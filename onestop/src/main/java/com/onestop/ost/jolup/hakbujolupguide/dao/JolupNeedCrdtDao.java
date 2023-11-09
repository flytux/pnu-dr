package com.onestop.ost.jolup.hakbujolupguide.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: JolupNeedCrdtDao.java
 * Description: 졸업소요학점DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class JolupNeedCrdtDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.jolup.hakbujolupguide.jolupneedcrdt.";

    /**
     * Database로 부터 해당학년도 해당하는 학과를 조회한다.  - selectBox
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectDept(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectDept", param);
    }
    /**
     * 졸업소요학점을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSOYO(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectSOYO", param);
    }
    
    /**
     * 교양선택 영역별 소요학점을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectCult(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectCult", param);
    }
}
