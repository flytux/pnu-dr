package com.onestop.ost.sj.sjsearch.controller;

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
 * Class Name: TermSjSearchController.java
 * Description:  금학기 성적 조회 Controller Class
 * </pre>
 * 
 * @author 구태균
 * @since 2022. 01. 27.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/sj/sjsearch/termsjsearch")

@RestController
public class TermSjSearchController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;

	/**
	 * 사용자 기본정보를 조회한다.
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectUserInfo")
	public ModelAndView selectUserInfo(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		//

		//List list = service.selectUserInfo(params);
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_성적_금학기성적조회_사용자정보_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		//
		view.addObject("data", list);

		return view;
	}

	/**
	 * 금학기 성적을 조회 한다.
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectQuery")
	public ModelAndView selectQuery(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		//

		//List list = service.selectQuery(params);
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYSTEM_GCD",
				"MENU_CD",
				"SESSION_USER_ID",
				"STDTGCD",
				"DEPT_CD" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_성적_금학기성적_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		//
		view.addObject("data", list);
		view.addObject("totalCnt", list.size());

		return view;
	}
}
