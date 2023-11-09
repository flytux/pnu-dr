package com.onestop.ost.curc.subjsearch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: ExdeptMajorSubjSearchService.java
 * Description: 타과전공인정과목 조회 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 28.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface ExdeptMajorSubjSearchService {
    
    /**
     * 타과전공인정과목에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectExdeptMajorSubjSearch(Map<String, Object> param)throws Exception;
    
    /**
     * 타과전공인정 대학원 구분을 조회한다.  - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectOpenGrad(Map<String, Object> param)throws Exception;
    
    /**
     * 타과전공인정 단과대학을 조회한다.  - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectOpenColl(Map<String, Object> param)throws Exception;
    
    /**
     * 타과전공인정 학과를 조회한다.  - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectOpenDept(Map<String, Object> param)throws Exception;
    
    
}
