package com.onestop.ost.scm.scmsituation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.scm.scmsituation.dao.JolupStdtEplymtSituationDao;
import com.onestop.ost.scm.scmsituation.service.JolupStdtEplymtSituationService;

/**
 * <pre>
 * Class Name: JolupStdtEplymtSituationServiceImpl.java
 * Description: 졸업생취업현황 ServiceImpl
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 02. 04.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("jolupStdtEplymtSituationServiceImpl")
public class JolupStdtEplymtSituationServiceImpl extends CommonServiceImpl implements JolupStdtEplymtSituationService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private JolupStdtEplymtSituationDao jolupStdtEplymtSituationDao;

    /**
     * 졸업생취업현황 화면 졸업년도 조회를 한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> getJolupYear(Map<String, Object> param) throws Exception {
        return jolupStdtEplymtSituationDao.getJolupYear(param);
    }
    
    /**
     * 졸업생취업현황 화면 졸업생 취업현황을 조회를 한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListJolupStdtEplymtSituation(Map<String, Object> param) throws Exception {
        return jolupStdtEplymtSituationDao.selectListJolupStdtEplymtSituation(param);
    }

    /**
     * 졸업생취업현황 화면 졸업생 취업현황상세 조회를 한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectEmploymentStatus(Map<String, Object> param) throws Exception {
        return jolupStdtEplymtSituationDao.selectEmploymentStatus(param);
    }

    /**
     * 졸업생취업현황 화면 졸업생 진학현황상세 조회를 한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectFurtherStatus(Map<String, Object> param) throws Exception {
        return jolupStdtEplymtSituationDao.selectFurtherStatus(param);
    }

    /**
     * 졸업생취업현황 화면 졸업생 구분별 스펙 조회를 한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectSpec(Map<String, Object> param) throws Exception {
        return jolupStdtEplymtSituationDao.selectSpec(param);
    }
}
