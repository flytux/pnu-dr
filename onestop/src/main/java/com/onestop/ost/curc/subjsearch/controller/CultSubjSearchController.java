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
import com.onestop.ost.curc.subjsearch.service.CultSubjSearchService;


/**
 * <pre>
 * Class Name: CultSubjSearchController.java
 * Description:  교양과목 조회 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 27.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/curc/subjsearch/CultSubjSearch")

@RestController
public class CultSubjSearchController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;

    
    /**
     * 교양과목에 관련된 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectCultSubjSearch")
    public ModelAndView selectCultSubjSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        
        
        //List list = cultSubjSearchService.selectCultSubjSearch(params);
        String [] params = {
				"SCH_SYEAR",
				"SCH_TERM_GCD",
				"RGROUP",
				"SCH_AREA_GCD",
				"FIRSTINDEX",
				"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교육과정_교양과목_조회");
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
