package com.onestop.ost.mil.controller;

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

/**
 * <pre>
 * Class Name: YbDrillApplyController.java
 * Description: 예비군훈련신청 Controller Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 1. 25.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/mil/ybdrillapply")

@RestController
public class YbDrillApplyController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;
	
	/**
     * 예비군훈련신청 일정 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "selectYbschedulecheck")
    public ModelAndView selectYbschedulecheck(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_예비군_교육지원신청서_신청일정조회");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        //List list = ybDrillApplyService.selectListYbDrillApply(params);
       
        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
//        view.addObject("pageInfo", IUtility.getPageInfo(params, list));
//        view.addObject("pageList", IUtility.getPageInfoArr(params));
        
        return view;
    }

    /**
     * 예비군훈련신청 화면 학생기본조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListYbDrillApply")
    public ModelAndView selectListYbDrillApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_교육지원신청서_학생기본조회");
		data.put("resultCnt", 2);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        //List list = ybDrillApplyService.selectListYbDrillApply(params);
       
        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
//        view.addObject("pageInfo", IUtility.getPageInfo(params, list));
//        view.addObject("pageList", IUtility.getPageInfoArr(params));
        
        return view;
    }
    

    /**
     * 예비군훈련신청 화면 교육일자조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListYbDrillApply2")
    public ModelAndView selectListYbDrillApply2(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = { 
				
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_교육지원신청서_교육일자조회");
		data.put("resultCnt", 2);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        //List list = ybDrillApplyService.selectListYbDrillApply2(params);
       

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
//        view.addObject("pageInfo", IUtility.getPageInfo(params, list));
//        view.addObject("pageList", IUtility.getPageInfoArr(params));
        
        return view;
    }

    /**
     * 예비군훈련신청 화면 입력체크를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectYbDrillApply")
    public ModelAndView selectYbDrillApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"NUM" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_교육지원신청서_입력체크");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        //view.addObject("data", ybDrillApplyService.selectYbDrillApply(params));
		view.addObject("data", resultMap);
        
        return view;
    }

    /**
     * 예비군훈련신청 화면 입력체크2를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectYbDrillApply2")
    public ModelAndView selectYbDrillApply2(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID",
				"NUM" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_교육지원신청서_입력체크2");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        //view.addObject("data", ybDrillApplyService.selectYbDrillApply2(params));
		view.addObject("data", resultMap);
        
        return view;
    }

    /**
     * 예비군훈련신청 화면 입력을 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/insertYbDrillApply")
    public ModelAndView insertYbDrillApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID",
				"NUM",
				"",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_교육지원신청서_입력");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        //view.addObject("data", ybDrillApplyService.insertYbDrillApply(params));
		view.addObject("data", resultMap);
        
        return view;
    }

    /**
     * 예비군훈련신청 화면 삭제를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/deleteYbDrillApply")
    public ModelAndView deleteYbDrillApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID",
				"EDU_DATE",
				"EDU_GCD" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_교육지원신청서_삭제");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        //view.addObject("data", ybDrillApplyService.deleteYbDrillApply(params));
        view.addObject("data", resultMap);
        
        return view;
    }
    
    
}
