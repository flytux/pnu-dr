package com.onestop.ost.sj.kp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.sj.kp.dao.LecevalResultSearchDao;
import com.onestop.ost.sj.kp.dao.MiddletermLecevalDao;
import com.onestop.ost.sj.kp.service.LecevalResultSearchService;
import com.onestop.ost.sj.kp.service.MiddletermLecevalService;

/**
 * <pre>
 * Class Name: LecevalResultSearchServiceImpl.java
 * Description: 강의평가결과공개 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2021. 12. 09.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("lecevalResultSearchService")
public class LecevalResultSearchServiceImpl extends CommonServiceImpl implements LecevalResultSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private LecevalResultSearchDao lecevalResultSearchDao;

    /**
     * 해당학년도/학기의 개설강좌 중 강의평가 (대상고과목)에 해당하는 학과를 조회한다.  - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectLecevalOpenDept(Map<String, Object> param) throws Exception {
        return lecevalResultSearchDao.selectLecevalOpenDept(param);
    }
    /**
     * 해당학년도/학기의 강의평가 교과목을 조회한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectLecevalResultSubj(Map<String, Object> param) throws Exception {
    	return lecevalResultSearchDao.selectLecevalResultSubj(param);
    }
    /**
     * 해당학년도/학기의 강의평가 교과목상세를 조회한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectLecevalResultDetail(Map<String, Object> param) throws Exception {
    	return lecevalResultSearchDao.selectLecevalResultDetail(param);
    }
}
