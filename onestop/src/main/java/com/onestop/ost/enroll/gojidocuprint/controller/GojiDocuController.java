package com.onestop.ost.enroll.gojidocuprint.controller;

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
import com.onestop.core.util.controller.CommonController;

/**
 * <pre>
 * Class Name: GojiDocuController.java
 * Description:  고지서 Controller Class
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/enroll/gojidocuprint/gojidocu")

@RestController
public class GojiDocuController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 등록학년도, 학기를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectSchd")
    public ModelAndView selectSchd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = gojiDocuService.selectSchd(params);
        //view.addObject("data", map);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_등록금고지서출력_년도학기조회");
		data.put("resultCnt", 1);
		Map<String, Object> applyMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", applyMap);
        return view;
    }
    
    /**
     * 고지서 구분을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectGojiGbn")
    public ModelAndView selectGojiGbn(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_등록금고지서출력_고지서구분조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		view.addObject("data", list);
        return view;
    }
    
    /**
     * 납부일자를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectChkPayPeriod")
    public ModelAndView selectChkPayPeriod(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.selectChkPayPeriod(params);
        //view.addObject("data", list);
        
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"ENROLL_STDT_GCD",
				"BUNHAL_CHASU"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_등록금고지서출력_납부일자조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 신입생 등록여부를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/freshmenRegistYnChk")
    public ModelAndView freshmenRegistYnChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.freshmenRegistYnChk(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"PSWD",
				"ADMIN_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_신입생등록여부_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 등록금납입확인서출력에 필요한 자료를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/payTuitChkFmPrtChk")
    public ModelAndView payTuitChkFmPrtChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.payTuitChkFmPrtChk(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"BUNHAL_CHASU"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_등록금납입확인서출력_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 고지서출력 버튼 클릭 시 계약학과일때 계약고지서출력을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/billPrintSearch") 
    public ModelAndView billPrintSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.billPrintSearch(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_계약학과_고지서출력_조회");
		data.put("resultCnt", 6);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 고지서출력 버튼 클릭 시 일반학과일때 일반고지서출력을 조회한다. -- 예치금 o
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/tuitionBasicSearch")
    public ModelAndView tuitionBasicSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.tuitionBasicSearch(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"BUNHAL_CHASU"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_등록금예치금고지서출력_조회");
		data.put("resultCnt", 7);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 고지서출력 버튼 클릭 시 일반학과일때 일반고지서출력을 조회한다. -- 예치금 x
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/tuitionBillPritChk")
    public ModelAndView tuitionBillPritChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.tuitionBillPritChk(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"BUNHAL_CHASU"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_등록금고지서출력_조회");
		data.put("resultCnt", 6);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * Bill print out 버튼 클릭 시 영문고지서출력을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/billChk")
    public ModelAndView billChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.billChk(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"BUNHAL_CHASU"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_영문등록금고지서출력_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 고지서 출력시 출력로그를 입력한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/printLog")
    public ModelAndView printLog(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //Map map = gojiDocuService.printLog(params);
        //view.addObject("data", map);

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
        		"SESSION_USER_ID",
        		"SESSION_USER_ID",
        		"SESSION_USER_IP",
        		"SESSION_SYSTEM_GCD",
        		"SESSION_MENU_CD"
        };
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_등록금고지서출력_출력로그입력");
		data.put("resultCnt", 1);
		Map<String, Object> applyMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", applyMap);
        return view;
    }
    
    /**
     * 재학생 등록금납부여부확인을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/payTuitYnChk")
    public ModelAndView payTuitYnChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.payTuitYnChk(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"PSWD",
				"ADMIN_ID",
				"BUNHAL_CHASU"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_등록금납부여부확인_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 고지서출력 버튼 클릭 시 복수전공일때 국문고지서를 출력한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/billPrintChk2")
    public ModelAndView billPrintChk2(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.billPrintChk2(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_복수전공추가수납고지서출력_조회");
		data.put("resultCnt", 6);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 고지서출력 버튼 클릭 시 복수전공일때 고지서를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/registYnChk")
    public ModelAndView registYnChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.registYnChk(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"PSWD",
				"ADMIN_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_복수전공추가수납등록여부확인_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 고지서출력 버튼 클릭 시 계절수업일때 고지서를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/sessionTermRegisterCheckSearch")
    public ModelAndView sessionTermRegisterCheckSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.sessionTermRegisterCheckSearch(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"PSWD",
				"ADMIN_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_계절학기등록여부확인_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
    
    /**
     * 고지서출력 버튼 클릭 시 계절수업일때 고지서를 출력한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/sessionTermBillPrintSearch")
    public ModelAndView sessionTermBillPrintSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = gojiDocuService.sessionTermBillPrintSearch(params);
        //view.addObject("data", list);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"PRINT_NUM"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_등록_계절학기고지서출력_조회");
		data.put("resultCnt", 3);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        return view;
    }
}
