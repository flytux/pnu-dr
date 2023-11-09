package com.onestop.ost.scm.scmsituation.controller;

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
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.scm.scmsituation.service.JolupStdtEplymtSituationService;
/**
 * <pre>
 * Class Name: JolupStdtEplymtSituationController.java
 * Description:  졸업생취업현황 Controller Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 02. 04.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/scm/scmsituation/JolupStdtEplymtSituation")

@RestController
public class JolupStdtEplymtSituationController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	
	@Autowired
    private ComFunctionService comFunctionService;	
	
    /**
     * 학생의 복수전공을 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/getMultiDept")
	public ModelAndView getMultiDept(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_취업통계_졸업생취업현황_복수전공조회");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        view.addObject("data", resultMap);    	
        
		return view;
	}
	
    /**
     * 졸업생취업현황 화면 졸업년도 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/getJolupYear")
	public ModelAndView getJolupYear(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_SYSTEM_GCD"
		};
		data.put("params", params);
		data.put("db", "ACADEMY");
		data.put("proc", "SCM_현황_졸업생취업현황_졸업년도_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		view.addObject("data", list);
    	
		return view;
	}
	
    /**
     * 졸업생취업현황 화면 졸업생 취업현황을 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/selectListJolupStdtEplymtSituation")
	public ModelAndView selectListJolupStdtEplymtSituation(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SCH_SYEAR",
				"SCH_COLL_GRAD_GCD",
				"SCH_GRAD_GCD",
				"SCH_COLL_CD",
				"SCH_DEPT_CD",
				"SCH_MAJOR_CD"
		};
		data.put("params", params);
		data.put("db", "ACADEMY");
		data.put("proc", "SCM_현황_졸업생취업현황_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);

		return view;
	}

    /**
     * 졸업생취업현황 화면 졸업생 취업현황상세 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/selectEmploymentStatus")
	public ModelAndView selectEmploymentStatus(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SCH_SYEAR",
				"SCH_COLL_GRAD_GCD",
				"SCH_GRAD_GCD",
				"SCH_COLL_CD",
				"SCH_DEPT_CD",
				"SCH_MAJOR_CD"
		};
		data.put("params", params);
		data.put("db", "ACADEMY");
		data.put("proc", "SCM_현황_졸업생취업현황_취업현황상세_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);

		return view;
	}
	
    /**
     * 졸업생취업현황 화면 졸업생 진학현황상세 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/selectFurtherStatus")
	public ModelAndView selectFurtherStatus(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SCH_SYEAR",
				"SCH_COLL_GRAD_GCD",
				"SCH_GRAD_GCD",
				"SCH_COLL_CD",
				"SCH_DEPT_CD",
				"SCH_MAJOR_CD"
		};
		data.put("params", params);
		data.put("db", "ACADEMY");
		data.put("proc", "SCM_현황_졸업생취업현황_진학현황상세_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);

		return view;
	}
	
    /**
     * 졸업생취업현황 화면 졸업생 구분별 스펙 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/selectSpec")
	public ModelAndView selectSpec(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SCH_SYEAR",
				"SCH_COLL_GRAD_GCD",
				"SCH_GRAD_GCD",
				"SCH_COLL_CD",
				"SCH_DEPT_CD",
				"SCH_MAJOR_CD",
				"RGROUP2",
				"COMPANY_CD",
				"COMPANY_NM",
				"SHOW_FG"
		};
		data.put("params", params);
		data.put("db", "ACADEMY");
		data.put("proc", "SCM_현황_졸업생취업현황_구분별_스펙_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);

		return view;
	}
}