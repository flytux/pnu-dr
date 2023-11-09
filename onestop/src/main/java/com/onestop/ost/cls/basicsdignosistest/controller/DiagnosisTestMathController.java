package com.onestop.ost.cls.basicsdignosistest.controller;

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

/**
 * <pre>
 * Class Name: DiagnosisTestMathController.java
 * Description:  수학 기초학력진단평가 Controller Class
 * </pre>
 * 
 * @author 구태균
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/basicsdiagnosistest/DiagnosisTestMath")
@RestController
public class DiagnosisTestMathController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 수학 기초학력진단평가 성적를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectQuery")
    public ModelAndView selectQuery(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
      //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        
        
        //List list = diagnosisTestMathService.selectQuery(params);
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수학기초학력진단평가_조회");
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
