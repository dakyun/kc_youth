/* ─ Constants ─ */
const PRICE_NOTE = 12000;
const PRICE_NOTE_10 = 11400;
const PRICE_NOTE_20 = 10800;
const PRICE_DIGITAL = 3000;
const SHIPPING_PER_20 = 4000;

/* ─ State ─ */
const state = {
    noteQty: 1,
    // FIX: emails 배열 추가 (수량 변경해도 입력값 보존)
    digital: { enabled: false, qty: 1, emails: [] },
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
const emailRow       = document.getElementById('emailRow');
// FIX: marginless 토글 대상
const digitalRowWrap = document.querySelector('#digitalOpt').closest('.row');

/* ─ Elements: 수령방법/주소 ─ */
const addrRow    = $('#addressRow');
const addrInput  = $('#addr');
const addrAddInput  = $('#addr_add');

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
        // FIX: 체크 시 marginless 부여
        digitalRowWrap?.classList.add('marginless');
    }else{
        digitalRow.style.display = 'none';
        digitalRowWrap?.classList.remove('marginless');
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

/* ─ 이메일 입력 상태/렌더 ─ */
// FIX: 수량 변경 시에도 입력값 보존
function ensureEmailSlots() {
    const q = state.digital.qty;
    while (state.digital.emails.length < q) {
        state.digital.emails.push({ local:'', mode:'select', domain:'naver.com' }); // mode: 'select' | 'input'
    }
    if (state.digital.emails.length > q) {
        state.digital.emails.length = q; // 잘라냄
    }
}

function renderEmailInputs() {
    ensureEmailSlots();
    emailRow.innerHTML = '';

    const domainList = ['naver.com','gmail.com','daum.net','hanmail.net','직접입력'];

    for (let i = 0; i < state.digital.qty; i++) {
        const saved = state.digital.emails[i];
        const idx = i + 1;

        const pairDiv = document.createElement('div');
        pairDiv.className = 'email-pair';

        // local
        const localInput = document.createElement('input');
        localInput.type = 'text';
        localInput.className = 'local';
        localInput.id = `email_local_${idx}`;
        localInput.placeholder = `메일 앞부분 ${idx}`;
        localInput.value = saved.local || '';
        localInput.addEventListener('input', () => {
            saved.local = localInput.value;
        });

        // @
        const atSpan = document.createElement('span');
        atSpan.className = 'at';
        atSpan.textContent = '@';

        // domain select
        const domainSelect = document.createElement('select');
        domainSelect.className = 'domain-select';
        domainSelect.id = `email_domain_select_${idx}`;
        domainList.forEach(d => {
            const opt = document.createElement('option');
            opt.value = d;
            opt.textContent = d;
            domainSelect.appendChild(opt);
        });

        // domain input (직접입력)
        const domainInput = document.createElement('input');
        domainInput.type = 'text';
        domainInput.className = 'domain-input';
        domainInput.id = `email_domain_input_${idx}`;
        domainInput.placeholder = `메일 뒷부분 ${idx}`;

        // 저장된 모드/값 반영
        if (saved.mode === 'input') {
            domainSelect.value = '직접입력';
            domainSelect.classList.add('less'); // 직접입력 시 less
            domainInput.style.display = 'block';
            domainInput.value = saved.domain || '';
        } else {
            domainSelect.value = saved.domain || 'naver.com';
            domainInput.style.display = 'none';
        }

        // select 변경 → 직접입력 토글 + less 토글
        domainSelect.addEventListener('change', () => {
            if (domainSelect.value === '직접입력') {
                domainSelect.classList.add('less');
                domainInput.style.display = 'block';
                saved.mode = 'input';
                saved.domain = '';
                domainInput.focus();
            } else {
                domainSelect.classList.remove('less');
                domainInput.style.display = 'none';
                domainInput.value = '';
                saved.mode = 'select';
                saved.domain = domainSelect.value;
            }
        });

        // 직접입력 타이핑
        domainInput.addEventListener('input', () => {
            saved.domain = domainInput.value;
        });

        // 초기 domain 동기화
        if (saved.mode === 'select') saved.domain = domainSelect.value;

        pairDiv.appendChild(localInput);
        pairDiv.appendChild(atSpan);
        pairDiv.appendChild(domainSelect);
        pairDiv.appendChild(domainInput);
        emailRow.appendChild(pairDiv);
    }
}

/* ─ 디지털 옵션 체크 ─ */
digitalOpt.addEventListener('change', () => {
    state.digital.enabled = digitalOpt.checked;
    if (state.digital.enabled) {
        if (state.digital.qty < 1) state.digital.qty = 1;
        emailRow.style.display = '';
        renderEmailInputs();
    } else {
        // 끄면 값 초기화
        state.digital.emails = [];
        emailRow.style.display = 'none';
        emailRow.innerHTML = '';
    }
    updateAll();
});

/* ─ 디지털 수량 변경 ─ */
[digitalMinus, digitalPlus, digitalNum].forEach(btn => {
    btn.addEventListener('click', () => {
        if (btn === digitalMinus) state.digital.qty = Math.max(1, state.digital.qty - 1);
        else if (btn === digitalPlus && state.digital.qty < 100) state.digital.qty += 1;
        else if (btn === digitalPlus && state.digital.qty == 100) alert("한번에 주문 가능한 수량은 100개까지만 가능합니다.");
        else {
            const v = parseInt(prompt('수량을 입력하세요', state.digital.qty), 10);
            if (!isNaN(v) && v > 0 && v <= 100) state.digital.qty = v;
            else if(!isNaN(v) && v > 100) alert("한번에 주문 가능한 수량은 100개까지만 가능합니다.");
        }
        // FIX: 먼저 입력 UI/값 반영 → 합계 갱신
        if (state.digital.enabled) renderEmailInputs();
        updateAll();
    });
});

/* ─ 디지털 옵션 삭제 ─ */
digitalRemove.addEventListener('click', () => {
    state.digital.enabled = false;
    state.digital.qty = 1;
    state.digital.emails = [];
    digitalOpt.checked = false;
    emailRow.style.display = 'none';
    emailRow.innerHTML = '';
    updateAll();
});

/* ─ Events: 수령방법/주소 ─ */
$$('input[name="receive"]').forEach(r=>{
    r.addEventListener('click', ()=>{
        state.receive = r.value; // C or D
        if(state.receive==='D'){
            addrRow.style.display = '';
        }else{
            addrRow.style.display = 'none';
            addrInput.value = '';
            addrAddInput.value = '';
            state.addr = '';
        }
        updateAll();
    });
});

addrInput?.addEventListener('input', ()=>{
    state.addr = addrInput.value.trim();
});

/* ─ Submit ─ */
document.getElementById('orderForm').addEventListener('submit', async (e) => {
    e.preventDefault();

    // FIX: 디지털 선택 시, 수량만큼 이메일 앞/뒤 검증
    if (state.digital.enabled) {
        for (let i = 0; i < state.digital.emails.length; i++) {
            const { local, mode, domain } = state.digital.emails[i];
            const dom = (mode === 'select') ? domain : domain; // 동일 키
            if (!local || !dom) {
                alert(`디지털 노트 이메일 ${i+1}번의 주소를 모두 입력해주세요.`);
                // 포커스 이동
                const localEl = document.getElementById(`email_local_${i+1}`);
                const selEl   = document.getElementById(`email_domain_select_${i+1}`);
                const inpEl   = document.getElementById(`email_domain_input_${i+1}`);
                if (!local) localEl?.focus();
                else if (mode === 'select' && (!dom || dom==='직접입력')) selEl?.focus();
                else inpEl?.focus();
                return;
            }
            // (선택) 간단한 이메일 형식 체크
            const simple = /^[^\s@]+$/;
            if (!simple.test(local) || !simple.test(dom) || dom.indexOf('.') === -1) {
                alert(`이메일 형식이 올바르지 않습니다: ${local}@${dom}`);
                return;
            }
        }
    }

    if(state.receive==='D' && (!document.getElementById('addr')?.value || !document.getElementById('addr_add')?.value)){
        alert('배송 받으실 주소를 입력해주세요.');
        addrInput?.focus();
        return;
    }

    try {
        await handleSubmit();
    } catch (err) {
        //console.error(err);
        alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
    }
});

/* ─ Init ─ */
updateAll();

/* (선택) 다음 주소 API 콜백 자리 */
function execDaumPostcode(){
    if (!window.daum || !daum.Postcode) { alert('주소 검색 스크립트를 확인해주세요.'); return; }
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress;
            document.getElementById("addr").value = roadAddr;
            document.getElementById('addr_add')?.focus();
        }
    }).open();
}

