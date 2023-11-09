package com.onestop.ost.jolup.degthesissubmitqexam.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: DegThesisSubmitQexamApplyDao.java
 * Description: 학위논문자격시험 웹신청 DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class DegThesisSubmitQexamApplyDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.jolup.degthesissubmitqexam.degthesissubmitqexamapply.";

    /**
     * Database로 부터 학적정보를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtInfo(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "selectStdtInfo", map);
    }
    
    /**
     * Database로 부터 응시대상과목을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSubject(Map<String, Object> param) throws Exception{
        return listPaging(SQLNAMESPACE + "selectSubject", param);
    }
    
    /**
     * Database로 부터 응시신청과목을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectApplySubject(Map<String, Object> param) throws Exception{
        return listPaging(SQLNAMESPACE + "selectApplySubject", param);
    }
    
    /**
     * Database로 부터 기합격과목 외국어를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectPassSubject(Map<String, Object> param) throws Exception{
        return listPaging(SQLNAMESPACE + "selectPassSubject", param);
    }
    
    /**
     * Database로 부터 기이수과목을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> checkPassSubject(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "checkPassSubject", param);
    }
    
    /**
     * Database로 부터 시험신청.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> excuteSubject(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "excuteSubject", param);
    }
    
}
