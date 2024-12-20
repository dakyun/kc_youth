$(document).ready(function () {
    history.pushState({}, '', "/index");

    $(".event-useguide .title").on("click", function(e) {
        $(this).toggleClass("open").siblings().toggleClass("open");
    });

    $('.nav-link').on('click', function(event) {
        //event.preventDefault(); // 링크의 기본 동작을 막음
        $('#nav-toggle').prop('checked', false); // 체크 해제
    });

    // 스크롤 이벤트
    const part = $('.qmenu');
    const speed = 160;
    const speed2 = 160;

    $(window).on('scroll',function(){
        let scrollTop = $(window).scrollTop();
        // nav
        part.each(function (i) {
            if (scrollTop >= part.eq(i).offset().top - speed) {
                $(".quick-menu li").eq(i).addClass("on").siblings().removeClass("on");
            }
            if (scrollTop >= part.eq(0).offset().top + speed2) {
                $("#resigter").addClass('none');
            }else{
                $("#resigter").removeClass('none');
            }
        });
    })
    $(".quick-menu a").on("click", function(){
        //e.preventDefault();
        $(".quick-menu li").removeClass("on");
        $(this).parent('.quick-menu li').addClass("active");
        $("html, body").animate({scrollTop: $(this.hash).offset().top + 20}, 300);
    });

    // $("#discography-albums").bxSlider({
    //     minSlides: 3,
    //     maxSlides: 3,
    //     moveSlides: 1,
    //     slideMargin: 80,
    //     pager: false,
    //     controls: false,
    //     slideWidth: 500,
    //     hideControlOnEnd: true,
    //     infiniteLoop: false,
    // });
    var ytSwiper = new Swiper('.ytSwiper', {
        slidesPerView: 1.2,
        spaceBetween: 20,
        //centeredSlides: true,
        observer: true,
        observeParents: true,
        breakpoints: {
            750: {
                slidesPerView: 2,
                spaceBetween: 50,
            },
            1200: {
                slidesPerView: 3,
                spaceBetween: 30,
            },
        }
    });

    const topSwiper = new Swiper(".top-img", {
        loop: true,
        autoplay: {
            delay: 1600,
            disableOnInteraction: false,
        },
        parallax: true,
        effect: "fade",
        allowTouchMove: false,
        observer: true,
        observeParents: true,
    });
    const newsSwiper = new Swiper(".card-swiper", {
        effect: "cards",
        grabCursor: true,
        allowTouchMove : true,
        observer: true,
        observeParents: true,
    });

    // 삭제 버튼 클릭 시 팝업 열기
    $("body").on('click', '.delete', function (e) {
        e.preventDefault();

        // 클릭된 .post-item에서 name 정보를 추출
        delTargetPostObj = $(this).closest('.post-item');
        const postItem = $(this).closest('.post-item'); // 클릭된 버튼의 상위 .post-item
        const name = postItem.find('.writer').text().trim(); // .writer 클래스에서 이름 추출

        // 팝업에 이름 정보를 동적으로 삽입
        $('#deleteName .name-info').text(name);

        // 삭제 팝업을 표시
        $('.layer-popup.delete-wrap').show();

        // 삭제 팝업 표시 시 비밀번호 입력란 초기화
        $('#delPassword').val('');
    });

    // 삭제하기 버튼 클릭 시 AJAX로 삭제 요청 보내기
    $("body").on('click', '.delete-wrap .btn.n1', function (e) {
        e.preventDefault();

        // 삭제할 게시물 ID 등 필요한 정보를 추출
        const postItem = delTargetPostObj; // 삭제 대상 Object
        const postId = postItem.data('id');  // 예: <li class="post-item" data-id="123">
        const password = $('#delPassword').val(); // 사용자가 입력한 비밀번호

        if (!password || password.length !== 6) {
            alert("비밀번호를 6자리로 입력해주세요.");
            return;
        }

        // AJAX 요청을 통해 서버로 삭제 요청 보내기
        $.ajax({
            url: '/delete',  // 서버의 삭제 엔드포인트
            type: 'POST',
            data: {
                postId: postId,
                password: password
            },
            success: function (response) {
                if (response.success) {
                    alert('게시물이 삭제되었습니다.');
                    location.href = '/index?pageNo='+nowPageNo+'&amount=12&searchName='+searchName+"#posting";
                } else {
                    alert(response.message);
                }
            },
            error: function () {
                alert('서버 요청 중 오류가 발생했습니다.');
            },
            complete: function () {
                delTargetPostObj = null;
                $('.layer-popup.delete-wrap').hide();
            }
        });
    });
});
// const sections = $(".section");
// const speed = 600;
// let delTargetPostObj = null;
//
// //스크롤 애니메이션
// $(window).on("scroll", function () {
//     let scrollTop = $(window).scrollTop();
//     sections.each(function (i) {
//         if (scrollTop >= sections.eq(i).offset().top - speed) {
//             sections.eq(i).find(".show-up").addClass("active");
//         }else{
//             sections.eq(i).find(".show-up").removeClass("active");
//         }
//     });
// });

