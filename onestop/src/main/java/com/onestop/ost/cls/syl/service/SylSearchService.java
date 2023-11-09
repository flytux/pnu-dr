package com.onestop.ost.cls.syl.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: SylSearchService.java
 * Description: 교수계획표 조회 Service Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 10.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface SylSearchService {
    
    /**
     * 교수계획표를 조회한다.  
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSylSearch(Map<String, Object> param)throws Exception;
    /**
     * 강의평가 조회가능기간을 조회한다.  
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectSeachPossDate(Map<String, Object> param)throws Exception;

}
