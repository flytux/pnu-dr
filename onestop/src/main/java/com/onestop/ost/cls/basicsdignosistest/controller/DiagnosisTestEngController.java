package com.onestop.ost.cls.basicsdignosistest.controller;

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
import com.onestop.ost.cls.basicsdignosistest.service.DiagnosisTestEngService;

/**
 * <pre>
 * Class Name: DiagnosisTestEngController.java
 * Description:  영어 기초학력진단평가 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/basicsdiagnosistest/DiagnosisTestEng")

@RestController
public class DiagnosisTestEngController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

    
    @Autowired
    private ComFunctionService comFunctionService;
    /**
     * 영어 기초학력진단평가 응시여부를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchTestFg")
    public ModelAndView searchTestFg(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수강신청_영어기초학력진단평가_응시여부_조회");
        data.put("resultCnt", 1);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //List list = diagnosisTestEngService.searchTestFg(params);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    
    /**
     * 영어 기초학력진단평가 결과에 따른 수강신청 과목을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return List<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchSubjList")
    public ModelAndView searchSubjList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수강신청_영어기초학력진단평가_수강신청과목_조회");
        data.put("resultCnt", 1);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //List list = diagnosisTestEngService.searchSubjList(params);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
  
}
