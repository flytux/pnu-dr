package com.onestop.ost.cls.subjApplyInvstgt.controller;

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
import com.onestop.ost.cls.subjApplyInvstgt.service.SclassApplyInvstgtService;

/**
 * <pre>
 * Class Name: HyuhakApplyController.java
 * Description:  계절수업 수요조사 Controller Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 24.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/subjApplyInvstgt/sclassApplyInvstgt")

@RestController
public class SclassApplyInvstgtController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;
    /**
     * 내가 신청한 계절수업 개설신청 교과목 목록을 조회한다.
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
				"SYSTEM_GCD",
				"MENU_CD"
		};

		data.put("params", params);
		data.put("db", "SYS");
		data.put("proc", "SP_기준년도_학기_조회");
		data.put("resultCnt", 1);
		
		data.put("SYSTEM_GCD", data.get("SESSION_SYSTEM_GCD"));
		data.put("MENU_CD", data.get("SESSION_MENU_CD"));
		
		Map<String, Object> termInfo = (Map<String, Object>)comFunctionService.bindProcMap(data);
        
        //params.put("SYSTEM_GCD", params.get("SESSION_SYSTEM_GCD"));
        //params.put("MENU_CD", params.get("SESSION_MENU_CD"));
        
        /* 기준년도, 학기 조회 */
    	//Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
    	// 기준학기가 정규학기인 경우, 계절수업으로 변경
    	if(IUtility.parseNull(termInfo.get("TERM_GCD")).equals("0010")) {
    		termInfo.put("TERM_GCD", "0011");
    	}else {
    		termInfo.put("TERM_GCD", "0021");
    	}
    	data.putAll(termInfo);
    	
    	String [] params2 = {
    			"SYEAR",
    			"TERM_GCD",
    			"SESSION_USER_ID"
    			};
    	data.put("params", params2);
    	data.put("db", "OST");
    	data.put("proc", "OST_수업_교과목수요조사_계절수업수요조사_개설신청교과목_조회");
    	data.put("resultCnt", 2);
    	comFunctionService.setPaging(data);
    	List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
        /* 내가 신청한 계절수업 개설신청 교과목 목록 조회 */
        //List list = sclassApplyInvstgtService.selectListApplySubj(params);

        view.addObject("data", list);
        view.addObject("termInfo", termInfo);
		view.addObject("totalCnt", ((List) list.get(1)).size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, (List) list.get(1)));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    /*@RequestMapping(value = "/selectListApplySubj")
    public ModelAndView selectListApplySubj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");   
        
        params.put("SYSTEM_GCD", params.get("SESSION_SYSTEM_GCD"));
        params.put("MENU_CD", params.get("SESSION_MENU_CD"));
        
        // 기준년도, 학기 조회 
    	Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
    	// 기준학기가 정규학기인 경우, 계절수업으로 변경
    	if(IUtility.parseNull(termInfo.get("TERM_GCD")).equals("0010")) {
    		termInfo.put("TERM_GCD", "0011");
    	}else {
    		termInfo.put("TERM_GCD", "0021");
    	}
    	params.putAll(termInfo);
    	
        // 내가 신청한 계절수업 개설신청 교과목 목록 조회 
        List list = sclassApplyInvstgtService.selectListApplySubj(params);

        view.addObject("data", list);
        view.addObject("termInfo", termInfo);
		view.addObject("totalCnt", ((List) list.get(1)).size());
		view.addObject("pageInfo", IUtility.getPageInfo(params, (List) list.get(1)));
		view.addObject("pageList", IUtility.getPageInfoArr(params));

        return view;
    }*/
    
    
    /**
     * 계절수업 수요조사 교과목 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListSclassSubj")
    public ModelAndView selectListSclassSubj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SYEAR",
        "SCH_GUBUN",
        "AREA_GCD",
        "SCH_DEPT_CD",
        "SUBJ_NM",
        "FIRSTINDEX",
        "LASTINDEX"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_교과목수요조사_계절수업수요조사_수요조사교과목_조회");
        data.put("resultCnt", 1);
        comFunctionService.setPaging(data);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        /* 계절수업 수요조사 교과목 목록 조회 */
        //List list = sclassApplyInvstgtService.selectListSclassSubj(params);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

        return view;
    }
    
    
    /**
     * 계절수업 수요조사 교과목을 저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/executeSubjApply")
    public ModelAndView executeSubjApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        //List<Map<String, Object>> paramList = (List<Map<String, Object>>) paramMap.get("data");

        //Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
        
		String [] params = {
				"rowState",
				"SYEAR",
				"TERM_GCD",
				"SESSION_USER_ID",
				"SUBJ_NO",
				"SUBJ_NM",
				"SUBJ_SERIAL_NO",
				"SUBJ_GCD",
				"CRDT",
				"MNG_DEPT_CD",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		datas.get(i).put("params", params);
		datas.get(i).put("db", "OST");
		datas.get(i).put("proc", "OST_수업_교과목수요조사_계절수업수요조사_저장");
		datas.get(i).put("resultCnt", 1);
		
        }
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
        
        //view.addObject("data", sclassApplyInvstgtService.executeSubjApply(paramList));
		view.addObject("data", resultMap);
		
        return view;
    }
    /*@RequestMapping(value = "/executeSubjApply")
    public ModelAndView executeSubjApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        
        List<Map<String, Object>> paramList = (List<Map<String, Object>>) paramMap.get("data");

        view.addObject("data", sclassApplyInvstgtService.executeSubjApply(paramList));
        
        return view;
    }*/
    
    /**
     * 순위별 계절수업 수요조사 목록을 조회한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListSclassSubjRank")
    public ModelAndView selectListSclassSubjRank(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SYEAR",
        "TERM_GCD",
        "SCH_TOT_CNT",
        "SCH_GUBUN",
        "SCH_AREA_GCD",
        "SCH_DEPT_CD"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_교과목수요조사_계절수업수요조사_순위_조회");
        data.put("resultCnt", 1);

        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        /* 순위별 계절수업 수요조사 목록 조회 */
        //List list = sclassApplyInvstgtService.selectListSclassSubjRank(params);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());

        return view;
    }
    /*@RequestMapping(value = "/selectListSclassSubjRank")
    public ModelAndView selectListSclassSubjRank(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        // 순위별 계절수업 수요조사 목록 조회 
        List list = sclassApplyInvstgtService.selectListSclassSubjRank(params);

        view.addObject("data", list);
		view.addObject("totalCnt", list.size());

        return view;
    }*/
}
