package com.onestop.ost.sep.overseasdispatch.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: OwnExpenseDao.java
 * Description: 자비 DAO Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class OwnExpenseDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.sep.overseasdispatch.ownexpense.";

    /**
     * Database로 부터 해외파견 자비 신청자정보를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtInfo(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "selectStdtInfo", map);
    }
    /**
     * Database로 부터 해외파견 지원가능대학목록을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectUnivList(Map<String, Object> map) throws Exception{
    	return selectQuery(SQLNAMESPACE + "selectUnivList", map);
    }

    /**
     * Database로 부터 자비 작성 화면에 입력된 정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveOwnExpense(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveOwnExpense", param);
    }

    /**
     * Database로 부터 자비 작성 화면에 입력된 정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> saveCancelOwnExpense(Map<String, Object> map) throws Exception{
    	return selectQuery(SQLNAMESPACE + "saveCancelOwnExpense", map);
    }
}
