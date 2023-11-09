package com.onestop.ost.cls.timetablesearch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.timetablesearch.dao.LectroomTimetableSearchDao;
import com.onestop.ost.cls.timetablesearch.dao.ProfTimetableSearchDao;
import com.onestop.ost.cls.timetablesearch.service.LectroomTimetableSearchService;
import com.onestop.ost.cls.timetablesearch.service.ProfTimetableSearchService;

/**
 * <pre>
 * Class Name: LectroomTimetableSearchServiceImpl.java
 * Description: 강의실별 시간표 조회 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 04.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("lectroomTimetableSearchService")
public class LectroomTimetableSearchServiceImpl extends CommonServiceImpl implements LectroomTimetableSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private LectroomTimetableSearchDao lectroomTimetableSearchDao;
    /**
     * 건물 조회 
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectbldCd(Map<String, Object> param) throws Exception {
    	return lectroomTimetableSearchDao.selectbldCd(param);
    }
    /**
     * 강의실 조회 
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectFacilityNo(Map<String, Object> param) throws Exception {
    	return lectroomTimetableSearchDao.selectFacilityNo(param);
    }
    /**
     * 강의실별 시간표 조회 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectLectroomTimetable(Map<String, Object> param) throws Exception {
    	return lectroomTimetableSearchDao.selectLectroomTimetable(param);
    }

  
    
}
