package com.onestop.common.sample.controller;

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
 * Class Name: SampleController.java
 * Description:  샘플 Controller Class
 * </pre>
 * 
 * @author 서혁성
 * @since 2021. 12. 09.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/common/sample")

@RestController
public class SampleController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	
	@Autowired
    private ComFunctionService comFunctionService;

	/**
	 * 샘플에 관련된 정보를 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/sample1SelectList")
	public ModelAndView sample1SelectList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
	
		String [] params = {
				"SCH_SYSTEM_GCD",
				"",
				"SCH_COMMON_CD",
				"SCH_COMMON_CD_KOR_NM",
				"",
				"",
				"FIRSTINDEX",
				"LASTINDEX"
		};
		data.put("params", params);
		data.put("db", "SYS");
		data.put("proc", "SYS_공통코드관리_샘플_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data); // 그리드에 페이징 사용시 추가
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);

		view.addObject("data", list);
		view.addObject("totalCnt", list.size());
		view.addObject("pageInfo", IUtility.getPageInfo(data, list));
		view.addObject("pageList", IUtility.getPageInfoArr(data));

		return view;
	}

	@RequestMapping(value = "/saveSampleInfo")
	public ModelAndView saveSampleInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"rowState",
				"SYSTEM_GCD",
				"COMMON_CD",
				"COMMON_CD_KOR_NM",
				"USE_FG",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "SYS");
		data.put("proc", "SYS_공통코드관리_샘플_저장");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", resultMap);

		return view;
	}
	
	
	
	@RequestMapping(value = "/bindProcList")
    public Map<String, Object> bindProcList(ParamMap paramMap, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SESSION_SYSTEM_GCD",
    				"SESSION_USER_ID",
    				"MENU_CD",
    				"LINEUP_SEQ_NO",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "SYS");
    		datas.get(i).put("proc", "SYS_공통_즐겨찾기_위치변경_저장");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
		

        
        setSuccess(result, resultMap);

        return result;
    }
}
