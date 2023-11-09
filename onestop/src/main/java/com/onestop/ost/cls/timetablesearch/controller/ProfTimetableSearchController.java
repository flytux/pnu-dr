package com.onestop.ost.cls.timetablesearch.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.cls.timetablesearch.service.ProfTimetableSearchService;

/**
 * <pre>
 * Class Name: ProfTimetableSearchController.java
 * Description:  교수별 시간표 조회 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/timetablesearch/proftimetablesearch")

@RestController
public class ProfTimetableSearchController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private ProfTimetableSearchService profTimetableSearchService;

	/**
	 * 교수소개 를 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectProfTimetable")
	public ModelAndView selectProfTimetable(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		List list = profTimetableSearchService.selectProfTimetable(params);
		
		
		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		view.addObject("pageList", IUtility.getPageInfoArr(params));
		return view;
	}

}
