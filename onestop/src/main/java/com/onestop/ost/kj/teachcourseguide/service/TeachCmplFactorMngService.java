package com.onestop.ost.kj.teachcourseguide.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: TeachCmplFactorMngService.java
 * Description: 교직이수요건관리 Service Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 18.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface TeachCmplFactorMngService {
	
	/**
	 * 교직이수요건관리 화면 대상자 조회를 한다.
	 * @param param
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListTeachCmplFactorMng(Map<String, Object> param)throws Exception;
	
	/**
	 * 교직이수요건관리 화면 신청및이수내역 조회를 한다.
	 * @param param
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListTeachCmplFactorMng2(Map<String, Object> param)throws Exception;
	
	/**
	 * 교직이수요건관리 화면 개설내역및신청 조회를 한다.
	 * @param param
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListTeachCmplFactorMng3(Map<String, Object> param)throws Exception;
	

    /**
	 * 교직이수요건관리 화면 신청 한다.
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> insertTeachCmplFactorMng(Map<String, Object> param) throws Exception;

    /**
	 * 교직이수요건관리 화면 신청취소 한다.
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> deleteTeachCmplFactorMng(Map<String, Object> param) throws Exception;

    /**
	 * 교직이수요건관리 화면 항목별 점수 조회 한다.
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectListTeachCmplFactorMngPop(Map<String, Object> param) throws Exception;
    
}