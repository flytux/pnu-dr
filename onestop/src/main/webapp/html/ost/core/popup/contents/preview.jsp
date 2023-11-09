<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title>부산대학교 - 학생지원시스템</title>
	  <link href="/common/css/jquery-ui.min.css" rel="stylesheet"> 
	  <link href="/common/bootstrap-4.6.1/css/bootstrap.min.css" rel="stylesheet"> 
	  <link href="/common/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet"> 
	  <link href="/common/css/common.css" rel="stylesheet">
	  <link href="/common/css/style.css" rel="stylesheet">
	  <link href="/common/css/contents.css" rel="stylesheet">
	</head>
	<body>
	   <script src="/common/js/jquery-3.6.0.min.js"></script>
		<script src="/common/js/gfn/gfn_com.js"></script>
		<script src="/common/js/gfn/gfn_str.js"></script>
		<script src="/common/js/crypto.js"></script>
		<script src="/common/js/script.js"></script>
	   <div id="root">	
	       <div class="container container-sub">
               <div class="contents-page"></div>
	       </div>
	   </div>     
    </body>
</html>
<%
	String _contents = request.getParameter("_contents");
%>
<script type="text/javascript">
$(document).ready(popInit());

function popInit() {
		$('.contents-page').html(gfn_com_valencode(Decrypt("<%=_contents%>","_key",256)));
	}	
</script>