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
import com.onestop.ost.curc.subjsearch.service.StdtApplyCurcSearchService;

/**
 * <pre>
 * Class Name: CultSubjSearchController.java
 * Description:  교양과목 조회 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/curc/subjsearch/StdtApplyCurcSearch")

@RestController
public class StdtApplyCurcSearchController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 학생별적용교육과정에 관련된 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectStdtApplyCurcSearch")
    public ModelAndView selectStdtApplyCurcSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        
        
        //List list = stdtApplyCurcSearchService.selectStdtApplyCurcSearch(params);
        String [] params = {
				"SCH_CURC_APPLY_SYEAR",
				"SCH_DEPT_CD",
				"MAJOR_CD",
				"FIRSTINDEX",
				"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교육과정_학생별적용교육과정_조회");
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
	 * 해당학년도 학과를 조회한다. - selectBox
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
		
		

		//List list = stdtApplyCurcSearchService.selectOpenDept(params);
		String [] params = {
				"SCH_CURC_APPLY_SYEAR",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교육과정_교육과정적용년도_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		
		view.addObject("data", list);

		return view;
	}
}