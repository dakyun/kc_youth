<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0"/>
    <title>맑은샘광천교회 청년부 2024</title>
    <meta property="og:title" content="맑은샘광천교회 청년부 2024" />
    <meta property="og:description" content="맑은샘광천교회 청년부 2024 연말결산 페이지입니다." />
    <meta property="og:image" content="https://kwangchunyouth.com/assets/images/recap_thumb.jpg" />
    <meta property="og:url" content="https://kwangchunyouth.com" />
    <meta property="og:type" content="website" />
    <link rel="stylesheet" href="/assets/css/slick.css?ts=${System.currentTimeMillis()}">
    <link rel="stylesheet" href="/assets/css/guide.css?ts=${System.currentTimeMillis()}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css?ts=${System.currentTimeMillis()}"/>
    <link rel="stylesheet" href="/assets/css/reset.css?ts=${System.currentTimeMillis()}">
    <link rel="stylesheet" href="/assets/css/index.css?ts=${System.currentTimeMillis()}">
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/matter-js/0.17.1/matter.min.js"></script>

    <script>
        let nowPageNo = '${maker.page.pageNo}';
        let searchName = '${searchName}';
    </script>
</head>
<body>
<header id="section1" class="qmenu">
    <div class="top-img" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
        <div class="swiper-wrapper">
            <div class="swiper-slide n1"></div>
            <div class="swiper-slide n2"></div>
            <div class="swiper-slide n3"></div>
        </div>
    </div>
    <div class="slide-text-wrapper">
        <div class="slide-container">
            <ul class="slide-wrapper">
                <div class="slide original">
                    <li>
                        <div class="item">
                            2024 KWANGCHUN YOUTH RECAP
                        </div>
                    </li>
                </div>
                <div class="slide clone">
                    <li>
                        <div class="item">
                            2024 KWANGCHUN YOUTH RECAP
                        </div>
                    </li>
                </div>
                <div class="slide clone">
                    <li>
                        <div class="item">
                            2024 KWANGCHUN YOUTH RECAP
                        </div>
                    </li>
                </div>
                <div class="slide clone">
                    <li>
                        <div class="item">
                            2024 KWANGCHUN YOUTH RECAP
                        </div>
                    </li>
                </div>
            </ul>
        </div>
    </div>
    <div class="container">
        <div id="header-text" class="bold">
            <h3 id="header-text-sub1">MALGEUNSAEM<br>KWANGCHUN CHURCH &#8224;</h3>
            <h3 id="header-text-sub2">ADIEU!<br>THE MEMORY OF 2024</h3>
        </div>
    </div>
    <div id="resigter"><a href="<c:url value="/note"/>"><span class="hidden">말씀노트 신청하기</span></a></div>
    <div class="quick-menu">
        <ul>
            <li class="on"><a href="#section1"><i class="n1"></i><span class="name">Intro</span></a></li>
            <li><a href="#discography"><i class="n5"></i><span class="name">Youtubes</span></a></li>
            <li><a href="#section3"><i class="n3"></i><span class="name">Event</span></a></li>
            <li><a href="#posting"><i class="n4"></i><span class="name">Thank You Note</span></a></li>
            <li><a href="#section2"><i class="n2"></i><span class="name">Card News</span></a></li>
        </ul>
    </div>
</header>
<nav class="nav">
    <input type="checkbox" class="nav-check" id="nav-toggle">
    <label for="nav-toggle" class="nav-button"><span class="nav-icon">&nbsp;</span></label>
    <div class="nav-bg">&nbsp;</div>
    <div class="nav-body">
        <ul class="nav-list">
            <li class="nav-item">
                <a href="#section1" class="nav-link bold"><span>01</span>Intro</a>
            </li>
            <li class="nav-item">
                <a href="#discography" class="nav-link bold"><span>02</span>Youtubes</a>
            </li>
            <li class="nav-item">
                <a href="#section3" class="nav-link bold"><span>03</span>Event</a>
            </li>
            <li class="nav-item">
                <a href="#posting" class="nav-link bold"><span>04</span>Thank You Note</a>
            </li>
            <li class="nav-item">
                <a href="#section2" class="nav-link bold"><span>05</span>Card News</a>
            </li>
            <li class="nav-item">
                <a href="<c:url value="/note"/>" class="nav-link bold"><span>06</span>말씀노트 구매</a>
            </li>
        </ul>
    </div>
