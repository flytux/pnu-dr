package com.onestop.ost.cls.timetablesearch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.timetablesearch.dao.ExamTimetableSearchDao;
import com.onestop.ost.cls.timetablesearch.dao.LectroomTimetableSearchDao;
import com.onestop.ost.cls.timetablesearch.dao.PersonTimetableSearchDao;
import com.onestop.ost.cls.timetablesearch.service.ExamTimetableSearchService;
import com.onestop.ost.cls.timetablesearch.service.PersonTimetableSearchService;

/**
 * <pre>
 * Class Name: PersonTimetableSearchServiceImpl.java
 * Description: 개인 시간표 조회 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("personTimetableSearchService")
public class PersonTimetableSearchServiceImpl extends CommonServiceImpl implements PersonTimetableSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private PersonTimetableSearchDao personTimetableSearchDao;
    /**
     * 조회가능여부 조회 
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPersonTimetableValid(Map<String, Object> param) throws Exception {
    	return personTimetableSearchDao.selectPersonTimetableValid(param);
    }

    /**
     * 개인시간표 조회 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectPersonTimetable(Map<String, Object> param) throws Exception {
    	return personTimetableSearchDao.selectPersonTimetable(param);
    }
  
    
}
