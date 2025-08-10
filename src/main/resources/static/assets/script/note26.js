/* ─ Constants ─ */
const PRICE_NOTE = 12000;
const PRICE_NOTE_10 = 11400;
const PRICE_NOTE_20 = 10800;
const PRICE_DIGITAL = 3000;
const SHIPPING_PER_20 = 4000;

/* ─ State ─ */
const state = {
    noteQty: 1,
    digital: { enabled: false, qty: 1 },
    receive: 'C', // C=현장수령, D=택배
    addr: ''
};

/* ─ Helpers ─ */
const $  = s => document.querySelector(s);
const $$ = s => document.querySelectorAll(s);
const fmt = n => Number(n).toLocaleString('ko-KR');

function noteUnit(q){
    return q>=20 ? PRICE_NOTE_20 : q>=10 ? PRICE_NOTE_10 : PRICE_NOTE;
}
function noteDiscountRate(q){ return q>=20?10 : q>=10?5 : 0; }
function shippingFee(){
    return state.receive==='D' ? Math.ceil(state.noteQty/20) * SHIPPING_PER_20 : 0;
}

/* ─ Elements: 노트 ─ */
const noteMinus = $('.qty-control[data-item="note"] .minus');
const notePlus  = $('.qty-control[data-item="note"] .plus');
const noteNum   = $('.qty-control[data-item="note"] .num');
const origEl    = $('.price-area .orig');
const rateEl    = $('.price-area .rate');
const discEl    = $('.price-area .disc-price');

/* ─ Elements: 디지털 옵션 ─ */
const digitalOpt     = $('#digitalOpt');
const digitalRow     = $('#digitalOptionRow');
const digitalMinus   = digitalRow.querySelector('.minus');
const digitalPlus    = digitalRow.querySelector('.plus');
const digitalNum     = digitalRow.querySelector('.num');
const digitalPriceEl = $('#digitalPrice');
const digitalRemove  = $('#digitalRemove');
const emailRow = document.getElementById('emailRow');
const emailInput = document.getElementById('email');
const digitalRowWrap = document.querySelector('#digitalOpt').closest('.row');

/* ─ Elements: 수령방법/주소 ─ */
const addrRow    = $('#addressRow');
const addrInput  = $('#addr');

/* ─ Elements: 계산기 ─ */
const calcList   = $('#calcList');
const totalPrice = $('#totalPrice');

/* ─ Update: 노트 가격 UI ─ */
function updateNoteUI(){
    const q = state.noteQty;
    const baseTotal = PRICE_NOTE * q;
    const unit = noteUnit(q);
    const discTotal = unit * q;
    const rate = noteDiscountRate(q);

    // 수량
    noteNum.textContent = q;

    // 가격 UI
    if(rate){
        origEl.style.display = 'inline';
        rateEl.style.display = 'inline';
        origEl.textContent   = fmt(baseTotal)+'원';
        rateEl.textContent   = `${rate}%`;
    }else{
        origEl.style.display = 'none';
        rateEl.style.display = 'none';
    }
    discEl.textContent = fmt(discTotal)+'원';
}

/* ─ Update: 디지털 옵션 UI ─ */
function updateDigitalUI(){
    if(state.digital.enabled){
        digitalRow.style.display = '';
        digitalNum.textContent = state.digital.qty;
        digitalPriceEl.textContent = fmt(state.digital.qty * PRICE_DIGITAL);
    }else{
        digitalRow.style.display = 'none';
    }
}

/* ─ 계산기 렌더 ─ */
function renderCalc(){
    const items = [];
    // (기본) 말씀노트
    const q = state.noteQty;
    const rate = noteDiscountRate(q);
    const baseTotal = PRICE_NOTE * q;
    const discTotal = noteUnit(q) * q;

    items.push({
        name: `(기본) 말씀노트, ${q}권`,
        leftSub: rate ? fmt(baseTotal)+'원' : null,
        rate: rate ? `${rate}%` : null,
        amount: discTotal
    });

    // (옵션) 디지털
    if(state.digital.enabled){
        items.push({
            name: `(옵션) 디지털 노트, ${state.digital.qty}권`,
            amount: state.digital.qty * PRICE_DIGITAL,
            plus: true
        });
    }

    // 배송비
    const ship = shippingFee();
    if(ship>0){
        items.push({
            name: `택배배송비`,
            amount: ship,
            plus: true
        });
    }

    // 렌더
    calcList.innerHTML = '';
    items.forEach(it=>{
        const li = document.createElement('li');
        li.innerHTML = `
      <span class="name">${it.name}
        ${it.leftSub ? `<span class="sub">${it.leftSub}</span>` : ``}
        ${it.rate ? `<span class="rate">${it.rate}</span>` : ``}
      </span>
      <span class="amt">${it.plus?'+':''}${fmt(it.amount)}원</span>`;
        calcList.appendChild(li);
    });

    const sum = items.reduce((a,c)=>a + c.amount, 0);
    totalPrice.textContent = fmt(sum)+'원';
}