</nav>
<div class="sticky-parent">
    <div class="sticky">
        <div class="horizontal"> <!--Horizantal conatiner with display flex-->
            <!--Content Start-->
            <div class="dim n1 section" ><img src="/assets/images/scroll02.jpg"><p class="show-up">여호와께서 우리를 위하여<br>큰 일을 행하셨으니</p></div>
            <div class="dim n2 section" ><img src="/assets/images/scroll03.jpg"><p class="show-up">우리는 기쁘도다</p></div>
            <div class="dim n3 section" ><img src="/assets/images/scroll08.jpg"><p class="show-up">눈물을 흘리며<br>씨를 뿌리는 자는</p></div>
            <div class="dim n4 section" ><img src="/assets/images/scroll06.jpg"><p class="show-up">기쁨으로 거두리로다<span>시편 126편 3절과 5절</span></p></div>
            <div class="dim n5 section" ><img src="/assets/images/scroll05.jpg" class="imgch"><p class="show-up">맑은샘광천교회 청년부<br>2024 연말결산</p><span class="scrolldown"></span></div>
        </div>
    </div>
</div>

<div class="container bg-bk">
    <div id="album-about" class="section">
        <div class="title-box show-up">
            <div class="left">
                <span class="sub">Letter from Kid-O</span>
                <strong>사랑하는 <br>맑은샘광천교회 청년 여러분!</strong>
            </div>
        </div>
        <p class="show-up delay">
            2024년 한 해 동안 우리 청년부를 인도하시고 은혜로 채워주신 하나님께 모든 감사와 찬양을 올려드립니다.
            시편 126편의 고백처럼 2024년은 하나님께서 우리 공동체에 큰 일을 행하셨던 축복의 시간임을 고백합니다.
        </p>
        <p class="show-up delay-more">
            올해 우리는 영적인 깊이와 외형적인 성장 모두에서 하나님의 손길을 경험했습니다. 정말 많은 새가족들이 공동체 안에서 함께 뜨겁게 예배하며 신앙생활을 하게 되었습니다.
            또한 많은 청년들의 섬김과 헌신으로 말미암아 수련회를 비롯하여 크고 작은 사역들 모두 풍성한 은혜가 넘치는 시간이었습니다. 이는 하나님께서 우리에게 허락하신 특별한 선물이자, 여러분 모두의 섬김과 헌신이 만들어낸 아름다운 열매라고 믿습니다. 공동체를 위해서 아낌없는 사랑과 수고와 기도로 동역해준 모두에게 감사의 마음을 전합니다.
        </p>
        <p class="show-up delay-more2">
            다가오는 새해에도 하나님께서 예비하신 더 큰 은혜와 계획을 기대하며 믿음의 발걸음을 함께 내딛기를 소망합니다.
            서로를 더 깊이 사랑하고 하나님의 뜻을 이루어가는 아름다운 청년부로 성장하길 기대합니다. 사랑하고 축복합니다.
        </p>
        <p class="show-up delay-more2">- 맑은샘광천교회 청년부 디렉터 김기도 목사 -</p>
    </div>
