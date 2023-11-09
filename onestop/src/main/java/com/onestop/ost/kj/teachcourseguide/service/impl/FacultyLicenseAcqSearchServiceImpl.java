package com.onestop.ost.kj.teachcourseguide.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.kj.teachcourseguide.dao.FacultyLicenseAcqSearchDao;
import com.onestop.ost.kj.teachcourseguide.service.FacultyLicenseAcqSearchService;

/**
 * <pre>
 * Class Name: FacultyLicenseAcqSearchServiceImpl.java
 * Description: 교직선발 및 교원자격취득확인 ServiceImpl
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("facultyLicenseAcqSearchService")
public class FacultyLicenseAcqSearchServiceImpl extends CommonServiceImpl implements FacultyLicenseAcqSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private FacultyLicenseAcqSearchDao facultyLicenseAcqSearchDao;

    /**
     * 교직선발 및 교원자격취득확인 화면 교직선발 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListTeachApply(Map<String, Object> param) throws Exception {
        return facultyLicenseAcqSearchDao.selectListTeachApply(param);
    }

    /**
     * 교직선발 및 교원자격취득확인 화면 교원자격 취득 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListFacultyLicense(Map<String, Object> param) throws Exception {
        return facultyLicenseAcqSearchDao.selectListFacultyLicense(param);
    }
    
}