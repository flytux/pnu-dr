package com.onestop.ost.kj.teachcourseguide.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: FacultyLicenseAcqSearchDao.java
 * Description: 교직선발 및 교원자격취득확인 Dao Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class FacultyLicenseAcqSearchDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "ost.kj.teachcourseguide.FacultyLicenseAcqSearch.";
    
    /**
     * Database로 부터 교직선발 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListTeachApply(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListTeachApply", param);
    }
    
    /**
     * Database로 부터 교원자격 취득 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListFacultyLicense(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListFacultyLicense", param);
    }
    
}
