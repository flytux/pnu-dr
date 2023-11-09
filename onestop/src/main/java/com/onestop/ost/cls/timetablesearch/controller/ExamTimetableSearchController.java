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
import com.onestop.ost.cls.timetablesearch.service.ExamTimetableSearchService;
import com.onestop.ost.cls.timetablesearch.service.LectroomTimetableSearchService;
import com.onestop.ost.cls.timetablesearch.service.ProfTimetableSearchService;

/**
 * <pre>
 * Class Name: ExamTimetableSearchController.java
 * Description:  시험 시간표 조회 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/timetablesearch/examtimetablesearch")

@RestController
public class ExamTimetableSearchController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private ExamTimetableSearchService examTimetableSearchService;
	/**
	 * 조회여부를 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectexamTimetableValid")
	public ModelAndView selectexamTimetableValid(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> map = examTimetableSearchService.selectexamTimetableValid(params);
		
		
		view.addObject("data", map);
		return view;
	}
	/**
	 * 시험시간표를 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectexamTimetable")
	public ModelAndView selectexamTimetable(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		List<Map<String, Object>> list = examTimetableSearchService.selectexamTimetable(params);
		
		
		view.addObject("data", list);
		return view;
	}


}
