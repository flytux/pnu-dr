package com.onestop.ost.enroll.enrollamtpayguide.controller;

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

/**
 * <pre>
 * Class Name: RefundApplyController.java
 * Description:  환불신청 Controller Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 08. 17.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/enroll/enrollamtpayguide/refundapply")

@RestController
public class RefundApplyController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;

    /**
     * 환불신청을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectRefundApply")
    public ModelAndView selectRefundApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");   
        //List list = refundApplyService.selectRefundApply(params);
        
        //view.addObject("data", list);
		//view.addObject("totalCnt", ((List) list.get(4)).size());
		//view.addObject("pageInfo", IUtility.getPageInfo(params, (List) list.get(4)));
		//view.addObject("pageList", IUtility.getPageInfoArr(params));
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_환불신청_조회");
		data.put("resultCnt", 6);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
		view.addObject("totalCnt", ((List) list.get(1)).size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, (List) list.get(1)));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }

    /**
     * 환불신청을 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/executeRefundApply")
    public ModelAndView executeRefundApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //view.addObject("data", refundApplyService.executeRefundApply(params));
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
        		"SYEAR",
        		"TERM_GCD",
        		"SESSION_USER_ID",
        		"REFUND_ADMS_AMT",
        		"REFUND_CLASS_1_AMT",
        		"REFUND_CLASS_2_AMT",
        		"REFUND_BANK_CD",
        		"REFUND_ACCT_NO",
        		"REFUND_ACCT_NM",
        		"REFUND_RATIO_GCD",
        		"SESSION_USER_ID",
        		"SESSION_USER_IP",
        		"SESSION_SYSTEM_GCD",
        		"SESSION_MENU_CD"
        };
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_환불신청_신청");
		data.put("resultCnt", 1);
		Map<String, Object> applyMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", applyMap);
        return view;
    }

    /**
     * 환불신청을 취소한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/cancelRefundApply")
    public ModelAndView cancelRefundApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //view.addObject("data", refundApplyService.cancelRefundApply(params));
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
        		"SYEAR",
        		"TERM_GCD",
        		"SESSION_USER_ID"
        };
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_환불신청_취소");
		data.put("resultCnt", 1);
		Map<String, Object> applyMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", applyMap);
        return view;
    }
}
