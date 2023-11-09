package com.onestop.ost.cls.basicsdignosistest.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: DiagnosisTestMathDao.java
 * Description: 수학 기초학력진단평가DAO Class
 * </pre>
 * 
 * @author 구태균
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class DiagnosisTestMathDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.cls.basicsdiagnosistest.DiagnosisTestMath.";
   
    /**
     * 수학 기초학력진단평가 성적를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectQuery(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectQuery", param);
    }
   
}
