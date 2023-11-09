package com.onestop.common.sample.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: SampleService.java
 * Description: 샘플 Service Class
 * </pre>
 * 
 * @author 서혁성
 * @since 2021. 12. 09.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface SampleService {
    
    /**
     * 샘플에 관련된 정보를 조회한다
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> sample1SelectList(Map<String, Object> param)throws Exception;
    
    public Map<String, Object> saveSampleInfo(Map<String, Object> param)throws Exception;
    
    public Map<String, Object> _saveSampleInfo(Map<String, Object> param)throws Exception;
}
