package com.onestop.ost.jh.jhapply.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: PriorityJhApplyDao.java
 * Description: 유니웰장학금신청 Dao Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 3. 11.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class UniwellJhApplyDao extends CommonComnDao {

	private static final String SQLNAMESPACE = "ost.jh.jhapply.UniwellJhApply.";

    /**
     * Database로 부터 신청기간  조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListPriorityJhApplySchd(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListPriorityJhApplySchd", param);
    }

    /**
     * Database로 부터 신청리스트 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListPriorityJhApply(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListPriorityJhApply", param);
    }

    /**
     * Database로 부터 학생정보 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListStdtInfo(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListStdtInfo", param);
    }

    /**
     * Database로 부터 계좌정보 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListBank(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListBank", param);
    }

    /**
     * Database로 부터 제출서류 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListDocs(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListDocs", param);
    }

    /**
     * Database로 부터 신청내역 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListPriorityJhApplySearch(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListPriorityJhApplySearch", param);
    }

    /**
     * 저장한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> executePriorityJhApply(Map<String, Object> param) throws Exception {
    	
        return executeQuery(SQLNAMESPACE + "executePriorityJhApply", param);
    }

    /**
     * 삭제한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> deletePriorityJhApply(Map<String, Object> param) throws Exception {
        return deleteQuery(SQLNAMESPACE + "deletePriorityJhApply", param);
    }

    /**
     * Database로 부터 형제/자매 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListBrothers(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListBrothers", param);
    }

}