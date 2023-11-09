package com.onestop.ost.cls.timetablesearch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.timetablesearch.dao.ProfTimetableSearchDao;
import com.onestop.ost.cls.timetablesearch.service.ProfTimetableSearchService;

/**
 * <pre>
 * Class Name: ProfTimetableSearchServiceImpl.java
 * Description: 교수별 시간표 조회 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("profTimetableSearchService")
public class ProfTimetableSearchServiceImpl extends CommonServiceImpl implements ProfTimetableSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ProfTimetableSearchDao profTimetableSearchDao;

    /**
     * 교수별 시간표 조회 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectProfTimetable(Map<String, Object> param) throws Exception {
    	return profTimetableSearchDao.selectProfTimetable(param);
    }

  
    
}
