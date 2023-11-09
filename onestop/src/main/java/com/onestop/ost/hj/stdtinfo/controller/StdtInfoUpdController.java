package com.onestop.ost.hj.stdtinfo.controller;

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
import com.onestop.ost.hj.stdtinfo.service.AcctNoUpdService;
import com.onestop.ost.hj.stdtinfo.service.StdtInfoUpdService;

/**
 * <pre>
 * Class Name: StdtInfoUpdController.java
 * Description:  개인정보 수정 Controller Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 14.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/hj/stdtinfo/stdtinfoupd")

@RestController
public class StdtInfoUpdController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;

    /**
     * 개인정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectStdtInfoUpd")
    public Map<String, Object> selectStdtInfoUpd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        // setSuccess(result, stdtInfoUpdService.selectStdtInfoUpd(param));
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학적부_개인정보_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    /**
     * 개인정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectStdtInfoUpd2")
    public Map<String, Object> selectStdtInfoUpd2(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	//Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
    	// setSuccess(result, stdtInfoUpdService.selectStdtInfoUpd(param));
    	String [] params = {
    			"STDT_NO"
    	};
    	data.put("params", params);
    	data.put("db", "OST");
    	data.put("proc", "OST_학적_학적부_개인정보_조회");
    	data.put("resultCnt", 1);
    	
    	List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	setSuccess(result, list);
    	
    	return result;
    }

    /**
     * 개인정보를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    
    @RequestMapping(value="/saveStdtInfoUpd")
    public ModelAndView saveStdtInfoUpd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID",
				"STDT_ENG_NM",
				"STDT_ZIP_NO",
				"STDT_ADDR",
				"STDT_DETAIL_ADDR",
				"STDT_TEL_NO",
				"MIL_SERVE_GCD",
				"STDT_CELLULAR_NO",
				"STDT_EMAIL",
				"GUARDIAN_NM",
				"GUARDIAN_REL_INFO",
				"GUARDIAN_TEL_NO",
				"GUARDIAN_ZIP_NO",
				"GUARDIAN_ADDR",
				"GUARDIAN_DETAIL_ADDR",
				"GUARDIAN_OCPTN_NM",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD",
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학적부_개인정보_저장");
		data.put("resultCnt", 1);

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        view.addObject("data", resultMap);
        
        return view;
    }
    

    /**
     * 이메일/SMS 수신여부를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/saveAgree")
    public ModelAndView saveAgree(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	String [] params = {
				"SESSION_USER_ID",
				"EMAIL_RCV_AGREE_FG",
				"SMS_RCV_AGREE_FG",
				"KAKAOTALK_RCV_AGREE_FG",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};
    	data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학적부_개인정보_수신동의_저장");
		data.put("resultCnt", 1);

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        view.addObject("data", resultMap);
        
        return view;
    }

}
