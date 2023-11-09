package com.onestop.ost.jh.controller;

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
 * Class Name: WorkServeController.java
 * Description:  근로봉사 Controller Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 03. 07.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/jh/workserve")

@RestController
public class WorkServeController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;

    /**
     * 근로봉사 내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectWorkServe")
    public ModelAndView selectWorkServe(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = workServeService.selectWorkServe(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"MONTH",
				"JH_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_근로내역_조회");
		data.put("resultCnt", 2);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
   
    /**
     * 근무정보 내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectApplyEnter")
    public ModelAndView selectApplyEnter(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = workServeService.selectApplyEnter(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_근로내역_입력가능여부조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }    

    /**
     * 입력기간을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectApplyDate")
    public ModelAndView selectApplyDate(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = workServeService.selectApplyDate(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_근로내역_입력기간_조회");
		data.put("resultCnt", 2);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
      // view.addObject("pageInfo", IUtility.getPageInfo(params, list));
      // view.addObject("pageList", IUtility.getPageInfoArr(params));
        
        return view;
    }
    
    /**
     * 근로봉사 내역을 입력한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/saveWorkInsert")
    public Map<String, Object> saveWorkInsert(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	//Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
    	//setSuccess(result, workServeService.saveWorkInsert(param));
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"JH_CHARGE_VIA_GCD",
				"JH_GCD",
				"JH_CD",
				"WORK_DATE",
				"WORK_ST_TIME",
				"WORK_ST_MINUTE",
				"WORK_END_TIME",
				"WORK_END_MINUTE",
				"TASK_CONTENT",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_근로내역_입력");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
		setSuccess(result, list);
		
    	return result;
    }
    
    /**
     * 근로봉사 내역을 수정한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/saveWorkServeUpdate")
    public Map<String, Object> saveWorkServeUpdate(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	//Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
    	//setSuccess(result, workServeService.saveWorkServeUpdate(param));
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"JH_CHARGE_VIA_GCD",
				"JH_GCD",
				"JH_CD",
				"WORK_DATE",
				"WORK_ST_TIME",
				"WORK_ST_MINUTE",
				"WORK_END_TIME",
				"WORK_END_MINUTE",
				"TASK_CONTENT",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_근로내역_수정");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	setSuccess(result, list);
    	
    	return result;
    }
    
    /**
     * 근로봉사 내역을 삭제한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/saveWorkDelete")
    public Map<String, Object> saveWorkDelete(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	//Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
    	//setSuccess(result, workServeService.saveWorkDelete(param));
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"JH_CHARGE_VIA_GCD",
				"JH_GCD",
				"JH_CD",
				"WORK_DATE",
				"WORK_ST_TIME",
				"WORK_ST_MINUTE"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_근로내역_삭제");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	setSuccess(result, list);
    	
    	return result;
    }

}
