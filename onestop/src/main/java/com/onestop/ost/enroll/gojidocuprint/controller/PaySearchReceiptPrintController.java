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
 * Class Name: PaySearchReceiptPrintController.java
 * Description:  납부확인(영수증출력) Controller Class
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/enroll/paysearchreceiptprint")

@RestController
public class PaySearchReceiptPrintController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 개인기본정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectChkBasicInfo")
    public ModelAndView selectChkBasicInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = paySearchReceiptPrintService.selectChkBasicInfo(params);
        //view.addObject("data", map);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_개인기본정보_조회");
		data.put("resultCnt", 1);
		Map<String, Object> stdtInfoMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", stdtInfoMap);
        return view;
    }
    
    /**
     * 개인별 등록내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectPaySchReceiptPrt")
    public ModelAndView selectPaySchReceiptPrt(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = paySearchReceiptPrintService.selectPaySchReceiptPrt(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_개인별등록내역_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);

        return view;
    }
}