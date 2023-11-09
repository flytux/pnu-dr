package com.onestop.ost.jolup.degthesissubmitqexam.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.jolup.degthesissubmitqexam.dao.DegThesisSubmitQexamApplySearchDao;
import com.onestop.ost.jolup.degthesissubmitqexam.service.DegThesisSubmitQexamApplySearchService;




/**
 * <pre>
 * Class Name: DegThesisSubmitQexamApplySearchServiceImpl.java
 * Description: 학위논문제출 자격시험 신청내역 ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("degThesisSubmitQexamApplySearchService")
public class DegThesisSubmitQexamApplySearchServiceImpl extends CommonServiceImpl implements DegThesisSubmitQexamApplySearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private DegThesisSubmitQexamApplySearchDao degThesisSubmitQexamApplySearchDao;
    
  
    
    /**
     * 종합시험 신청내역을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectCompExam(Map<String, Object> param) throws Exception {
        return degThesisSubmitQexamApplySearchDao.selectCompExam(param);
    }
    
    /**
     * 외국어시험 신청내역을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectForeignExam(Map<String, Object> param) throws Exception {
        return degThesisSubmitQexamApplySearchDao.selectForeignExam(param);
    }
      
}
