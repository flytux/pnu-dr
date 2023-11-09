package com.onestop.ost.cls.lecaplycheck.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: CloseLectSearchDao.java
 * Description: 폐강강좌 조회 DAO Class
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
public class CloseLectSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.lecaplycheck.closelectsearch.";

    /**
     * Database로 부터 폐강강좌에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectCloseLectSearch(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectCloseLectSearch", param);
    }
}
