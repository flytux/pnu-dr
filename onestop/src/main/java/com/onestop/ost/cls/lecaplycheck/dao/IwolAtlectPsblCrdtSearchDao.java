package com.onestop.ost.cls.lecaplycheck.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: IwolAtlectPsblCrdtSearchDao.java
 * Description: 학점이월제 수강가능학점 조회 DAO Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class IwolAtlectPsblCrdtSearchDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.cls.lecaplycheck.iwolatlectpsblcrdtsearch.";

    /**
     * Database로 부터 학점이월제 수강가능학점을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectIwolAtlectPsblCrdtSearch(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "selectIwolAtlectPsblCrdtSearch", map);
    }




}
