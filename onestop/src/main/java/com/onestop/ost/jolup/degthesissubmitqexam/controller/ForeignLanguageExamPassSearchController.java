package com.onestop.ost.jolup.degthesissubmitqexam.controller;

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
import com.onestop.ost.jolup.degthesissubmitqexam.service.ForeignLanguageExamPassSearchService;
/**
 * <pre>
 * Class Name: ForeignLanguageExamPassSearchController.java
 * Description:  외국어시험 합격조회 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/jolup/degthesissubmitqexam/foreignlanguageexampasssearch")

@RestController
public class ForeignLanguageExamPassSearchController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 외국어시험 합격여부를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    
    @RequestMapping(value="/selectExamPass")
    public ModelAndView selectExamPass(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = foreignLanguageExamPassSearchService.selectExamPass(params);
		String [] params = {
				"SESSION_USER_ID",
				"FIRSTINDEX",
				"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_외국어시험합격조회_조회");
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