const sections = $(".section");
const speed = 600;
const speedSmallScreen = 600; // 750px 이하일 때 적용될 속도
let delTargetPostObj = null;

// 스크롤 애니메이션
$(window).on("scroll", function () {
    let scrollTop = $(window).scrollTop();
    let currentSpeed = $(window).width() <= 750 ? speedSmallScreen : speed;

    sections.each(function (i) {
        if (scrollTop >= sections.eq(i).offset().top - currentSpeed) {
            sections.eq(i).find(".show-up").addClass("active");
            sections.eq(i).find(".imgch").addClass("active");
        } else {
            sections.eq(i).find(".show-up").removeClass("active");
            sections.eq(i).find(".imgch").removeClass("active");
        }
    });
});


$(window).on("load", function () {
    setFlowBanner1();
    setFlowBanner2();
    setFlowBanner3();
});

function setFlowBanner1() {
    const $wrap = $(".flow-text.n1");
    const $list = $(".flow-text.n1 .list");
    let wrapWidth = $wrap.width();
    let listWidth = $list.width();
    const speed = 92; //1초에 몇픽셀 이동하는지 설정

    //리스트 복제
    let $clone = $list.clone();
    $wrap.append($clone);
    flowBannerAct();

    //배너 실행 함수
    function flowBannerAct() {
        //무한 반복을 위해 리스트를 복제 후 배너에 추가
        if (listWidth < wrapWidth) {
            const listCount = Math.ceil((wrapWidth * 2) / listWidth);
            for (let i = 2; i < listCount; i++) {
                $clone = $clone.clone();
                $wrap.append($clone);
            }
        }
        $wrap.find(".list").css({
            animation: `${listWidth / speed}s linear infinite flowRolling`,
        });
    }
}
function setFlowBanner3() {
    const $wrap = $(".flow-text.n3");
    const $list = $(".flow-text.n3 .list");
    let wrapWidth = $wrap.width();
    let listWidth = $list.width();
    const speed = 92; //1초에 몇픽셀 이동하는지 설정

    //리스트 복제
    let $clone = $list.clone();
    $wrap.append($clone);
    flowBannerAct();

    //배너 실행 함수
    function flowBannerAct() {
        //무한 반복을 위해 리스트를 복제 후 배너에 추가
        if (listWidth < wrapWidth) {
            const listCount = Math.ceil((wrapWidth * 2) / listWidth);
            for (let i = 2; i < listCount; i++) {
                $clone = $clone.clone();
                $wrap.append($clone);
            }
        }
        $wrap.find(".list").css({
            animation: `${listWidth / speed}s linear infinite flowRolling`,
        });
    }
}
function setFlowBanner2() {
    const $wrap = $(".flow-text.n2");
    const $list = $(".flow-text.n2 .list");
    let wrapWidth = $wrap.width();
    let listWidth = $list.width();
    const speed = 92; //1초에 몇픽셀 이동하는지 설정

    //리스트 복제
    let $clone = $list.clone();
    $wrap.append($clone);
    flowBannerAct();

    //배너 실행 함수
    function flowBannerAct() {
        //무한 반복을 위해 리스트를 복제 후 배너에 추가
        if (listWidth < wrapWidth) {
            const listCount = Math.ceil((wrapWidth * 2) / listWidth);
            for (let i = 2; i < listCount; i++) {
                $clone = $clone.clone();
                $wrap.append($clone);
            }
        }
        $wrap.find(".list").css({
            animation: `${listWidth / speed}s linear infinite flowRolling2`,
        });
    }
}
$('#comment').keyup(function (e) {
    let content = $(this).val();

    // 글자수 세기
    if (content.length == 0 || content == '') {
        $('#textcount').text('0');
    } else {
        $('#textcount').text(content.length);
    }

    // 글자수 제한
    if (content.length > 200) {
        // 200자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 200));
        // 200자 넘으면 알림창 뜨도록
        alert('글자수는 200자까지 입력 가능합니다.');
    };
});

