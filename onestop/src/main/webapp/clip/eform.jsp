<%@page import="com.clipsoft.clipreport.oof.OOFFile"%>
<%@page import="com.clipsoft.clipreport.oof.OOFDocument"%>
<%@page import="java.io.File"%>
<%@page import="com.clipsoft.clipreport.server.service.ReportUtil"%>
<%@page import="com.clipsoft.clipreport.oof.connection.OOFConnectionHTTP"%>
<%@page import="com.clipsoft.clipreport.oof.OOFFile"%>
<%@page import="com.clipsoft.clipreport.oof.OOFDocument"%>
<%@page import="com.clipsoft.clipreport.oof.connection.*"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.clipsoft.clipreport.server.service.ReportUtil"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

String crfe = request.getParameter("_crfe")==null?"":request.getParameter("_crfe");
String url = request.getParameter("url")==null?"":request.getParameter("url");
String yrsf = request.getParameter("_yrsf")==null?"":request.getParameter("_yrsf");
String term = request.getParameter("_term")==null?"":request.getParameter("_term");

url = url.replace("&_previous=[object Object]", "");

if(url != "") {
	url = url + "&";
	//url = java.net.URLDecoder.decode(url) + "&";
}



OOFDocument oof = OOFDocument.newOOF();
//OOFFile file = oof.addFile("crfe.root", "%root%/crf/CLIP.crfe");
OOFFile file = oof.addFile("crfe.root", "%root%/crf/" + crfe + ".crfe");
oof.addField("yrsf", yrsf);
oof.addField("term", term);


String method = "get";

//url = "http://localhost:8000/common-mng/mng/bz-common-mng/standard-year-term-mng/sys-standard-year-term-info/?busss_gbn=0001&yrsf=&term=&start_date=&end_date=&format=json&";


OOFConnectionHTTP conn = oof.addConnectionHTTP("*", url, method);
conn.addContentParamJSON("*", "utf-8", "{%dataset.json.root%}");

%>

<%@include file="Property.jsp"%>

<%
//세션을 활용하여 리포트키들을 관리하지 않는 옵션
//request.getSession().setAttribute("ClipReport-SessionList-Allow", false);
String resultKey =  ReportUtil.createEForm(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);

//리포트의 특정 사용자 ID를 부여합니다.
//clipreport5.properties 의 useuserid 옵션이 true 일 때만 적용됩니다.
//clipreport5.properties 의 useuserid 옵션이 true 이고 기본 예제[String resultKey =  ReportUtil.createEForm(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);] 사용 했을 때 세션ID가 userID로 사용 됩니다.
//String resultKey =  ReportUtil.createEForm(request, oof, "false", "false", request.getRemoteAddr(), propertyPath, "userID");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EForm</title>
<meta name="viewport" content="width=800, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="./css/clipreport.css">
<link rel="stylesheet" type="text/css" href="./css/eform.css">
<link rel="stylesheet" type="text/css" href="./css/UserConfig.css">
<link rel="stylesheet" type="text/css" href="./css/font.css">
<script type='text/javascript' src='./js/jquery-1.11.1.js'></script>
<script type='text/javascript' src='./js/clipreport.js?ver=1.0'></script>
<script type='text/javascript' src='./js/UserConfig.js'></script>
<script type='text/javascript' src='./js/jform.min.js'></script>

<script type='text/javascript'>
var urlPath = document.location.protocol + "//" + document.location.host;

function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

var csrftoken = getCookie('csrftoken');

function csrfSafeMethod(method) {
    // these HTTP methods do not require CSRF protection
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}

$.ajaxSetup({
    beforeSend: function(xhr, settings) {
        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
        }
    }
});

function html2xml(divPath) {
    var eformkey = "<%=resultKey%>";
	// var eform = createImportJSPEForm(urlPath + "/ClipReport5/Clip.jsp", eformkey, document.getElementById(divPath));
	var eform = createImportJSPEForm(urlPath + "/reporting/Clip.jsp", eformkey, document.getElementById(divPath));

	// alert("urlPath:" + urlPath);
	// alert("divPath:" + divPath);

	eform.setNecessaryEnabled(true);
	eform.setStyle("close_button", "display: none;");
	// eform.setStyle("save_button", "right: 10px;background-image: url(../img/eform/save.png);width: 30px;height: 30px;");
	eform.setStyle("save_button", "right: 10px; width: 30px;height: 30px;");
	eform.setStyle("print_button","display:block; left:620px;");

	eform.setEndSaveButtonEvent(function () {
        var eformData = eform.getEFormData();

		// console.log(JSON.stringify(eformData));

        var remark = eformData["remark"].data;
        var remarkCheck = eformData["remarkCheck"].data;
        var permalink = eformData["permalink"].data;
        var sndrd_yrterm_info_ident = eformData["sndrd_yrterm_info_ident"].data;
        var busss_gbn = eformData["busss_gbn"].data;
        var yrsf = eformData["yrsf"].data;
        var term = eformData["term"].data;
        var start_date = eformData["start_date"].data;
        var end_date = eformData["end_date"].data;
        // var url = permalink.toString().replace('?format=json', '').replace('http://localhost:8000', '');
        var url = permalink.toString().replace('?format=json', '').replace('http://one.pusan.ac.kr:8000', '');

        var json = {
            "sndrd_yrterm_info_ident" : sndrd_yrterm_info_ident[0].toString(),
            "busss_gbn" : busss_gbn[0].toString(),
            "yrsf" : yrsf[0].toString(),
            "term" : term[0].toString(),
            "start_date" : start_date[0].toString(),
            "end_date" : end_date[0].toString(),
            "start_date_str" : start_date[0].toString(),
            "end_date_str" : end_date[0].toString(),
            "remark" : remark[0].toString(),
            "crtr_ip" : '127.0.0.1',
        };

        data = [{
            method:'PUT',
            url:url,
            data:json
        }];

		console.log("data:", data);

        $.ajax({
            // url:'http://localhost:8000/core/batch/',
            url:'http://one.pusan.ac.kr:8000/core/batch/',
            // url:'/core/batch/',
            type:"POST",
            data:JSON.stringify(data),
            contentType:"application/json; charset=utf-8",
            dataType:"json",
            success: function(){
                alert('저장 되었습니다.');
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
	});

	eform.view();
}

</script>
</head>
<body onload="html2xml('targetDiv1')">
<div id='targetDiv1' style='position:absolute;top:5px;left:5px;right:5px;bottom:5px;'></div>
</body>
</html>
