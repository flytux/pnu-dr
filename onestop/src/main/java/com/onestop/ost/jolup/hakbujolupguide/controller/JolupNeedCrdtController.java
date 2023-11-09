package com.onestop.ost.jolup.hakbujolupguide.controller;

import java.util.HashMap;
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
import com.onestop.ost.jolup.hakbujolupguide.service.JolupFactorCriteriaSearchService;
import com.onestop.ost.jolup.hakbujolupguide.service.JolupNeedCrdtService;

/**
 * <pre>
 * Class Name: JolupNeedCrdtController.java
 * Description:  졸업소요학점 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/jolup/hakbujolupguide/jolupneedcrdt")

@RestController
public class JolupNeedCrdtController extends CommonController{
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
	@RequestMapping(value = "/selectDept")
	public ModelAndView selectDept(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		//List list = jolupNeedCrdtService.selectDept(params);
		String [] params = {
				"SCH_SYEAR"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업소요학점_학과_조회");
		data.put("resultCnt", 1);
		
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		
		view.addObject("data", list);

		return view;
	}

    /**
     * 졸업소요학점을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectSOYO")
    public ModelAndView selectSOYO(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        /* 수강신청 교과목 내역 조회 */
        //List list = jolupNeedCrdtService.selectSOYO(params);
        String [] params = {
				"SCH_SYEAR",
				"SCH_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업소요학점_학과별졸업소요학점_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    
    /**
     * 교양선택 영역별 소요학점을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectCult")
    public ModelAndView selectCult(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        //List list = jolupNeedCrdtService.selectCult(params);
        String [] params = {
				"SCH_SYEAR",
				"SCH_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업소요학점_교양선택영역별소요학점_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
}
