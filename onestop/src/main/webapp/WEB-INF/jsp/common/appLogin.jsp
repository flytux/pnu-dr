<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@page import="java.util.Map"%>
<%@page import="com.onestop.core.util.IUtility"%>
<%
	Map _site = (Map)session.getAttribute("SITE_INFO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부산대학교 - 학생지원시스템</title>
<link rel="shortcut icon" href="/common/images_ses/logo.ico" type="image/x-icon">
</head>
<body>
<script src="/common/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var gCsrfTokenHeaderName = '${_csrf.headerName}';
	var gCsrfTokenParameterName = '${_csrf.parameterName}';
	var gCsrfToken = '${_csrf.token}';
	var userId = '${userId}';
	var menuCD = '${menuCD}';


var form = $('<form method="POST" action="/login/loginCheck">');
form.append('<input type="hidden" name="USER_ID" value="'+userId+'">');
form.append('<input type="hidden" name="'+gCsrfTokenParameterName+'" value="'+gCsrfToken+'" />');
form.append('<input type="hidden" name="_appLoginCheck" value="Y">');
form.append('<input type="hidden" name="menuCD" value="'+menuCD+'">');
$('body').append(form);
form.submit().remove();
</script>
</body>
</html>