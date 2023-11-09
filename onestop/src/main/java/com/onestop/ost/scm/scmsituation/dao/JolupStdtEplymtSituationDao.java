package com.onestop.ost.scm.scmsituation.dao;
	
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: JolupStdtEplymtSituationDao.java
 * Description: 졸업생취업현황 Dao Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 02. 04.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class JolupStdtEplymtSituationDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "ost.scm.scmsituation.JolupStdtEplymtSituation.";

    /**
     * Database로 부터 졸업년도를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> getJolupYear(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "getJolupYear", param);
    }
    
    /**
     * Database로 부터 졸업생 취업현황를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJolupStdtEplymtSituation(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListJolupStdtEplymtSituation", param);
    }
    
    /**
     * Database로 부터 졸업생 취업현황상세 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectEmploymentStatus(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectEmploymentStatus", param);
    }

    /**
     * Database로 부터 졸업생 진학현황상세 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectFurtherStatus(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectFurtherStatus", param);
    }

    /**
     * Database로 부터 졸업생 구분별 스펙 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSpec(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectSpec", param);
    }
    
}
