package com.onestop.ost.jolup.hakbujolupguide.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: JolupFactorCriteriaSearchDao.java
 * Description: 졸업요건기준 및 충족여부 DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 04.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class JolupFactorCriteriaSearchDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.jolup.hakbujolupguide.jolupfactorcriteriasearch.";

    /**
     * Database로 부터 졸업요건기준 및 충족여부를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectJolupFactor(Map<String, Object> map) throws Exception{
        return listPaging(SQLNAMESPACE + "selectJolupFactor", map);
    }
    
    /**
     * Database로 부터 졸업요건기준 및 충족여부 개인정보를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public  Map<String, Object> selectJolupStdtInfo(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectJolupStdtInfo", param);
    }
  
}
