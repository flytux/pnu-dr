<%@page import="java.util.Map"%>
<%@page import="com.onestop.core.util.IUtility"%>
<%
	Map rtn = (Map) request.getAttribute("rtn");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>부산대학교 - 학생지원시스템</title>
	</head>
	<body>
	<%
		if("True".equals(IUtility.parseNull(rtn.get("gbn")))) {
	%>
			<form name=form1 method=post action="<%=IUtility.parseNull(rtn.get("dest"))%>">
			<input type="hidden" name="gbn" value="<%=IUtility.parseNull(rtn.get("gbn"))%>">
			<input type="hidden" name="sta" value="<%=IUtility.parseNull(rtn.get("sta"))%>">
			<input type="hidden" name="userid" value="<%=IUtility.parseNull(rtn.get("userid"))%>">
			<input type="hidden" name="name" value="<%=IUtility.parseNull(rtn.get("name"))%>">
			<input type="hidden" name="deptcd" value="<%=IUtility.parseNull(rtn.get("deptcd"))%>">
			<input type="hidden" name="dept" value="<%=IUtility.parseNull(rtn.get("dept"))%>">
			<input type="hidden" name="majorcd" value="<%=IUtility.parseNull(rtn.get("majorcd"))%>">
			<input type="hidden" name="major" value="<%=IUtility.parseNull(rtn.get("major"))%>">
			<input type="hidden" name="stdt_year" value="<%=IUtility.parseNull(rtn.get("stdt_year"))%>">
			<input type="hidden" name="collcd" value="<%=IUtility.parseNull(rtn.get("collcd"))%>">
			<input type="hidden" name="coll" value="<%=IUtility.parseNull(rtn.get("coll"))%>">
			<input type="hidden" name="gender" value="<%=IUtility.parseNull(rtn.get("gender"))%>">
			</form>
			<script language="javascript">
				document.form1.submit();
			</script>
	<%
		} else {
	%>
			<form name=form1 method=post action="<%=IUtility.parseNull(rtn.get("dest"))%>" ID="Form1">
			   <input type="hidden" name="gbn" value="<%=IUtility.parseNull(rtn.get("gbn"))%>" ID="Hidden1">	
			</form>
			<script language="javascript">
				document.form1.submit();
			</script>
	<%
		}
	%>
	</body>
</html>
