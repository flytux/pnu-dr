package com.onestop.ost.cls.profintro.controller;

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
import com.onestop.ost.cls.profintro.service.ProfIntroService;

/**
 * <pre>
 * Class Name: ProfIntroController.java
 * Description:  교수소개 조회 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 24.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/profintro/profintro")

@RestController
public class ProfIntroController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;


	@Autowired
    private ComFunctionService comFunctionService;
	/**
	 * 교수소개 (대학원)을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectProfIntroGrad")
	public ModelAndView selectProfIntroGrad(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_교수소개_대학원_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//List list = profIntroService.selectProfIntroGrad(params);
		
		view.addObject("data", list);
		return view;
	}

	/**
	 * 교수소개 (단과대학)을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectProfIntroColl")
	public ModelAndView selectProfIntroColl(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_교수소개_단과대학_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//List list = profIntroService.selectProfIntroColl(params);
		
		view.addObject("data", list);
		return view;
	}
	/*@RequestMapping(value = "/selectProfIntroColl")
	public ModelAndView selectProfIntroColl(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		List list = profIntroService.selectProfIntroColl(params);
		
		
		view.addObject("data", list);
		return view;
	}*/
	/**
	 * 교수소개 (학과)을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectProfIntroDept")
	public ModelAndView selectProfIntroDept(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_교수소개_학과_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		
		//List list = profIntroService.selectProfIntroDept(params);
		
		
		view.addObject("data", list);
		return view;
	}
	/*@RequestMapping(value = "/selectProfIntroDept")
	public ModelAndView selectProfIntroDept(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		List list = profIntroService.selectProfIntroDept(params);
		
		
		view.addObject("data", list);
		return view;
	}*/
	/**
	 * 교수소개 를 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectProfIntro")
	public ModelAndView selectProfIntro(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SCH_DEPT_CD",
		"FIRSTINDEX",
		"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_교수소개_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		
		//List list = profIntroService.selectProfIntro(params);
		
		
		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));
		return view;
	}
	/**
	 * 교수소개 상세을 조회한다. - 팝업
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectProfDetailIntro")
	public ModelAndView selectProfDetailIntro(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"PROF_NO"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_교수소개_상세_조회");
		data.put("resultCnt", 1);
		Map<String, Object> map = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		
		//Map<String, Object> map = profIntroService.selectProfDetailIntro(params);
		
		
		view.addObject("data", map);
		return view;
	}
	/*@RequestMapping(value = "/selectProfDetailIntro")
	public ModelAndView selectProfDetailIntro(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> map = profIntroService.selectProfDetailIntro(params);
		
		
		view.addObject("data", map);
		return view;
	}*/
}
