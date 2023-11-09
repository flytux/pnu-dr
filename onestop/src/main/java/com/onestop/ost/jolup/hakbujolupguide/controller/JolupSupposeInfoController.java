package com.onestop.ost.jolup.hakbujolupguide.controller;

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
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.jolup.hakbujolupguide.service.JolupSupposeInfoService;

/**
 * <pre>
 * Class Name: JolupSupposeInfoController.java
 * Description: 졸업예정정보 Controller Class
 * </pre>
 * 
 * @author 심진용
 * @since 2022. 3. 2.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/jolup/hakbujolupguide/jolupsupposeInfo")

@RestController
public class JolupSupposeInfoController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
	
    /**
     * 작성된 사정기분별 졸업예정정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
	@RequestMapping(value = "/selectListJolupSupposeInfo")
	public ModelAndView selectListJolupSupposeInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID"
				, "SESSION_USER_ID"
				, "SESSION_USER_IP"
				, "SESSION_SYSTEM_GCD"
				, "SESSION_MENU_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업예정정보_사정처리");
		data.put("resultCnt", 1);
		
		comFunctionService.bindProcMap(data);
		
		
		//List list = jolupSupposeInfoService.selectListJolupSupposeInfo(params);
		
		//view.addObject("data", list);
        //view.addObject("totalCnt", list.size());
        //view.addObject("pageInfo", IUtility.getPageInfo(params, list));
        //view.addObject("pageList", IUtility.getPageInfoArr(params));
		
		//Map<String, Object> stdtJolupInfo = jolupSupposeInfoService.stdtJolupInfo(params);
		String [] params2 = {
				"SESSION_USER_ID"
		};
		data.put("params", params2);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업예정정보_학생조회");
		data.put("resultCnt", 1);
		
		Map<String, Object> stdtJolupInfo = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", stdtJolupInfo);
		
		return view;
	}
	
	@RequestMapping(value = "/hakjukList")
    public ModelAndView hakjukList(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = jolupSupposeInfoService.hakjukList(params);
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업예정정보_학적신청내역_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        view.addObject("dataList", list);
        view.addObject("params", data);
        view.setViewName("ost/jolup/hakbujolupguide/hakjukList");
        return view;
    }
	
	@RequestMapping(value = "/subjGbnList")
    public ModelAndView subjGbnList(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = jolupSupposeInfoService.subjGbnList(params);
		String [] params = {
				"SESSION_USER_ID",
				"EVALTN_GCD",
				"APPLY_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업예정정보_교과목구분별이수여부_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        return view;
    }
	
	@RequestMapping(value = "/mandatorySubjList")
    public ModelAndView mandatorySubjList(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = jolupSupposeInfoService.mandatorySubjList(params);
		String [] params = {
				"SESSION_USER_ID",
				"EVALTN_GCD",
				"APPLY_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		/*data.put("proc", "JU_학부졸업_졸업예정정보_필수교과목이수여부_조회1");*/
		data.put("proc", "OST_졸업_졸업예정정보_필수교과목이수여부_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        return view;
    }
	
	@RequestMapping(value = "/cultureChoiceList1")
    public ModelAndView cultureChoiceList1(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");\
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = jolupSupposeInfoService.cultureChoiceList1(params);
		String [] params = {
				"SESSION_USER_ID",
				"EVALTN_GCD",
				"APPLY_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
/*		data.put("proc", "JU_학부졸업_졸업예정정보_교양선택영역별이수여부_조회1");*/
		data.put("proc", "OST_졸업_졸업예정정보_교양선택이수여부_조회1");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        return view;
    }
	
	@RequestMapping(value = "/cultureChoiceList2")
    public ModelAndView cultureChoiceList2(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = jolupSupposeInfoService.cultureChoiceList2(params);
		String [] params = {
				"SESSION_USER_ID",
				"EVALTN_GCD",
				"APPLY_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
/*        data.put("proc", "JU_학부졸업_졸업예정정보_교양선택영역별이수여부_조회2");*/
        data.put("proc", "OST_졸업_졸업예정정보_교양선택이수여부_조회2");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        return view;
    }
	
	@RequestMapping(value = "/cultureChoiceList3")
    public ModelAndView cultureChoiceList3(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = jolupSupposeInfoService.cultureChoiceList3(params);
		String [] params = {
				"SESSION_USER_ID",
				"EVALTN_GCD",
				"APPLY_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
/*        data.put("proc", "JU_학부졸업_졸업예정정보_교양선택영역별이수여부_조회3");*/
        data.put("proc", "OST_졸업_졸업예정정보_교양선택이수여부_조회3");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        return view;
    }
	
	@RequestMapping(value = "/majorList")
    public ModelAndView majorList(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = jolupSupposeInfoService.majorList(params);
		String [] params = {
				"SESSION_USER_ID",
				"EVALTN_GCD",
				"APPLY_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_졸업_졸업예정정보_전공이수여부_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        return view;
    }
	
	@RequestMapping(value = "/jolupReqList")
    public ModelAndView jolupReqList(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //List list = jolupSupposeInfoService.jolupReqList(params);
		String [] params = {
				"SESSION_USER_ID",
				"EVALTN_GCD",
				"APPLY_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
/*		data.put("proc", "JU_학부졸업_졸업예정정보_졸업요건이수여부_조회1");*/
		data.put("proc", "OST_졸업_졸업예정정보_졸업요건이수여부_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
		view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        return view;
    }
    
}