/* 상세 더보기 버튼(있을 때만) */
const detailWrap = document.querySelector('.detail_img_wrap');
const moreBtn = document.getElementById('detailMoreBtn');
if (detailWrap && moreBtn) {
    moreBtn.addEventListener('click', () => {
        detailWrap.classList.toggle('open');
        moreBtn.textContent = detailWrap.classList.contains('open') ? '접기' : '2026 말씀노트 자세히보기';
    });
}

/* 탭 네비(있을 때만) */
const tabs = document.querySelectorAll('.tab-item');
const sections = document.querySelectorAll('#noteSell, #sectionDetail');
if (tabs.length && sections.length) {
    // 기본 첫 번째 탭 활성화
    tabs[0].classList.add('active');
    // 클릭 시 부드럽게 스크롤
    tabs.forEach(tab => {
        tab.addEventListener('click', e => {
            e.preventDefault();
            const targetId = tab.getAttribute('href');
            document.querySelector(targetId)?.scrollIntoView({ behavior: 'smooth' });
        });
    });
    // 스크롤 시 active 변경
    window.addEventListener('scroll', () => {
        let current = sections[0].getAttribute('id');
        sections.forEach(section => {
            const sectionTop = section.offsetTop - 60;
            if (pageYOffset >= sectionTop) current = section.getAttribute('id');
        });
        tabs.forEach(tab => {
            tab.classList.remove('active');
            if (tab.getAttribute('href') === `#${current}`) tab.classList.add('active');
        });
    });
}

