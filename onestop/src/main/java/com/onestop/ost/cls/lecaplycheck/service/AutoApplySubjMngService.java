package com.onestop.ost.cls.lecaplycheck.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: AutoApplySubjMngService.java
 * Description: 자동신청교과목 확인 및 삭제 Service Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 17.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface AutoApplySubjMngService {
	
	 /**
	     * 수강신청 학사일정을 조회한다.
	     * @param param
	     * @return List<Map<String, Object>>
	     * @throws Exception
	     */
    public Map<String, Object> searchClsSchdChk(Map<String, Object> param)throws Exception;
	
	/**
     * 자동신청결과확인 학사일정을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchAutoClsSchdChk(Map<String, Object> param)throws Exception;
    
    /**
     * 자동신청교과목 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchAutoApplySubj(Map<String, Object> param)throws Exception;
    
    /**
     * 자동신청교과목 삭제 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchAutoApplyCancel(Map<String, Object> param)throws Exception;
    
    /**
     * 자동신청교과목을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveAutoApplyCancel(Map<String, Object> params)throws Exception;
    
    /**
     * 자동신청교과목 재이수교과목 상세정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchRecmplSubj(Map<String, Object> param)throws Exception;
}
