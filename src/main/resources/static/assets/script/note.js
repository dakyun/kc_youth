document.addEventListener('DOMContentLoaded', function () {
    initEvents();
});

const NoteWriteRequestDTO = {
    name: "",
    contact: "",
    cnt: 0,
    type: "",
    addr: "",
    use_yn: "N",
};

function initEvents() {
    // 기타 입력란 표시/숨기기 이벤트
    document.querySelector("input#q_etc").addEventListener("change", function () {
        // document.querySelector(".etc.n1").style.display = this.checked ? "block" : "none";
        setDisplay();
    });


    // 택배 주소 입력란 표시/숨기기 이벤트
    document.querySelector("input#parcel").addEventListener("change", function () {
        // document.querySelector(".etc.n2").style.display = this.checked ? "block" : "none";
        setDisplay2();
    });


    // 신청하기 버튼 클릭 이벤트
    document.getElementById("noteApply").addEventListener("click", function () {
        applyNote();
    });
}

function applyNote() {
    const name = document.getElementById("name").value.trim();
    const contact = document.getElementById("contact").value.trim();
    let cnt = document.querySelector("input[name='quantity']:checked").value;
    const type = document.querySelector("input[name='receive']:checked").value;
    let addr = "";
    let addr_add = "";
    if(type === "D") {
        addr = document.getElementById("addr").value.trim();
        addr_add = document.getElementById("addr_add").value.trim();
    } else if(type === "I") {
        addr = document.getElementById("email").value.trim();
    }

    if (cnt === "etc") {
        cnt = parseInt(document.getElementById("quantity_etc_input").value.trim(), 10);
        if (isNaN(cnt) || cnt <= 0) {
            alert("기타 권수를 올바르게 입력하세요.");
            return;
        }
    } else {
        cnt = parseInt(cnt.substring(1), 10); // "q1" -> 1
    }

    // 필수 값 체크
    if (!name || !contact || cnt <= 0 || !type || (type === "D" && (!addr || !addr_add)) || (type === "I" && !addr)) {
        alert("모든 필수 입력값을 확인하세요.");
        return;
    }

    // DTO 생성
    const requestDTO = {
        ...NoteWriteRequestDTO,
        name: name,
        contact: contact,
        cnt: cnt,
        type: type,
        addr: (addr + " " + addr_add).trim(),
        use_yn: "Y",
        reg_dt: new Date().toISOString(),
        chg_dt: new Date().toISOString(),
    };

    // AJAX 요청
    sendNoteData(requestDTO);
}

function sendNoteData(data) {
    $.ajax({
        url: "/note/apply",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function (response) {
            alert("신청이 성공적으로 완료되었습니다.");
            console.log("응답 데이터:", response);
            resetForm();
        },
        error: function (xhr, status, error) {
            alert("오류가 발생했습니다. 다시 시도해주세요.");
            console.error("오류 상세:", status, error);
        },
    });
}

function resetForm() {
    document.getElementById("name").value = "";
    document.getElementById("contact").value = "";
    document.querySelector("input[name='quantity'][value='q1']").checked = true;
    document.querySelector("input[name='receive'][value='C']").checked = true;
    document.getElementById("quantity_etc_input").value = "";
    document.getElementById("addr").value = "";
    document.getElementById("addr_add").value = "";
    document.getElementById("email").value = "";
    document.querySelector(".etc.n1").style.display = "none";
    document.querySelector(".etc.n2").style.display = "none";
    document.querySelector(".etc.n3").style.display = "none";
}

function setDisplay(){
    if($('input:radio[id=q_etc]').is(':checked')){
        $('.etc.n1').show();
    }else{
        $('.etc.n1').hide();
    }
}
function setDisplay2(){
    if($('input:radio[id=parcel]').is(':checked')){
        $('.etc.n2').show();
    }else{
        $('.etc.n2').hide();
    }
}
function setDisplay3(){
    if($('input:radio[id=pad]').is(':checked')){
        $('.etc.n3').show();
    }else{
        $('.etc.n3').hide();
    }
}

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress;

            document.getElementById("addr").value = roadAddr;
            document.getElementById('addr_add').focus();
        }
    }).open();
}
