package com.onestop.ost.cls.timetablesearch.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: LectroomTimetableSearchDao.java
 * Description: 강의실별 시간표 조회 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 04.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class LectroomTimetableSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.timetablesearch.lectroomtimetablesearch.";


    /**
     * Database로 부터 건물을 조회 -
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectbldCd(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectbldCd", param);
    }
    /**
     * Database로 부터 강의실을 조회 -
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectFacilityNo(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectFacilityNo", param);
    }
    /**
     * Database로 부터 강의실별 시간표를 조회 -
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLectroomTimetable(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectLectroomTimetable", param);
    }
  

}
