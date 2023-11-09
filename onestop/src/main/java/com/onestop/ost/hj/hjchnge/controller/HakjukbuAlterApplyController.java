package com.onestop.ost.hj.hjchnge.controller;

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
import com.onestop.core.main.service.MainService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.hj.hjchnge.service.HakjukbuAlterApplyService;

/**
 * <pre>
 * Class Name: HakjukbuAlterApplyController.java
 * Description:  학적부변경신청 Controller Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/hj/hjchnge/hakjukbuAlterApply")

@RestController
public class HakjukbuAlterApplyController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private HakjukbuAlterApplyService hakjukbuAlterApplyService;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 학생정보, 정정신청 내역을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListHakjukbuAlterApply")
    public ModelAndView selectListHakjukbuAlterApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        data.put("SYSTEM_GCD", data.get("SESSION_SYSTEM_GCD"));
        data.put("MENU_CD", data.get("SESSION_MENU_CD"));
        
        /* 기준년도, 학기 조회 */
    	//Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
        
        String [] params = {
				"SYSTEM_GCD",
				"MENU_CD"
		};
        
		data.put("params", params);
		data.put("db", "SYS");
		data.put("proc", "SP_기준년도_학기_조회");
		data.put("resultCnt", 1);
		Map<String, Object> termInfo = (Map<String, Object>)comFunctionService.bindProcMap(data);

    	/* 정정신청 내역 조회 */
        //List list = hakjukbuAlterApplyService.selectListHakjukbuAlterApply(params);
		
		String [] params2 = {
				"SESSION_USER_ID"
		};
		data.put("params", params2);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학적변동_학적부기재사항정정신청_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
    	view.addObject("termInfo", termInfo); 
        view.addObject("totalCnt", list.size());

        return view;
    }
    
    
    /**
     * 정정신청을 저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/executeHakjukbuAlterApply")
    public ModelAndView saveSampleInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        view.addObject("data", hakjukbuAlterApplyService.executeHakjukbuAlterApply(params));
        
        return view;
    }
    
}
