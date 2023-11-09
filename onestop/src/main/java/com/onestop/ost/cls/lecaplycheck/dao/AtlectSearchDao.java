package com.onestop.ost.cls.lecaplycheck.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: AtlectSearchDao.java
 * Description: 수강확인 DAO Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class AtlectSearchDao extends CommonComnDao {
	
    private static final String SQLNAMESPACE = "ost.cls.lecaplycheck.atlectsearch.";
    
    /**
     * Database로 부터 자동신청결과확인 기간을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchAutoApplySchdChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchAutoApplySchdChk", param);
    }
    
    /**
     * Database로 부터 학사일정 개강일자 기간을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchClassOpenSchdChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchClassOpenSchdChk", param);
    }
    
    /**
     * Database로 부터 수강확인 그리드를 조회한다. 
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchAtlectSearchList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchAtlectSearchList", param);
    }
    
    public Map<String, Object> searchAtlectTotSearch(Map<String, Object> param) throws Exception {
        return selectOne(SQLNAMESPACE + "searchAtlectTotSearch", param);
    }
    
    /**
     * Database로 부터 폐강강좌현황 그리드를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchClosedList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchClosedList", param);
    }
    
    /**
     * Database로 부터 수강취소현황 그리드를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchCancelList", param);
    }
}
