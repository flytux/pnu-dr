package com.onestop.ost.cls.basicsdignosistest.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.basicsdignosistest.dao.DiagnosisTestMathDao;
import com.onestop.ost.cls.basicsdignosistest.service.DiagnosisTestMathService;


/**
 * <pre>
 * Class Name: DiagnosisTestMathServiceImpl.java
 * Description: 수학 기초학력진단평가 ServiceImpl
 * </pre>
 * 
 * @author 구태균
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service
public class DiagnosisTestMathServiceImpl extends CommonServiceImpl implements DiagnosisTestMathService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private DiagnosisTestMathDao diagnosisTestMathDao;
    
    /**
     * 수학 기초학력진단평가 성적를 조회한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectQuery(Map<String, Object> param) throws Exception {
        return diagnosisTestMathDao.selectQuery(param);
    }
}
