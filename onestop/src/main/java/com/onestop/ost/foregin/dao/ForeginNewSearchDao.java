package com.onestop.ost.foregin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: ExchgFeeDao.java
 * Description: 교환/교비 DAO Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ForeginNewSearchDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.foregin.foreginnewsearch.";
    
    /**
     * Database로 부터 학생별적용교육과정에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> fnsList(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "fnsList", param);
    }
    
}
