package com.onestop.ost.jolup.degthesissubmitqexam.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: DegThesisSubmitQexamApplySearchService.java
 * Description: 학위논문제출 자격시험 신청내역 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface DegThesisSubmitQexamApplySearchService {
	
    
    /**
     * 종합시험 신청내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectCompExam(Map<String, Object> param) throws Exception;
    
    /**
     * 외국어시험 신청내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectForeignExam(Map<String, Object> param) throws Exception;
       
}
