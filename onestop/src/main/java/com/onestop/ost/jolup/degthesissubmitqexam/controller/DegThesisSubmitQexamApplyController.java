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
import com.onestop.ost.jolup.degthesissubmitqexam.service.DegThesisSubmitQexamApplyService;

/**
 * <pre>
 * Class Name: DegThesisSubmitQexamApplyController.java
 * Description:  학위논문자격시험 웹신청 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/jolup/degthesissubmitqexam/degthesissubmitqexamapply")

@RestController
public class DegThesisSubmitQexamApplyController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 학적정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectStdtInfo")
    public Map<String, Object> selectStdtInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //setSuccess(result, degThesisSubmitQexamApplyService.selectStdtInfo(param));
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"MONTH",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_학위논문자격시험웹신청_학생정보_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 기합격정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/checkPassSubject2")
    public Map<String, Object> checkPassSubject2(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
    	String [] params = {
    			"SESSION_USER_ID",
    			"KOREAN_EXAM_APPLY_FG",
    			"ENG_EXAM_APPLY_FG",
    			"SECOND_FORELANG_EXAM_GCD"
    	};
    	data.put("params", params);
    	data.put("db", "OST");
    	data.put("proc", "OST_졸업_학위논문자격시험웹신청_기합격과목외국어_조회");
    	data.put("resultCnt", 1);
    	
    	List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	setSuccess(result, list);
    	
    	return result;
    }
    
    /**
     * 응시대상과목을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    
    @RequestMapping(value="/selectSubject")
    public ModelAndView selectExamSubj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = degThesisSubmitQexamApplyService.selectSubject(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"GRAD_GCD",
				"DEG_COURSE_GCD",
				"MAJOR_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_학위논문자격시험웹신청_응시대상과목_조회");
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
     * 응시신청과목을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    
    @RequestMapping(value="/selectApplySubject")
    public ModelAndView selectApplySubject(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = degThesisSubmitQexamApplyService.selectApplySubject(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"MONTH",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_학위논문자격시험웹신청_응시신청과목_조회");
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
     * 기합격과목 외국어를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    
    @RequestMapping(value="/selectPassSubject")
    public ModelAndView selectPassSubject(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = degThesisSubmitQexamApplyService.selectPassSubject(params);
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_학위논문자격시험웹신청_기합격과목내역_조회");
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
     * 기합격 과목을 조회한다.
     * 
     * @param paramList
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/checkPassSubject")
    public ModelAndView checkPassSubject(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas = (List<Map<String, Object>>) paramMap.get("data");

        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SESSION_USER_ID",
    				"COMP_EXAM_SUBJ_CD",
    				"SUBJ_NM",
    				"GRAD_GCD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_졸업_학위논문자격시험웹신청_기합격과목_조회");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
		/*
		 * String [] params = { "SESSION_USER_ID", "COMP_EXAM_SUBJ_CD", "SUBJ_NM",
		 * "GRAD_GCD" };
		 * 
		 * data.put("params", params); data.put("db", "OST"); data.put("proc",
		 * "OST_졸업_학위논문자격시험웹신청_기합격과목_조회"); data.put("resultCnt", 1);
		 * 
		 * Map<String, Object> resultMap = (Map<String,
		 * Object>)comFunctionService.bindProcList(data);
		 */
        
        //view.addObject("data", degThesisSubmitQexamApplyService.checkPassSubject(list));
        view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 시험신청.
     * 
     * @param paramList
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/excuteSubject")
    public ModelAndView excuteSubject(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas = (List<Map<String, Object>>) paramMap.get("data");

        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"STATUS",
    				"SYEAR",
    				"MONTH",
    				"TERM_GCD",
    				"SESSION_USER_ID",
    				"COMP_EXAM_SUBJ_CD",
    				"SUBJ_NM",
    				"GRAD_GCD",
    				"DEG_COURSE_GCD",
    				"COMP_EXAM_TYPE_GCD",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_졸업_학위논문자격시험웹신청_전공과목신청");
    		datas.get(i).put("resultCnt", 1);
		}
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
        
        //view.addObject("data", degThesisSubmitQexamApplyService.excuteSubject(list));
        view.addObject("data", resultMap);
        
        return view;
    }
    /**
     * 시험신청.
     * 
     * @param paramList
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/excuteSubject2")
    public ModelAndView excuteSubject2(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");
    	
    	@SuppressWarnings("unchecked")
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
		String [] params = {
				"STATUS",
				"SYEAR",
				"MONTH",
				"TERM_GCD",
				"SESSION_USER_ID",
				"GRAD_GCD",
				"DEG_COURSE_GCD",
				"KOREAN_EXAM_APPLY_FG",
				"ENG_EXAM_APPLY_FG",
				"SECOND_FORELANG_EXAM_GCD",
				"FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};
		
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_학위논문자격시험웹신청_외국어과목신청");
		data.put("resultCnt", 1);
    	Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
    	
    	//view.addObject("data", degThesisSubmitQexamApplyService.excuteSubject(list));
    	view.addObject("data", resultMap);
    	
    	return view;
    }
    
    
    /**
     * 학위논문제출자격시험 일정 여부 조회
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectExamPosibleYn")
    public ModelAndView selectExamPosibleYn(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"GRAD_GCD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_학위논문자격시험웹신청_일정_조회");
		data.put("resultCnt", 1);

		Map<String, Object> examPossibleMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        view.addObject("data", examPossibleMap);

        return view;
    }
}
