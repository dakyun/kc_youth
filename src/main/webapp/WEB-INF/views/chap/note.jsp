<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2025 말씀노트 판매</title>
    <link rel="stylesheet" href="/assets/css/resetfornote.css?ts=${System.currentTimeMillis()}">
    <link rel="stylesheet" href="/assets/css/note.css?ts=${System.currentTimeMillis()}">
    <script src="/assets/script/note.js?ts=${System.currentTimeMillis()}"></script>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="allwrap">
<header>
    <img src="/assets/images/note_01.jpg">
</header>
<main id="noteSell">
    <h2><strong>예약정보 입력</strong></h2>
    <div class="note-box">
        <div class="row">
            <span class="s-txt">이름<em>*</em></span>
            <input type="text" id="name" class="input-style" placeholder="예) 김교회" maxlength="6">
        </div>
        <div class="row">
            <span class="s-txt">연락처<em>*</em></span>
            <input type="text" id="contact" class="input-style" placeholder="예) 010-1234-5678">
        </div>
        <div class="row">
            <span class="s-txt">예약 수량<em>*</em></span>
            <div class="radio">
                <label>
                    <input type="radio" onchange="setDisplay()" name="quantity" value="q1" checked />
                    <span>1권</span>
                </label>
                <label>
                    <input type="radio" onchange="setDisplay()" name="quantity" value="q2" />
                    <span>2권</span>
                </label>
                <label>
                    <input type="radio" onchange="setDisplay()" name="quantity" value="q3" />
                    <span>3권</span>
                </label>
                <label>
                    <input type="radio" onchange="setDisplay()" name="quantity" value="q4" />
                    <span>4권</span>
                </label>
                <label>
                    <input type="radio" onchange="setDisplay()" name="quantity" value="q5" />
                    <span>5권</span>
                </label>
                <label>
                    <input onchange="setDisplay()" id="q_etc"  type="radio" name="quantity" value="etc" />
                    <span>기타</span>
                </label>
                <div class="etc n1" style="display:none;">
                    <input id="quantity_etc_input" class="input-style yet" type="text" placeholder="권 수를 입력하세요">
                </div>
            </div>
        </div>
        <div class="row last">
            <span class="s-txt">수령 방법<em>*</em></span>
            <div class="radio">
                <label class="flex">
                    <input type="radio" onchange="setDisplay2();setDisplay3()" name="receive" value="C" checked />
                    <span class="word"><strong>현장수령</strong></span>
                </label>
                <span class="mini">맑은샘광천교회 주일 청년부예배 전,후 본당 로비에서 수령<br>(12/15~12/31) *자세한 일정은 추후 공지 예정입니다.</span>
                <label class="flex">
                    <input type="radio" onchange="setDisplay2();setDisplay3();" id="parcel" name="receive" value="D" />
                    <span class="word"><strong>택배발송</strong></span>
                </label>
                <span class="mini">택배발송을 원하시면 체크 후 주소를 입력해주세요.<br>*택배비 5권당 4,000원</span>
                <div class="etc n2" style="display:none;">
                    <button class="addrbtn" type="button" onclick="execDaumPostcode()"><span>주소 검색</span></button>
                    <input id="addr" class="input-style yet" type="text" name="receive" placeholder="주소를 검색하세요" readonly>
                    <input id="addr_add" class="input-style yet" type="text" name="receive" placeholder="상세주소를 입력하세요">
                </div>
                <label class="flex last">
                    <input type="radio" onchange="setDisplay2();setDisplay3();" id="pad" name="receive" value="I" />
                    <span class="word"><strong>아이패드 파일</strong></span>
                </label>
                <span class="mini">파일로 받기를 원하시면 체크 후 이메일을 입력해주세요.<br>*디지털 말씀노트(12/15부터 순차 발송)</span>
                <div class="etc n3" style="display:none;">
                    <input id="email" class="input-style yet" type="text" name="receive" placeholder="ex)abc123@naver.com">
                </div>
            </div>
        </div>
        <button type="button" id="noteApply" class="pp-btn"><span>주문서 제출하기</span></button>
        <span class="alert">*하단 신청하기 버튼 제출 시 개인정보수집에 동의한 것으로 간주됩니다.</span>
    </div>
    <div class="margin-box"></div>
    <div class="note-box">
        <div class="row payment">
            <span class="s-txt">결제 방법</span>
            <a class="kakaobtn" href="https://m.site.naver.com/1giZI"><span class="logo">물구나무이야기로 송금됩니다.</span><span class="txt">카카오페이</span></a>
            <p>무통장입금 : <span id="copyButton"><span id="copysource">3333-28-8190208 카카오뱅크</span><span class="copyment">복사하기</span></span><br>
                <span style="display:inline-block;width:19.3vw"></span>(예금주 : 물구나무이야기)</p></p>
        </div>
    </div>
    <div class="margin-box"></div>
    <div class="q-box">
        <div class="img"> <img src="/assets/images/note_02.jpg"></div>
        <ul>
            <li><a href="https://m.site.naver.com/1yg3J">말씀노트가 궁금하다면?<span class="arrow"></span></a></li>
            <li><a href="https://www.instagram.com/p/C96ZwIszhlK/?img_index=1">2024 말씀노트 판매수익금 후원 결과 보고<span class="arrow"></span></a></li>
        </ul>
    </div>
    <div class="margin-box"></div>
</main>
<footer class="section">
     <a href="http://pf.kakao.com/_xcBxouM"><img src="/assets/images/note_03.jpg"></a>
</footer>
</div>
<script>
    /* contact copy 버튼 */
    document.execCommand("copy");
    var button = document.getElementById("copyButton"),
        contentHolder = document.getElementById("copysource");

    button.addEventListener(
        "click",
        function () {
            var range = document.createRange(),
                selection = window.getSelection();

            selection.removeAllRanges();

            range.selectNodeContents(contentHolder);

            selection.addRange(range);

            document.execCommand("copy");

            selection.removeAllRanges();

            alert('계좌번호가 복사되었습니다!')
        },
        false,
    );
</script>
</body>
</html>