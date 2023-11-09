package com.onestop.ost.hj.stdtinfo.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name:HakjukbuSearchService.java
 * Description: 학적부 Service Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 18.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface HakjukbuSearchService {
	
    
    /**
     * 학생정보를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectStdtInfo(Map<String, Object> param) throws Exception;
    
    /**
     * 입학목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListEnt(Map<String, Object> param) throws Exception;
    
    /**
     * 출신대학교 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListOunv(Map<String, Object> param) throws Exception;
    
    /**
     * 비자정보를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListVisa(Map<String, Object> param) throws Exception;
    
    /**
     * 학적변동 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSrchg(Map<String, Object> param) throws Exception;
    
    /**
     * 다중전공신청 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListMultiMajor(Map<String, Object> param) throws Exception;
    
    /**
     * 연계과정신청 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListLinkProc(Map<String, Object> param) throws Exception;
    
    /**
     * 학사/무논문학위취득유예신청 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListAcqDelay(Map<String, Object> param) throws Exception;
    
    /**
     * 편입/교류/복수.공동학위 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListCourseEtc(Map<String, Object> param) throws Exception;
    
    /**
     * 장학금 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJangHak(Map<String, Object> param) throws Exception;
    
    /**
     * 학기별성적 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListTermSj(Map<String, Object> param) throws Exception;
    
    /**
     * 학기별성적 합계를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectListTotTermSj(Map<String, Object> param) throws Exception;
    
    /**
     * 교과목성적 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSubjSj(Map<String, Object> param) throws Exception;
    
    /**
     * 졸업 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListDeg(Map<String, Object> param) throws Exception;


    
}
