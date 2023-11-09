package com.onestop.ost.cls.lecaplycheck.controller;

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
import com.onestop.ost.cls.lecaplycheck.service.BasketApplyInwonSearchService;

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
@RequestMapping(value = "/ost/cls/lecaplycheck/BasketApplyInwonSearch")
@RestController
public class BasketApplyInwonSearchController extends CommonController {

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
	@RequestMapping(value = "/selectQuerySearch")
	public ModelAndView selectQuerySearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SCH_SYEAR",
		"SCH_TERM_GCD",
		"COLL_GRAD_GCD",
		"SESSION_USER_ID",
		"GBN",
		"FIRSTINDEX",
		"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_희망과목담기신청인원확인_신청인원현황_조회");
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
