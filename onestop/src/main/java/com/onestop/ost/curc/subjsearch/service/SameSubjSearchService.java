package com.onestop.ost.curc.subjsearch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: SameSubjSearchService.java
 * Description: 동일교과목 조회 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 28.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface SameSubjSearchService {
    
    /**
     * 동일교과목에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSameSubjSearch(Map<String, Object> param)throws Exception;
    
}
