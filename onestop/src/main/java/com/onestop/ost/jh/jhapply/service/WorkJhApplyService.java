package com.onestop.ost.jh.jhapply.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: WorkJhApplyService.java
 * Description: 장학생(근로)신청 Service Class 
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 3. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface WorkJhApplyService {
	
	/**
	 * 장학생(근로)신청 화면 신청기간  조회를 한다.
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListWorkJhApplySchd(Map<String, Object> param)throws Exception;
	
	/**
	 * 장학생(근로)신청 화면 신청리스트 조회를 한다.
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListWorkJhApply(Map<String, Object> param)throws Exception;
	
	/**
	 * 장학생(근로)신청 화면 학생정보 조회를 한다.
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListStdtInfo(Map<String, Object> param)throws Exception;

	/**
	 * 장학생(근로)신청 화면 계좌정보 조회를 한다.
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListBank(Map<String, Object> param)throws Exception;

	/**
	 * 장학생(근로)신청 화면 계좌정보 조회를 한다.
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListUpperDept(Map<String, Object> param)throws Exception;

	/**
	 * 장학생(근로)신청 화면 계좌정보 조회를 한다.
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListDept(Map<String, Object> param)throws Exception;
	
	/**
	 * 장학생(근로)신청 화면 제출서류 조회를 한다.
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListDocs(Map<String, Object> param)throws Exception;
	
	/**
	 * 장학생(근로)신청 화면 신청내역 조회를 한다.
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListWorkJhApplySearch(Map<String, Object> param)throws Exception;
    
    /**
     * 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeWorkJhApply(Map<String, Object> param) throws Exception;

    /**
     * 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> deleteWorkJhApply(Map<String, Object> param) throws Exception;

	/**
	 * 장학생(근로)신청 화면 형제/자매 조회를 한다.
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListBrothers(Map<String, Object> param)throws Exception;
}