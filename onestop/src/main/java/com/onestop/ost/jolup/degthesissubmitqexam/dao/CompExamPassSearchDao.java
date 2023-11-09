package com.onestop.ost.jolup.degthesissubmitqexam.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: CompExamPassSearchDao.java
 * Description: 종합시험 합격과목조회 DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 11.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class CompExamPassSearchDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.jolup.degthesissubmitqexam.compexampasssearch.";

  
    /**
     * Database로 부터 종합시험 합격과목을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectExamPass(Map<String, Object> param) throws Exception{
        return listPaging(SQLNAMESPACE + "selectExamPass", param);
    }
}
