package com.onestop.ost.sj.kp.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: EndtermLecevalDao.java
 * Description: 기말강의평가 DAO Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 09.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class EndtermLecevalDao extends CommonComnDao {
	
    private static final String SQLNAMESPACE = "ost.sj.kp.endtermleceval.";

	/**
     * Database로 부터 기말강의평가 학사일정을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchEndSchdChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchEndSchdChk", param);
    }
    
    /**
     * Database로 부터 기말강의평가에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectEndtermLeceval(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectEndtermLeceval", param);
    }
    
    /**
     * Database로 부터 기말강의평가 강의평가 전체문항을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectEndtermLecevalQuestionList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectEndtermLecevalQuestionList", param);
    }
    
    /**
     * 기말강의평가 강의평가작성 내용을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public int saveEndtermLecevalQuestion(Map<String, Object> param) throws Exception {
        return insert(SQLNAMESPACE + "saveEndtermLecevalQuestion", param);
    }
    
    /**
     * 기말강의평가 교육인증 강의평가작성 내용을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public int saveEduCertLecevalQuestion(Map<String, Object> param) throws Exception {
        return insert(SQLNAMESPACE + "saveEduCertLecevalQuestion", param);
    }
    
    /**
     * Database로 부터 기말강의평가 교육인증 강의평가 문항을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectEduCertLecevalQuestionList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectEduCertLecevalQuestionList", param);
    }
}
