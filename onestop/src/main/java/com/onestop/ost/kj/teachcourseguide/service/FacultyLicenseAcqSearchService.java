package com.onestop.ost.kj.teachcourseguide.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: FacultyLicenseAcqSearchService.java
 * Description: 교직선발 및 교원자격취득확인 Service Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface FacultyLicenseAcqSearchService {
	
    /**
     * 교직선발 및 교원자격취득확인 화면 교직선발 조회를 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListTeachApply(Map<String, Object> param)throws Exception;

    
    /**
     * 교직선발 및 교원자격취득확인 화면 교원자격 취득 조회를 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListFacultyLicense(Map<String, Object> param)throws Exception;
}

