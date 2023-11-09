package com.onestop.ost.cls.atlectmanual.controller;

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
import com.onestop.ost.cls.atlectmanual.service.ExunivStdtAtlectManualService;

/**
 * <pre>
 * Class Name: ExunivStdtAtlectManualController.java
 * Description:  타대생수강편람 조회 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/atlectmanual/exunivstdtatlectmanual")

@RestController
public class ExunivStdtAtlectManualController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;


	@Autowired
    private ComFunctionService comFunctionService;
	/**
	 * 타대생수강편람화면의 수강편람을 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	
	/*@RequestMapping(value = "/selectExunivStdtAtlectManual")
	public ModelAndView selectExunivStdtAtlectManual(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		List list = exunivStdtAtlectManualService.selectExunivStdtAtlectManual(params);

		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		view.addObject("pageList", IUtility.getPageInfoArr(params));
		return view;
	}*/
	@RequestMapping(value = "/selectExunivStdtAtlectManual")
	public ModelAndView selectExunivStdtAtlectManual(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SCH_SYEAR",
		"SCH_TERM_GCD",
		"FIRSTINDEX",
		"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_타대생수강편람_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		//List list = exunivStdtAtlectManualService.selectExunivStdtAtlectManual(params);

		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));
		return view;
	}
}