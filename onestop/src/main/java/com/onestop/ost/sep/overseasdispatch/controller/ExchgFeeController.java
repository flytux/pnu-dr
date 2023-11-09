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
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.sep.overseasdispatch.service.ExchgFeeService;

/**
 * <pre>
 * Class Name: ExchgFeeController.java
 * Description:  교환/교비 Controller Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/sep/overseasdispatch/exchgfee")

@RestController
public class ExchgFeeController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ExchgFeeService exchgFeeService;
	@Autowired
    private ComFunctionService comFunctionService;

    /**
     * 신청가능년도학기를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchSchdYearTerm")
    public ModelAndView searchSchdYearTerm(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

       // Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
       // Map map = exchgFeeService.searchSchdYearTerm(params);
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"EXCHG_GCD",
				"EXCHG_DETAIL_GCD" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_신청가능년도학기_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    
    /**
     * 신청기간을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchSchdChk")
    public ModelAndView searchSchdChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = exchgFeeService.searchSchdChk(params);
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"EXCHG_GCD",
				"EXCHG_DETAIL_GCD",
				"CHASU_NO" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_신청기간_조회");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 해외교환/교비 신청자 정보 조회
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchExchgStdtInfo")
    public ModelAndView searchExchgStdtInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = exchgFeeService.searchExchgStdtInfo(params);
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"CHASU_NO",
				"SESSION_USER_ID" 
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_교환교비_신청자정보_조회");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 해외교환/교비 해외파견 프로그램 참가내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return List<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchDispatchApplyList")
    public ModelAndView searchDispatchApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        //List list = exchgFeeService.searchDispatchApplyList(params);
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_해외파견프로그램_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    
    /**
     * 해외교환/교비 원어강의 참가 수를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return List<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchNativeApplyList")
    public ModelAndView searchNativeApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        //List list = exchgFeeService.searchNativeApplyList(params);
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_원어강의참가_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    
    /**
     * 1지망 지원가능대학 목록을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/searchCollList01")
    public Map<String, Object> searchCollList01(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR_01",
				"TERM_GCD_01",
				"EXCHG_DETAIL_GCD_01",
				"LANG_GCD_01",
				"DEG_COURSE_GCD_01",
				"CMPL_TERM_CNT_01",
				"CHASU_NO_01" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_지원가능대학목록_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //setSuccess(result, exchgFeeService.searchCollList01(param));
		setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 2지망 지원가능대학 목록을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/searchCollList02")
    public Map<String, Object> searchCollList02(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR_02",
				"TERM_GCD_02",
				"EXCHG_DETAIL_GCD_02",
				"LANG_GCD_02",
				"DEG_COURSE_GCD_02",
				"CMPL_TERM_CNT_02",
				"CHASU_NO_02" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_지원가능대학목록_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //setSuccess(result, exchgFeeService.searchCollList02(param));
		setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 3지망 지원가능대학 목록을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/searchCollList03")
    public Map<String, Object> searchCollList03(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR_03",
				"TERM_GCD_03",
				"EXCHG_DETAIL_GCD_03",
				"LANG_GCD_03",
				"DEG_COURSE_GCD_03",
				"CMPL_TERM_CNT_03",
				"CHASU_NO_03" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_지원가능대학목록_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //setSuccess(result, exchgFeeService.searchCollList03(param));
		setSuccess(result, list);
        
        return result;
    }
    
    /**
     * 교환/교비 신청정보를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/saveExchgFee")
    public ModelAndView saveExchgFee(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        view.addObject("data", exchgFeeService.saveExchgFee(params));
        
        return view;
    }
    
    /**
     * 교환/교비 신청취소한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/cancelExchgFee")
    public ModelAndView cancelExchgFee(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"EXCHG_DETAIL_GCD",
				"SESSION_USER_ID",
				"CHASU_NO",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD",
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_교환교비_신청취소");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        //view.addObject("data", exchgFeeService.cancelExchgFee(params));
		view.addObject("data", resultMap);
        
        return view;
    }
}
