package com.onestop.ost.cls.syl.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.syl.dao.SylSearchDao;
import com.onestop.ost.cls.syl.service.SylSearchService;
import com.onestop.ost.sj.kp.dao.LecevalResultSearchDao;
import com.onestop.ost.sj.kp.dao.MiddletermLecevalDao;
import com.onestop.ost.sj.kp.service.LecevalResultSearchService;
import com.onestop.ost.sj.kp.service.MiddletermLecevalService;

/**
 * <pre>
 * Class Name: SylSearchServiceImpl.java
 * Description: 교수계획표 조회 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2021. 12. 09.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("sylSearchService")
public class SylSearchServiceImpl extends CommonServiceImpl implements SylSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private SylSearchDao sylSearchDao;

    /**
     * 교수계획표를 조회한다
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectSylSearch(Map<String, Object> param) throws Exception {
        return sylSearchDao.selectSylSearch(param);
    }
  
    /**
     * 강의평가 조회가능 기간을 조회한다.  - selectBox
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectSeachPossDate(Map<String, Object> param) throws Exception {
    	return sylSearchDao.selectSeachPossDate(param);
    }
    
}
