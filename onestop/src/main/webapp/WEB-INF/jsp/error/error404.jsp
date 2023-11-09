<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%
log("------------- error404 Start -------------");
if(exception != null){
    String msg = exception.getLocalizedMessage();
    log(msg, exception);
}
log("------------- error404 End -------------");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 에러</title>
<link rel="shortcut icon" href="/common/images/favicon.ico" type="image/x-icon">
<link href="/common/css/non-page.css" rel="stylesheet">
</head>
<body>
    <div id="Commingsoon" class="wrap">
        <img src="/common/images/error_img.png" alt="페이지 준비중" />
        <h1>페이지<span>준비중</span>입니다</h1>
        <hr>
        <p>요청하신 페이지가 존재하지 않습니다<br />요청하신 페이지가 제거되었거나, 이름이 변경되었거나 일시적으로 사용할 수 없습니다.</p>
        <a href="/main" class="btn">메인으로 바로가기 &gt;</a><!-- .do -->
    </div>
</body>
</html>