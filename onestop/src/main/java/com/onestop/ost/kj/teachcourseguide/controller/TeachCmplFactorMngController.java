package com.onestop.ost.kj.teachcourseguide.controller;

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
import com.onestop.ost.kj.teachcourseguide.service.TeachCmplFactorMngService;

/**
 * <pre>
 * Class Name: TeachCmplFactorMngController.java
 * Description: 교직이수요건관리 Controller Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 17.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/kj/teachcourseguide/TeachCmplFactorMng")
@RestController
public class TeachCmplFactorMngController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private TeachCmplFactorMngService teachCmplFactorMngService;
    
	@Autowired
    private ComFunctionService comFunctionService;
	
    /**
     * 교직이수요건관리 화면 대상자 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListTeachCmplFactorMng")
    public ModelAndView selectListTeachCmplFactorMng(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
    	
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

        param.put("SYSTEM_GCD", param.get("SESSION_SYSTEM_GCD"));
        param.put("MENU_CD", param.get("SESSION_MENU_CD"));
        
        /* 기준년도/학기 조회 */
		String [] params = {
				"SYSTEM_GCD",
				"MENU_CD"
		};

		param.put("params", params);
		param.put("db", "SYS");
		param.put("proc", "SP_기준년도_학기_조회");
		param.put("resultCnt", 1);
		Map<String, Object> termInfo = (Map<String, Object>)comFunctionService.bindProcMap(param);     
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
        data.put("SYEAR", termInfo.get("SYEAR"));
        data.put("TERM_GCD", termInfo.get("TERM_GCD"));		
	
		String [] params2 = {
				"SESSION_USER_ID",
				"",
				""
		};
		data.put("params", params2);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교직이수요건관리_대상자_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
    	view.addObject("termInfo", termInfo); 
        
        return view;
    }	
    
    /**
     * 교직이수요건관리 화면 신청및이수내역 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListTeachCmplFactorMng2")
    public ModelAndView selectListTeachCmplFactorMng2(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID",
				"PROGRAM_GCD" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교직이수요건관리_신청내역_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
    
    /**
     * 교직이수요건관리 화면 개설내역및신청 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListTeachCmplFactorMng3")
    public ModelAndView selectListTeachCmplFactorMng3(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"PROGRAM_GCD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교직이수요건관리_개설현황_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
    

    /**
     * 교직이수요건관리 화면 신청 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertTeachCmplFactorMng")
    public ModelAndView insertTeachCmplFactorMng(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        view.addObject("data", teachCmplFactorMngService.insertTeachCmplFactorMng(params));	
        
        return view;
    }
    
    /**
     * 교직이수요건관리 화면 신청취소 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deleteTeachCmplFactorMng")
    public ModelAndView deleteTeachCmplFactorMng(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"PROGRAM_GCD",
				"PROGRAM_SERIAL_NO",
				"SESSION_USER_ID",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교직이수요건관리_신청_삭제");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

		view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 교직이수요건관리 화면 항목별검사 조회 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectListTeachCmplFactorMngPop")
    public ModelAndView selectListTeachCmplFactorMngPop(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"PROGRAM_GCD",
				"PROGRAM_SERIAL_NO",
				"SESSION_USER_ID"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교직이수요건관리_항목별점수_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

		view.addObject("data", resultMap);
        
        return view;
    }
    
}