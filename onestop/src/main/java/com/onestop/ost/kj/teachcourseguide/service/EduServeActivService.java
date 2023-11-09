package com.onestop.ost.kj.teachcourseguide.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: EduServeActivService.java
 * Description: 교육봉사활동 Service
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface EduServeActivService {
	
	/**
	 * 교육봉사활동 화면 대상자 조회를 한다.
	 * @param param
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListEduServeActiv(Map<String, Object> param)throws Exception;

	/**
	 * 교육봉사활동 화면 계획서입력내역 조회를 한다.
	 * @param param
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListEduServePlan(Map<String, Object> param)throws Exception;
	
	/**
	 * 교육봉사활동 화면 학점신청 조회를 한다.
	 * @param param
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListEduServePlanCrdt(Map<String, Object> param)throws Exception;
	
	/**
	 * 교육봉사활동 화면 교육봉사활동계획신청구분코드 조회를 한다.
	 * @param param
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListEsaItem(Map<String, Object> param)throws Exception;
	
	/**
	 * 교육봉사활동 화면 세부내용 조회를 한다.
	 * @param param
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListPlanDetailSearch(Map<String, Object> param)throws Exception;

    /**
	 * 교육봉사활동 화면 계획서 저장 한다.
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> executePlan(Map<String, Object> param) throws Exception;

    /**
	 * 교육봉사활동 화면 계획서 삭제 한다.
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> deletePlan(Map<String, Object> param) throws Exception;
    
	/**
	 * 교육봉사활동 화면 일지 조회를 한다.
	 * @param param
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectListPlanDaylog(Map<String, Object> param)throws Exception;

    /**
	 * 교육봉사활동 화면 일지 저장 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executePlanDaylog(List<Map<String, Object>> list)throws Exception;
    
    
    /**
	 * 교육봉사활동 화면 일지 삭제 한다.
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> deletePlanDaylog(Map<String, Object> param) throws Exception;

    /**
	 * 교육봉사활동 화면 점신청/취소 저장 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeEduServeActiv(List<Map<String, Object>> list)throws Exception;
}