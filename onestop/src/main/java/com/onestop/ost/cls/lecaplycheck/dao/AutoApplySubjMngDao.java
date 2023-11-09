package com.onestop.ost.cls.lecaplycheck.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: AutoApplySubjMngDao.java
 * Description: 자동신청교과목 확인 및 삭제 DAO Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 17.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class AutoApplySubjMngDao extends CommonComnDao {
	
    private static final String SQLNAMESPACE = "ost.cls.lecaplycheck.autoapplysubjmng.";
    
	/**
     * Database로 부터 수강신청 학사일정을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchClsSchdChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchClsSchdChk", param);
    }
    
    /**
     * Database로 부터 자동신청결과확인 학사일정을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchAutoClsSchdChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchAutoClsSchdChk", param);
    }
    
    /**
     * Database로 부터 자동신청교과목 내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchAutoApplySubj(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchAutoApplySubj", param);
    }
    
    /**
     * Database로 부터 자동신청교과목 삭제 내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchAutoApplyCancel(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchAutoApplyCancel", param);
    }
    
    /**
     * Database로 부터 자동신청교과목을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public int saveAutoApplyCancel(Map<String, Object> param) throws Exception {
        return insert(SQLNAMESPACE + "saveAutoApplyCancel", param);
    }
    
    /**
     * Database로 부터 자동신청교과목 재이수교과목 상세정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchRecmplSubj(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchRecmplSubj", param);
    }

}
