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
import com.onestop.ost.cls.atlectmanual.service.AtlectManualService;

/**
 * <pre>
 * Class Name: AtlectManualController.java
 * Description:  수강편람 조회 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 15.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/atlectmanual/atlectmanual")

@RestController
public class AtlectManualController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;
	
	@Autowired
    private AtlectManualService atlectManualService;
	/**
	 * 수강편람화면의 학년도/학기/대학대학원구분 별 원어강의 조회조건을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectLativeLangLectGcd")
	public ModelAndView selectLativeLangLectGcd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		//List list = atlectManualService.selectLativeLangLectGcd(params);

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SCH_SYEAR",
		"SCH_TERM_GCD",
		"SCH_COLL_GRAD_GCD",
		"SCH_LANG"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강편람_원어강의_조회조건_조회");
		data.put("resultCnt", 1);

		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		view.addObject("data", list);
		return view;
	}
	/**
	 * 수강편람화면의 세부구분 (학과)을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectDetailSelectList")
	public ModelAndView selectDetailSelectList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SCH_SYEAR",
		"SCH_TERM_GCD",
		"SCH_COLL_GRAD_GCD",
		"SCH_SUBJ_GBN"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강편람_세부구분_수강학과_조회조건_조회");
		data.put("resultCnt", 1);

		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		//List list = atlectManualService.selectDetailSelectList(params);
		
		view.addObject("data", list);
		return view;
	}

	/**
	 * 수강편람화면의 세부구분 (단과대학)을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectDetailSelectCollList")
	public ModelAndView selectDetailSelectCollList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SCH_SYEAR",
		"SCH_TERM_GCD",
		"SCH_COLL_GRAD_GCD",
		"SCH_SUBJ_GBN"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강편람_단과대학_조회조건_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		//List list = atlectManualService.selectDetailSelectCollList(params);
		
		view.addObject("data", list);
		return view;
	}
	/**
	 * 수강편람화면의 수강편람을 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	/*@RequestMapping(value = "/selectAtlectManual")
	public ModelAndView selectAtlectManual(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		List list = atlectManualService.selectAtlectManual(params);
		
		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		view.addObject("pageList", IUtility.getPageInfoArr(params));
		return view;
	}*/
	
	@RequestMapping(value = "/selectAtlectManual")
	public ModelAndView selectAtlectManual(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		List list = atlectManualService.selectAtlectManual(params);
		
		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		view.addObject("pageList", IUtility.getPageInfoArr(params));
		return view;
	}
	/**
	 * 수강편람화면의 제한사항 팝업을 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/selectAtlectManualPrecaution")
	public ModelAndView selectAtlectManualPrecaution(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SYEAR",
		"TERM_GCD",
		"SUBJ_NO",
		"CLASS_NO",
		"MNG_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강편람_팝업_제한사항_조회");
		data.put("resultCnt", 1);
	
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//List list = atlectManualService.selectAtlectManualPrecaution(params);
		
		view.addObject("data", list);
		return view;
	}
	/**
	 * 수강편람화면의 배정인원 조회가능 여부를 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/selectPeronnellSearchPossFg")
	public ModelAndView selectPeronnellSearchPossFg(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
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
		data.put("proc", "OST_수업_수강편람_배정인원_조회여부_조회");
		data.put("resultCnt", 1);
		Map<String, Object> map = (Map<String, Object>)comFunctionService.bindProcMap(data);
		//Map<String, Object> map = atlectManualService.selectPeronnellSearchPossFg(params);
		
		view.addObject("data", map);
		return view;
	}
	
	/**
	 * 수강편람화면의 배정인원를 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectAtlectManualPersonnel")
	public ModelAndView selectAtlectManualPersonnel(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SUBJ_NO",
				"CLASS_NO",
				"MNG_DEPT_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강편람_팝업_배정인원_조회");
		data.put("resultCnt", 1);
		Map<String, Object> map = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		//Map<String, Object> map = atlectManualService.selectAtlectManualPersonnel(params);
		
		view.addObject("data", map);
		return view;
	}
	/**
	 * 수강편람화면팝업의 혼합 개설교과목 일자별 수업유형을 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectAtlectManualMixSubjTypeGcd")
	public ModelAndView selectAtlectManualMixSubjTypeGcd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SYEAR",
		"TERM_GCD",
		"SUBJ_NO",
		"CLASS_NO",
		"FIRSTINDEX",
		"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강편람_팝업_수업유형_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		
		//List list =  atlectManualService.selectAtlectManualMixSubjTypeGcd(params);
		
		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		return view;
	}
	/**
	 * 수강편람화면팝업의 교수상세를 조회한다. 
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectAtlectManualDetailProf")
	public ModelAndView selectAtlectManualDetailProf(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SYEAR",
		"TERM_GCD",
		"SUBJ_NO",
		"CLASS_NO"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강편람_교수상세_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//List list =  atlectManualService.selectAtlectManualDetailProf(params);
		
		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		return view;
	}
}
