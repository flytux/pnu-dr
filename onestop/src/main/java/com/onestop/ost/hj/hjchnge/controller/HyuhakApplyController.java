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
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.hj.hjchnge.service.HyuhakApplyService;

import egovframework.com.utl.cas.service.EgovSessionCookieUtil;

/**
 * <pre>
 * Class Name: HyuhakApplyController.java
 * Description:  휴학신청 Controller Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/hj/hjchnge/hyuhakApply")

@RestController
public class HyuhakApplyController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private HyuhakApplyService hyuhakApplyService;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 휴학신청내역을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListHyuhakApply")
    public ModelAndView selectListHakjukbuAlterApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        /* 군입대개월수 목록 조회 */
        //List milServeBmList = hyuhakApplyService.selectListMilServeBm(params);
        String [] params = {};
		data.put("params", params);
		data.put("db", "HAKJUK");
		data.put("proc", "HJ_공통_군입대개월수_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> milServeBmList = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
        /* 학생정보, 휴학신청내역 조회 */
        //List list = hyuhakApplyService.selectListHyuhakApply(params);
		String [] params2 = {
				"SESSION_USER_ID",
				"FIRSTINDEX",
				"LASTINDEX",
				"SESSION_USER_DEPT_CD"
		};
		data.put("params", params2);
		data.put("db", "OST");
		data.put("proc", "OST_학적_휴복학_휴학신청_조회");
		data.put("resultCnt", 2);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("milServeBmList", milServeBmList);
		view.addObject("totalCnt", ((List) list.get(1)).size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, (List) list.get(1)));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    
    /**
     * 휴학신청 수정, 삭제 가능여부를 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectHyuhakPosibleYn")
    public ModelAndView selectHyuhakPosibleYn(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        /* 휴학신청 가능여부 조회 */
        //Map hyuhakPossibleMap = hyuhakApplyService.selectHyuhakPosibleYn(params);
        String [] params = {
				"APPLY_SYEAR",
				"APPLY_TERM_GCD",
				"SESSION_USER_ID",
				"CHG_APPLY_REASON_GCD",
				"HYUHAK_TERM_CNT"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_휴복학_휴학가능여부");
		data.put("resultCnt", 1);

		Map<String, Object> hyuhakPossibleMap = (Map<String, Object>)comFunctionService.bindProcMap(data);

        view.addObject("data", hyuhakPossibleMap);

        return view;
    }
    
    
    /**
     * 휴학신청을 저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/executeHyuhakApply")
    public ModelAndView executeHyuhakApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        view.addObject("data", hyuhakApplyService.executeHyuhakApply(params));
        
        return view;
    }
    
}
