package com.onestop.ost.cls.lecaplycheck.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.lecaplycheck.dao.AtlectSearchDao;
import com.onestop.ost.cls.lecaplycheck.service.AtlectSearchService;

/**
 * <pre>
 * Class Name: AtlectSearchServiceImpl.java
 * Description: 수강확인 ServiceImpl
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("atlectSearchService")
public class AtlectSearchServiceImpl extends CommonServiceImpl implements AtlectSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private AtlectSearchDao atlectSearchDao;
    
    /**
     * 자동신청결과확인 기간을 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchAutoApplySchdChk(Map<String, Object> param) throws Exception {
        return atlectSearchDao.searchAutoApplySchdChk(param);
    }
    
    /**
     * 학사일정 개강일자 기간을 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchClassOpenSchdChk(Map<String, Object> param) throws Exception {
        return atlectSearchDao.searchClassOpenSchdChk(param);
    }
    
    /**
     * 수강확인 그리드를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchAtlectSearchList(Map<String, Object> param) throws Exception {
        return atlectSearchDao.searchAtlectSearchList(param);
    }
    
    @Override
    public Map<String, Object> searchAtlectTotSearch(Map<String, Object> param) throws Exception {
        return atlectSearchDao.searchAtlectTotSearch(param);
    }
    
    /**
     * 폐강강좌현황 그리드를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchClosedList(Map<String, Object> param) throws Exception {
        return atlectSearchDao.searchClosedList(param);
    }
    
    /**
     * 수강취소현황 그리드를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchCancelList(Map<String, Object> param) throws Exception {
        return atlectSearchDao.searchCancelList(param);
    }
}
