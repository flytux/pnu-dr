package com.onestop.ost.cls.timetablesearch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: ProfTimetableSearchService.java
 * Description: 교수별 시간표 조회 Service Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface ProfTimetableSearchService {
    
   
    /**
     * 교수별 시간표 조회. 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfTimetable(Map<String, Object> param)throws Exception;


}
