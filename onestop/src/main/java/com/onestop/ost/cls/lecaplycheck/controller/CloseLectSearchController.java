package com.onestop.ost.cls.lecaplycheck.controller;

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
import com.onestop.ost.cls.lecaplycheck.service.CloseLectSearchService;

/**
 * <pre>
 * Class Name: CloseLectSearchController.java
 * Description:  폐강강좌 조회 Controller Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/lecaplycheck/closelectsearch")

@RestController
public class CloseLectSearchController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;


    @Autowired
    private ComFunctionService comFunctionService;
    /**
     * 폐강강좌를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectCloseLectSearch")
    public ModelAndView selectCloseLectSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SCH_SYEAR",
        "SCH_TERM_GCD",
        "SCH_COLL_GRAD_GCD",
        "FIRSTINDEX",
        "LASTINDEX"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_수강신청및확인_폐강강좌_조회");
        data.put("resultCnt", 1);
        comFunctionService.setPaging(data);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //List list = closeLectSearchService.selectCloseLectSearch(params);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        
        return view;
    }
}
