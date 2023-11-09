package com.onestop.ost.curc.subjsearch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: MajorSubjSearchService.java
 * Description: 전공과목 조회 Service Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface MajorSubjSearchService {
    
    /**
     * 전공과목에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMajorSubjSearch(Map<String, Object> param)throws Exception;
    
}
