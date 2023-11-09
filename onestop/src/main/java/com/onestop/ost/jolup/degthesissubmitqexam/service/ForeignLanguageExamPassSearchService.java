package com.onestop.ost.jolup.degthesissubmitqexam.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: ForeignLanguageExamPassSearchService.java
 * Description: 외국어시험 합격조회 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 10.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface ForeignLanguageExamPassSearchService {
	
    
    /**
     * 외국어시험 합격여부를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectExamPass(Map<String, Object> param) throws Exception;
     
}
