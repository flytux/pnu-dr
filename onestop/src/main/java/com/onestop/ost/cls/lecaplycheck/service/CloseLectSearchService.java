package com.onestop.ost.cls.lecaplycheck.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: CloseLectSearchService.java
 * Description: 폐강강좌 조회 Service Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface CloseLectSearchService {
    
    /**
     * 폐강강좌에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectCloseLectSearch(Map<String, Object> param)throws Exception;
    
}
