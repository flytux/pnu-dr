package com.onestop.ost.jolup.degthesissubmitqexam.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: DegThesisSubmitQexamApplySearchDao.java
 * Description: 학위논문제출 자격시험 신청내역 DAO Class
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
public class DegThesisSubmitQexamApplySearchDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.jolup.degthesissubmitqexam.degthesissubmitqexamapplysearch.";

  
    /**
     * Database로 부터 종합시험 신청내역을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectCompExam(Map<String, Object> param) throws Exception{
        return listPaging(SQLNAMESPACE + "selectCompExam", param);
    }
    
    /**
     * Database로 부터 외국어시험 신청내역을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectForeignExam(Map<String, Object> param) throws Exception{
        return listPaging(SQLNAMESPACE + "selectForeignExam", param);
    }
    
}
