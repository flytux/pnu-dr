package com.onestop.ost.cls.basicsdignosistest.service;

import java.util.List;
import java.util.Map;


/**
 * <pre>
 * Class Name: DiagnosisTestMathService.java
 * Description: 수학 기초학력진단평가 Service Class
 * </pre>
 * 
 * @author 구태균
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface DiagnosisTestMathService {
	
	
	/**
     * 수학 기초학력진단평가 성적를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectQuery(Map<String, Object> param)throws Exception;
}
