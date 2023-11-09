package com.onestop.ost.cls.profintro.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.profintro.dao.ProfIntroDao;
import com.onestop.ost.cls.profintro.service.ProfIntroService;
import com.onestop.ost.cls.syl.dao.SylSearchDao;
import com.onestop.ost.cls.syl.service.SylSearchService;
import com.onestop.ost.sj.kp.dao.LecevalResultSearchDao;
import com.onestop.ost.sj.kp.dao.MiddletermLecevalDao;
import com.onestop.ost.sj.kp.service.LecevalResultSearchService;
import com.onestop.ost.sj.kp.service.MiddletermLecevalService;

/**
 * <pre>
 * Class Name: ProfIntroServiceImpl.java
 * Description: 교수소개 조회 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 24.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("profIntroService")
public class ProfIntroServiceImpl extends CommonServiceImpl implements ProfIntroService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ProfIntroDao profIntroDao;

    /**
     * 교수소개 대학원목록 조회 - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectProfIntroGrad(Map<String, Object> param) throws Exception {
        return profIntroDao.selectProfIntroGrad(param);
    }
    /**
     * 교수소개 단과대학목록 조회 - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectProfIntroColl(Map<String, Object> param) throws Exception {
    	return profIntroDao.selectProfIntroColl(param);
    }
    /**
     * 교수소개 학과목록 조회 - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectProfIntroDept(Map<String, Object> param) throws Exception {
    	return profIntroDao.selectProfIntroDept(param);
    }
    /**
     * 교수소개 조회 - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectProfIntro(Map<String, Object> param) throws Exception {
    	return profIntroDao.selectProfIntro(param);
    }
    /**
     * 교수소개 상세조회 - 팝업
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectProfDetailIntro(Map<String, Object> param) throws Exception {
    	return profIntroDao.selectProfDetailIntro(param);
    }
  
  
    
}
