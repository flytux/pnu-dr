package com.onestop.ost.jh.jhapply.controller;

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
import com.onestop.ost.jh.jhapply.service.UniwellJhApplyService;

/**
 * <pre>
 * Class Name: PriorityJhApplyController.java
 * Description: 유니웰장학금신청 Controller Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 3. 11.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/jh/jhapply/UniwellJhApply")
@RestController
public class UniwellJhApplyController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private UniwellJhApplyService uniwellJhApplyService;
    
    @Autowired
    private ComFunctionService comFunctionService;
	
    /**
     * 유니웰장학금신청 화면 신청기간 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListPriorityJhApplySchd")
    public ModelAndView selectListPriorityJhApplySchd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
		//List list = uniwellJhApplyService.selectListPriorityJhApplySchd(params);
		String [] params = {
				"SESSION_USER_ID",
				"JH_APPLY_GCD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_웹신청_사용기간_조회");
		data.put("resultCnt", 1);
		
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
     * 유니웰장학금신청 화면 신청리스트 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListPriorityJhApply")
    public ModelAndView selectListPriorityJhApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
		//List list = uniwellJhApplyService.selectListPriorityJhApply(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"JH_CHARGE_VIA_GCD",
				"JH_GCD",
				"JH_APPLY_GCD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_웹신청_신청리스트_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
    
    /**
     * 유니웰장학금신청 화면 학생정보 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListStdtInfo")
    public ModelAndView selectListStdtInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
		//List list = uniwellJhApplyService.selectListStdtInfo(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_웹신청_학생정보_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	

    
    /**
     * 유니웰장학금신청 화면 계좌정보 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListBank")
    public ModelAndView selectListBank(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
		//List list = uniwellJhApplyService.selectListBank(params);
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_웹신청_학생계좌_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
    
    /**
     * 유니웰장학금신청 화면 제출서류 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListDocs")
    public ModelAndView selectListDocs(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
		//List list = uniwellJhApplyService.selectListDocs(params);
		String [] params = {
				"HAKBU_GRAD_USE_FG",
				"JH_APPLY_GCD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_웹신청_제출서류_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
    
    /**
     * 유니웰장학금신청 화면 신청내역 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListPriorityJhApplySearch")
    public ModelAndView selectListPriorityJhApplySearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
		//List list = uniwellJhApplyService.selectListPriorityJhApplySearch(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"JH_CHARGE_VIA_GCD",
				"JH_GCD",
				"JH_CD",
				"JH_APPLY_GCD",
				"JH_SUBMIT_DOC_GCD",
				"APPLY_CHASU"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_웹신청_신청내역_조회");
		data.put("resultCnt", 3);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
    
    /**
     * 저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/executePriorityJhApply")
    public ModelAndView executePriorityJhApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        view.addObject("data", uniwellJhApplyService.executePriorityJhApply(params));
        
        return view;
    }

    /**
     * 삭제한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/deletePriorityJhApply")
    public ModelAndView deletePriorityJhApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        //view.addObject("data", uniwellJhApplyService.deletePriorityJhApply(params));
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"JH_CHARGE_VIA_GCD",
				"JH_GCD",
				"JH_CD",
				"APPLY_CHASU",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_웹신청_삭제");
		data.put("resultCnt", 1);
		
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        view.addObject("data", resultMap);
        
        return view;
    }

    /**
     * 유니웰장학금신청 화면 형제/자매 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListBrothers")
    public ModelAndView selectListBrothers(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
		//List list = uniwellJhApplyService.selectListBrothers(params);
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"SEARCH_STDT_NO",
				"SSN",
				"''"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_장학_장학금신청_형제자매검색");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);	
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
}