package com.onestop.ost.bus.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.Function;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.bus.service.BusApplyService;


/**
 * <pre>
 * Class Name: BusApplyController.java
 * Description:  통학버스 신청 Controller Class
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/bus/busapply")

@RestController
public class BusApplyController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private BusApplyService busApplyService;
    
    @Autowired
    ServletContext context;
    
    @Autowired
    private ComFunctionService comFunctionService;
    /**
     * 통학버스 진행학기를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    /*@RequestMapping(value="/selectDateCheck")
    public Map<String, Object> selectDateCheck(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = (Map<String, Object>)paramMap.get("data");

        setSuccess(result, busApplyService.selectDateCheck(param));
        return result;
    }*/
    @RequestMapping(value="/selectDateCheck")
    public Map<String, Object> selectDateCheck(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>)paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
                "SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_통학버스_이용신청_진행연도학기");
        data.put("resultCnt", 1);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        return result;
    }
    
    /**
     * 통학버스 이용신청을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    //@RequestMapping(value = "/selectBusApply")
    /*public ModelAndView selectBusApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        List list = busApplyService.selectBusApply(params);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
      // view.addObject("pageInfo", IUtility.getPageInfo(params, list));
      // view.addObject("pageList", IUtility.getPageInfoArr(params));
        
        return view;
    }*/
    @RequestMapping(value = "/selectBusApply")
    public ModelAndView selectBusApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = busApplyService.selectBusApply(params);
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        		"SYEAR",
        		"TERM_GCD",
        		"CHASU_NO",
        		"SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_통학버스_이용신청_조회");
        data.put("resultCnt", 9);
        comFunctionService.setPaging(data);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        // view.addObject("pageInfo", IUtility.getPageInfo(params, list));
        // view.addObject("pageList", IUtility.getPageInfoArr(params));
        
        return view;
    }
    
    /**
     * 통학버스 승차시간,장소코드/ 하차시간,장소코드를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectBusCd")
    public ModelAndView selectBusCd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        List list = busApplyService.selectBusCd(params);
        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    
    /**
     * 통학버스 현재 월의 탑승정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectMonthApplyList")
    public ModelAndView selectMonthApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //List list = busApplyService.selectMonthApplyList(params);

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        		"SYEAR",
        		"TERM_GCD",
        		"CHASU_NO",
        		"SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_통학버스_이용신청_신규_조회");
        data.put("resultCnt", 1);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }
    /*@RequestMapping(value = "/selectMonthApplyList")
    public ModelAndView selectMonthApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        List list = busApplyService.selectMonthApplyList(params);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        
        return view;
    }*/
    
    /**
     * 통학버스 이용신청을 신규,수정 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/executeBusApply")
    public Map<String, Object> executeBusApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");

        busApplyService.executeBusApply(list);
        setSuccess(result, list);

        return result;*/
    	Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"rowStatus",
    				"SYEAR",
    				"TERM_GCD",
    				"CHASU_NO",
    				"SESSION_USER_ID",
    				"GETON_DATE",
    				"DAY_GCD",
    				"GOSCH_TIME_CD",
    				"AFTERSCH_TIME_CD",
    				"GOSCH_LOCATION_CD",
    				"AFTERSCH_LOCATION_CD",
    				"APPLY_SERIAL_NO",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_통학버스_이용신청_저장_상세");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
    
        setSuccess(result, resultMap);

        return result;
    }
    
    /**
     * 통학버스 이용신청_마스터 저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/executeBusApplyMaster")
    public Map<String, Object> executeBusApplyMaster(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	/*Map<String, Object> result = new HashMap<String, Object>();
    	@SuppressWarnings("unchecked")
    	Map<String, Object> data = (Map<String, Object>)paramMap.get("data");
    	
    	busApplyService.executeBusApplyMaster(data);
    	setSuccess(result, data);
    	
    	return result;*/
    	Map<String, Object> result = new HashMap<String, Object>();
    	@SuppressWarnings("unchecked")
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	String [] params = {
				"SYEAR",
				"TERM_GCD",
				"CHASU_NO",
				"SESSION_USER_ID",
				"APPLY_SERIAL_NO",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_통학버스_이용신청_저장");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		setSuccess(result, list);
        return result;
    }
    
    /**
     * 통학버스 이용신청을 삭제 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/deleteDetailBusApply")
    public Map<String, Object> deleteDetailBusApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");

        busApplyService.cancelDetailBusApply(list);
        setSuccess(result, list);

        return result;*/
    	Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SYEAR",
    				"TERM_GCD",
    				"CHASU_NO",
    				"SESSION_USER_ID",
    				"GETON_DATE",
    				"CANCEL_CHASU_CD",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_통학버스_이용신청_삭제");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
    
        setSuccess(result, resultMap);

        return result;
    }
    
    /**
     * 통학버스 이용신청을 취소 한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/cancelDetailBusApply")
    public Map<String, Object> cancelDetailBusApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");

        busApplyService.cancelDetailBusApply(list);
        setSuccess(result, list);

        return result;*/
    	Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SYEAR",
    				"TERM_GCD",
    				"CHASU_NO",
    				"SESSION_USER_ID",
    				"GETON_DATE",
    				"CANCEL_CHASU_CD",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_통학버스_이용신청_취소_상세");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
    
        setSuccess(result, resultMap);

        return result;
    }
    @RequestMapping(value="/cancelBusApply")
    public Map<String, Object> cancelBusApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");

        busApplyService.cancelBusApply(list);
        setSuccess(result, list);

        return result;*/
    	Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SYEAR",
    				"TERM_GCD",
    				"CHASU_NO",
    				"SESSION_USER_ID",
    				"CANCEL_CHASU_CD",
    				"APPLY_SERIAL_NO",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_통학버스_이용신청_취소");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
    
        setSuccess(result, resultMap);

        return result;
    }
    
    /**
     * 통학버스 이용신청 학생의 사진을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectStdtPhoto")
    public ModelAndView selectStdtPhoto(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        String [] params = {
        		"SESSION_USER_ID"
        };

        data.put("params", params);
        data.put("db", "ACADEMY");
        data.put("proc", "BUS_통학버스_신청내역관리_사진_조회");
        data.put("resultCnt", 1);
        Map<String, Object> stdtInfoMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        //Map stdtInfoMap = busApplyService.selectStdtPhoto(data);

        view.addObject("data", stdtInfoMap);

        return view;
    }
    /*@RequestMapping(value = "/selectStdtPhoto")
    public ModelAndView selectStdtPhoto(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map stdtInfoMap = busApplyService.selectStdtPhoto(params);

        view.addObject("data", stdtInfoMap);

        return view;
    }*/
    
    
    
    /**
     * 통학버스 고지서 출력가능여부를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/printChkBusApply")
    public ModelAndView printChkBusApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        String [] params = {
        		"SYEAR",
        		"TERM_GCD",
        		"CHASU_NO",
        		"SESSION_USER_ID",
        		"APPLY_SERIAL_NO"
        };

        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_통학버스_이용신청_고지서출력가능여부_조회");
        data.put("resultCnt", 1);
        Map<String, Object> stdtInfoMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        //Map stdtInfoMap = busApplyService.printChkBusApply(params);

        view.addObject("data", stdtInfoMap);

        return view;
    }
    /*@RequestMapping(value = "/printChkBusApply")
    public ModelAndView printChkBusApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map stdtInfoMap = busApplyService.printChkBusApply(params);

        view.addObject("data", stdtInfoMap);

        return view;
    }*/
}