/* ─ Total update entry ─ */
function updateAll(){
    updateNoteUI();
    updateDigitalUI();
    renderCalc();
}

/* ─ Events: 노트 수량 ─ */
noteMinus.addEventListener('click', ()=>{
    state.noteQty = Math.max(1, state.noteQty - 1);
    updateAll();
});
notePlus.addEventListener('click', ()=>{
    state.noteQty += 1;
    updateAll();
});
noteNum.addEventListener('click', ()=>{
    const v = parseInt(prompt('수량을 입력하세요', state.noteQty),10);
    if(!isNaN(v) && v>0){ state.noteQty = v; updateAll(); }
});

/* ─ Events: 디지털 옵션 ─ */
digitalOpt.addEventListener('change', () => {
    state.digital.enabled = digitalOpt.checked;
    if (state.digital.enabled) {
        if (state.digital.qty < 1) state.digital.qty = 1;
        emailRow.style.display = ''; // 이메일 입력 표시
        digitalRowWrap.classList.add('marginless');
    } else {
        emailRow.style.display = 'none'; // 이메일 숨김
        emailInput.value = '';
        digitalRowWrap.classList.remove('marginless');
    }
    updateAll();
});
digitalMinus.addEventListener('click', ()=>{
    state.digital.qty = Math.max(1, state.digital.qty - 1);
    updateAll();
});
digitalPlus.addEventListener('click', ()=>{
    state.digital.qty += 1;
    updateAll();
});
digitalNum.addEventListener('click', ()=>{
    const v = parseInt(prompt('수량을 입력하세요', state.digital.qty),10);
    if(!isNaN(v) && v>0){ state.digital.qty = v; updateAll(); }
});
digitalRemove.addEventListener('click', () => {
    state.digital.enabled = false;
    digitalOpt.checked = false;
    emailRow.style.display = 'none'; // 이메일 입력 영역 숨김
    emailInput.value = '';            // 값 초기화
    updateAll();
});

/* ─ Events: 수령방법/주소 ─ */
$$('input[name="receive"]').forEach(r=>{
    r.addEventListener('change', ()=>{
        state.receive = r.value; // C or D
        if(state.receive==='D'){
            addrRow.style.display = '';
        }else{
            addrRow.style.display = 'none';
            addrInput.value = '';
            state.addr = '';
        }
        updateAll();
    });
});

addrInput.addEventListener('input', ()=>{
    state.addr = addrInput.value.trim();
});

/* ─ Submit ─ */
$('#orderForm').addEventListener('submit', e=>{
    e.preventDefault();
    if (state.digital.enabled && !emailInput.value.trim()) {
        alert('디지털 말씀노트를 받으실 이메일 주소를 입력해주세요.');
        emailInput.focus();
        return;
    }
    if(state.receive==='D' && !state.addr){
        alert('배송 받으실 주소를 입력해주세요.');
        addrInput.focus();
        return;
    }
    // 추가 검증 필요 시 여기에
    alert('주문이 완료되었습니다.');
});

/* ─ Init ─ */
updateAll();

/* (선택) 다음 주소 API 콜백 자리 */
function execDaumPostcode(){
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress;

            document.getElementById("addr").value = roadAddr;
            document.getElementById('addr_add').focus();
        }
    }).open();
}

const detailWrap = document.querySelector('.detail_img_wrap');
const moreBtn = document.getElementById('detailMoreBtn');

moreBtn.addEventListener('click', () => {
    detailWrap.classList.toggle('open');
    if (detailWrap.classList.contains('open')) {
        moreBtn.textContent = '접기';
    } else {
        moreBtn.textContent = '2026 말씀노트 자세히보기';
    }
});

const tabs = document.querySelectorAll('.tab-item');
const sections = document.querySelectorAll('#noteSell, #sectionDetail');

// 기본 첫 번째 탭 활성화
tabs[0].classList.add('active');

// 클릭 시 부드럽게 스크롤 이동
tabs.forEach(tab => {
    tab.addEventListener('click', e => {
        e.preventDefault();
        const targetId = tab.getAttribute('href');
        document.querySelector(targetId).scrollIntoView({ behavior: 'smooth' });
    });
});

// 스크롤 시 active 상태 변경
window.addEventListener('scroll', () => {
    let current = sections[0].getAttribute('id'); // 기본은 첫 번째 섹션

    sections.forEach(section => {
        const sectionTop = section.offsetTop - 60; // 탭 높이 고려
        if (pageYOffset >= sectionTop) {
            current = section.getAttribute('id');
        }
    });

    tabs.forEach(tab => {
        tab.classList.remove('active');
        if (tab.getAttribute('href') === `#${current}`) {
            tab.classList.add('active');
        }
    });
});

// Swiper 초기화
const topSwiper = new Swiper('.topSwiper', {
    loop: true, // 무한 루프
    autoplay: {
        delay: 3000, // 3초마다 자동전환
        disableOnInteraction: false // 사용자 스와이프 후에도 autoplay 유지
    },
    pagination: {
        el: '.topSwiper .swiper-pagination',
        clickable: true // 점 클릭 시 해당 슬라이드 이동
    }
});