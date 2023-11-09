package com.onestop.ost.cls.syl.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: SylSearchDao.java
 * Description: 교수계획표 조회 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 20.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class SylSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.syl.sylsearch.";

   
    /**
     * Database로 부터 교수계획표를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSylSearch(Map<String, Object> param) throws Exception {
    	return listPaging(SQLNAMESPACE + "selectSylSearch", param);
    }
    /**
     * Database로 부터 강의평가 조회 가능 기간을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectSeachPossDate(Map<String, Object> param) throws Exception {
    	return selectQueryMap(SQLNAMESPACE + "selectSeachPossDate", param);
    }
  
}
