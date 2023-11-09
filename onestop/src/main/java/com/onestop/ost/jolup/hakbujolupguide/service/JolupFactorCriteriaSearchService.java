package com.onestop.ost.jolup.hakbujolupguide.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: JolupFactorCriteriaSearchService.java
 * Description: 졸업요건기준 및 충족여부 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 04.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface JolupFactorCriteriaSearchService {
	
    /**
     * 졸업요건기준 및 충족여부를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectJolupFactor(Map<String, Object> map) throws Exception;
    
    /**
     * 졸업요건기준 및 충족여부 개인정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectJolupStdtInfo(Map<String, Object> param)throws Exception;
    
}
