package com.onestop.ost.curc.subjsearch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: TeachSubjSearchService.java
 * Description: 교직과목 조회 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 27.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface TeachSubjSearchService {
    
    /**
     * 교직과목에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectTeachSubjSearch(Map<String, Object> param)throws Exception;
    
}
