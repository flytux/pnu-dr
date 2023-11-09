package com.onestop.ost.cls.timetablesearch.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: ExamTimetableSearchDao.java
 * Description: 시험 시간표 조회 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ExamTimetableSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.timetablesearch.examtimetablesearch.";


    /**
     * Database로 부터 조회가능여부를 조회 -
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectexamTimetableValid(Map<String, Object> param) throws Exception {
    	return selectQueryMap(SQLNAMESPACE + "selectexamTimetableValid", param);
    }
    /**
     * Database로 부터 시험시간표를 조회 -
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectexamTimetable(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectexamTimetable", param);
    }

  

}