</div>
<main>
    <section class="wrapper bg-wt section">
        <div class="title-box">
            <div class="left">
                <span class="sub show-up">올 한해 청년부 사역 어떤 것들이 있었나요?</span>
                <strong class="show-up delay">What We Did in 2024</strong>
            </div>
            <%--<a href="#;" onclick="alert('12월 15일 공개 예정입니다!')" class="org-btn show-up delay"><span>연말결산 사진첩 드라이브 바로가기</span></a>--%>
        </div>

        <div class="flow-text n1 show-up delay-more">
            <ul class="list">
                <li class="item n1">#1-2청 겨울수련회</li>
                <li class="item n2">#겨울 연탄봉사</li>
                <li class="item n3">#리더십 리트릿</li>
                <li class="item n4">#1-2청 체육대회</li>
                <li class="item n5">#또래모임</li>
                <li class="item n6">#한양 도성 서울 트래킹</li>
            </ul>
        </div>
        <div class="flow-text n2 show-up delay-more">
            <ul class="list">
                <li class="item n1">#찬양예배</li>
                <li class="item n2">#홈커밍데이</li>
                <li class="item n3">#동아리 활동</li>
                <li class="item n4">#해외단기선교 인도네시아&태국</li>
                <li class="item n5">#예배국파티</li>
                <li class="item n6">#여름연합수련회</li>
                <li class="item n7">#기독교 역사 탐방</li>
            </ul>
        </div>
        <div class="flow-text n3 show-up delay-more">
            <ul class="list">
                <li class="item n1">#양육훈련</li>
                <li class="item n5">#바베큐파티</li>
                <li class="item n2">#전도축제</li>
                <li class="item n3">#방학 책모임</li>
                <li class="item n4">#성경골든벨</li>
                <li class="item n6">#OCC 선물상자</li>
            </ul>
        </div>
    </section>
    <div id="discography" class="section bg-grey qmenu">
        <div class="title-box">
            <div class="left">
                <span class="sub show-up">올해 사역 리뷰 & 베스트영상을 모아봤어요</span>
                <strong class="show-up delay">Check on Youtube!</strong>
            </div>
            <a target="_blank" href="https://www.youtube.com/@%EB%A7%91%EC%9D%80%EC%83%98%EA%B4%91%EC%B2%9C%EA%B5%90%ED%9A%8C%EC%B2%AD%EB%85%84%EB%B6%80" class="org-btn show-up delay"><span>청년부 유튜브 바로가기</span></a>
        </div>
        <div class="container show-up delay-more ytSwiper">
            <ul id="discography-albums" class="swiper-wrapper">
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://youtu.be/hr64qwRgM84?si=fewY_hS4Pu3-mY8z"><img src="/assets/images/yt01.webp" alt=""></a>
                    <h3 class="bold">청년 1-2부 여름 연합수련회 리뷰</h3>
                    <span>08.15 - 17</span>
                </li>
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://youtu.be/sz5cNEL8N7k?si=tqEg4ribvpDKXtnE"><img src="/assets/images/yt02.webp" alt=""></a>
                    <h3 class="bold">전도축제 청년부 워십</h3>
                    <span>11.04</span>
                </li>
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://youtu.be/s0ZZ3-bGerg?si=5wR3ge4uzPq4CF_6"><img src="/assets/images/yt03.webp" alt=""></a>
                    <h3 class="bold">새가족 홈커밍데이 홍보영상</h3>
                    <span>06.30</span>
                </li>
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://youtu.be/LIR4djOWjac?si=Iq_6-YFlxBEXwQ_C"><img src="/assets/images/yt04.webp" alt=""></a>
                    <h3 class="bold">맑은샘광천교회 청년부 체육대회</h3>
                    <span>04.21(2청) - 04.28(1청)</span>
                </li>
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://youtu.be/AxJxAJ_5_ho?si=a00DSGzvRHOYhX8R"><img src="/assets/images/yt05.webp" alt=""></a>
                    <h3 class="bold">청년부 1&2 하반기 바베큐파티</h3>
                    <span>10.06(1청) - 10.13(2청)</span>
                </li>
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://www.youtube.com/watch?v=iewmfkwgYyo"><img src="/assets/images/yt06.webp" alt=""></a>
                    <h3 class="bold">1학기 찬양예배 리뷰</h3>
                    <span>05.12</span>
                </li>
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://youtu.be/yqaE9BuePS8?si=XiXvvjUJwcUwjhoS"><img src="/assets/images/yt07.webp" alt=""></a>
                    <h3 class="bold">인도네시아 단기선교 보고영상</h3>
                    <span>07.14 - 25</span>
                </li>
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://youtu.be/m0WbWa8c_W8?si=pF-yfdUp1NBgg7cB"><img src="/assets/images/yt08.webp" alt=""></a>
                    <h3 class="bold">태국 단기선교 보고영상</h3>
                    <span>07.22 - 30</span>
                </li>
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://youtu.be/U5nyf68M-D0?si=KgC4Z3nAmAuETrqR"><img src="/assets/images/yt09.webp" alt=""></a>
                    <h3 class="bold">1청 겨울수련회 리뷰</h3>
                    <span>02.29 - 03.02</span>
                </li>
                <li class="album-info swiper-slide">
                    <a target="_blank" href="https://www.youtube.com/watch?v=DoDRDkh1Q80"><img src="/assets/images/yt10.webp" alt=""></a>
                    <h3 class="bold">2청 겨울수련회 리뷰</h3>
                    <span>01.18 - 20</span>
                </li>
            </ul>
        </div>
    </div>
    <section id="section3" class="event wrapper bg-bk qmenu section">
        <div class="title-box center">
            <div class="center">
                <span class="sub show-up">2024 연말결산 이벤트</span>
                <strong class="show-up delay">Share <br>Your Message!</strong>
            </div>
            <p class="show-up delay-more">올 한해 개인의 삶 또는 공동체에서 느낀 <br class="nd">감사제목을 나눠주세요<br class="nd"><br>
                12월 29일(주) 인스타그램 라이브 추첨을 통해 <br class="nd">2025 말씀노트를 선물로 드려요!
                <span class="mini">* 자세한 참여방법 및 유의사항은 하단 '꼭! 확인하세요!'를 참고하세요</span>
            </p>
        </div>
        <span class="gift show-up delay-more"><img src="/assets/images/event_item01.png" alt=""></span>
        <div class="join show-up delay-more2">
            <h5>HOW TO JOIN</h5>
            <ul>
                <li>
                    <span class="num">STEP1</span>
                    <img src="/assets/images/step01.png" alt="">
                    <p>하단 댓글 영역에서<br>감사제목을 200자 이내로 작성하세요</p>
                </li>
                <li>
                    <span class="num">STEP2</span>
                    <img src="/assets/images/step02.png" alt="">
                    <p>이름(또는 별명), 또래, 비밀번호를<br>정확하게 입력하세요</p>
                </li>
                <li>
                    <span class="num">STEP3</span>
                    <img src="/assets/images/step03.png" alt="">
                    <p>‘등록’ 버튼을 누르고 리스트에<br>업로드가 되었는지 확인!</p>
                </li>
            </ul>
        </div>
        <div class="guide-wrap">
            <div class="guide event white-txt" style="background:#333;">
                <div class="event-useguide">
                    <div class="title">꼭! 확인하세요<span class="txt"></span></div>
                    <div class="content" style="background:#333;">
                        <ul>
                            <li>
                                <em class="left">응모기간</em>
                                <span class="right">~ 2024년 12월 29일 15:59</span>
                            </li>
                            <li>
                                <em class="left">응모대상</em>
                                <span class="right">맑은샘 광천교회 청년부 (새가족 대환영)</span>
                            </li>
                            <li>
                                <em class="left">당첨자 발표</em>
                                <span class="right">2024년 12월 29일 청년부 인스타그램 (@kwangchun_youth) 계정 라이브에서 10명 추첨 , 시간 추후 인스타그램 공지</span>
                            </li>
                            <li>
                                <em class="left">선물 증정 일정</em>
                                <span class="right">2025년 1월 5일, 12일(주일) 양일간 예배전후 2F 본당 앞에서 본인확인 후 증정</span>
                            </li>
                            <li>
                                <em class="left">유의사항</em>
                                <ul class="right">
                                    <li>추첨 응모를 위해서는 이름에 실명(별명 작성 시 판별 가능한 자)을 입력해야 하며 또래를 정확하게 입력하셔야 합니다.</li>
                                    <li>여러개의 감사제목이 작성 가능하지만 이벤트를 위한 추첨 명단 응모권은 최대 1개입니다. (ex. 10개 작성 하여도 응모권은 최대 1개)</li>
                                    <li>작성한 글에 대한 수정은 불가능하며 삭제만 가능합니다. (삭제 시 입력한 비밀번호 6자리 필요)</li>
                                    <li>동일 내용 도배, 비방, 욕설 등 공동체 정신에 위배되는 글 작성 시 관리자에 의해 삭제될 수 있습니다.</li>
                                    <li>입력하신 감사제목을 제외한 이름, 또래, 비밀번호의 데이터는 페이지 종료(25년1월 말)와 함께 소멸될 예정입니다.</li>
                                    <li>관련 문의사항이 있는 경우 박다균97 형제(010-5497-5609)에게 연락 바랍니다.</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="section4" class="container wrapper bg-bk qmenu">
        <div id="post-area" class="section">
            <h2>감사제목 입력하기</h2>
            <div class="fill-area">
                <form action="/reply/write" id = "register-form" method="post"> <!-- id 추가 됨 -->
                    <!-- 댓글 입력 (200자 이내) -->
                    <div class="comment">
                        <label for="comment"><span class="hidden">나의 감사 제목(200자 이내)</span></label>
                        <textarea id="comment" name="content" maxlength="200" placeholder="2024년 올해의 감사 제목을 나눠주세요(20자 이상 200자 이내)" required></textarea>
                        <div class="count"><span id="textcount">0</span> / 200</div>
                    </div>

                    <div class="bottom-area">
                        <!-- 이름 입력 -->
                        <div class="name box">
                            <label for="name"><span class="txt">이름</span></label>
                            <input class="w100" type="text" id="name" name="name" placeholder="2자 이상 입력(특수문자 불가)" maxlength="5"  required>
                        </div>

                        <!-- 또래 입력 -->
                        <div class="year box">
                            <label for="birthYear"><span class="txt">또래</span></label>
                            <select class="w100" id="birthYear" name="generation" required>
                                <option value="" disabled selected><span class="option"></span>연도 선택</option>
                                <!-- 1980년부터 2004년까지의 연도 추가 -->
                                <option value="1980">80</option>
                                <option value="1981">81</option>
                                <option value="1982">82</option>
                                <option value="1983">83</option>
                                <option value="1984">84</option>
                                <option value="1985">85</option>
                                <option value="1986">86</option>
                                <option value="1987">87</option>
                                <option value="1988">88</option>
                                <option value="1989">89</option>
                                <option value="1990">90</option>
                                <option value="1991">91</option>
                                <option value="1992">92</option>
                                <option value="1993">93</option>
                                <option value="1994">94</option>
                                <option value="1995">95</option>
                                <option value="1996">96</option>
                                <option value="1997">97</option>
                                <option value="1998">98</option>
                                <option value="1999">99</option>
                                <option value="2000">00</option>
                                <option value="2001">01</option>
                                <option value="2002">02</option>
                                <option value="2003">03</option>
                                <option value="2004">04</option>
                                <option value="2005">05</option>
                            </select>
                        </div>

                        <!-- 비밀번호 입력 (6자리) -->
                        <div class="password box">
                            <label for="password1"><span class="txt">비밀번호</span></label>
                            <input class="w100" type="password" id="password1" placeholder="6자리 숫자 입력" name="password" minlength="6" maxlength="6" required> <!-- id 명 passworld1으로 변경-->
                        </div>

                        <!-- 비밀번호 확인 -->
                        <div class="password box">
                            <label for="password2"><span class="txt n2">비밀번호 확인</span></label>
                            <input class="w100" type="password" id="password2" placeholder="비밀번호 다시 입력" name="passwordConfirm" minlength="6" maxlength="6" required> <!-- id 명 passworld2로 변경-->
                        </div>

                        <!-- 등록 버튼 -->
                        <button type="submit" id="submit-button"><span class="btn">등록</span></button> <!-- id 추가 -->
                    </div>
                </form>

            </div>
            <div class="top-info" id="posting">
                <c:if test="${searchName.isEmpty()}">
                    <h5>전체 (${replyCount})</h5>
                </c:if>
                <c:if test="${!searchName.isEmpty()}">
                    <h5>검색 결과 (${replyCount})<a href="/index?pageNo=1&amount=12#posting" class="back-to"><span>전체 보기</span></a></h5>
                </c:if>
                <div class="search">
                    <input type="text" class="insearch" title="검색어 입력" placeholder="이름으로 작성 글 찾기" value="${searchName}">
                    <a class="in-btn">검색</a>
                </div>
            </div>
            <ul class="post">
                <!-- 카드 복사 -->
                <c:forEach var="reply" items="${replyList}">
                    <li class="post-item ${reply.background}" data-id="${reply.id}">
                        <p><span class="inner"><span class="contain"><span class="more">더보기</span><span class="real">${reply.content}</span></span></p>
                        <div class="bottom-area">
                            <span class="writer">${reply.name}&nbsp;${reply.generation.substring(2)}</span>
                            <div class="time"><span>${reply.regDate}</span></div>
                        </div>
                        <a class="delete"><span>삭제</span></a>
                    </li>
                </c:forEach>
            </ul>
            <div class="pager">
                <ul>
                    <c:if test="${maker.page.pageNo > 1}">
                        <li class="page-item cm"><a class="page-link"
                                                    href="/index?pageNo=${maker.page.pageNo - 1}&amount=${p.amount}&searchName=${searchName}#posting"><span></span></a>
                        </li>
                    </c:if>

                    <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                        <c:if test="${maker.page.pageNo != i}">
                            <li data-page-num="${i}" class="page-item">
                                <a class="page-link"
                                   href="/index?pageNo=${i}&amount=${p.amount}&searchName=${searchName}#posting"><span>${i}</span></a>
                            </li>
                        </c:if>
                        <c:if test="${maker.page.pageNo == i}">
                            <li data-page-num="${i}" class="page-item hover">
                                <a class="page-link"
                                   href="/index?pageNo=${i}&amount=${p.amount}&searchName=${searchName}#posting"><span>${i}</span></a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${maker.page.pageNo < maker.finalPage}">
                        <li class="page-item cm next"><a class="page-link"
                                                         href="/index?pageNo=${maker.page.pageNo + 1}&amount=${p.amount}&searchName=${searchName}#posting"><span></span></a>
                        </li>
                    </c:if>

                </ul>
            </div>
        </div>
    </div>
    <section id="section2" class="news wrapper bg-wt qmenu section">
        <div class="title-box">
            <div class="left">
                <span class="sub show-up">2024 총결산 카드뉴스가 도착했어요! </span>
                <strong class="show-up delay">Recap Card News</strong>
            </div>
            <a target="_blank" href="https://www.instagram.com/kwangchun_youth/" class="org-btn show-up delay"><span>청년부 인스타그램 바로가기</span></a>
        </div>
        <div class="card-swiper show-up delay-more">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card01.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card02.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card03.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card04.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card05.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card06.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card07.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card08.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card09.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card10.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card11.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card12.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card13.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card14.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card15.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card16.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card17.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card18.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card19.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card20.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card21.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card22.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card23.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card24.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card25.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card26.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card27.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card28.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card29.webp" alt="">
                </div>
                <div class="swiper-slide">
                    <img src="/assets/images/cardnews/card30.webp" alt="">
                </div>
                <div class="swiper-slide coming">
                    <div class="box"><h4></h4><span>더 많은 카드뉴스는<br>청년부 인스타그램에서 확인하세요!</span></div>
                </div>
            </div>
        </div>
    </section>
    <section class="mimo wrapper bg-org section">
        <!-- REF:소이정 -->
        <div class="title-box center">
            <div class="center show-up">
                <span class="sub">맑은샘광천교회 청년부에 대해 더 알고 싶으시다면?</span>
                <strong>Follow Our SNS!</strong>
            </div>
            <a href="https://www.instagram.com/kwangchun_youth/" class="mimo-btn show-up delay"><span><i class="fab fa-instagram"></i>@kwangchun_youth</span></a>
            <a href="https://www.youtube.com/@%EB%A7%91%EC%9D%80%EC%83%98%EA%B4%91%EC%B2%9C%EA%B5%90%ED%9A%8C%EC%B2%AD%EB%85%84%EB%B6%80" class="mimo-btn show-up delay"><span class="n2"><i class="fab fa-youtube"></i>맑은샘광천교회 청년부</span></a>
        </div>
        <div id="mimoCanvas"></div>
        <div class="mo-mimo">
            <span class="item n1"></span>
            <span class="item n2"></span>
            <span class="item n3"></span>
            <span class="item n4"></span>
        </div>
        <div class="textcontainer">
            <span class="particletext hearts">Hearts</span>
        </div>
    </section>
