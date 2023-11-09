package com.onestop.ost.enroll.enrollamtpayguide.controller;

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
 * Class Name: DevidePayController.java
 * Description:  분할납부 Controller Class
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 04. 18.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/enroll/enrollamtpayguide/devidepay") 

@RestController
public class DevidePayController extends CommonController {
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 분할납부 컨텐츠를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListDevidePayContent")
    public ModelAndView selectListDevidePayContent(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYSTEM_GCD",
				"MENU_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_컨텐츠정보_조회");
		data.put("resultCnt", 1);
		Map<String, Object> tuitionMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", tuitionMap);
        return view;
    }
    
    /**
     * 등록금을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectChkTuition")
    public ModelAndView selectChkTuition(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = devidePayService.selectChkTuition(params);
        //view.addObject("data", map);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_분할납부신청_등록금_조회");
		data.put("resultCnt", 1);
		Map<String, Object> tuitionMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", tuitionMap);
        return view;
    }
    
    /**
     * 가능기간을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectChkApply")
    public ModelAndView selectChkApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = devidePayService.selectChkApply(params);
        //view.addObject("data", map);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_분할납부신청_가능기간_조회");
		data.put("resultCnt", 1);
		Map<String, Object> applyMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", applyMap);
        return view;
    }
    
    /**
     * 신청내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectApplyList")
    public ModelAndView selectApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = devidePayService.selectApplyList(params);
        //view.addObject("data", list);
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"GBN"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_분할납부신청내역_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);

        return view;
    }
    
    /**
     * 등록기본정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectStdtInfo")
    public ModelAndView selectStdtInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = devidePayService.selectStdtInfo(params);
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
     * 입력가능체크.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectInputChk")
    public ModelAndView selectInputChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = devidePayService.selectInputChk(params);
        //view.addObject("data", map);

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
        		"SYEAR",
        		"TERM_GCD",
				"SESSION_USER_ID",
				"rowStatus"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_분할납부_입력가능체크");
		data.put("resultCnt", 1);
		Map<String, Object> inputChkMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", inputChkMap);
        return view;
    }
    
    /**
     * 입력수정.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/executeDevidePay")
    public ModelAndView executeDevidePay(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        /*List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");
        view.addObject("data", devidePayService.executeDevidePay(list));*/             
        
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SYEAR",
    				"TERM_GCD",
    				"DEVIDE_TIMESNO",
    				"SESSION_USER_ID",
    				"rowStatus",
    				"CLAIM_DEVIDE_CHASU",
    				"DEVIDE_RATIO",
    				"DEVIDE_CLASS_1_AMT",
    				"DEVIDE_CLASS_2_AMT",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_등록_분할납부_입력수정");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
		view.addObject("data", resultMap);
        return view;
    }    
    
    /**
     * 입력삭제
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/deleteDevidePay")
    public ModelAndView deleteDevidePay(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        /*Map<String, Object> map = (Map<String, Object>)paramMap.get("data");
        devidePayService.deleteDevidePay(map);*/
        //view.addObject("data", );
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
        		"SYEAR",
        		"TERM_GCD",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_분할납부_신청취소");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", resultMap);
        return view;
        
    }   
    
    /**
     * 학년도, 학기.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectEnYearTerm")
    public ModelAndView selectEnYearTerm(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = devidePayService.selectInputChk(params);
        //view.addObject("data", map);

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {        		
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_분할납부신청_학년도_학기");
		data.put("resultCnt", 1);
		Map<String, Object> inputChkMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", inputChkMap);
        return view;
    }
    
}
