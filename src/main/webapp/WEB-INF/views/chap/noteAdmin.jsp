<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2025 말씀노트 판매 어드민페이지</title>
</head>
<body>
<main>
    <form action="/note/download/excel" method="post">
        <button type="submit">엑셀 다운로드</button>
    </form>
</main>
</body>
</html>