</main>
<footer>
    <div class="container">
        <div class="footer-box">
            <div class="sns-box">
                <img src="/assets/images/emo06.png" class="church">
                <h3>당신 근처의 좋은 교회,<br>맑은샘광천교회 청년부!</h3>
                <p>예배장소 | 맑은샘광천교회 2층 그레이스홀, 상월곡역 3번 출구<br>주일예배 | 주일 오후 2시<br></p>
            </div>
            <div id="copyright">
                <p>*해당 페이지는 2025년 1월 31일까지 운영되며 <br />이벤트 참여 시 제공받은 정보들은 페이지 종료와 함께 소멸될 예정입니다.<br><br><span>© 2024 맑은샘광천교회 청년부 예배국 디자인팀&온라인사역팀&미디어팀</span></p>
            </div>
        </div>
    </div>
</footer>







<%--    기존 모달 창--%>

<div class="layer-popup more-wrap" style="display:none;">
    <div class="layer-wrap">
        <div class="post-item bg3">
            <p><span class="inner">곡 ‘On The Ground’</span></p>
            <div class="bottom-area">
                <span class="writer">천*</span>
                <div class="time"><span>30분전</span></div>
            </div>
            <a href="" class="close"><span>닫기</span></a>
        </div>
    </div>
    <span class="dimm"></span>
