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

import com.onestop.common.sample.service.SampleService;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.sj.kp.service.LecevalResultSearchService;
import com.onestop.ost.sj.kp.service.MiddletermLecevalService;

/**
 * <pre>
 * Class Name: LecevalResultSearchController.java
 * Description:  강의평가 결과공개 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 01. 27.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/sj/kp/lecevalresultsearch")

@RestController
public class LecevalResultSearchController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;

	/**
	 * 해당학년도/학기의 개설강좌 중 강의평가 (대상고과목)에 해당하는 학과를 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectLecevalOpenDept")
	public ModelAndView selectLecevalOpenDept(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		//
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"BOUNDARY",
				"SYEAR",
				"SCH_TERM_GCD",
				"COLL_CD",
				"SYEAR2",
				"TERM_GCD2",
				"SESSION_SYSTEM_GCD",
				"SESSION_USER_ID",
				"SESSION_USER_DEPT_CD",
				"SESSION_SEARCH_SCOPE_GCD"
		};
		data.put("params", params);
		data.put("db", "LECTURE");
		data.put("proc", "KP_강의평가_공용_학과목록_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		//List list = lecevalResultSearchService.selectLecevalOpenDept(params);

		//
		view.addObject("data", list);

		return view;
	}

	/**
	 * 해당학년도/학기의 강의평가 교과목을 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectLecevalResultSubj")
	public ModelAndView selectLecevalResultSubj(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		//

		//List list = lecevalResultSearchService.selectLecevalResultSubj(params);
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR",
				"SCH_TERM_GCD",
				"SCH_COLL_CD",
				"SCH_DEPT_CD",
				"SCH_SUBJ_GCD",
				"SCH_SUBJ_NM",
				"SEARCH_GBN",
				"SESSION_USER_ID",
				"FIRSTINDEX",
				"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_강의평가_강의평가결과공개_교과목조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		//
		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		//view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		//view.addObject("pageList", IUtility.getPageInfoArr(params));
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

		return view;
	}
	/**
	 * 해당학년도/학기의 강의평가 교과목상세를 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectLecevalResultDetail")
	public ModelAndView selectLecevalResultDetail(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		//
		
		//List list = lecevalResultSearchService.selectLecevalResultDetail(params);
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SUBJ_NO",
				"CLASS_NO",
				"USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_강의평가_강의평가결과공개_교과목상세조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//
		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		
		return view;
	}
}
