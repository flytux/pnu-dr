package com.onestop.ost.curc.subjsearch.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: ExdeptMajorSubjSeachDao.java
 * Description: 타과전공인정과목 조회 DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 28.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ExdeptMajorSubjSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.curc.subjsearch.ExdeptMajorSubjSearch.";

    /**
     * Database로 부터 타과전공인정과목에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectExdeptMajorSubjSearch(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectExdeptMajorSubjSearch", param);
    }
  
    /**
     * Database로 부터 타과전공인정 대학원 구분을 조회한다.  - selectBox
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectOpenGrad(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectOpenGrad", param);
    }
    
    /**
     * Database로 부터 타과전공인정 단과대학을 조회한다.  - selectBox
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectOpenColl(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectOpenColl", param);
    }
    
    /**
     * Database로 부터 타과전공인정 학과를 조회한다.  - selectBox
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectOpenDept(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectOpenDept", param);
    }
}
