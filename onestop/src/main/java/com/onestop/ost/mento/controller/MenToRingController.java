package com.onestop.ost.mento.controller;

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

/**
 * <pre>
 * Class Name: PassInfoSearchController.java
 * Description:  합격정보조회 Controller Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 09.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/mento/mentoring")

@RestController
public class MenToRingController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;
	
	 /**
     * 대상여부체크를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/mentoringInfoChk")
    public Map<String, Object> mentoringInfoChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
                "SESSION_USER_ID"
        };
        
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링_학생지원시스템_대상여부체크");
        data.put("resultCnt", 4);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 분류목록를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/mentoringSearch")
    public Map<String, Object> mentoringSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링_학생지원시스템_분류목록");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 분류별 멘톡 목록를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/mentoringDetailSearch")
    public Map<String, Object> mentoringDetailSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
                "YEAR",
                "TERM_CD",
                "ITEM_CD"
        };
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링_학생지원시스템_분류별멘토목록");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 멘토신청 조회 목록를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/applySearch")
    public Map<String, Object> applySearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
                "YEAR",
                "TERM_CD",
                "PROJ_CD",
                "SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링_학생지원시스템_멘토신청_조회");
        data.put("resultCnt", 2);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 멘토신청 입력한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/applyInsert")
    public Map<String, Object> applyInsert(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
        		"YEAR",
        		"TERM_CD",
        		"PROJ_CD",
                "SESSION_USER_ID",
                "SESSION_USER_IP"
        };
        
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링_학생지원시스템_멘토신청_입력");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 멘토신청 삭제한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/applyDelete")
    public Map<String, Object> applyDelete(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
        		"YEAR",
        		"TERM_CD",
        		"PROJ_CD",
                "SESSION_USER_ID",
                "SESSION_USER_IP"
        };
        
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링_학생지원시스템_멘토신청_삭제");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 외국인 대상여부체크 삭제한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/mentoringInfoChkForeign")
    public Map<String, Object> mentoringInfoChkForeign(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
                "SESSION_USER_ID"
        };
        
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_대상여부체크");
        data.put("resultCnt", 4);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 외국인 분류목록을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/mentoringSearchForeign")
    public Map<String, Object> mentoringSearchForeign(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_분류목록");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 외국인 분류별 멘토목록을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/mentoringDetailSearchForeign")
    public Map<String, Object> mentoringDetailSearchForeign(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
                "YEAR",
                "TERM_CD",
                "ITEM_CD"
        };
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_분류별멘토목록");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 외국인 멘토신청 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/applySearchForeign")
    public Map<String, Object> applySearchForeign(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
                "YEAR",
                "TERM_CD",
                "PROJ_CD",
                "SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_멘토신청_조회");
        data.put("resultCnt", 2);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 외국인 멘토신청 입력한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/applyInsertForeign")
    public Map<String, Object> applyInsertForeign(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
                "YEAR",
                "TERM_CD",
                "PROJ_CD",
                "SESSION_USER_ID",
                "SESSION_USER_IP"
        };
        
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_멘토신청_입력");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 외국인 멘토신청 삭제한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/applyDeleteForeign")
    public Map<String, Object> applyDeleteForeign(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
                "YEAR",
                "TERM_CD",
                "PROJ_CD",
                "SESSION_USER_ID",
                "SESSION_USER_IP"
        };
        
        data.put("params", params);
        data.put("db", "SMART");
        data.put("proc", "통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_멘토신청_삭제");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    
}
