package com.onestop.ost.curc.subjsearch.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: StdtApplyCurcSeachDao.java
 * Description: 학생별적용교육과정 조회 DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class StdtApplyCurcSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.curc.subjsearch.StdtApplyCurcSearch.";

    /**
     * Database로 부터 학생별적용교육과정에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtApplyCurcSearch(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectStdtApplyCurcSearch", param);
    }
    /**
     * Database로 부터 학과를 조회한다.  - selectBox
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectOpenDept(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectOpenDept", param);
    }
}
