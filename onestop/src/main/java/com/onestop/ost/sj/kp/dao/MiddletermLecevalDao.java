package com.onestop.ost.sj.kp.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: MiddletermLecevalDao.java
 * Description: 중간평가관리 DAO Class
 * </pre>
 * 
 * @author 김수민
 * @since 2021. 12. 09.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class MiddletermLecevalDao extends CommonComnDao {
	
    private static final String SQLNAMESPACE = "ost.sj.kp.middletermleceval.";

	/**
     * Database로 부터 중간강의평가 학사일정을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchSchdChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchSchdChk", param);
    }
    
    /**
     * Database로 부터 중간강의평가에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMiddletermLeceval(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectMiddletermLeceval", param);
    }
    
    /**
     * Database로 부터 중간강의평가 강의평가 전체문항을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMiddletermLecevalQuestionList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectMiddletermLecevalQuestionList", param);
    }
    
    /**
     * 중간강의평가 학생 key값을 생성한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public int saveStdtKey(Map<String, Object> param) throws Exception {
        return insert(SQLNAMESPACE + "saveStdtKey", param);
    }
    
    /**
     * 중간강의평가 강의평가작성 내용을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public int saveMiddletermLecevalQuestion(Map<String, Object> param) throws Exception {
        return insert(SQLNAMESPACE + "saveMiddletermLecevalQuestion", param);
    }
    
    /**
     * Database로 부터 웹제한단어를 검색한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectWebLimitWord(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectWebLimitWord", param);
    }
}
