package com.onestop.ost.cls.lecaplycheck.controller;

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
import com.onestop.core.util.controller.CommonController;

/**
 * <pre>
 * Class Name: AutoApplySubjMngController.java
 * Description:  자동신청교과목 확인 및 삭제 Controller Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 17.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/lecaplycheck/AutoApplySubjMng")

@RestController
public class AutoApplySubjMngController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;


	@Autowired
    private ComFunctionService comFunctionService;
	/**
	 * 수강신청 기준학년도,학기,학사일정을 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchSchdChk")
	public ModelAndView searchSchdChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {};

		data.put("params", params);
		data.put("db", "LECTURE");
		data.put("proc", "CLS_수강신청_수강신청_수강학년도학기_조회"); 
		data.put("resultCnt", 1);
		Map<String, Object> termInfo = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		// 기준학년도 조회
		//Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
		if (termInfo.size() > 0) {
			data.put("SYEAR", termInfo.get("SYEAR"));
			data.put("TERM_GCD", termInfo.get("TERM_GCD"));
		}

		String [] params2 = {
				"SYEAR",
				"TERM_GCD"
		};

		data.put("params", params2);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강신청기간_학사일정_조회");
		data.put("resultCnt", 1);
		Map<String, Object> map = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		// 수강신청 기간 조회
		//Map<String, Object> map = autoApplySubjMngService.searchClsSchdChk(params);

		if (!map.get("CHK").equals("N")) {
			if (map.get("CHK").equals("T")) {
				map.put("msg", "수강신청기간에는 일시적으로 서비스를 제한합니다.");
				map.put("clsFg", "N");
				map.put("autoFg", "N");
				view.addObject("data", map);
				return view;
			} else if (map.get("CHK").equals("F")) {
				String [] params3 = {
						"SYEAR",
						"TERM_GCD"
				};

				data.put("params", params3);
				data.put("db", "OST");
				data.put("proc", "OST_수업_자동신청결과확인_학사일정_조회");
				data.put("resultCnt", 1);
				Map<String, Object> mapAuto = (Map<String, Object>)comFunctionService.bindProcMap(data);
				
				//Map<String, Object> mapAuto = autoApplySubjMngService.searchAutoClsSchdChk(params);
				if (mapAuto != null) {
					if (mapAuto.size() > 0) {
						if (mapAuto.get("CHK").equals("F")) {
							mapAuto.put("msg", "자동신청결과확인 기간이 아닙니다.");
							mapAuto.put("clsFg", "Y");
							mapAuto.put("autoFg", "N");
							view.addObject("data", mapAuto);
							return view;
						} else {
							mapAuto.put("clsFg", "Y");
							mapAuto.put("autoFg", "Y");
							view.addObject("data", mapAuto);
							return view;
						}
					} else {
						mapAuto.put("msg", "조회가능기간이 등록되어 있지 않습니다.");
						mapAuto.put("clsFg", "N");
						mapAuto.put("autoFg", "N");
						view.addObject("data", mapAuto);
						return view;
					}
				}else {
					mapAuto = new HashMap<String, Object>();
					mapAuto.put("msg", "조회가능기간이 등록되어 있지 않습니다.");
					mapAuto.put("clsFg", "N");
					mapAuto.put("autoFg", "N");
					view.addObject("data", mapAuto);
					return view;
					
				}
			}
		} else {
			map.put("msg", "조회가능기간이 등록되어 있지 않습니다.");
			map.put("clsFg", "N");
			map.put("autoFg", "N");
			view.addObject("data", map);
			return view;
		}
		return view;
	}
	
	/**
	 * 자동신청교과목 내역을 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return List<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchAutoApplySubj")
	public ModelAndView searchAutoApplySubj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SCH_SYEAR",
		"SCH_TERM_GCD",
		"SCH_STDT_NO"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강신청및확인_자동신청교과목확인및삭제_자동신청교과목_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//List list = autoApplySubjMngService.searchAutoApplySubj(params);

		view.addObject("data", list);
		view.addObject("totalCnt", list.size());

		return view;
	}
	/*@RequestMapping(value = "/searchAutoApplySubj")
	public ModelAndView searchAutoApplySubj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		List list = autoApplySubjMngService.searchAutoApplySubj(params);

		view.addObject("data", list);
		view.addObject("totalCnt", list.size());

		return view;
	}*/
	/**
	 * 자동신청교과목 삭제 내역을 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return List<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchAutoApplyCancel")
	public ModelAndView searchAutoApplyCancel(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SCH_SYEAR",
		"SCH_TERM_GCD",
		"SCH_STDT_NO"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강신청및확인_자동신청교과목확인및삭제_자동신청교과목_삭제내역_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//List list = autoApplySubjMngService.searchAutoApplyCancel(params);

		view.addObject("data", list);
		view.addObject("totalCnt", list.size());

		return view;
	}
	/*@RequestMapping(value = "/searchAutoApplyCancel")
	public ModelAndView searchAutoApplyCancel(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		List list = autoApplySubjMngService.searchAutoApplyCancel(params);

		view.addObject("data", list);
		view.addObject("totalCnt", list.size());

		return view;
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
	@RequestMapping(value = "/saveAutoApplyCancel")
	public ModelAndView saveAutoApplyCancel(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");

		String [] params = {
				"SYEAR",
				"TERM_GCD",
				"SUBJ_NO",
				"CLASS_NO",
				"SCH_STDT_NO",
				"SESSION_USER_ID",
				"SESSION_USER_IP",
				"SESSION_SYSTEM_GCD",
				"SESSION_MENU_CD"
		};

		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강신청및확인_자동신청교과목확인및삭제_자동신청교과목_삭제");
		data.put("resultCnt", 1);
		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcMap(data);
		
		view.addObject("data", resultMap);

		return view;
	}
	/*@RequestMapping(value = "/saveAutoApplyCancel")
	public ModelAndView saveAutoApplyCancel(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		view.addObject("data", autoApplySubjMngService.saveAutoApplyCancel(params));

		return view;
	}*/
	/**
	 * 자동신청교과목 재이수교과목 상세정보를 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return List<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/searchRecmplSubj")
	public ModelAndView searchRecmplSubj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SYEAR",
		"TERM_GCD",
		"SUBJ_NO",
		"CLASS_NO",
		"SESSION_USER_ID"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수업_수강신청및확인_자동신청교과목확인및삭제_재이수내역_조회");
		data.put("resultCnt", 1);
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		//List list = autoApplySubjMngService.searchRecmplSubj(params);

		view.addObject("data", list);
		view.addObject("totalCnt", list.size());

		return view;
	}
	/*@RequestMapping(value = "/searchRecmplSubj")
	public ModelAndView searchRecmplSubj(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

		List list = autoApplySubjMngService.searchRecmplSubj(params);

		view.addObject("data", list);
		view.addObject("totalCnt", list.size());

		return view;
	}*/
}
