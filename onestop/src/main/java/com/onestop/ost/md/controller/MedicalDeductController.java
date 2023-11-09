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

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.md.service.MedicalDeductService;

/**
 * <pre>
 * Class Name: MedicalDeductController.java
 * Description:  학생의료공제회 Controller Class
 * </pre>
 * 
 * @author 김우영
 * @since 2022. 07. 26.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/md")

@RestController
public class MedicalDeductController extends CommonController{
	@Autowired
    MessageSource localeMessageSource;
	
	@Autowired
    private ComFunctionService comFunctionService;

	/**
     * 급여신청 내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/payApplyList")
    public Map<String, Object> payApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		data.put("proc", "OST_등록_의료공제회_의료공제신청_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
        // setSuccess(result, medicalDeductService.payApplyList(param));
		setSuccess(result, list);
        return result;
        
        /*
        ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
    	
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        List<Map<String, Object>> list = medicalDeductService.payApplyList(params);
        
        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		view.addObject("pageList", IUtility.getPageInfoArr(params));

        return view;
        */
    }
    
    /**
     * 급여신청 상세내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/payApplyDetail")
    public Map<String, Object> payApplyDetail(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"APPLY_SERIAL_NO",
				"SESSION_USER_ID" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_의료공제회_의료공제신청_상세조회");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
 
        //setSuccess(result, medicalDeductService.payApplyDetail(param));
        setSuccess(result, resultMap);
        return result;
    }
    
    /**
     * 급여신청 정보를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/executePayApplyInfo")
    public Map<String, Object> executePayApplyInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"APPLY_SERIAL_NO",
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"DISEASE_NM",
				"HOSPITAL_NM",
				"HOSPITAL_TEL_NO",
				"OUTPATIENT_START_DATE",
				"OUTPATIENT_CLOSE_DATE",
				"INPATIENT_START_DATE",
				"INPATIENT_CLOSE_DATE",
				"OCCUR_CONTENT",
				"SELF_PAY_AMT",
				"BANK_CD",
				"ACCT_NO",
				"ACCT_NM",
				"ATTACH_FILE_GRP_CD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD",
				"rowStatus"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_의료공제회_의료공제회신청_저장");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
        //setSuccess(result, medicalDeductService.executePayApplyInfo(param));
		setSuccess(result, resultMap);
        return result;
    }
    
    /**
     * 환불신청 내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/refundApplyList")
    public Map<String, Object> refundApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SCH_SYEAR",
				"SCH_TERM_GCD",
				"SCH_CLAIM_SMALL_GCD",
				"SESSION_USER_ID",
				""
		};
		data.put("params", params);
		data.put("db", "ENROLL");
		data.put("proc", "DR_잡부금환불_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        
        //setSuccess(result, medicalDeductService.refundApplyList(param));
		setSuccess(result, list);
        return result;
    
    }
    
    /**
     * 환불신청 정보를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/executeRefundApplyInfo")
    public Map<String, Object> executeRefundApplyInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"rowStatus",
				"SYEAR",
				"TERM_GCD",
				"CLAIM_SMALL_GCD",
				"SESSION_USER_ID",
				"BANK_CD",
				"ACCT_NO",
				"ACCT_NM",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "ENROLL");
		data.put("proc", "DR_잡부금환불_저장");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        //setSuccess(result, medicalDeductService.executeRefundApplyInfo(param));
		setSuccess(result, resultMap);
        return result;
    }
}