/* Swiper 초기화(있을 때만) */
if (window.Swiper) {
    const topSwiper = new Swiper('.topSwiper', {
        loop: true,
        autoplay: { delay: 3000, disableOnInteraction: false },
        pagination: { el: '.topSwiper .swiper-pagination', clickable: true }
    });
}

function collectEmails() {
    const pairs = document.querySelectorAll('#emailRow .email-pair');
    const emails = [];

    pairs.forEach(pair => {
        const local = pair.querySelector('.local')?.value?.trim() || "";
        const sel   = pair.querySelector('.domain-select')?.value || "";
        const input = pair.querySelector('.domain-input')?.value?.trim() || "";

        if (!local) return;

        const domain = (sel === '직접입력' ? input : sel).trim();
        if (!domain) return;

        const email = `${local}@${domain}`;
        emails.push(email);
    });

    return [...new Set(emails.map(e => e.toLowerCase()))];
}

function buildPayload() {
    return {
        name: document.getElementById('buyerName').value.trim(),
        contact: document.getElementById('buyerPhone').value.trim(),
        type: document.querySelector('input[name="receive"]:checked')?.value ?? 'C',
        addr: document.getElementById('addr')?.value + " " + document.getElementById('addr_add')?.value ?? "",
        cnt: document.getElementById('note_cnt')?.innerText ?? 0,
        digital_cnt: (
            document.getElementById('digitalOpt').checked &&
            document.getElementById('digital_cnt')?.innerText
        ) ? document.getElementById('digital_cnt').innerText : 0,
        email: collectEmails()
    };
}

async function postOrder(payload) {
    const res = await fetch('/note/apply', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(payload)
    });

    if (!res.ok) {
        const errText = await res.text().catch(()=>'');
        throw new Error(`요청 실패 (${res.status}) ${errText}`);
    }
    return res.text();
}

async function handleSubmit() {
    let serverResp;

    const btn = document.querySelector('.submit-btn');
    btn.disabled = true;
    const originalLabel = btn.textContent;
    btn.textContent = '전송중...';

    try {
        const payload = buildPayload();
        serverResp = await postOrder(payload);
        alert('주문이 완료되었습니다.');
        location.reload();
    } catch (ex) {
        //console.error(ex);
        alert('전송 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
    } finally {
        btn.disabled = false;
        btn.textContent = originalLabel;
    }

    return serverResp;
}
