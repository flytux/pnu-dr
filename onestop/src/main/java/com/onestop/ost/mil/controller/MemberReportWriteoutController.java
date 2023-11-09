package com.onestop.ost.mil.controller;

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

/**
 * <pre>
 * Class Name: MemberReportWriteoutController.java
 * Description:  대원신고서작성 Controller Class
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 01. 26.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/mil/memberreportwriteout")

@RestController
public class MemberReportWriteoutController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;

    /**
     * 병과특기를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectMainSpecialAbilityCd")
    public Map<String, Object> selectMainSpecialAbilityCd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"MIL_KIND_GCD",
				"MIL_KIND_CD_GCD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_병과_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //setSuccess(result, memberReportWriteoutService.selectMainSpecialAbilityCd(param));
		setSuccess(result, list);
        
        return result;
    }
    
    
    /**
     * 예비군 신청기간을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectApplyDate")
    public Map<String, Object> selectApplyDate(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_신청기간_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        //setSuccess(result, memberReportWriteoutService.selectApplyDate(param));
        setSuccess(result, list);
        return result;
    }
    
    /**
     * 학생의 주민등록번호 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectStdtSsn")
    public Map<String, Object> selectStdtSsn(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_주민등록번호_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        //setSuccess(result, memberReportWriteoutService.selectStdtSsn(param));
        setSuccess(result, list);
        return result;
    }
    
    /**
     * 허용 ip를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectIpCheck")
    public Map<String, Object> selectIpCheck(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_대원신고서작성_허용IP_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        //setSuccess(result, memberReportWriteoutService.selectIpCheck(param));
		setSuccess(result, list);
        return result;
    }
    
    /**
     * 대원신고서 작성 화면에 입력된 정보를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/saveMemberReportWriteout")
    public Map<String, Object> saveMemberReportWriteout(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"CAMPUS_GCD",
				"SESSION_USER_ID",
				"STDT_KOR_NM",
				"SSN",
				"STDT_YEAR",
				"STNDING_GCD",
				"ZIP_CD",
				"ADDR1",
				"ADDR2",
				"TELL_NO",
				"PHONE_NO",
				"EMAIL",
				"MIL_START_DATE",
				"MIL_NO",
				"MIL_END_DATE",
				"MIL_END_GCD",
				"MIL_KIND_GCD",
				"MIL_SERVE_SHAPE_GCD",
				"MIL_END_RANK_GCD",
				"MAIN_SPECIAL_ABILITY_CD",
				"MOVEIN_GCD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD",
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_예비군_대원신고서_입력");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        //setSuccess(result, memberReportWriteoutService.saveMemberReportWriteout(param));
		setSuccess(result, list);
        return result;
    }
}
