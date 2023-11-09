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

/**
 * <pre>
 * Class Name: AcctNoUpdController.java
 * Description:  계좌정보 수정 Controller Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 11.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/hj/stdtinfo/acctnoupd")

@RestController
public class AcctNoUpdController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;

    /**
     * 계좌정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectAcctNoUpd")
    public Map<String, Object> selectAcctNoUpd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //setSuccess(result, acctNoUpdService.selectAcctNoUpd(param));
		String [] params = {
				"SESSION_USER_ID"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학적부_계좌번호_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
		setSuccess(result, list);
		
        return result;
    }

    /**
     * 계좌정보의 은행목록을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectBankList")
    public Map<String, Object> selectBankList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	//Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
    	//setSuccess(result, acctNoUpdService.selectBankList(param));
    	String [] params = {};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학적부_계좌번호_은행목록_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	setSuccess(result, list);
    	
    	return result;
    }

    /**
     * 계좌정보를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/saveAcctNoUpd")
    public ModelAndView saveSampleInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        // view.addObject("data", acctNoUpdService.saveAcctNoUpd(params));
        
        String [] params = {
				"SESSION_USER_ID",
				"BANK_CD",
				"ACCT_NO",
				"ACCT_NM_NM",
				"SYSTEM_GCD",
				"CLAUSE_SEQ_NO",
				"CLAUSE_HISTORY_SEQ_NO",
				"CLAUSE_AGREE_SEQ_NO",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD",
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학적부_계좌번호_저장");
		data.put("resultCnt", 1);
		
		
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        view.addObject("data", resultMap);
        
        return view;
    }    
    
    /**
     * 본인계좌인지를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/chkAcctNoUpd")
    public Map<String, Object> chkAcctNoUpd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //setSuccess(result, acctNoUpdService.chkAcctNoUpd(param));
        String [] params = {
				"ACCT_NM_NM",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_학적부_계좌번호_본인계좌체크");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }

}