$(window).on('resize', function() {
    if ($(window).width() <= 750) {
        $('ul .post-item .inner').each(function(index, item) {
            var rvTxt = $(this).find('.contain').height();
            var winVw = $(window).width();
            var valPer = winVw / 100;
            var value = rvTxt / valPer;
            if ($(this).hasClass("ht-content")) {
                if (value < 10) {
                    $(this).find('.more').hide();
                    $(this).css("pointer-events", "none");
                }
            } else {
                if (value < 15) {
                    $(this).find('.more').hide();
                    $(this).css("pointer-events", "none");
                }
            }
        });
    }
});

// 초기 로드 시에도 함수가 호출되도록 함
$(document).ready(function() {
    if ($(window).width() <= 750) {
        $('ul .post-item .inner').each(function(index, item) {
            var rvTxt = $(this).find('.contain').height();
            var winVw = $(window).width();
            var valPer = winVw / 100;
            var value = rvTxt / valPer;
            if ($(this).hasClass("ht-content")) {
                if (value < 10) {
                    $(this).find('.more').hide();
                    $(this).css("pointer-events", "none");
                }
            } else {
                if (value < 15) {
                    $(this).find('.more').hide();
                    $(this).css("pointer-events", "none");
                }
            }
        });
    }
});

// '더보기' 누를 시 모달 창 팝업하는 함수
function calHeight() {
    $('ul .post-item .inner').each(function(){
        var rvTxt = $(this).find('.contain').height();
        var rvTxt2 = $(this).find('.real').height();
        var rvTxtInVw = rvTxt2 / 7.5; // rvTxt를 vw 값으로 환산

        if (window.innerWidth >= 1200) {
            // 1200px 이상 화면일 때
            if(rvTxt < 144){
                $(this).find('.more').hide();
                $(this).css("pointer-events","none");
            } else {
                $(this).addClass('more-layer');
            }
        } else if (window.innerWidth <= 750) {
            // 750px 이하 화면일 때
            if(rvTxtInVw < 17){
                $(this).find('.more').hide();
                $(this).css("pointer-events","none");
            } else {
                $(this).addClass('more-layer');
            }
        }
    })
};

