package com.onestop.ost.cls.syl.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.common.sample.service.SampleService;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.cls.syl.service.SylSearchService;
import com.onestop.ost.sj.kp.service.LecevalResultSearchService;
import com.onestop.ost.sj.kp.service.MiddletermLecevalService;

/**
 * <pre>
 * Class Name: SylSearchController.java
 * Description:  교수계획표 조회 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/syl/sylsearch")

@RestController
public class SylSearchController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;


	@Autowired
    private ComFunctionService comFunctionService;
	/**
	 * 교수계획표를 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/selectSylSearch")
	public ModelAndView selectSylSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SCH_SYEAR",
				"SCH_TERM_GCD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_교수계획표_강의평가_조회가능기간_조회");
		data.put("resultCnt", 1);
		Map<String, Object> dateMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		
		//Map<String,Object> dateMap = sylSearchService.selectSeachPossDate(params);
		
		String [] params2 = {
				"SCH_SYEAR",
				"SCH_TERM_GCD",
				"SEARCH_GBN",
				"profSearch_hidden",
				"SCH_SUBJ_NM",
				"FIRSTINDEX",
				"LASTINDEX"
				};
		data.put("params", params2);
		data.put("db", "OST");
		data.put("proc", "OST_수업_교수계획표_교수계획표_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//List list = sylSearchService.selectSylSearch(params);

		
		view.addObject("data", list);
		view.addObject("possDate",dateMap);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));
		return view;
	}
	
	/*@RequestMapping(value = "/selectSylSearch")
	public ModelAndView selectSylSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String,Object> dateMap = sylSearchService.selectSeachPossDate(params);
		List list = sylSearchService.selectSylSearch(params);

		
		view.addObject("data", list);
		view.addObject("possDate",dateMap);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		view.addObject("pageList", IUtility.getPageInfoArr(params));
		return view;
	}*/
}
