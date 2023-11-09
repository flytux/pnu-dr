package com.onestop.ost.bus.controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

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
 * Class Name: BusApplyListController.java
 * Description:  통학버스 조회 및 취소 Controller Class
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 02. 08.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/bus/busapplylist")

@RestController
public class BusApplyListController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 통학버스 이용신청을 전체 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectBusApplyList")
    public ModelAndView selectBusApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = busApplyListService.selectBusApplyList(params);

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SYEAR",
        "TERM_GCD",
        "STDT_NO"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_통학버스_이용신청_전체조회");
        data.put("resultCnt", 1);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    
    /**
     * 통학버스 상세보기에서 취소한 자료에 대해 상세 취소저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/cancelDetailBusApplyList")
    public ModelAndView cancelDetailBusApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"CHASU_NO",
				"STDT_NO",
				"GETON_DATE",
				"CANCEL_CHASU_CD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_통학버스_이용신청_취소_상세");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        //view.addObject("data", busApplyListService.cancelDetailBusApplyList(params));
		view.addObject("data", resultMap);
		
        return view;
    }
    
    /**
     * 통학버스 상세보기에서 취소한 자료에 대해 상세 취소저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/reApplyDetailBusApplyList")
    public ModelAndView reApplyDetailBusApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"CHASU_NO",
				"STDT_NO",
				"GETON_DATE",
				"CANCEL_CHASU_CD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_통학버스_이용신청_취소_재신청_상세");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        //view.addObject("data", busApplyListService.cancelDetailBusApplyList(params));
		view.addObject("data", resultMap);
		
        return view;
    }
    
    /**
     * 통학버스 상세보기에서 취소한 자료에 대해 취소저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/cancelBusApplyList")
    public ModelAndView cancelBusApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"CHASU_NO",
				"STDT_NO",
				"APPLY_SERIAL_NO",
				"CANCEL_CHASU_CD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_통학버스_이용신청_취소");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        //view.addObject("data", busApplyListService.cancelBusApplyList(params));
        view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 통학버스 이용신청의 당일 이용이 가능한지 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectGetonDate")
    public ModelAndView selectGetonDate(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SESSION_USER_ID"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_통학버스_이용신청_당일_이용_확인");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        //view.addObject("data", busApplyListService.selectGetonDate(params));
		view.addObject("data", resultMap);
        
        return view;
    }
    
    /**
     * 통학버스 이용신청의 당일 이용 잔여좌석이 존재하는지 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectBusAfterSchTime")
    public ModelAndView selectBusAfterSchTime(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = busApplyListService.selectBusAfterSchTime(params);

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_통학버스_이용신청_당일_잔여좌석_확인");
        data.put("resultCnt", 1);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    
    /**
     * 통학버스 이용신청의 당일 이용 신청을 변경한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/executeBusAfterSchTime")
    public ModelAndView executeBusAfterSchTime(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"CHASU_NO",
				"GETON_DATE",
				"TIME_CD",
				"LOCATION_CD",
				"SESSION_USER_ID",
				"KIND",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_통학버스_이용신청_당일_신청변경_신청");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        //view.addObject("data", busApplyListService.executeBusAfterSchTime(params));
		view.addObject("data", resultMap);
		
        return view;
    }
}
