package com.onestop.ost.hj.degacq.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.main.service.MainService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.hj.degacq.service.JolupDelayApplyService;

/**
 * <pre>
 * Class Name: JolupDelayApplyController.java
 * Description: 학사학위취득유예신청 Controller Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/hj/degacq/JolupDelayApply")

@RestController
public class JolupDelayApplyController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private JolupDelayApplyService jolupDelayApplyService;
    
    @Autowired
    private ComFunctionService comFunctionService;
	
    /**
     * 학사학위취득유예신청 화면 학사학위취득유예신청목록 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListJolupDelayApply")
	public ModelAndView selectListMltiMajorApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		//List list = jolupDelayApplyService.selectListJolupDelayApply(params);
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학사학위취득유예_신청_조회");
		data.put("resultCnt", 3);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		data.put("SYSTEM_GCD", data.get("SESSION_SYSTEM_GCD"));
		data.put("MENU_CD", data.get("SESSION_MENU_CD"));
        
        /* 기준년도/학기 조회 */
    	//Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
		String [] params2 = {
				"SYSTEM_GCD",
				"MENU_CD"
		};

		data.put("params", params2);
		data.put("db", "SYS");
		data.put("proc", "SP_기준년도_학기_조회");
		data.put("resultCnt", 1);
		
		Map<String, Object> termInfo = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
    	view.addObject("termInfo", termInfo); 

		return view;
	}
	

    
    /**
     * 학사학위취득유예신청 화면 신청가능여부 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectChkApply")
    public ModelAndView selectChkApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

//        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
//        view.addObject("data", jolupDelayApplyService.selectChkApply(params));

		String [] params = {
				"SESSION_USER_ID",
				"APPLY_SYEAR",
				"APPLY_TERM_GCD",
				"TIMESNO"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학사학위취득유예_신청가능여부");
		data.put("resultCnt", 1);
		
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
		view.addObject("data", resultMap);
		
        return view;
    }
    
    /**
     * 학사학위취득유예신청을 저장 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/executeJolupDelayApply")
    public ModelAndView executeJolupDelayApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //view.addObject("data", jolupDelayApplyService.executeJolupDelayApply(params));
		String [] params = {
				"rowState",
				"SESSION_USER_ID",
				"APPLY_SYEAR",
				"APPLY_TERM_GCD",
				"CHG_SEQ_NO",
				"APPLY_CONTENT",
				"SJ_CERT_DOCU_ISSUE_NO",
				"SUPPOSE_SYEAR",
				"SUPPOSE_TERM_GCD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학사학위취득유예_신청_저장");
		data.put("resultCnt", 1);

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
		view.addObject("data", resultMap);
		
        return view;
    }

    /**
     * 학사학위취득유예신청 화면 신청가능기간여부 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectChkSchd")
    public ModelAndView selectChkSchd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //view.addObject("data", jolupDelayApplyService.selectChkSchd(params));
		String [] params = {
				"APPLY_SYEAR",
				"APPLY_TERM_GCD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학사학위취득유예_신청가능기간여부");
		data.put("resultCnt", 1);

		
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
		view.addObject("data", resultMap);
		
        return view;
    }

	
    /**
     * 학사학위취득유예신청 화면 인터넷 성적증명서 발급 번호 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/selectListSjCertDocuIssueNo")
	public ModelAndView selectListSjCertDocuIssueNo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		//List list = jolupDelayApplyService.selectListSjCertDocuIssueNo(params);
		String [] params = {
				"SESSION_USER_ID",
				"SYEAR",
				"TERM_GCD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학사학위취득유예_성적증명서발급내역_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());

		return view;
	}
	

}


