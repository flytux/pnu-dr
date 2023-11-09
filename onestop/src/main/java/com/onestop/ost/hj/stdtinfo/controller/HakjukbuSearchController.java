package com.onestop.ost.hj.stdtinfo.controller;

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
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.hj.stdtinfo.service.HakjukbuSearchService;

/**
 * <pre>
 * Class Name: HakjukbuSearchController.java
 * Description:  학적부 Controller Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 18.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/hj/stdtinfo/hakjukbuSearch")

@RestController
public class HakjukbuSearchController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 학생정보를 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectStdtInfo")
    public ModelAndView selectStdtInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        /* 학생정보 조회 */
        //Map stdtInfoMap = hakjukbuSearchService.selectStdtInfo(params);
        String [] params = {
				"SESSION_USER_ID",
				"SESSION_USER_CONTENT"
		};

		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_학적_조회");
		data.put("resultCnt", 1);
		
		Map<String, Object> stdtInfoMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        view.addObject("data", stdtInfoMap);

        return view;
    }
    
    /**
     * 입학목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListEnt")
    public ModelAndView selectListEnt(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 입학목록 조회 */
        //List entList = hakjukbuSearchService.selectListEnt(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_입학_입학내역_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> entList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", entList);
		view.addObject("totalCnt", entList.size());

        return view;
    }
    
    /**
     * 출신대학교목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListOunv")
    public ModelAndView selectListOunv(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        // Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 출신대학교목록 조회 */
        // List ounvList = hakjukbuSearchService.selectListOunv(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_입학_출신대학교_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> ounvList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", ounvList);
		view.addObject("totalCnt", ounvList.size());

        return view;
    }

    /**
     * 비자정보를 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListVisa")
    public ModelAndView selectVisaInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        // Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        /*  비자정보 조회 */
        // List visaList = hakjukbuSearchService.selectListVisa(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_비자_조회");
		data.put("resultCnt", 2);
		
		List<Map<String, Object>> visaList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", visaList);

        return view;
    }
    
    /**
     * 학적변동 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListSrchg")
    public ModelAndView selectListSrchg(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 학적변동 목록 조회 */
        //List multList = hakjukbuSearchService.selectListSrchg(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_학적변동_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> multList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", multList);
		view.addObject("totalCnt", multList.size());

        return view;
    }
    
    /**
     * 다중전공신청 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListMultiMajor")
    public ModelAndView selectListMultiMajor(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 다중전공신청 목록 조회 */
        //List multList = hakjukbuSearchService.selectListMultiMajor(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_학적변동_다중전공신청_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> multList = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        view.addObject("data", multList);
		view.addObject("totalCnt", multList.size());

        return view;
    }
    
    /**
     * 연계과정신청 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListLinkProc")
    public ModelAndView selectListLinkProc(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 연계과정신청 목록 조회 */
        //List linkList = hakjukbuSearchService.selectListLinkProc(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_학적변동_연계과정신청_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> linkList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", linkList);
		view.addObject("totalCnt", linkList.size());

        return view;
    }
    
    /**
     * 학사/무논문학위취득유예신청 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListAcqDelay")
    public ModelAndView selectListAcqDelay(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 학사/무논문학위취득유예신청 목록 조회 */
        //List acqDelayList = hakjukbuSearchService.selectListAcqDelay(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_학적변동_학사무논문학위취득유예신청_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> acqDelayList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", acqDelayList);
		view.addObject("totalCnt", acqDelayList.size());

        return view;
    }
    
    /**
     * 편입/교류/복수.공동학위 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListCourseEtc")
    public ModelAndView selectListCourseEtc(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 편입/교류/복수.공동학위 목록 조회 */
        //List courseEtcList = hakjukbuSearchService.selectListCourseEtc(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_편입교류복수공동학위_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> courseEtcList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", courseEtcList);
		view.addObject("totalCnt", courseEtcList.size());

        return view;
    }
    
    /**
     * 장학금 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListJangHak")
    public ModelAndView selectListJangHak(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 장학금 목록 조회 */
        //List courseEtcList = hakjukbuSearchService.selectListJangHak(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_장학금탭_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> courseEtcList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", courseEtcList);
		view.addObject("totalCnt", courseEtcList.size());

        return view;
    }
    
    /**
     * 학기별성적 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListTermSj")
    public ModelAndView selectListTermSj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 학기별성적 목록 조회 */
        //List termSjcList = hakjukbuSearchService.selectListTermSj(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_성적_학기별성적_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> termSjcList = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        /* 학기별성적 합계 조회 */
        //Map totTermSj = hakjukbuSearchService.selectListTotTermSj(params);
		String [] params2 = {
				"SESSION_USER_ID"
		};

		data.put("params", params2);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_성적_학기별성적_합계_조회");
		data.put("resultCnt", 1);
		
		Map<String, Object> totTermSj = (Map<String, Object>)comFunctionService.bindProcMap(data);

        view.addObject("data", termSjcList);
        view.addObject("totTermSj", totTermSj);
		view.addObject("totalCnt", termSjcList.size());

        return view;
    }
    
    /**
     * 교과목성적 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListSubjSj")
    public ModelAndView selectListSubjSj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 교과목성적 목록 조회 */
        // List subSjcList = hakjukbuSearchService.selectListSubjSj(params);
        String [] params = {
				"SESSION_USER_ID",
				"SYEAR",
				"TERM_GCD"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_성적_교과목성적_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> subSjcList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", subSjcList);
		view.addObject("totalCnt", subSjcList.size());

        return view;
    }
    
    /**
     * 졸업 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListDeg")
    public ModelAndView selectListDeg(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        // Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
        /* 졸업 목록 조회 */
        // List degcList = hakjukbuSearchService.selectListDeg(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_학생정보_학적부조회_졸업_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> degcList = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", degcList);
		view.addObject("totalCnt", degcList.size());

        return view;
    }
    
}
