package com.onestop.ost.jolup.degthesissubmitqexam.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: ForeignLanguageExamPassSearchDao.java
 * Description: 외국어시험 합격조회 DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ForeignLanguageExamPassSearchDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.jolup.degthesissubmitqexam.foreignlanguageexampasssearch.";

  
    /**
     * Database로 부터 외국어시험 합격여부를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectExamPass(Map<String, Object> param) throws Exception{
        return listPaging(SQLNAMESPACE + "selectExamPass", param);
    }
}
