package com.onestop.ost.sj.kp.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: MiddletermLecevalService.java
 * Description: 중간강의평가 Service Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 01. 25.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface MiddletermLecevalService {
    
	 /**
	     * 중간강의평가 학사일정을 조회한다.
	     * @param param
	     * @return List<Map<String, Object>>
	     * @throws Exception
	     */
    public Map<String, Object> searchSchdChk(Map<String, Object> param)throws Exception;
    
    /**
     * 중간강의평가에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMiddletermLeceval(Map<String, Object> param)throws Exception;
    
    /**
     * 중간강의평가 강의평가 전체문항을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMiddletermLecevalQuestionList(Map<String, Object> param)throws Exception;
    
    /**
     * 중간강의평가 강의평가작성 내용을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveMiddletermLecevalQuestion(List<Map<String, Object>> list)throws Exception;
    
}
