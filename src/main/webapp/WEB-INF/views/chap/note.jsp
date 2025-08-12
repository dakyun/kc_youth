<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2026 말씀노트 사전판매</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/assets/css/resetfornote.css?ts=${System.currentTimeMillis()}">
    <link rel="stylesheet" href="/assets/css/note26.css?ts=${System.currentTimeMillis()}">
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>
<div class="top_img">
    <div class="logo">
        <img src="/assets/images/note26/top_logo.png" alt="">
        <p><strong>사전예약</strong> (8/15~10/15)</p>
    </div>
    <div class="topSwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="/assets/images/note26/top_img01.jpg" alt=""></div>
            <div class="swiper-slide"><img src="/assets/images/note26/top_img02.jpg" alt=""></div>
        </div>
        <div class="swiper-pagination"></div>
    </div>
    <img src="/assets/images/note26/top_img10.jpg" alt="">
</div>
<div class="content_gap"></div>
<!-- 중간 네비게이션 -->
<nav class="tab-nav" id="tabNav">
    <a href="#noteSell" class="tab-item active">사전예약 주문</a>
    <a href="#sectionDetail" class="tab-item">상세내용 보기</a>
</nav>

<main id="noteSell">
    <form id="orderForm" autocomplete="off">
        <!-- 1. 기본 정보 -->
        <div class="note-box">
            <div class="row">
                <span class="s-txt">이름<em>*</em></span>
                <input type="text" id="buyerName" class="input-style" placeholder="예) 김교회" maxlength="6" required>
            </div>
            <div class="row">
                <span class="s-txt">연락처<em>*</em></span>
                <input type="tel" id="buyerPhone" class="input-style" placeholder="예) 010-1234-5678" required>
            </div>
        </div>

        <!-- 2. 말씀노트 (필수) -->
        <div class="note-box">
            <div class="row">
                <span class="s-txt">말씀노트<em>*</em></span>
                <div class="qty-price">
                    <!-- 좌측: 수량 조절 -->
                    <div class="qty-control" data-item="note">
                        <button type="button" class="minus">−</button>
                        <div class="num" id="note_cnt">1</div>
                        <button type="button" class="plus">＋</button>
                    </div>
                    <!-- 우측: 가격 정보 -->
                    <div class="price-area">
                        <span class="orig" style="display:none;"></span>
                        <span class="rate" style="display:none;"></span>
                        <span class="disc-price"></span>
                    </div>
                </div>
            </div>

            <!-- 3. 옵션 (선택) : 디지털 말씀노트 -->
            <!-- 옵션 (선택) : 디지털 말씀노트 -->
            <div class="row">
                <span class="s-txt">옵션 (선택)</span>
                <label class="opt-check">
                    <input type="checkbox" id="digitalOpt">
                    <i class="box"></i>
                    <span class="label-txt">디지털 말씀 노트 추가 (PDF, +3,000원)</span>
                </label>

                <!-- 이메일 입력 영역 (디폴트 숨김) -->
                <div class="etc n3" id="emailRow" style="display:none;">
                    <!-- JS로 input 여러 개 생성 -->
                </div>
            </div>


            <!-- 체크 시 렌더되는 옵션 UI -->
            <div id="digitalOptionRow" class="row opt-row" style="display:none;">
                <div class="opt-right">
                    <div class="qty-control" data-item="digital">
                        <button type="button" class="minus">−</button>
                        <div class="num" id="digital_cnt">1</div>
                        <button type="button" class="plus">＋</button>
                    </div>
                    <div class="wrapper">
                        <div class="price"><em id="digitalPrice">3,000</em>원</div>
                        <button type="button" class="remove" id="digitalRemove" aria-label="remove">삭제</button>
                    </div>
                </div>
            </div>

            <!-- 4. 수령 방법 (필수) -->
            <div class="row last">
                <span class="s-txt">수령 방법<em>*</em></span>
                <div class="radio">
                    <label class="flex">
                        <input type="radio" name="receive" value="C" checked>
                        <span class="word">현장수령</span>
                    </label>
                    <span class="mini">10/19(주일), 10/26(주일) 오후 1시 맑은샘광천교회 2층 로비</span>

                    <label class="flex">
                        <input type="radio" id="parcel" name="receive" value="D">
                        <span class="word">택배발송</span>
                    </label>
                    <span class="mini">택배발송을 원하시면 선택 후 주소를 입력해주세요.<br>*택배비 20권당 4,000원</span>

                    <!-- 택배 선택 시 노출 -->
                    <div class="etc n2" id="addressRow" style="display:none;">
                        <div class="wrapper">
                            <button type="button" onclick="execDaumPostcode()">검색</button>
                            <input id="addr" class="input-style yet" type="text" placeholder="배송 받으실 주소를 정확히 입력하세요">
                        </div>
                        <input id="addr_add" class="input-style yet n2" type="text" placeholder="상세 주소 입력">
                    </div>
                </div>
            </div>
        </div>

        <!-- 5. 총 금액 계산기 -->
        <div class="note-box">
            <div class="calc-box">
                <h3 class="calc-title"><img src="/assets/images/note26/ico_calc.svg" alt="">총 금액 계산기</h3>
                <ul class="calc-list" id="calcList">
                    <!-- JS로 항목 렌더 -->
                </ul>
                <div class="total">
                    <span>총 금액</span>
                    <strong id="totalPrice">12,000원</strong>
                </div>
            </div>
            <a href="https://aq.gy/f/Q%5exCr" class="sendmoney" target="_blank">송금하기</a>

            <p class="alert">송금 후 현재 페이지의 "주문서 제출하기"를 꼭 눌러주세요!</p>
        </div>

        <!-- 하단 고정 -->
        <div class="fixed_bottom">
            <a href="" class="left">문의</a>
            <button type="submit" class="submit-btn">주문서 제출하기</button>
        </div>
    </form>
</main>
<div class="content_gap"></div>
<div class="detail_img_wrap" id="sectionDetail">
    <div class="detail_img">
        <img src="/assets/images/note26/detail01.jpg" alt="">
        <img src="/assets/images/note26/detail02.jpg" alt="">
        <img src="/assets/images/note26/detail03.jpg" alt="">
        <img src="/assets/images/note26/detail04.jpg" alt="">
        <img src="/assets/images/note26/detail05.jpg" alt="">
        <img src="/assets/images/note26/detail06.jpg" alt="">
        <img src="/assets/images/note26/detail07.jpg" alt="">
    </div>
    <button type="button" class="btn-more"><span id="detailMoreBtn">2026 말씀노트 자세히보기</span></button>
</div>
<div class="content_gap"></div>
<footer class="section">
    <a href="http://pf.kakao.com/_xcBxouM"><img src="/assets/images/note26/footer.jpg"></a>
</footer>
<div class="" style="padding-bottom:100px;"></div>

<script src="/assets/script/note26.js?ts=${System.currentTimeMillis()}"></script>
</body>
</html>