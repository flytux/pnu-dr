package com.onestop.ost.hj.stdtinfo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: AcctNoUpdDao.java
 * Description: 계좌정보 수정 DAO Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 11.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class AcctNoUpdDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.hj.stdtinfo.acctnoupd.";

    /**
     * Database로 부터 계좌정보를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectAcctNoUpd(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "selectAcctNoUpd", map);
    }

    /**
     * Database로 부터 계좌정보의 은행목록을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectBankList(Map<String, Object> map) throws Exception{
    	return selectQuery(SQLNAMESPACE + "selectBankList", map);
    }

    /**
     * Database로 부터 계좌정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveAcctNoUpd(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveAcctNoUpd", param);
    }    

    /**
     * Database로 부터 본인계좌인지를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> chkAcctNoUpd(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "chkAcctNoUpd", map);
    }

}
