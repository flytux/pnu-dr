package com.onestop.ost.jh.jhapply.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: WorkJhApplyDao.java
 * Description: 장학생(근로)신청 Dao Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 3. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class WorkJhApplyDao extends CommonComnDao {

	private static final String SQLNAMESPACE = "ost.jh.jhapply.WorkJhApply.";

    /**
     * Database로 부터 신청기간  조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListWorkJhApplySchd(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListWorkJhApplySchd", param);
    }

    /**
     * Database로 부터 신청리스트 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListWorkJhApply(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListWorkJhApply", param);
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
     * Database로 부터 상위근무부서 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListUpperDept(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListUpperDept", param);
    }

    /**
     * Database로 부터 근무부서 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListDept(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListDept", param);
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
    public List<Map<String, Object>> selectListWorkJhApplySearch(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListWorkJhApplySearch", param);
    }

    /**
     * 저장한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> executeWorkJhApply(Map<String, Object> param) throws Exception {
    	
        return executeQuery(SQLNAMESPACE + "executeWorkJhApply", param);
    }

    /**
     * 삭제한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> deleteWorkJhApply(Map<String, Object> param) throws Exception {
        return deleteQuery(SQLNAMESPACE + "deleteWorkJhApply", param);
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