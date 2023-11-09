package com.onestop.ost.cls.timetablesearch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: ExamTimetableSearchService.java
 * Description: 시험 시간표 조회 Service Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface ExamTimetableSearchService {
    
    /**
     * 조회가능여부 조회. 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectexamTimetableValid(Map<String, Object> param)throws Exception;
    /**
     * 시험시간표 조회. 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectexamTimetable(Map<String, Object> param)throws Exception;


}
