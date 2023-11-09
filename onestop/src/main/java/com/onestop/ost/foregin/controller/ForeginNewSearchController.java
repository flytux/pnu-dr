package com.onestop.ost.foregin.controller;

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
 * Class Name: PassInfoSearchController.java
 * Description:  합격정보조회 Controller Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 09.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/foregin/ForeginNewSearch")

@RestController
public class ForeginNewSearchController extends CommonController{
    @Autowired
    MessageSource localeMessageSource;

	@Autowired
    private ComFunctionService comFunctionService;

	/**
     * 학생별적용교육과정에 관련된 정보를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/fnsList")
    public ModelAndView fnsList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
        
        String [] params = {
				"SCH_EXAM_NO",
				"SCH_PWD"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_학적_신입생학번_외국인용_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

        view.addObject("data", list);
        
        return view;
        
      
    }

}
