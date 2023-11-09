package com.onestop.ost.cls.timetablesearch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.timetablesearch.dao.ExamTimetableSearchDao;
import com.onestop.ost.cls.timetablesearch.dao.LectroomTimetableSearchDao;
import com.onestop.ost.cls.timetablesearch.service.ExamTimetableSearchService;

/**
 * <pre>
 * Class Name: ExamTimetableSearchServiceImpl.java
 * Description: 시험 시간표 조회 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("examTimetableSearchService")
public class ExamTimetableSearchServiceImpl extends CommonServiceImpl implements ExamTimetableSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ExamTimetableSearchDao examTimetableSearchDao;
    /**
     * 조회가능여부 조회 
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectexamTimetableValid(Map<String, Object> param) throws Exception {
    	return examTimetableSearchDao.selectexamTimetableValid(param);
    }

    /**
     * 시험시간표 조회 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectexamTimetable(Map<String, Object> param) throws Exception {
    	return examTimetableSearchDao.selectexamTimetable(param);
    }
  
    
}
