package com.onestop.core.bbs.controller;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.onestop.core.bbs.service.BbsService;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.controller.CommonController;

@RestController
@RequestMapping("/bbs")
public class BbsController extends CommonController{
	
	@Resource(name = "bbsService")
    private BbsService bbsService;
	
	@Autowired
    private ComFunctionService comFunctionService;
	
	/**
     * 게시판 목록 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectList")
    public ModelAndView SelectList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        bbsService.setBbsConstructor(params,view);

        view.addObject("params", params);
        return view;
    }
    
    @RequestMapping(value = "/passChkPop")
    public ModelAndView passChkPop(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //bbsService.setBbsConstructor(params,view);
        view.addObject("params", params);
        view.setViewName("common/bbs/common/passChkPop");
        return view;
    }
    
    @RequestMapping(value = "/passChkConfirm")
    public ModelAndView passChkConfirm(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        //bbsService.setBbsConstructor(params,view);
        Map<String, Object> result = bbsService.selectBbsPassword(params);
        view.addObject("data", result);
        view.addObject("params", params);
        return view;
    }
    
    @RequestMapping(value = "/detailPop")
    public ModelAndView detailPop(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        bbsService.setBbsConstructor(params,view);
        view.setViewName("common/bbs/common/detailPop");
        return view;
    }
    
    @RequestMapping(value = "/writePop")
    public ModelAndView writePop(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        bbsService.setBbsConstructor(params,view);
        view.setViewName("common/bbs/common/writePop");
        return view;
    }
    
    @RequestMapping(value = "/answerWritePop")
    public ModelAndView answerPop(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        bbsService.setBbsConstructor(params,view);
        view.setViewName("common/bbs/common/writePop"); 
        return view;
    }
    
    @RequestMapping(value = "/saveBbsInfo")
    public ModelAndView saveBbsInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        view.addObject("data", bbsService.saveBbsInfo(params));
        
        return view;
    }
    
    @RequestMapping(value = "/saveBbsPostReplyInfo")
    public ModelAndView saveBbsReplyInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");
        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        view.addObject("data", bbsService.saveBbsReplyInfo(params));
        
        return view;
    }
    
    @RequestMapping(value = "/PaymentIdSelectPop")
    public ModelAndView PaymentIdSelectPop(ParamMap paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        view.addObject("param", data);
        String [] params = {
				"DIVISION_CD"
		};
		data.put("params", params);
		data.put("db", "PORTAL");
		data.put("proc", "UMS_API_부서별과금아이디_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		view.addObject("dataList", list);
		
        view.setViewName("common/bbs/common/paymentIdSelectPop"); 
        return view;
    }
    
    public static Map<String, Object> convertToMap(Object obj) throws IllegalArgumentException, IllegalAccessException{
    	if(obj == null) {
    		return Collections.emptyMap();
    	}
    	
    	Map<String, Object> convertMap = new HashMap<>();
    	
    	Field[] fields = obj.getClass().getDeclaredFields();
    	
    	for (Field field : fields) {
    		field.setAccessible(true);
    		convertMap.put(field.getName(), field.get(obj));
			
		}
		return convertMap;
    	
    }
    
    	
}
