package com.onestop.ost.jolup.degthesissubmitqexam.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: DegThesisSubmitQexamApplyService.java
 * Description: 학위논문자격시험 웹신청 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface DegThesisSubmitQexamApplyService {
	
    /**
     * 학적정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtInfo(Map<String, Object> map) throws Exception;
    
    /**
     * 응시대상과목을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSubject(Map<String, Object> param) throws Exception;
    
    /**
     * 응시신청과목을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectApplySubject(Map<String, Object> param) throws Exception;
    
    /**
     * 기합격과목 외국어를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectPassSubject(Map<String, Object> param) throws Exception;
     
    /**
     * 기합격 과목을 조회한다.
     * @param list
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> checkPassSubject(List<Map<String, Object>> list)throws Exception;
    
    /**
     * 시험신청.
     * @param list
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> excuteSubject(List<Map<String, Object>> list)throws Exception;
}