// '더보기' 버튼 클릭 시 모달에 내용 추가 및 모달 표시
$(document).ready(function() {
    $('#resigter').on('click', function(event) {
        if ($(window).width() >= 1200) {
            event.preventDefault(); // 기본 동작을 막음
            alert('모바일로 주문 부탁 드립니다!');
            $(this).attr('href', '#'); // href 속성을 '#'으로 변경
        }
    });
    calHeight();

    // '더보기' 버튼 클릭 시 모달에 내용 추가 및 모달 표시
    $("body").on('click', '.more-layer', function(e) {
        e.preventDefault();

        const postItem = $(this).closest('.post-item'); // 클릭된 게시물 항목
        const content = postItem.find('.contain .real').text(); // 게시물 내용
        const writer = postItem.find('.writer').text(); // 작성자
        const time = postItem.find('.time span').text(); // 작성일

        // 모달의 내용 업데이트
        const modal = $('.layer-popup.more-wrap');
        modal.find('.post-item .inner').text(content); // 모달에 내용 추가
        modal.find('.post-item .writer').text(writer); // 작성자
        modal.find('.post-item .time span').text(time); // 작성일

        // 모달 표시
        modal.show();
        $('#resigter, .quick-menu').css('z-index', '0');
    });

    $("body").on('click', '.more-layer', function(e){
        e.preventDefault();
        $('.layer-popup.more-wrap').show();
        $('#resigter, .quick-menu').css('z-index','0');
    });
    $("body").on('click', '.layer-popup', function(e){
        e.preventDefault();
        $('.layer-popup.more-wrap').hide();
        $('#resigter, .quick-menu').css('z-index','50');
    });
    //삭제 버튼
    $("body").on('click', '.delete', function(e){
        e.preventDefault();
        $('.layer-popup.delete-wrap').show();
        $('#resigter, .quick-menu').css('z-index','0');
    });
    $("body").on('click', '.delete-wrap .btn.n2', function(e){
        e.preventDefault();
        $('.layer-popup.delete-wrap').hide();
        $('#resigter, .quick-menu').css('z-index','50');
    });
});


// // Adding scroll event listener
// document.addEventListener('scroll', horizontalScroll);
//
// //Selecting Elements
// let sticky = document.querySelector('.sticky');
// let stickyParent = document.querySelector('.sticky-parent');
//
// let scrollWidth = sticky.scrollWidth;
// let verticalScrollHeight = stickyParent.getBoundingClientRect().height-sticky.getBoundingClientRect().height;
//
// //Scroll function
// function horizontalScroll(){
//
//     //Checking whether the sticky element has entered into view or not
//     let stickyPosition = sticky.getBoundingClientRect().top;
//     if(stickyPosition > 1){
//         return;
//     }else{
//         let scrolled = stickyParent.getBoundingClientRect().top; //how much is scrolled?
//         sticky.scrollLeft =(scrollWidth/verticalScrollHeight)*(-scrolled)*0.85;
//
//     }
// }
// Adding scroll event listener
document.addEventListener('scroll', function() {
    if (window.innerWidth >= 1200) {
        horizontalScroll();
    }
});

//Selecting Elements
let sticky = document.querySelector('.sticky');
let stickyParent = document.querySelector('.sticky-parent');

let scrollWidth = sticky.scrollWidth;
let verticalScrollHeight = stickyParent.getBoundingClientRect().height - sticky.getBoundingClientRect().height;

//Scroll function
function horizontalScroll() {

    //Checking whether the sticky element has entered into view or not
    let stickyPosition = sticky.getBoundingClientRect().top;
    if (stickyPosition > 1) {
        return;
    } else {
        let scrolled = stickyParent.getBoundingClientRect().top; //how much is scrolled?
        sticky.scrollLeft = (scrollWidth / verticalScrollHeight) * (-scrolled) * 0.85;
    }
}


// 이름으로 작성 글 찾을 시 발생하는 이벤트
// 검색 버튼 클릭 이벤트
$("body").on("click", ".in-btn", function (e) {
    e.preventDefault();
    executeSearch(); // 검색 실행 함수 호출
});

// 검색 입력 필드에서 엔터 키 입력 이벤트
$("body").on("keydown", ".insearch", function (e) {
    if (e.key === "Enter") { // Enter 키 확인
        e.preventDefault(); // 기본 엔터 동작(폼 제출) 방지
        executeSearch(); // 검색 실행 함수 호출
    }
});

