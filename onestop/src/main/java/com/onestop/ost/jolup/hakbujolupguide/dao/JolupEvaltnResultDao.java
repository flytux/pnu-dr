package com.onestop.ost.jolup.hakbujolupguide.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: JolupEvaltnResultDao.java
 * Description: 졸업사정결과 Dao Class
 * </pre>
 * 
 * @author 심진용
 * @since 2022. 3. 8.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class JolupEvaltnResultDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "ost.jolup.hakjukbujolupguide.jolupevaltnresult.";
    
    /**
     * Database로 부터 작성된 사정기분별 졸업예정정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJolupEvaltnResult(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListJolupEvaltnResult", param);
    }
}
