package com.onestop.ost.hj.stdtinfo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.hj.stdtinfo.dao.HakjukbuSearchDao;
import com.onestop.ost.hj.stdtinfo.service.HakjukbuSearchService;

/**
 * <pre>
 * Class Name: HakjukbuSearchServiceImpl.java
 * Description: 학적부 ServiceImpl
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 18.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("hakjukbuSearchService")
public class HakjukbuSearchServiceImpl extends CommonServiceImpl implements HakjukbuSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private HakjukbuSearchDao hakjukbuSearchDao;    

    /**
     * 학생정보를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectStdtInfo(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectStdtInfo(param);
    }
    
    /**
     * 입학목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListEnt(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListEnt(param);
    }
    
    /**
     * 출신대학교 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListOunv(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListOunv(param);
    }
    
    /**
     * 비자정보를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListVisa(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListVisa(param);
    }
    
    /**
     * 학적변동 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListSrchg(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListSrchg(param);
    }
    
    /**
     * 다중전공신청 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListMultiMajor(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListMultiMajor(param);
    }
    
    /**
     * 연계과정신청 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListLinkProc(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListLinkProc(param);
    }
    
    /**
     * 학사/무논문학위취득유예신청 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListAcqDelay(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListAcqDelay(param);
    }
    
    /**
     * 편입/교류/복수.공동학위 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListCourseEtc(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListCourseEtc(param);
    }
    
    /**
     * 장학금 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListJangHak(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListJangHak(param);
    }
       
    /**
     * 학기별성적 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListTermSj(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListTermSj(param);
    }
    
    /**
     * 학기별성적 합계를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectListTotTermSj(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListTotTermSj(param);
    }
    
    /**
     * 교과목성적 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListSubjSj(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListSubjSj(param);
    }
    
    /**
     * 졸업 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListDeg(Map<String, Object> param) throws Exception {
        return hakjukbuSearchDao.selectListDeg(param);
    }

}
