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
import com.onestop.ost.cls.timetablesearch.service.PersonTimetableSearchService;
import com.onestop.ost.cls.timetablesearch.service.ProfTimetableSearchService;

/**
 * <pre>
 * Class Name: PersonTimetableSearchController.java
 * Description:  개인 시간표 조회 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/timetablesearch/persontimetablesearch")

@RestController
public class PersonTimetableSearchController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private PersonTimetableSearchService personTimetableSearchService;
	/**
	 * 조회여부를 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectPersonTimetableValid")
	public ModelAndView selectPersonTimetableValid(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> map = personTimetableSearchService.selectPersonTimetableValid(params);
		
		
		view.addObject("data", map);
		return view;
	}
	/**
	 * 개인시간표를 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectPersonTimetable")
	public ModelAndView selectPersonTimetable(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		List<Map<String, Object>> list = personTimetableSearchService.selectPersonTimetable(params);
		
		
		view.addObject("data", list);
		return view;
	}


}
