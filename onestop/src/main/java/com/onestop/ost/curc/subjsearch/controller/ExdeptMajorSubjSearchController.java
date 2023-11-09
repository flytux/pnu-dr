package com.onestop.ost.curc.subjsearch.controller;

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
import com.onestop.ost.curc.subjsearch.service.ExdeptMajorSubjSearchService;

/**
 * <pre>
 * Class Name: ExdeptMajorSubjSearchController.java
 * Description:  타과 전공인정과목 조회 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 28.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/curc/subjsearch/ExdeptMajorSubjSearch")

@RestController
public class ExdeptMajorSubjSearchController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 타과전공인정과목에 관련된 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectExdeptMajorSubjSearch")
    public ModelAndView selectExdeptMajorSubjSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        
        //List list = exdeptMajorSubjSearchService.selectExdeptMajorSubjSearch(params);
        String [] params = {
				"SCH_DEPT_CD",
				"FIRSTINDEX",
				"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교육과정_타과인정과목조회_대학원과목_조회");
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
	 * 타과전공인정 대학원 구분을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectOpenGrad")
	public ModelAndView selectOpenGrad(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		

		//List list = exdeptMajorSubjSearchService.selectOpenGrad(params);
		String [] params = {};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교육과정_타과전공인정_대학원_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		
		view.addObject("data", list);

		return view;
		
	}
	/**
	 * 타과전공인정 단과대학을 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectOpenColl")
	public ModelAndView selectOpenColl(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		

		//List list = exdeptMajorSubjSearchService.selectOpenColl(params);
		String [] params = {};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교육과정_타과전공인정_단과대학_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		
		view.addObject("data", list);

		return view;
	}
	
	/**
	 * 타과전공인정 학과를 조회한다. - selectBox
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/selectOpenDept")
	public ModelAndView selectOpenDept(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		

		//List list = exdeptMajorSubjSearchService.selectOpenDept(params);
		String [] params = {};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교육과정_타과전공인정_학과_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		
		view.addObject("data", list);

		return view;
	}
}
