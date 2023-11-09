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
import com.onestop.ost.cls.timetablesearch.service.LectroomTimetableSearchService;
import com.onestop.ost.cls.timetablesearch.service.ProfTimetableSearchService;

/**
 * <pre>
 * Class Name: LectroomTimetableSearchController.java
 * Description:  강의실별 시간표 조회 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 04.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/timetablesearch/lectroomtimetablesearch")

@RestController
public class LectroomTimetableSearchController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private LectroomTimetableSearchService lectroomTimetableSearchService;
	/**
	 * 건물을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectbldCd")
	public ModelAndView selectbldCd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		List list = lectroomTimetableSearchService.selectbldCd(params);
		
		
		view.addObject("data", list);
		return view;
	}
	/**
	 * 강의실을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectFacilityNo")
	public ModelAndView selectFacilityNo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		List list = lectroomTimetableSearchService.selectFacilityNo(params);
		
		
		view.addObject("data", list);
		return view;
	}
	/**
	 * 강의실별 시간표를 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectLectroomTimetable")
	public ModelAndView selectLectroomTimetable(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		List list = lectroomTimetableSearchService.selectLectroomTimetable(params);
		
		
		view.addObject("data", list);
		return view;
	}

}
