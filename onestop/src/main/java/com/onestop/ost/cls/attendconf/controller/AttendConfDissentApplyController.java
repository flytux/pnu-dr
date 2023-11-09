package com.onestop.ost.cls.attendconf.controller;

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
import com.onestop.core.main.service.MainService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.cls.attendconf.service.AttendConfDissentApplyService;

/**
 * <pre>
 * Class Name: AttendConfDissentApplyController.java
 * Description:  출결확인 및 이의신청. Controller Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/attendconf/attendConfDissentApply")

@RestController
public class AttendConfDissentApplyController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    /**
     * 학사일정을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectSchdInfo")
    public ModelAndView selectSchdInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");   

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_출결확인_출결확인및이의신청_학사일정_조회");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        /* 학사일정 조회 */
        //Map<String, Object> map = attendConfDissentApplyService.selectSchdInfo(params);

        view.addObject("data", resultMap);

        return view;
    }
    /*@RequestMapping(value = "/selectSchdInfo")
    public ModelAndView selectSchdInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");   

        // 학사일정 조회 
        Map<String, Object> map = attendConfDissentApplyService.selectSchdInfo(params);

        view.addObject("data", map);

        return view;
    }*/
    /**
     * 출결 이의신청 내역을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListAttDisApply")
    public ModelAndView selectListAttDisApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");   

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SCH_SYEAR",
        "SCH_TERM_GCD",
        "SESSION_USER_ID",
        "FIRSTINDEX",
        "LASTINDEX"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_출결확인_출결확인및이의신청_조회");
        data.put("resultCnt", 1);
        comFunctionService.setPaging(data);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        /* 출결 이의신청 내역 조회 */
        //List list = attendConfDissentApplyService.selectListAttDisApply(params);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    /*@RequestMapping(value = "/selectListAttDisApply")
    public ModelAndView selectListAttDisApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");   

        // 출결 이의신청 내역 조회 
        List list = attendConfDissentApplyService.selectListAttDisApply(params);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		view.addObject("pageList", IUtility.getPageInfoArr(params));

        return view;
    }*/
    /**
     * 출결 이의신청을 삭제한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/deleteDissentApply")
    public ModelAndView deleteDissentApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SUBJ_NO",
				"CLASS_NO",
				"LECT_DATE",
				"STDT_NO",
				"SEQ_NO",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_출결확인_출결확인및이의신청_삭제");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        view.addObject("data", resultMap);
        
        return view;
    }
    /*@RequestMapping(value = "/deleteDissentApply")
    public ModelAndView deleteDissentApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        view.addObject("data", attendConfDissentApplyService.deleteDissentApply(params));
        
        return view;
    }*/
    /**
     * 수강신청 교과목 내역을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListApplySubj")
    public ModelAndView selectListApplySubj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SCH_SYEAR",
        "SCH_TERM_GCD",
        "SESSION_USER_ID",
        "FIRSTINDEX",
        "LASTINDEX"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_출결확인_출결확인및이의신청_수강신청교과목_조회");
        data.put("resultCnt", 1);
        comFunctionService.setPaging(data);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        /* 수강신청 교과목 내역 조회 */
        //List list = attendConfDissentApplyService.selectListApplySubj(params);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    /*@RequestMapping(value = "/selectListApplySubj")
    public ModelAndView selectListApplySubj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        // 수강신청 교과목 내역 조회 
        List list = attendConfDissentApplyService.selectListApplySubj(params);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		view.addObject("pageList", IUtility.getPageInfoArr(params));

        return view;
    }*/
    
    /**
     * 출결사항 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListAttend")
    public ModelAndView selectListAttend(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SCH_SYEAR",
        "SCH_TERM_GCD",
        "SESSION_USER_ID",
        "SUBJ_NO",
        "CLASS_NO",
        "FIRSTINDEX",
        "LASTINDEX"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_출결확인_출결확인및이의신청_출결사항_조회");
        data.put("resultCnt", 1);
        comFunctionService.setPaging(data);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        /* 출결사항 목록 조회 */
        //List list = attendConfDissentApplyService.selectListAttend(params);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    /*@RequestMapping(value = "/selectListAttend")
    public ModelAndView selectListAttend(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        // 출결사항 목록 조회 
        List list = attendConfDissentApplyService.selectListAttend(params);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, list));
		view.addObject("pageList", IUtility.getPageInfoArr(params));

        return view;
    }*/
    /**
     * 출결 이의신청을 입력한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/insertDissentApply")
    public Map<String, Object> insertDissentApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SYEAR",
    				"TERM_GCD",
    				"SUBJ_NO",
    				"CLASS_NO",
    				"LECT_DATE",
    				"START_LECTTIME",
    				"STDT_NO",
    				"CLOSE_LECTTIME",
    				"START_TIME",
    				"CLOSE_TIME",
    				"APPLY_REASON_GCD",
    				"ATTEND_GCD",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_수업_출결확인_출결확인및이의신청_저장");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);

        
        setSuccess(result, resultMap);

        return result;
    }    

    /*@RequestMapping(value = "/insertDissentApply")
    public ModelAndView insertDissentApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        List<Map<String, Object>> paramList = (List<Map<String, Object>>) paramMap.get("data");

        view.addObject("data", attendConfDissentApplyService.insertDissentApply(paramList));
        
        return view;
    }*/
}
