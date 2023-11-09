package com.onestop.ost.hj.stdtinfo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: StdtInfoUpdDao.java
 * Description: 개인정보 수정 DAO Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class StdtInfoUpdDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.hj.stdtinfo.stdtinfoupd.";

    /**
     * Database로 부터 개인정보를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtInfoUpd(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "selectStdtInfoUpd", map);
    }

    /**
     * Database로 부터 개인정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveStdtInfoUpd(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveStdtInfoUpd", param);
    } 
    

    /**
     * Database로 부터 EMAIL/SMS 수신여부를  저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveAgree(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveAgree", param);
    } 

}
