package com.onestop.ost.curc.common.controller;

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
import com.onestop.ost.curc.common.service.CurcCommonService;

/**
 * <pre>
 * Class Name: CurcCommonController.java
 * Description:  학생 교육과정 공통  Controller Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/curc/common/curccommon")

@RestController
public class CurcCommonController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 학생지원_교육과정 학년도 SelectBox dropDownList 시작학년도 ~ 종료학년도 조회
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectSearchBoxSyear")
    public ModelAndView selectSearchBoxSyear(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        //Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"BOUNDARY",
				"STARTYEAR",
				"ENDYEAR"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_교육과정_공통_학년도_조회");
		data.put("resultCnt", 1);
        
        
        
        //List list = curcCommonService.selectSearchBoxSyear(params);
        List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
        
        /* 기준년도/학기 조회 */
        data.put("SYSTEM_GCD", data.get("SESSION_SYSTEM_GCD"));
        data.put("MENU_CD", data.get("SESSION_MENU_CD"));
        
    	//Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
        String [] params2 = {
				"SYSTEM_GCD",
				"MENU_CD"
		};

		data.put("params", params2);
		data.put("db", "SYS");
		data.put("proc", "SP_기준년도_학기_조회");
		data.put("resultCnt", 1);
		Map<String, Object> termInfo = (Map<String, Object>)comFunctionService.bindProcMap(data);
    	
        view.addObject("data", list);
    	view.addObject("termInfo", termInfo);
        
        return view;
    }
}
