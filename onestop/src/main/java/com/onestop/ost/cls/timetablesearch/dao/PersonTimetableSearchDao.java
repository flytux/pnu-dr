package com.onestop.ost.cls.timetablesearch.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: PersonTimetableSearchDao.java
 * Description: 개인 시간표 조회 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class PersonTimetableSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.timetablesearch.persontimetablesearch.";


    /**
     * Database로 부터 조회가능여부를 조회 -
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectPersonTimetableValid(Map<String, Object> param) throws Exception {
    	return selectQueryMap(SQLNAMESPACE + "selectPersonTimetableValid", param);
    }
    /**
     * Database로 부터 개인시간표를 조회 -
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectPersonTimetable(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectPersonTimetable", param);
    }

  

}
