package com.onestop.core.function.controller;


import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.clipsoft.clipreport.oof.OOFDocument;
import com.clipsoft.clipreport.oof.OOFFile;
import com.clipsoft.clipreport.server.service.ReportUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;
import com.onestop.core.util.controller.CommonController;
/**  
 * @Class Name : LoginController.java
 * @Description : 로그인 Controller Class
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.05.17  서대영         최초생성
 * @ 2020.10.08  백성현         파라미터 한글깨짐 수정
 * @ 2020.10.28  백성현         파라미터 쉼표(,) 재변환
 */
@RequestMapping(value="/clip")
@Controller
public class ClipController extends CommonController {

    
    @RequestMapping(value="/report")
    public ModelAndView selectList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
    	
        String rptName = IUtility.getDecStr(IUtility.parseNull(paramMap.get("rptName")),ProjectConstant.SECURITY_KEY);
    	String conName = IUtility.getDecStr(IUtility.parseNull(paramMap.get("conName")),ProjectConstant.SECURITY_KEY);
    	String strData = StringEscapeUtils.unescapeHtml3(IUtility.getDecStr(IUtility.parseNull(paramMap.get("data")),ProjectConstant.SECURITY_KEY));
    	//strData  = IUtility.getReplaceDecode(new String(strData.getBytes("8859_1"),"UTF-8"));
    	strData = IUtility.getReplaceDecode(strData);
    	if(strData == null || "".equals(strData)) strData = "{}";
    	String strReportOption = StringEscapeUtils.unescapeHtml3(IUtility.getDecStr(IUtility.parseNull(paramMap.get("reportOption")),ProjectConstant.SECURITY_KEY));
    	//strReportOption  = IUtility.getReplaceDecode(new String(strReportOption.getBytes("8859_1"),"UTF-8"));
    	if(strReportOption == null || "".equals(strReportOption)) strReportOption = "{}";
    	
    	ModelAndView view = new ModelAndView();
    	view.setViewName("clip/report");
    	
    	OOFDocument oof = OOFDocument.newOOF();
    	OOFFile file = oof.addFile("crf.root", "C:/Project/PNUReport/report" + rptName);
    	logger.info(oof);
    	
    	file.addConnectionData("", conName);
    	
    	ObjectMapper mapper = new ObjectMapper();
    	Map<String, Object> dataField = new HashMap<String, Object>();
    	dataField = mapper.readValue(strData, Map.class);
    	
    	Iterator<String> iterator = dataField.keySet().iterator();
    	while(iterator.hasNext()) {
    		String paramKey = iterator.next();
    		file.addField(paramKey, IUtility.parseNull(dataField.get(paramKey)));
    	}
    	
    	String propertyPath  = request.getSession().getServletContext().getRealPath("/") + File.separator +  "WEB-INF" + File.separator + "clipreport5" + File.separator + "clipreport5.properties";
    	//String propertyPath  = "C:\\clipreport\\clipreport5"+ File.separator + "clipreport5.properties";
    	//세션을 활용하여 리포트키들을 관리하지 않는 옵션
    	//request.getSession().setAttribute("ClipReport-SessionList-Allow", false);
    	String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);
    	//리포트의 특정 사용자 ID를 부여합니다.
    	//clipreport4.properties 의 useuserid 옵션이 true 일 때만 적용됩니다. 
    	//clipreport4.properties 의 useuserid 옵션이 true 이고 기본 예제[String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);] 사용 했을 때 세션ID가 userID로 사용 됩니다.
    	//String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath, "userID");

    	//리포트key의 사용자문자열을 추가합니다.(문자숫자만 가능합니다.)
    	//String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath, "", "usetKey");
    	view.addObject("resultKey", resultKey);
    	view.addObject("reportOption", strReportOption);
    	view.addObject("strData", strData);
    	return view;
    }
    
}