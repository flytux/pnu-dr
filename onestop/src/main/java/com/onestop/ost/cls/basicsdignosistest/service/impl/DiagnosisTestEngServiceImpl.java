package com.onestop.ost.cls.basicsdignosistest.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.basicsdignosistest.dao.DiagnosisTestEngDao;
import com.onestop.ost.cls.basicsdignosistest.service.DiagnosisTestEngService;


/**
 * <pre>
 * Class Name: DiagnosisTestEngServiceImpl.java
 * Description: 영어 기초학력진단평가 ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("diagnosisTestEngService")
public class DiagnosisTestEngServiceImpl extends CommonServiceImpl implements DiagnosisTestEngService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private DiagnosisTestEngDao diagnosisTestEngDao;
    
    /**
     * 영어 기초학력진단평가 응시여부를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchTestFg(Map<String, Object> param) throws Exception {
        return diagnosisTestEngDao.searchTestFg(param);
    }
    
    /**
     * 영어 기초학력진단평가 결과에 따른 수강신청 과목을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchSubjList(Map<String, Object> param) throws Exception {
        return diagnosisTestEngDao.searchSubjList(param);
    }

}
