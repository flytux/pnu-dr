package com.onestop.ost.cls.basicsdignosistest.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: DiagnosisTestEngService.java
 * Description: 영어 기초학력진단평가 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface DiagnosisTestEngService {
	
	
	/**
     * 영어 기초학력진단평가 응시여부를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchTestFg(Map<String, Object> param)throws Exception;
    
    /**
     * 영어 기초학력진단평가 결과에 따른 수강신청 과목을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchSubjList(Map<String, Object> param)throws Exception;
    

}
