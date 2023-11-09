package com.onestop.ost.sep.overseasdispatch.controller;

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
@RequestMapping(value = "/ost/sep/overseasdispatch/passinfosearch")

@RestController
public class PassInfoSearchController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;

    /**
     * 기본정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectStdtInfo")
    public Map<String, Object> selectStdtInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_WEB_해외파견_합격정보조회_기본정보조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //setSuccess(result, passInfoSearchService.selectStdtInfo(param));
		setSuccess(result, list);
        
        return result;
    }

    /**
     * 합격정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return List<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectPassInfo")
    public ModelAndView selectPassInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_WEB_해외파견_합격정보조회_정보조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //List list = passInfoSearchService.selectPassInfo(params);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    
}
