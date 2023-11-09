package com.onestop.core.function.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

/**
 * @Class Name : ComnSys001Service.java
 * @Description : 공통코드관리 Service Class
 * @Modification Information
 * @since : 2020-02-06
 * @author : 정원빈
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
public interface ComFunctionService {
	/**
	 * 공통코드관리 공통코드 데이터를 조회한다.
	 * 
	 * @param map
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public Map<String, Object> getCode(Map<String, Object> map) throws Exception;

	/**
	 * 공통코드관리 공통코드 데이터를 조건별 조회한다.
	 * 
	 * @param map
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCodeByEtcParam(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> getEmpUserInfo(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> getAssignComboGradGcdInfo(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> getAssignComboCollCdInfo(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> getAssignComboDeptCdInfo(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> getAssignComboMajorCdInfo(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> getAssignComboDeptMajorCdInfo(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> clauseDetailList(Map<String, Object> map) throws Exception;

	public Map<String, Object> insertAgreeDltInfo(List<Map<String, Object>> list) throws Exception;

	public void getNoticePopupInfo(Map<String, Object> map,ModelAndView view) throws Exception;

	public List<Map<String, Object>> getUserInfo(Map<String, Object> map) throws Exception;

	public void infoSearchInsert(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> getSiteInfo(String systemGcd) throws Exception;
	
	public void insertSystemLog(Map<String, Object> map) throws Exception;
	
	public void setPaging(Map<String, Object> map) throws Exception;
	
	public Object bindProc(Map<String, Object> param) throws Exception;
	
	public Object bindProcMap(Map<String, Object> param) throws Exception;

    public Object bindProcList(List<Map<String, Object>> param) throws Exception;
}
