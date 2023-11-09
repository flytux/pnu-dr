package com.onestop.ost.md.controller;

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
import com.onestop.core.util.controller.CommonController;

/**
 * <pre>
 * Class Name: GlobalStdtIdIssuanceController.java
 * Description:  국제학생증발급 Controller Class
 * </pre>
 * 
 * @author 김성재
 * @since 2022. 10. 31.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/md/globalstdtidissuance")

@RestController
public class GlobalStdtIdIssuanceController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;

    
    /**
     * 사용자 정보를 을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectUserInfo")
    public ModelAndView payApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
                "SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_대학생활_국제학생증_학생정보_조회");
        data.put("resultCnt", 1);
        
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        view.addObject("data", list);
        return view;
    }
}
