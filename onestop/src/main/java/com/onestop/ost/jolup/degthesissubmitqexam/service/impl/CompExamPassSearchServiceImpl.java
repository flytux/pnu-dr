package com.onestop.ost.jolup.degthesissubmitqexam.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.jolup.degthesissubmitqexam.dao.CompExamPassSearchDao;
import com.onestop.ost.jolup.degthesissubmitqexam.service.CompExamPassSearchService;

/**
 * <pre>
 * Class Name: CompExamPassSearchServiceImpl.java
 * Description: 종합시험 합격과목조회ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 11.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("compExamPassSearchService")
public class CompExamPassSearchServiceImpl extends CommonServiceImpl implements CompExamPassSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private CompExamPassSearchDao compExamPassSearchDao;
    
  
    
    /**
     * 종합시험 합격과목울 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectExamPass(Map<String, Object> param) throws Exception {
        return compExamPassSearchDao.selectExamPass(param);
    }
   
}
