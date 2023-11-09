package com.onestop.ost.curc.subjsearch.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: CultSubjSearchDao.java
 * Description: 교양과목 조회 DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 27.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class CultSubjSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.curc.subjsearch.CultSubjSearch.";

    /**
     * Database로 부터 교양과목에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectCultSubjSearch(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectCultSubjSearch", param);
    }
}
