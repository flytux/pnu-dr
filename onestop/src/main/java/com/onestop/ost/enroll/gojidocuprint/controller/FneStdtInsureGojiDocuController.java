package com.onestop.ost.enroll.gojidocuprint.controller;

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
 * Class Name: FneStdtInsureGojiDocuController.java
 * Description:  외국인 유학생 보험료 고지서 Controller Class
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/enroll/gojidocuprint/fnestdtInsuregojidocu")

@RestController
public class FneStdtInsureGojiDocuController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 외국인보험료 납부내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectFneStdtInsure")
    public ModelAndView selectFneStdtInsure(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = fneStdtInsureGojiDocuService.selectFneStdtInsure(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_외국인보험료_납부내역_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);

        return view;
    }
    
    /**
     * 외국인보험료 납부내역 고지서를 출력한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/printChkFneStdtInsure")
    public ModelAndView printChkFneStdtInsure(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = fneStdtInsureGojiDocuService.printChkFneStdtInsure(params);
        //view.addObject("data", map);

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
        		"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_외국인보험료_고지서출력");
		data.put("resultCnt", 1);
		Map<String, Object> printMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", printMap);
        
        return view;
    }
}
