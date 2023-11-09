package com.onestop.ost.cls.timetablesearch.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: ProfTimetableSearchDao.java
 * Description: 교수별 시간표 조회 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ProfTimetableSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.timetablesearch.proftimetablesearch.";


    /**
     * Database로 부터 교수별 시간표를 조회 -
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfTimetable(Map<String, Object> param) throws Exception {
    	return listPaging(SQLNAMESPACE + "selectProfTimetable", param);
    }
  

}
