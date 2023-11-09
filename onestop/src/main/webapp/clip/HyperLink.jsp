<%@page import="java.io.File"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.onestop.core.util.IUtility"%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

Map<String, Object> params = new HashMap<String, Object>();
Enumeration _params = request.getParameterNames();
String hyperparam = "";
int cnt = 0;
while(_params.hasMoreElements()) {
    String name = (String) _params.nextElement();   
    String value = IUtility.parseNull(request.getParameter(name));  
    if(cnt==0){
        hyperparam += "?";
       }else{
        hyperparam += "&";
       }
    hyperparam += name + "=";
    hyperparam += value;
    cnt++;
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="./css/clipreport.css">
<link rel="stylesheet" type="text/css" href="./css/UserConfig.css">
<link rel="stylesheet" type="text/css" href="./css/font.css">
<script type='text/javascript' src='./js/jquery-1.11.1.js'></script>
<script type='text/javascript' src='./js/clipreport.js'></script>
<script type='text/javascript' src='./js/UserConfig.js'></script>
<script type='text/javascript'>
function onpageload() { 
	 var url = "/report/viewer.do" + "<%=hyperparam %>";
	 location.href=url;

}
</script>
</head>
<body onload="onpageload()">

</body>
</html>