// 검색 실행 함수
function executeSearch() {
    const _searchName = $(".insearch").val().trim(); // 입력된 검색어 가져오기

    if (!_searchName) {
        alert("검색어를 입력해주세요.");
        return;
    }

    $.ajax({
        url: `/reply?searchName=${encodeURIComponent(_searchName)}`, // 검색어를 URL에 포함
        type: 'GET',
        success: function (response) {
            if (response.success) {
                if (response.replyCount == 0) {
                    alert("검색 결과가 없습니다.");
                } else {
                    location.href = '/index?pageNo=1&amount=12&searchName='+_searchName+"#posting";
                }
            } else {
                alert(response.message || "검색 실패");
            }
        },
        error: function () {
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    });
}

// 글 등록 시 입력값 검증
const checkResultList = [false, false, false, false, false];

// 입력값 검증 대상 (name, generation, pw, pw2, comment)
const $nameInput = document.getElementById('name');
const $generationInput = document.getElementById('birthYear');
const $pwInput = document.getElementById('password1');
const $reChkPw = document.getElementById('password2');
const $contentInput = document.getElementById('comment');

// 이름 입력값 검증 (영문 대소문자, 한글 2자 이상, 특수문자 불가)
const namePattern = /^[a-zA-Z가-힣]{2,}$/;
$nameInput.addEventListener('input', () => {
    const nameValue = $nameInput.value.trim();
    checkResultList[0] = namePattern.test(nameValue);
});

// 또래 입력값 검증
$generationInput.addEventListener('change', () => {
    checkResultList[1] = $generationInput.value.trim() !== '';
});

// 비밀번호 입력값 검증
const passwordPattern = /^\d{6}$/;
$pwInput.addEventListener('input', () => {
    const pwValue = $pwInput.value.trim();
    checkResultList[2] = passwordPattern.test(pwValue);
});

// 비밀번호 재확인 검증
$reChkPw.addEventListener('input', () => {
    const reChkPwVal = $reChkPw.value.trim();
    checkResultList[3] = reChkPwVal === $pwInput.value.trim();
});

// 등록 버튼 눌렀을 시 처리
document.getElementById('submit-button').onclick = e => {
    if ($contentInput.value.trim().length < 20) {
        checkResultList[4] = false;
        alert('감사 내용을 20자 이상 작성해 주세요.');
        e.preventDefault();
        return;
    } else {
        checkResultList[4] = true;
    }

    let msg = '';

    if (checkResultList.includes(false)) {
        if (!checkResultList[0]) {
            msg += '-이름은 공백없이 영문 대소문자 또는 한글 2자 이상으로 입력해 주세요(특수문자, 공백 불가).\n';
        }
        if (!checkResultList[1]) {
            msg += '-또래를 선택해 주세요.\n';
        }
        if (!checkResultList[2]) {
            msg += '-비밀번호는 6자리 숫자로만 입력해 주세요.\n';
        }
        if (!checkResultList[3]) {
            msg += '-입력한 비밀번호를 재확인해 주세요.\n';
        }
        alert(msg.trim()); // 마지막 줄바꿈 제거
        e.preventDefault();
    } else {
        alert('글 등록이 완료되었습니다!');
        document.getElementById('register-form').submit();
    }

};

function initparticles() {
    hearts();
}
function hearts() {
    $.each($(".particletext.hearts"), function(){
        var heartcount = ($(this).width()/50)*5;
        for(var i = 0; i <= heartcount; i++) {
            var size = ($.rnd(60,120)/10);
            $(this).append('<span class="particle" style="top:' + $.rnd(20,80) + '%; left:' + $.rnd(0,200) + '%;width:' + size + 'px; height:' + size + 'px;animation-delay: ' + ($.rnd(0,30)/10) + 's;"></span>');
        }
    });
}


jQuery.rnd = function(m,n) {
    m = parseInt(m);
    n = parseInt(n);
    return Math.floor( Math.random() * (n - m + 1) ) + m;
}

initparticles();