</div>
<div class="layer-popup delete-wrap" style="display:none;">
    <div class="layer-wrap">
        <div class="delete-box">
            <span class="icon-delete"><img src="assets/images/icon-delete.png" alt=""></span>
            <p>글 삭제를 위해<br>등록 시 입력한 정보를 확인하고<br> 6자리 비밀번호를 입력해 주세요.</p>
            <p id="deleteName">작성자: <span class="name-info"></span></p> <!-- name 정보 표시 -->
            <label for="delPassword"><span class="hidden">비밀번호</span></label>
            <input class="w100" type="password" id="delPassword" placeholder="6자리 숫자를 입력하세요" name="password" minlength="6" maxlength="6" required>
            <div class="btn-box">
                <a href="" class="btn n1"><span>삭제하기</span></a>
                <a href="" class="btn n2"><span>취소</span></a>
            </div>
        </div>
    </div>
    <span class="dimm"></span>
</div>
<script>
    const { Engine, Render, Runner, World, Bodies, Body, Mouse, MouseConstraint, Events, Vertices } = Matter;

    const engine = Engine.create();
    const world = engine.world;

    const charactersData = [
        { imagePath: '/assets/images/mimo01.png', width: 320, height: 320, scale:0.9 },
        { imagePath: '/assets/images/mimo13.png', width: 160, height: 160, scale:0.8 },
        { imagePath: '/assets/images/mimo04.png', width: 320, height: 320, scale:1 },
        { imagePath: '/assets/images/mimo02.png', width: 320, height: 320, scale:1 },
        { imagePath: '/assets/images/mimo05.png', width: 320, height: 320, scale:0.9 },
        { imagePath: '/assets/images/mimo07.png', width: 320, height: 320, scale:1 },
        { imagePath: '/assets/images/mimo06.png', width: 320, height: 320, scale:1 },
        { imagePath: '/assets/images/mimo09.png', width: 320, height: 320, scale:0.9 },
        { imagePath: '/assets/images/mimo11.png', width: 320, height: 320, scale:0.9 },
        { imagePath: '/assets/images/mimo08.png', width: 320, height: 320, scale:0.9 },
        { imagePath: '/assets/images/mimo14.png', width: 320, height: 320, scale:0.9 },
        { imagePath: '/assets/images/mimo15.png', width: 320, height: 320, scale:0.9 },
        { imagePath: '/assets/images/mimo12.png', width: 320, height: 320, scale:0.9 },
        { imagePath: '/assets/images/mimo20.png', width: 210, height: 200, scale:0.9 },
        { imagePath: '/assets/images/mimo21.png', width: 210, height: 200, scale:0.9 },
        { imagePath: '/assets/images/mimo22.png', width: 210, height: 200, scale:0.9 },
        { imagePath: '/assets/images/mimo23.png', width: 210, height: 200, scale:0.9 },
        { imagePath: '/assets/images/mimo21.png', width: 210, height: 200, scale:0.7 },
        { imagePath: '/assets/images/mimo22.png', width: 210, height: 200, scale:0.7 },
        { imagePath: '/assets/images/mimo23.png', width: 210, height: 200, scale:0.7 },
    ];

    engine.world.gravity.y = 0;
    const globalCharacterRatio = 0.45;
    const globalCharacterRestitution = 0.1;
    const globalCharacterFriction = 0.005;
    const globalCharacterFrictionAir = 0.02;
    const globalCharacterAngularDamping = 0.02;

    const globalForceDistance = 200;
    const globalForceMagnitude = 0.01;

    const renderBox = document.getElementById('mimoCanvas');

    const render = Render.create({
        element: renderBox,
        engine: engine,
        options: {
            width: renderBox.offsetWidth,
            height: renderBox.offsetHeight,
            wireframes: false,
            background: 'transparent',
            pixelRatio: window.devicePixelRatio
        }
    });

    let boundaries;
    Render.run(render);
    const runner = Runner.create();
    Runner.run(runner, engine);

    const characters = [];

    function getRandomPosition(maxWidth, maxHeight) {
        const spacingMultiplier = maxWidth <= 750 ? 1.5 : 10; // 750px 이하일 때 간격을 넓힘
        const x = Math.random() * maxWidth * spacingMultiplier;
        const y = Math.random() * (maxHeight * 0.3) - 300;
        return { x, y };
    }

    Events.on(engine, 'beforeUpdate', function() {
        const center1 = { x: renderBox.offsetWidth * 0.35, y: renderBox.offsetHeight / 2 };
        const center2 = { x: renderBox.offsetWidth * 0.65, y: renderBox.offsetHeight / 2 };
        characters.forEach(character => {
            const deltaX1 = center1.x - character.position.x;
            const deltaY1 = center1.y - character.position.y;
            const distance1 = Math.sqrt(deltaX1 * deltaX1 + deltaY1 * deltaY1);

            const deltaX2 = center2.x - character.position.x;
            const deltaY2 = center2.y - character.position.y;
            const distance2 = Math.sqrt(deltaX2 * deltaX2 + deltaY2 * deltaY2);

            const closerCenter = distance1 < distance2 ? center1 : center2;
            const deltaX = closerCenter.x - character.position.x;
            const deltaY = closerCenter.y - character.position.y;
            const distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);

            const forceMagnitude = 0.0001 * Math.max(1, distance);

            const force = {
                x: (deltaX / distance) * forceMagnitude,
                y: (deltaY / distance) * forceMagnitude
            };

            Matter.Body.applyForce(character, character.position, force);
        });
    });

    const mouse = Mouse.create(render.canvas);
    const mouseConstraint = MouseConstraint.create(engine, {
        mouse: mouse,
        constraint: {
            stiffness: 0.2,
            render: {
                visible: false
            }
        }
    });
    World.add(world, mouseConstraint);
    render.mouse = mouse;

    Events.on(mouseConstraint, 'mousemove', (event) => {
        const mousePosition = mouse.position;

        characters.forEach(character => {
            const deltaX = character.position.x - mousePosition.x;
            const deltaY = character.position.y - mousePosition.y;
            const distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);

            if (distance < globalForceDistance) {
                const forceMagnitude = globalForceMagnitude * (globalForceDistance - distance)
                const force = {
                    x: deltaX / distance * forceMagnitude,
                    y: deltaY / distance * forceMagnitude
                };

                Matter.Body.applyForce(character, character.position, force);
            }
        });
    });

    function createCharacter(characterData, ratio = 1) {
        const { imagePath, width, height, scale } = characterData;
        const { x, y } = getRandomPosition(renderBox.offsetWidth, renderBox.offsetHeight);

        const vertices = [];
        const sides = 50;
        const angleStep = (Math.PI * 2) / sides;

        for (let i = 0; i < sides; i++) {
            const angle = i * angleStep;
            const vertexX = (width / 2) * Math.cos(angle) * ratio * globalCharacterRatio;
            const vertexY = (height / 2) * Math.sin(angle) * ratio * globalCharacterRatio;
            vertices.push({ x: vertexX, y: vertexY });
        }

        const character = Bodies.fromVertices(x, y, [vertices], {
            restitution: globalCharacterRestitution,
            friction: globalCharacterFriction,
            frictionAir: globalCharacterFrictionAir,
            angularDamping: globalCharacterAngularDamping,

            render: {
                sprite: {
                    texture: imagePath,
                    xScale: scale * ratio * globalCharacterRatio,
                    yScale: scale * ratio * globalCharacterRatio
                }
            }
        });

        character.inertia = Infinity;
        character.maxAngularVelocity = 0.1;
        return character;
    }

    function resetCharacters() {
        World.remove(world, characters);
        characters.length = 0;

        const ratio = renderBox.offsetWidth / 1000;
        const frictionAir = renderBox.offsetWidth <= 750 ? 1.2 : globalCharacterFrictionAir;
        const angularDamping = renderBox.offsetWidth <= 750 ? 1.2 : globalCharacterAngularDamping;
        const scaleMultiplier = renderBox.offsetWidth <= 750 ? 2 : 1;

        charactersData.forEach(characterData => {
            const character = createCharacter(characterData, ratio);
            character.frictionAir = frictionAir;
            character.angularDamping = angularDamping;
            character.render.sprite.xScale *= scaleMultiplier;
            character.render.sprite.yScale *= scaleMultiplier;
            characters.push(character);
            World.add(world, character);
        });
    }

    function updateCharacterScales(ratio) {
        characters.forEach(character => {
            const scale = character.render.sprite.xScale / globalCharacterRatio;
            const newScale = scale * ratio;

            character.render.sprite.xScale = newScale;
            character.render.sprite.yScale = newScale;
        });
    }

    window.addEventListener('resize', () => {
        render.options.width = renderBox.offsetWidth;
        render.options.height = renderBox.offsetHeight;
        render.canvas.width = renderBox.offsetWidth;
        render.canvas.height = renderBox.offsetHeight;
        resetCharacters();
    });

    resetCharacters();

    $(document).ready(function() {
        // 기본 스크롤 동작 허용
        $('#mimoCanvas canvas').on('wheel', function(event) {
            // 기본 동작을 막지 않도록 주석 처리 또는 제거
            // event.preventDefault();
        });
    });
</script>
<script src="/assets/script/index.js?ts=${System.currentTimeMillis()}"></script>
</body>
</html>