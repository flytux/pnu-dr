package com.onestop.ost.mil.controller;

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
 * Class Name: YbCompnStaSearchController.java
 * Description:  예비군편성상태조회 Controller Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 1. 26.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/mil/ybCompnStaSearch")

@RestController
public class YbCompnStaSearchController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 예비군 병역정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectYbMilInfo")
    public ModelAndView selectYbMilInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_병역정보_조회");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
       // Map milMap = ybCompnStaSearchService.selectYbMilInfo(params);

        //view.addObject("data", milMap);
		view.addObject("data", resultMap);

        return view;
    }
    
    /**
     * 예비군 편성상태를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectYbCompnSta")
    public ModelAndView selectYbCompnSta(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_편성상태_조회");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        //Map ybStaMap = ybCompnStaSearchService.selectYbCompnSta(params);
       // 

        view.addObject("data", resultMap);
        
        return view;
    }

    
    /**
     * 예비군 편성사항 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListYbCompnSta")
    public ModelAndView selectListYbCompnSta(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

		/*
		 * Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		 * 
		 * Map map = ybCompnStaSearchService.selectYbCompnStaInfo(params);
		 * view.addObject("data", map);
		 */
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_편성사항_조회");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

		view.addObject("data", resultMap);
        return view;
    }

}
