package com.onestop.ost.cls.lecaplycheck.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: IwolAtlectPsblCrdtSearchService.java
 * Description: 학점이월제 수강가능학점 조회 Service Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface IwolAtlectPsblCrdtSearchService {
	
    /**
     * 학점이월제 수강가능학점을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectIwolAtlectPsblCrdtSearch(Map<String, Object> map) throws Exception;

    
}
