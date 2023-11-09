package com.onestop.ost.cls.makeupsituation.controller;

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
import com.onestop.ost.cls.makeupsituation.service.MakeupSituationService;

/**
 * <pre>
 * Class Name: BasketApplyInwonSearchController.java
 * Description:  희망과목담기신청인원확인 Controller Class
 * </pre>
 * 
 * @author 구태균
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/makeupsituation/MakeupSituation")
@RestController
public class MakeupSituationController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;


	@Autowired
    private ComFunctionService comFunctionService;
	/**
	 * 희망과목담기신청인원 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	/*@RequestMapping(value = "/selectQuerySearch")
	public ModelAndView selectQuerySearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		List list = service.selectQuerySearch(params);
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(params, list));
        view.addObject("pageList", IUtility.getPageInfoArr(params));
        
		return view;
	}*/
	@RequestMapping(value = "/selectQuerySearch")
	public ModelAndView selectQuerySearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SESSION_USER_ID",
		"FIRSTINDEX",
		"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_보충과목부과현황_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//List list = service.selectQuerySearch(params);
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        
		return view;
	}
}
