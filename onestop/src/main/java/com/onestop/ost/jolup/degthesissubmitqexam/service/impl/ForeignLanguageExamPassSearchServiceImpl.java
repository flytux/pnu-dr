package com.onestop.ost.jolup.degthesissubmitqexam.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.jolup.degthesissubmitqexam.dao.ForeignLanguageExamPassSearchDao;
import com.onestop.ost.jolup.degthesissubmitqexam.service.ForeignLanguageExamPassSearchService;

/**
 * <pre>
 * Class Name: ForeignLanguageExamPassSearchServiceImpl.java
 * Description: 외국어시험 합격조회ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("foreignLanguageExamPassSearchService")
public class ForeignLanguageExamPassSearchServiceImpl extends CommonServiceImpl implements ForeignLanguageExamPassSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ForeignLanguageExamPassSearchDao foreignLanguageExamPassSearchDao;
    
  
    
    /**
     * 외국어시험 합격여부를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectExamPass(Map<String, Object> param) throws Exception {
        return foreignLanguageExamPassSearchDao.selectExamPass(param);
    }
   
}
