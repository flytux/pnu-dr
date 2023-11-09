package com.onestop.ost.jolup.hakbujolupguide.controller;

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
import com.onestop.ost.jolup.hakbujolupguide.service.JolupEvaltnResultService;

/**
 * <pre>
 * Class Name: JolupEvaltnResultController.java
 * Description: 졸업사정결과 Controller Class
 * </pre>
 * 
 * @author 심진용
 * @since 2022. 3. 8.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/jolup/hakbujolupguide/jolupevaltnresult")

@RestController
public class JolupEvaltnResultController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 작성된 사정기분별 졸업예정정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/selectListJolupEvaltnResult")
	public ModelAndView selectListJolupEvaltnResult(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		//List list = jolupEvaltnResultService.selectListJolupEvaltnResult(params);
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업사정결과_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		
		view.addObject("data", list);

		return view;
	}
    
}


