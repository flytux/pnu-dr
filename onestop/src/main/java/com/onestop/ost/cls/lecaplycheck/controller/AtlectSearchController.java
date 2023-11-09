package com.onestop.ost.cls.lecaplycheck.controller;

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
import com.onestop.core.main.service.MainService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.cls.lecaplycheck.service.AtlectSearchService;

/**
 * <pre>
 * Class Name: AtlectSearchController.java
 * Description:  수강확인 Controller Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/lecaplycheck/AtlectSearch")

@RestController
public class AtlectSearchController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;
    
    
    @Autowired
    private MainService mainService;

    @Autowired
    private ComFunctionService comFunctionService;
    /**
     * 기준학년도,학기를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectOneShafYyShtm")
    public ModelAndView selectOneShafYyShtm(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        // 기준학년도 조회
        Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);

        view.addObject("data", termInfo);
        return view;
    }
    
    /**
     * 자동신청결과확인 기간, 개강일자 체크 및 외국학생보험납부 내역을 조회한다.
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

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> result = new HashMap<String, Object>();

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        // 자동신청결과확인 기간 조회
        //Map<String, Object> autoSchd = atlectSearchService.searchAutoApplySchdChk(params);
    	
    	// 학사일정 개강일자 기간 조회
        //Map<String, Object> classSchd = atlectSearchService.searchClassOpenSchdChk(params);

    	String [] params3 = {
    			"SCH_SYEAR",
    			"SCH_TERM_GCD",
    			"SESSION_USER_ID"
    			};
    	data.put("params", params3);
    	data.put("db", "OST");
    	data.put("proc", "OST_수업_수강신청및확인_수강확인_수강신청확인_조회");
    	data.put("resultCnt", 1);
    	List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	// 수강확인 그리드 조회
    	//List<Map<String, Object>> list = atlectSearchService.searchAtlectSearchList(params);
    	
    	result.put("resultYn","Y");
    	view.addObject("list", list);
    	view.addObject("totalCnt", list.size());

        view.addObject("data", result);
        return view;
    }
    /*@RequestMapping(value = "/searchSchdChk")
    public ModelAndView searchSchdChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> result = new HashMap<String, Object>();

        // 자동신청결과확인 기간 조회
        Map<String, Object> autoSchd = atlectSearchService.searchAutoApplySchdChk(params);
        
        if (autoSchd.get("SCHD_FG").equals("Y")) {
        	// 학사일정 개강일자 기간 조회
            Map<String, Object> classSchd = atlectSearchService.searchClassOpenSchdChk(params);
            
            if(classSchd.get("MSG_TYPE").equals("Y")) {
            	// 수강확인 그리드 조회
            	List<Map<String, Object>> list = atlectSearchService.searchAtlectSearchList(params);
            	
            	result.put("resultYn","Y");
            	view.addObject("list", list);
            	view.addObject("totalCnt", list.size());
            } else {
            	result.put("resultYn","N");
            	result.put("msg",classSchd.get("MSG"));
            }
        } else if (autoSchd.get("SCHD_FG").equals("N")) {
        	result.put("resultYn","N");
        	result.put("msg","조회기간이 아닙니다.");
        }
        view.addObject("data", result);
        return view;
    }*/
    /**
     * 폐강과목현황을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchClosedList")
    public ModelAndView searchClosedList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SCH_SYEAR",
        "SCH_TERM_GCD",
        "SESSION_USER_ID" //"STDT_NO"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_수강신청및확인_수강확인_폐강강좌현황_조회");
        data.put("resultCnt", 1);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //List<Map<String, Object>> list = atlectSearchService.searchClosedList(params);

    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());

        return view;
    }
    /*@RequestMapping(value = "/searchClosedList")
    public ModelAndView searchClosedList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        List<Map<String, Object>> list = atlectSearchService.searchClosedList(params);

    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());

        return view;
    }*/
    /**
     * 수강취소현황을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchCancelList")
    public ModelAndView searchCancelList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SCH_SYEAR",
        "SCH_TERM_GCD",
        "SESSION_USER_ID" //"STDT_NO"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_수강신청및확인_수강확인_수강취소현황_조회");
        data.put("resultCnt", 1);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //List<Map<String, Object>> list = atlectSearchService.searchCancelList(params);

    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());
        return view;
    }
    /*@RequestMapping(value = "/searchCancelList")
    public ModelAndView searchCancelList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        List<Map<String, Object>> list = atlectSearchService.searchCancelList(params);

    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());
        return view;
    }*/
}
