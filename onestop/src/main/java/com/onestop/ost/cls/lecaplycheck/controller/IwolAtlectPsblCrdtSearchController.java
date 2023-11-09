package com.onestop.ost.cls.lecaplycheck.controller;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.cls.lecaplycheck.service.IwolAtlectPsblCrdtSearchService;
import com.onestop.ost.hj.stdtinfo.service.StdtInfoUpdService;

/**
 * <pre>
 * Class Name: IwolAtlectPsblCrdtSearchController.java
 * Description:  학점이월제 수강가능학점 조회 Controller Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/lecaplycheck/iwolatlectpsblcrdtsearch")

@RestController
public class IwolAtlectPsblCrdtSearchController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;


    @Autowired
    private ComFunctionService comFunctionService;
    /**
     * 학점이월제 수강가능학점을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectIwolAtlectPsblCrdtSearch")
    public Map<String, Object> selectIwolAtlectPsblCrdtSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SCH_SYEAR",
        "SCH_TERM_GCD",
        "SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_수강신청및확인_학점이월제수강가능학점_조회");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //setSuccess(result, iwolAtlectPsblCrdtSearchService.selectIwolAtlectPsblCrdtSearch(param));
        setSuccess(result, list);
        return result;
    }



    


}
