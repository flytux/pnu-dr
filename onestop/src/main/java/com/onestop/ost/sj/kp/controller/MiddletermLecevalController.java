package com.onestop.ost.sj.kp.controller;

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
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.sj.kp.service.MiddletermLecevalService;

/**
 * <pre>
 * Class Name: MiddletermLecevalController.java
 * Description:  중간강의평가 Controller Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 01. 25.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/sj/kp/middletermleceval")

@RestController
public class MiddletermLecevalController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private MiddletermLecevalService middletermLecevalService;
    
    @Autowired
    private MainService mainService;
	@Autowired
    private ComFunctionService comFunctionService;

    
    /**
     * 학사일정을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchSchdChk")
    public ModelAndView searchSchdChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);

        if(termInfo.size() > 0) {
        	params.put("SYEAR", termInfo.get("SYEAR"));
        	params.put("TERM_GCD", termInfo.get("TERM_GCD"));
        }
        Map<String, Object> map = middletermLecevalService.searchSchdChk(params);

        view.addObject("data", map);
        
        return view;
    }
    
    /**
     * 중간강의평가에 관련된 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectMiddletermLeceval")
    public ModelAndView selectMiddletermLeceval(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        //List list = middletermLecevalService.selectMiddletermLeceval(params);
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"FIRSTINDEX",
				"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_강의평가_중간강의평가_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        //view.addObject("pageInfo", IUtility.getPageInfo(params, list));
        //view.addObject("pageList", IUtility.getPageInfoArr(params));
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        
        return view;
    }
    
    /**
     * 중간강의평가 강의평가 전체문항을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectMiddletermLecevalQuestionList")
    public ModelAndView selectMiddletermLecevalQuestionList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        //List list = middletermLecevalService.selectMiddletermLecevalQuestionList(params);
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SUBJ_NO",
				"CLASS_NO",
				"CHARGE_PROF_NO",
				"LECEVAL_GCD",
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_강의평가_중간강의평가_평가_전체문항_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    
    /**
     * 중간강의평가 강의평가작성 내용을 저장한다.
     * 
     * @param paramList
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/saveMiddletermLecevalQuestion")
    public ModelAndView saveMiddletermLecevalQuestion(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");
        view.addObject("data", middletermLecevalService.saveMiddletermLecevalQuestion(list));
        
        return view;
    }
}
