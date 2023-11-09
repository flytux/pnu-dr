package com.onestop.ost.jolup.degthesissubmitqexam.controller;

import java.util.HashMap;
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
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.jolup.degthesissubmitqexam.service.DegThesisSubmitQexamApplySearchService;
/**
 * <pre>
 * Class Name: DegThesisSubmitQexamApplySearchController.java
 * Description:  학위논문제출 자격시험 신청내역 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/jolup/degthesissubmitqexam/degthesissubmitqexamapplysearch")

@RestController
public class DegThesisSubmitQexamApplySearchController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 종합시험 신청내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    
    @RequestMapping(value="/selectCompExam")
    public ModelAndView selectCompExam(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = degThesisSubmitQexamApplySearchService.selectCompExam(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"MONTH",				
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_학위논문제출자격시험신청내역_종합시험신청내역_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    

    /**
     * 외국어시험 신청내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    
    @RequestMapping(value="/selectForeignExam")
    public ModelAndView selectForeignExam(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = degThesisSubmitQexamApplySearchService.selectForeignExam(params);
		String [] params = {
				"SYEAR",
				"MONTH",	
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_학위논문제출자격시험신청내역_외국어시험신청내역_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    
    /**
     * 학위논문제출자격시험 조회일정 여부 조회
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectExamInfoPosibleYn")
    public ModelAndView selectExamInfoPosibleYn(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"GRAD_GCD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_학위논문제출자격시험신청내역_일정_조회");
		data.put("resultCnt", 1);

		Map<String, Object> examPossibleMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        view.addObject("data", examPossibleMap);

        return view;
    }
}
