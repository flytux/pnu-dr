package com.onestop.ost.jolup.hakbujolupguide.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: JolupEvaltnResultService.java
 * Description: 졸업사정결과 Service Class
 * </pre>
 * 
 * @author 심진용
 * @since 2022. 3. 8.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface JolupEvaltnResultService {
    
    /**
     * 작성된 사정기분별 졸업예정정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJolupEvaltnResult(Map<String, Object> param)throws Exception;
}
