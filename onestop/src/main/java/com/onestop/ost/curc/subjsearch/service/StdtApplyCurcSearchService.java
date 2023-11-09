package com.onestop.ost.curc.subjsearch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: StdtApplyCurcSearchService.java
 * Description: 학생별적용교육과정 조회 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface StdtApplyCurcSearchService {
    
    /**
     * 학생별적용교육과정에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtApplyCurcSearch(Map<String, Object> param)throws Exception;
    /**
     * 해당학년도 학과를 조회한다.  - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectOpenDept(Map<String, Object> param)throws Exception;
    
}
