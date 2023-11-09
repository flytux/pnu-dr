package com.onestop.ost.scm.scmsituation.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: JolupStdtEplymtSituationService.java
 * Description: 졸업생취업현황 Service Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 02. 04.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface JolupStdtEplymtSituationService {
    
    /**
     * 졸업생취업현황 화면 졸업년도 조회를 한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> getJolupYear(Map<String, Object> param)throws Exception;
    
    /**
     * 졸업생취업현황 화면 졸업생 취업현황을 조회를 한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJolupStdtEplymtSituation(Map<String, Object> param)throws Exception;
    
    /**
     * 졸업생취업현황 화면 졸업생 취업현황상세 조회를 한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectEmploymentStatus(Map<String, Object> param)throws Exception;
    
    /**
     * 졸업생취업현황 화면 졸업생 진학현황상세 조회를 한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectFurtherStatus(Map<String, Object> param)throws Exception;
    
    /**
     * 졸업생취업현황 화면 졸업생 구분별 스펙 조회를 한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSpec(Map<String, Object> param)throws Exception;
}
