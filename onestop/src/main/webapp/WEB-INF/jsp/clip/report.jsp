<%@page import="com.onestop.core.util.IUtility" %>
<%@page import="com.clipsoft.clipreport.oof.OOFFile"%>
<%@page import="com.clipsoft.clipreport.oof.OOFDocument"%>
<%@page import="java.io.File"%>
<%@page import="com.clipsoft.clipreport.server.service.ReportUtil"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

//세션을 활용하여 리포트키들을 관리하지 않는 옵션
//request.getSession().setAttribute("ClipReport-SessionList-Allow", false);

//리포트의 특정 사용자 ID를 부여합니다.
//clipreport4.properties 의 useuserid 옵션이 true 일 때만 적용됩니다. 
//clipreport4.properties 의 useuserid 옵션이 true 이고 기본 예제[String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);] 사용 했을 때 세션ID가 userID로 사용 됩니다.
//String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath, "userID");

//리포트key의 사용자문자열을 추가합니다.(문자숫자만 가능합니다.)
//String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath, "", "usetKey");

String resultKey =  IUtility.parseNull(request.getAttribute("resultKey"));
Object reportOption = request.getAttribute("reportOption");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="./css/clipreport.css">
<link rel="stylesheet" type="text/css" href="./css/UserConfig.css?20230201">
<link rel="stylesheet" type="text/css" href="./css/font.css">
<script type='text/javascript' src='./js/jquery-1.11.1.js'></script>
<script type='text/javascript' src='./js/clipreport.js'></script>
<script type='text/javascript' src='./js/UserConfig.js'></script>
<script type='text/javascript'>
var urlPath = document.location.protocol + "//" + document.location.host;
var parentWin = opener||parent;
function html2xml(divPath){	
    var reportkey = "<%=resultKey%>";
	var report = createImportJSPReport(urlPath + "/clip/Clip.jsp", reportkey, document.getElementById(divPath));
	<%-- var reportOption = <%= reportOption%>;

	var func = eval('parentWin.' + reportOption.frameId + '_common.initCallBackReport');
	if($.isFunction(func)) func(report, window);
	//report.setDefaultRatio('PageWidth');
	//리포트 실행

	if(reportOption.useDirectPrint == true) {
		// 리포트 즉시 인쇄
		// IE에서 상단 하단에 페이지라던지 URL이 나올때는
		// IE에서는 IE 메뉴바에서 파일 -> 페이지설정 -> 머리글/바닥글의 속성을 전부 -비어 있음- 으로 변경해야합니다.
		report.directHTMLPrint();
	}
	else {
		// 리포트 뷰어 출력
		report.view();
	} --%>
	
	report.view();
	
    $('button.report_menu_close_button_svg').remove(); // 리포트 닫기버튼 숨김처리
    $('button.report_menu_reportInfo_button_svg').remove(); // 리포트 등록정보 숨김처리
	
    
    
	/* if(reportOption){
		if(reportOption.useDownload == false){
			$('button.report_menu_save_button_svg').remove();
			reportOption.useExcel = false;
			reportOption.usePdf = false;
			reportOption.useHwp = false;
			reportOption.useDoc = false;
			reportOption.useEtc = false;
		}
		
		if(reportOption.useExcel == false){
			$('button.report_menu_excel_button_svg').remove();
			report.setSaveOptionVisible("excel", false);
			report.setSaveOptionVisible("excelx", false);
			report.setSaveOptionVisible("excelData", false);
		}
		
		if(reportOption.usePdf == false){
			$('button.report_menu_pdf_button_svg').remove();
			report.setSaveOptionVisible("pdf", false);
		}
		
		if(reportOption.useHwp == false){
			$('button.report_menu_hwp_button_svg').remove();
			report.setSaveOptionVisible("hwp", false);
		}
		
		if(reportOption.useDoc == false){
			$('button.report_menu_doc_button_svg').remove();
			report.setSaveOptionVisible("doc", false);
			report.setSaveOptionVisible("docx", false);
		}
		
		if(reportOption.useEtc == false){
			$.each(['rtf','ppt','html','html5','hancell','jpg','txt','tif','multiTif','pptx'], function(i, format){
				report.setSaveOptionVisible(format, false);
			});
		}
		
		if(reportOption.usePrint == false){
			$('button.report_menu_print_button_svg').remove();
		}
		
		if(reportOption.ChangeZoomIn != undefined) {
			report.changeRatioCombo(reportOption.ChangeZoomIn);
		}
		
	} */
}
</script>
</head>
<body onload="html2xml('targetDiv1')">
<div id='targetDiv1' style='position:absolute;top:5px;left:5px;right:5px;bottom:5px;'></div>
</body>
</html>
