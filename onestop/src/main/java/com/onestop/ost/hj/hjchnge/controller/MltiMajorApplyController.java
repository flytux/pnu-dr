package com.onestop.ost.hj.hjchnge.controller;

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
import com.onestop.core.main.service.MainService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.hj.hjchnge.service.MltiMajorApplyService;

/**
 * <pre>
 * Class Name: MltiMajorApplyController.java
 * Description: 다중전공신청 Controller Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 9.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/hj/hjchnge/MltiMajorApply")

@RestController
public class MltiMajorApplyController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
	
    /**
     * 다중전공신청 화면 다중전공신청내역목록 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/selectListMltiMajorApply")
	public ModelAndView selectListMltiMajorApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		//List list = mltiMajorApplyService.selectListMltiMajorApply(params);
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_다중전공_다중전공신청_조회");
		data.put("resultCnt", 3);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
        data.put("SYSTEM_GCD", data.get("SESSION_SYSTEM_GCD"));
        data.put("MENU_CD", data.get("SESSION_MENU_CD"));
        
        /* 기준년도/학기 조회 */
    	//Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
        
        String [] params2 = {
				"SYSTEM_GCD",
				"MENU_CD"
		};

		data.put("params", params2);
		data.put("db", "SYS");
		data.put("proc", "SP_기준년도_학기_조회");
		data.put("resultCnt", 1);
		Map<String, Object> termInfo = (Map<String, Object>)comFunctionService.bindProcMap(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
    	view.addObject("termInfo", termInfo); 

		return view;
	}
	
    /**
     * 다중전공신청 화면 신청가능기간여부 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectChkSchd")
    public ModelAndView selectChkSchd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        //view.addObject("data", mltiMajorApplyService.selectChkSchd(params));
        String [] params = {
				"SESSION_USER_ID",
				"CHG_APPLY_REASON_GCD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_다중전공_신청가능기간여부");
		data.put("resultCnt", 1);
		
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 다중전공신청 화면 신청가능여부 조회를 한다.
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
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //view.addObject("data", mltiMajorApplyService.selectChkApply(params));
        String [] params = {
				"APPLY_SYEAR",
				"APPLY_TERM_GCD",
				"SESSION_USER_ID",
				"CHG_APPLY_REASON_GCD",
				"SCH_COLL_CD",
				"SCH_DEPT_CD",
				"SCH_MAJOR_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_다중전공_신청가능여부");
		data.put("resultCnt", 1);
		
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 다중전공신청을 저장 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/executeMltiMajorApply")
    public ModelAndView executeMltiMajorApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        //view.addObject("data", mltiMajorApplyService.executeMltiMajorApply(params));
        String [] params = {
				"rowState",
				"SESSION_USER_ID",
				"APPLY_SYEAR",
				"APPLY_TERM_GCD",
				"CHG_SEQ_NO",
				"CHG_APPLY_REASON_GCD",
				"SCH_GRAD_GCD",
				"SCH_COLL_CD",
				"SCH_DEPT_CD",
				"SCH_MAJOR_CD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_다중전공_다중전공신청_저장");
		data.put("resultCnt", 1);
		
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        view.addObject("data", resultMap);	
        
        return view;
    }
    
}
