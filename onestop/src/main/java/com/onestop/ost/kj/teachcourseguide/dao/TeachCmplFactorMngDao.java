package com.onestop.ost.kj.teachcourseguide.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;
/**
 * <pre>
 * Class Name: TeachCmplFactorMngDao.java
 * Description: 교직이수요건관리 Dao Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 18.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class TeachCmplFactorMngDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "ost.kj.teachcourseguide.TeachCmplFactorMng.";

    /**
     * Database로 부터 대상자 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListTeachCmplFactorMng(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListTeachCmplFactorMng", param);
    }

    /**
     * Database로 부터 신청및이수내역 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListTeachCmplFactorMng2(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListTeachCmplFactorMng2", param);
    }

    /**
     * Database로 부터 개설내역및신청 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListTeachCmplFactorMng3(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListTeachCmplFactorMng3", param);
    }

    /**
     * 신청 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> insertTeachCmplFactorMng(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "insertTeachCmplFactorMng", param);
    }
    
    /**
     * 신청취소 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> deleteTeachCmplFactorMng(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "deleteTeachCmplFactorMng", param);
    }
    
    /**
     * 항목별점수 조회 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectListTeachCmplFactorMngPop(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectListTeachCmplFactorMngPop", param);
    }
}