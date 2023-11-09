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
import com.onestop.ost.hj.hjchnge.service.BokhakApplyService;

/**
 * <pre>
 * Class Name: BokhakApplyController.java
 * Description:  복학신청 Controller Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 16.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/hj/hjchnge/bokhakApply")

@RestController
public class BokhakApplyController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 복학신청내역을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListBokhakApply")
    public ModelAndView selectListBokhakApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        /* 학생정보, 복학신청내역 조회 */
        //List list = bokhakApplyService.selectListBokhakApply(params);
		String [] params = {
				"SESSION_USER_ID",
				"FIRSTINDEX",
				"LASTINDEX",
				"SESSION_USER_DEPT_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_휴복학_복학신청_조회");
		data.put("resultCnt", 2);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
		view.addObject("totalCnt", ((List) list.get(1)).size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, (List) list.get(1)));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    
    /**
     * 복학신청가능여부를 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectBokhakPosibleYn")
    public ModelAndView selectBokhakPosibleYn(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        /* 복학신청 가능여부 조회 */
        //Map bokhakPossibleMap = bokhakApplyService.selectBokhakPosibleYn(params);
		String [] params = {
				"SESSION_USER_ID",
				"CHG_APPLY_REASON_GCD",
				"MIL_END_DATE"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_휴복학_복학가능여부");
		data.put("resultCnt", 1);

		Map<String, Object> bokhakPossibleMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        view.addObject("data", bokhakPossibleMap);

        return view;
    }
    
    
    /**
     * 복학신청을 저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/executeBokhakApply")
    public ModelAndView executeBokhakApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        //view.addObject("data", bokhakApplyService.executeBokhakApply(params));
		String [] params = {
				"rowState",
				"SESSION_USER_ID",
				"APPLY_SYEAR",
				"APPLY_TERM_GCD",
				"CHG_SEQ_NO",
				"CHG_APPLY_REASON_GCD",
				"SUPPOSE_SYEAR",
				"SUPPOSE_TERM_GCD",
				"MIL_END_DATE",
				"MIL_NO",
				"STDT_ZIP_NO",
				"STDT_ADDR",
				"STDT_DETAIL_ADDR",
				"STDT_EMAIL",
				"STDT_CELLULAR_NO_hidden",
				"STDT_TEL_NO_hidden",
				"ATTACH_FILE_GRP_CD",
				"userAgent",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_휴복학_복학신청_저장");
		data.put("resultCnt", 1);

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
		view.addObject("data", resultMap);
		
        return view;
    }
    
}
