<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%
log("------------- error450 Start -------------");
if(exception != null){
    String msg = exception.getLocalizedMessage();
    log(msg, exception);
}
log("------------- error450 End -------------");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>500 에러</title>
<link rel="shortcut icon" href="/common/images/favicon.ico" type="image/x-icon">
<link href="/common/css/non-page.css" rel="stylesheet">
</head>
<body>
    <div id="Error" class="wrap">
        <img src="/common/images/error_img.png" alt="페이지 오류" />
        <h1>페이지<span>오류</span>안내</h1>
        <hr>
        <p>서비스 처리 과정에서 에러가 발생하였습니다.</p>
        <a href="/main" class="btn">메인으로 바로가기 &gt;</a><!-- .do -->
    </div>
</body>
</html>