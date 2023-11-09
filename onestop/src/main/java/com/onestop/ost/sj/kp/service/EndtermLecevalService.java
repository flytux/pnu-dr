package com.onestop.ost.sj.kp.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: EndtermLecevalService.java
 * Description: 기말강의평가 Service Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 09.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface EndtermLecevalService {
    
	 /**
	     * 기말강의평가 학사일정을 조회한다.
	     * @param param
	     * @return List<Map<String, Object>>
	     * @throws Exception
	     */
    public Map<String, Object> searchEndSchdChk(Map<String, Object> param)throws Exception;
    
    /**
     * 기말강의평가에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectEndtermLeceval(Map<String, Object> param)throws Exception;
    
    /**
     * 기말강의평가 강의평가 전체문항을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectEndtermLecevalQuestionList(Map<String, Object> param)throws Exception;
    
    /**
     * 기말강의평가 강의평가작성 내용을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveEndtermLecevalQuestion(List<Map<String, Object>> list)throws Exception;
    
    
    /**
     * 기말강의평가 교육인증 강의평가작성 내용을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveEduCertLecevalQuestion(List<Map<String, Object>> list)throws Exception;
    
    
    /**
     * 기말강의평가 교육인증 강의평가 문항을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectEduCertLecevalQuestionList(Map<String, Object> param)throws Exception;
    
}
