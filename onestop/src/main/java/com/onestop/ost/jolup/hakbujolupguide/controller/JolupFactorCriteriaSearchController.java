package com.onestop.ost.jolup.hakbujolupguide.controller;

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
import com.onestop.ost.jolup.hakbujolupguide.service.JolupFactorCriteriaSearchService;

/**
 * <pre>
 * Class Name: JolupFactorCriteriaSearchsController.java
 * Description:  졸업요건기준 및 충족여부 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 04.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/jolup/hakbujolupguide/jolupfactorcriteriasearch")

@RestController
public class JolupFactorCriteriaSearchController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;

    /**
     * 졸업요건기준 및 충족여부를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectJolupFactor")
    public ModelAndView selectJolupFactor(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = jolupFactorCriteriaSearchtService.selectJolupFactor(params);
		String [] params = {
				"SESSION_USER_ID",
				"FIRSTINDEX",
				"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업요건및충족여부_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        HashMap hmap =(HashMap) list.get(0);
        
        
        view.addObject("data", list);
        
        if("A".equals(hmap.get("O_RSLT"))) {
        	data.put("O_MSG", hmap.get("O_MSG"));
        	

        	view.addObject("totalCnt", 0);
        	view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        } 
        
        else if("B".equals(hmap.get("O_RSLT"))){
        	data.put("O_MSG", hmap.get("O_MSG"));
        	

        	view.addObject("totalCnt", 0);
        	view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        }
        
        else if("C".equals(hmap.get("O_RSLT"))){
        	data.put("O_MSG", hmap.get("O_MSG"));
        	

        	view.addObject("totalCnt", 0);
        	view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        }
        
        else{            
        	view.addObject("totalCnt", list.size());
 	        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
 	        view.addObject("pageList", IUtility.getPageInfoArr(data));
         }
        	 
        return view;
    }
    
    /**
     * 졸업요건기준 및 충족여부 개인정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectJolupStdtInfo")
    public Map<String, Object> selectJolupStdtInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        
        //Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        //setSuccess(result, jolupFactorCriteriaSearchtService.selectJolupStdtInfo(param));
		String [] params = {
				"SESSION_USER_ID"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업요건및충족여부_개인정보_조회");
		data.put("resultCnt", 1);
		
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        setSuccess(result, resultMap);
        
        return result;
    }
    
}
