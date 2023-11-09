package com.onestop.ost.vote.dao;

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
public class RealTimeVoteDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.vote.realtimevote.";
    
    /**
     * Database로 부터 신청가능년도학기를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> serviceTerm(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "serviceTerm", param);
    }
    
}
