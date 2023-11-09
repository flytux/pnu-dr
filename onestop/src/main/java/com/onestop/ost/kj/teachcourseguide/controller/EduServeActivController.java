
package com.onestop.ost.kj.teachcourseguide.controller;

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
import com.onestop.ost.kj.teachcourseguide.service.EduServeActivService;

/**
 * <pre>
 * Class Name: EduServeActivController.java
 * Description: 교육봉사활동 Controller Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/kj/teachcourseguide/EduServeActiv")
@RestController
public class EduServeActivController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;    
	
    /**
     * 교육봉사활동 화면 대상자 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListEduServeActiv")
    public ModelAndView selectListEduServeActiv(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

        param.put("SYSTEM_GCD", param.get("SESSION_SYSTEM_GCD"));
        param.put("MENU_CD", param.get("SESSION_MENU_CD"));

        /* 기준년도/학기 조회 */
		String [] params = {
				"SYSTEM_GCD",
				"MENU_CD"
		};

		param.put("params", params);
		param.put("db", "SYS");
		param.put("proc", "SP_기준년도_학기_조회");
		param.put("resultCnt", 1);
		Map<String, Object> termInfo = (Map<String, Object>)comFunctionService.bindProcMap(param);     
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
        data.put("SYEAR", termInfo.get("SYEAR"));
        data.put("TERM_GCD", termInfo.get("TERM_GCD"));		
	
		String [] params2 = {
				"SESSION_USER_ID",
				"SYEAR",
				"TERM_GCD"
		};
		data.put("params", params2);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교직이수요건관리_대상자_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
    	view.addObject("termInfo", termInfo); 
        
        return view;
    }	
    
    /**
     * 교육봉사활동 화면 계획서입력내역 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListEduServePlan")
    public ModelAndView selectListEduServePlan(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
	
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교육봉사활동_계획서_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	

    /**
     * 교육봉사활동 화면 학점신청 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListEduServePlanCrdt")
    public ModelAndView selectListEduServePlanCrdt(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
	
		String [] params = {
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교육봉사활동_학점신청_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	

    /**
     * 교육봉사활동 화면 교육봉사활동계획신청구분코드 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListEsaItem")
    public ModelAndView selectListEsaItem(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교육봉사활동_항목_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	

    /**
     * 교육봉사활동 화면 세부내용 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListPlanDetailSearch")
    public ModelAndView selectListPlanDetailSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID",
				"EDU_SERVE_ACTIV_PLAN_SEQ_NO"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교육봉사활동_계획서_세부내용_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
    
    /**
     * 교육봉사활동 화면 계획서 저장 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/executePlan")
    public ModelAndView executePlan(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID",
				"EDU_SERVE_ACTIV_PLAN_SEQ_NO",
				"EDU_SERVE_ACTIV_START_DATE",
				"EDU_SERVE_ACTIV_CLOSE_DATE",
				"EDU_SERVE_ACTIV_PLAN_TIME_CNT",
				"EDU_SERVE_ACTIV_PLAN_STA_GCD",
				"GBN",
				"APPLY_GCD",
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교육봉사활동_계획서_수정");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);        

		view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 교육봉사활동 화면 계획서 삭제 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deletePlan")
    public ModelAndView deletePlan(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID",
				"EDU_SERVE_ACTIV_PLAN_SEQ_NO",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교육봉사활동_계획서_삭제");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

		view.addObject("data", resultMap);
        
        return view;
    }

    /**
     * 교육봉사활동 화면 일지 조회를 한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListPlanDaylog")
    public ModelAndView selectListPlanDaylog(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID",
				"EDU_SERVE_ACTIV_PLAN_SEQ_NO" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교육봉사활동_일지_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }	
    
    /**
     * 교육봉사활동 화면 일지 저장 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/executePlanDaylog")
    public ModelAndView executePlanDaylog(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SESSION_USER_ID",
    				"EDU_SERVE_ACTIV_PLAN_SEQ_NO",
    				"DAYLOG_START_DT",
    				"DAYLOG_CLOSE_DT",
    				"DAYLOG_ACTIV_CONTENT",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_교직_교육봉사활동_일지_저장");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
        
		view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 교육봉사활동 화면 일지 삭제 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deletePlanDaylog")
    public ModelAndView deletePlanDaylog(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID",
				"EDU_SERVE_ACTIV_PLAN_SEQ_NO",
				"DAYLOG_DIFF_SEQ_NO"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교직_교육봉사활동_일지_삭제");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

		view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 교육봉사활동 화면 학점신청/취소 저장 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/executeEduServeActiv")
    public ModelAndView executeEduServeActiv(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SESSION_USER_ID",
    				"EDU_SERVE_ACTIV_PLAN_SEQ_NO",
    				"GBN",
    				"REQ_STA_GCD",
    				"SYEAR",
    				"TERM_GCD",
    				"EDU_SERVE_ACTIV_TARGET_INWON_CNT",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_교직_교육봉사활동_계획서_처리");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
		view.addObject("data", resultMap);
        
        return view;
    }
    
}