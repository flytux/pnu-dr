package com.onestop.ost.cls.attendconf.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.cls.attendconf.service.AttendAcceptApplyService;

/**
 * <pre>
 * Class Name: AttendAcceptApplyController.java
 * Description:  출석인정신청 Controller Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/attendconf/attendacceptapply")

@RestController
public class AttendAcceptApplyController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private AttendAcceptApplyService attendAcceptApplyService;

    @Autowired
    private ComFunctionService comFunctionService;
    /**
     * 출석인정신청의 신청내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    /*
    @RequestMapping(value = "/selectAttendAcceptApply")
    public ModelAndView selectAttendAcceptApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        List list = attendAcceptApplyService.selectAttendAcceptApply(params);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(params, list));
        view.addObject("pageList", IUtility.getPageInfoArr(params));
        
        return view;
    }*/
    @RequestMapping(value = "/selectAttendAcceptApply")
    public ModelAndView selectAttendAcceptApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SESSION_USER_ID",
        "SCH_SYEAR",
        "SCH_TERM_GCD",
        "FIRSTINDEX",
        "LASTINDEX"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_출결확인_출석인정신청_신청내역_조회");
        data.put("resultCnt", 1);

        comFunctionService.setPaging(data);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
         
        //List list = attendAcceptApplyService.selectAttendAcceptApply(params);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
        view.addObject("pageInfo", IUtility.getPageInfo(data, list));
        view.addObject("pageList", IUtility.getPageInfoArr(data));
        
        return view;
    }

    /**
     * 출석인정신청의 수강신청내역을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    /*
    @RequestMapping(value = "/selectLecApply")
    public ModelAndView selectLecApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");
    	
    	Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
    	
    	List list = attendAcceptApplyService.selectLecApply(params);
    	
    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());
    	view.addObject("pageInfo", IUtility.getPageInfo(params, list));
    	view.addObject("pageList", IUtility.getPageInfoArr(params));
    	
    	return view;
    }
    */
    @RequestMapping(value = "/selectLecApply")
    public ModelAndView selectLecApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");
    	
    	//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	String [] params = {
    	"SESSION_USER_ID",
    	"SCH_SYEAR",
    	"SCH_TERM_GCD"
    	};
    	
    	data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_출결확인_출석인정신청_수강신청내역_조회");
		data.put("resultCnt", 1);
		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
    	
//    	data.put("params", params);
//    	data.put("db", "OST");
//    	data.put("proc", "OST_수업_출결확인_출석인정신청_수강신청내역_조회");
//    	data.put("resultCnt", 1);
//    	comFunctionService.setPaging(data);
//    	List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	//List list = attendAcceptApplyService.selectLecApply(params);
    	
    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());
    	view.addObject("pageInfo", IUtility.getPageInfo(data, list));
    	view.addObject("pageList", IUtility.getPageInfoArr(data));
    	
    	return view;
    }
    
    /**
     * 학사일정을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectLecDate")
    public Map<String, Object> selectLecDate(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        String [] params = {
        "SYEAR",
        "TERM_GCD",
        "SESSION_USER_ID"
        };
        data.put("params", params);
        data.put("db", "OST");
        data.put("proc", "OST_수업_출결확인_출석인정신청_학사일정_조회");
        data.put("resultCnt", 1);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        setSuccess(result, list);
        
        return result;
    }
    /*@RequestMapping(value="/selectLecDate")
    public Map<String, Object> selectLecDate(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        setSuccess(result, attendAcceptApplyService.selectLecDate(param));
        
        return result;
    }*/
    /**
     * 자동신청교과목을 삭제한다.
     * 
     * @param paramList
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/saveAttendAcceptApply")
    public ModelAndView saveAttendAcceptApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM",
				"SUBJ_NO",
				"CLASS_NO",
				"SEQ_NO",
				"SESSION_USER_ID",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_출결확인_출석인정신청_신청내역_삭제");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
    	
        view.addObject("data", resultMap);
        
        return view;
    }  
    /*@RequestMapping(value = "/saveAttendAcceptApply")
    public ModelAndView saveAttendAcceptApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        view.addObject("data", attendAcceptApplyService.saveAttendAcceptApply(params));
        
        return view;
    }*/
    /**
     * 출석인정 신청을 저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/saveLecApply")
    public Map<String, Object> saveLecApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SYEAR",
    				"TERM_GCD",
    				"SESSION_USER_ID",
    				"SUBJ_NO",
    				"CLASS_NO",
    				"ATTACH_FILE_GRP_CD",
    				"ATTEND_START_DATE_VAL",
    				"ATTEND_CLOSE_DATE_VAL",
    				"APPLY_REASON_GCD_VAL",
    				"DETAIL_REASON_CONTENT_VAL",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "OST");
    		datas.get(i).put("proc", "OST_수업_출결확인_출석인정신청_출석인정신청_저장");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);

        
        setSuccess(result, resultMap);

        return result;
    }    
    /*@RequestMapping(value = "/saveLecApply")
    public ModelAndView saveLecApply(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");

        view.addObject("data", attendAcceptApplyService.saveLecApply(list));
        
        return view;
    }*/
    /**
     * 개인정보동의 정보를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/saveClause")
    public ModelAndView saveSampleInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");


        view.addObject("data", attendAcceptApplyService.saveClause(params));
        
        return view;
    }      
    
}
