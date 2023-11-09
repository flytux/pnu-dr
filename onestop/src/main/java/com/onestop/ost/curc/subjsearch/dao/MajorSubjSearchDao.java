package com.onestop.ost.curc.subjsearch.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: MajorSubjSeachDao.java
 * Description: 전공과목 조회 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class MajorSubjSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.curc.subjsearch.MajorSubjSearch.";

    /**
     * Database로 부터 전공과목에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMajorSubjSearch(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectMajorSubjSearch", param);
    }
}
