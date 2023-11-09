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
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.kj.teachcourseguide.service.FacultyLicenseAcqSearchService;

/**
 * <pre>
 * Class Name: FacultyLicenseAcqSearchController.java
 * Description: 교직선발 및 교원자격취득확인 Contoller Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/kj/teachcourseguide/FacultyLicenseAcqSearch")

@RestController
public class FacultyLicenseAcqSearchController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;
	
	@Autowired
    private ComFunctionService comFunctionService;
	
    /**
     * 교직선발 및 교원자격취득확인 화면 교직선발 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListTeachApply")
    public ModelAndView selectListTeachApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교직선발및교원자격취득확인_교직선발_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
    
    /**
     * 교직선발 및 교원자격취득확인 화면 교원자격 취득 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListFacultyLicense")
    public ModelAndView selectListFacultyLicense(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교직선발및교원자격취득확인_교원자격취득_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
}
