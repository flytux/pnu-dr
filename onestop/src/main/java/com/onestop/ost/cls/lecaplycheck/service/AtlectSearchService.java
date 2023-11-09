package com.onestop.ost.cls.lecaplycheck.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: AtlectSearchService.java
 * Description: 수강확인 Service Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface AtlectSearchService {
	
	 /**
     * 자동신청결과확인 기간을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchAutoApplySchdChk(Map<String, Object> param)throws Exception;
    
    /**
     * 학사일정 개강일자 기간을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchClassOpenSchdChk(Map<String, Object> param)throws Exception;
    
    /**
     * 수강확인 그리드를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchAtlectSearchList(Map<String, Object> param)throws Exception;
    
    public Map<String, Object> searchAtlectTotSearch(Map<String, Object> param)throws Exception;
    
    /**
     * 폐강강좌현황 그리드를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchClosedList(Map<String, Object> param)throws Exception;
    
    /**
     * 수강취소현황 그리드를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelList(Map<String, Object> param)throws Exception;
}
