package com.onestop.ost.sep.overseasdispatch.controller;

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
import com.onestop.ost.sep.overseasdispatch.service.ShortTermDispatchService;

/**
 * <pre>
 * Class Name: ShortTermDispatchController.java
 * Description:  단기파견 Controller Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/sep/overseasdispatch/shorttermdispatch")

@RestController
public class ShortTermDispatchController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ShortTermDispatchService shortTermDispatchService;
	@Autowired
    private ComFunctionService comFunctionService;

    /**
     * 해외파견 단기파견 신청자 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectStdtInfo")
    public Map<String, Object> selectStdtInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        //Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"EXCHG_DETAIL_GCD",
				"SESSION_USER_ID",
				"CHASU_NO"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_단기파견_신청자정보_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        //setSuccess(result, shortTermDispatchService.selectStdtInfo(param));
		setSuccess(result, list);
        
        return result;
    }
    /**
     * 해외파견 지원가능대학목록을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/selectUnivList")
    public Map<String, Object> selectUnivList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	//Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
    	
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"EXCHG_DETAIL_GCD",
				"LANG_GCD",
				"DEG_COURSE_GCD",
				"CMPL_TERM_CNT",
				"CHASU_NO" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_지원가능대학목록_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	//setSuccess(result, shortTermDispatchService.selectUnivList(param));
		setSuccess(result, list);
    	
    	return result;
    }
       
    /**
     * 단기파견 작성 화면에 입력된 정보를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/saveShortTermDispatch")
    public ModelAndView saveShortTermDispatch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        view.addObject("data", shortTermDispatchService.saveShortTermDispatch(params));	
        
        return view;
    }

    /**
     * 단기파견 작성 화면에 입력된 취소 정보를 저장한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value="/saveCancelShortTermDispatch")
    public Map<String, Object> saveCancelShortTermDispatch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	//Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
    	
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"EXCHG_DETAIL_GCD",
				"SESSION_USER_ID",
				"CHASU_NO",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_신청취소");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	//setSuccess(result, shortTermDispatchService.saveCancelShortTermDispatch(param));
		setSuccess(result, list);
    	return result;
    }
    
    /**
     * 참가해외파견 프로그램을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    
    @RequestMapping(value = "/selectProgram")
    public ModelAndView selectProgram(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
       // 
       // List list = shortTermDispatchService.selectProgram(params);
        
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		
		String [] params = {
				"SESSION_USER_ID" 
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학생교류_해외파견_해외파견프로그램_조회");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        view.addObject("totalCnt", list.size());
      // view.addObject("pageInfo", IUtility.getPageInfo(params, list));
      // view.addObject("pageList", IUtility.getPageInfoArr(params));
        
        return view;
    }
}
    
   /* @RequestMapping(value="/selectProgram")
    public Map<String, Object> selectProgram(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Map<String, Object> result = new HashMap<String, Object>();
    	Map<String, Object> param = (Map<String, Object>)paramMap.get("data");
    	
    	setSuccess(result, shortTermDispatchService.selectProgram(param));
    	return result;
    	}*/
    
  /*  @RequestMapping(value = "/selectProgram")
    public ModelAndView searchExchgStdtInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map map = shortTermDispatchService.selectProgram(params);

        view.addObject("data", map);
        
        return view;
    }*/
