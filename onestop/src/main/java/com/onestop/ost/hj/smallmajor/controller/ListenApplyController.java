package com.onestop.ost.hj.smallmajor.controller;

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
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.hj.stdtinfo.service.AcctNoUpdService;

/**
 * <pre>
 * Class Name: ListenApplyController.java
 * Description:  이수신청 Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2023. 10. 11.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/hj/smallmajor/listenApply")

@RestController
public class ListenApplyController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;

    /**
     * 이수신청정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @RequestMapping(value="/selectListListenApply")
    public ModelAndView selectListListenApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
		String [] params = {
				"SESSION_USER_ID",
				"FIRSTINDEX",
				"LASTINDEX"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_소단위전공_이수신청_이수신청내역_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
		
        return view;
    }
    /**
     * 트랙,마이크로디그리 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @RequestMapping(value="/selectTrackList")
    public ModelAndView selectTrackList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");
    	String [] params = {
    			"CHG_APPLY_REASON_GCD"
    	};
    	
    	data.put("params", params);
    	data.put("db", "OST");
    	data.put("proc", "OST_학적_소단위전공_이수신청_소단위전공목록_조회");
    	data.put("resultCnt", 1);
    	List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	view.addObject("data", list);
    	
    	return view;
    }
    /**
     * 신청정보를 저장한다
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/executeListenApply")
    public Map<String,Object> executeListenApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	String [] params = {
    			"SESSION_USER_ID",
    			"CHG_APPLY_REASON_GCD",
    			"SCH_MAJOR_GBN",
    			"APPLY_SYEAR",
    			"APPLY_TERM_GCD",
    			"CLAUSE_DETAIL_SEQ_NO",
    			"CLAUSE_HISTORY_SEQ_NO",
    			"CLAUSE_SEQ_NO",
    			"SESSION_USER_IP",
    			"SESSION_SYSTEM_GCD",
    			"SESSION_MENU_CD"
    	};
    	data.put("params", params);
    	data.put("db", "OST");
    	data.put("proc", "OST_학적_소단위전공_이수신청_신청_저장");
    	data.put("resultCnt", 1);
    	result = (Map<String, Object>)comFunctionService.bindProc(data);
    	
    	
    	return result;
    }



}
