package com.onestop.ost.sj.kp.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: LecevalResultSearchDao.java
 * Description: 강의평가결과공개 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 01. 17.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class LecevalResultSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.sj.kp.lecevalresultsearch.";

    /**
     * Database로 부터 해당학년도/학기의 개설강좌 중 강의평가 (대상고과목)에 해당하는 학과를 조회한다.  - selectBox
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLecevalOpenDept(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectLecevalOpenDept", param);
    }
    /**
     * Database로 부터 해당학년도/학기의 강의평가 교과목을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLecevalResultSubj(Map<String, Object> param) throws Exception {
    	return listPaging(SQLNAMESPACE + "selectLecevalResultSubj", param);
    }
    /**
     * Database로 부터 해당학년도/학기의 강의평가 교과목상세를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLecevalResultDetail(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectLecevalResultDetail", param);
    }
}
