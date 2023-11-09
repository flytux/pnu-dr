package com.onestop.core.function.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * @Class Name : ComnSys001Dao.java
 * @Description : 공통코드관리 DAO Class
 * @Modification Information
 * @since : 2020-02-06
 * @author : 정원빈
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ComFunctionDao extends CommonComnDao {

	private static final String SQLNAMESPACE = "core.function.";

	/**
	 * 공통코드관리 공통코드 데이터를 조회한다.
	 * 
	 * @param map
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCode(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getCode", map);
	}

	/**
	 * 공통코드관리 공통코드 데이터를 조건별 조회한다.
	 * 
	 * @param map
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCodeByEtcParam(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getCodeByEtcParam", map);
	}

	public List<Map<String, Object>> getEmpUserInfo(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getEmpUserInfo", map);
	}

	public List<Map<String, Object>> getAssignComboGradGcdInfo(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getAssignComboGradGcdInfo", map);
	}

	public List<Map<String, Object>> getAssignComboCollCdInfo(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getAssignComboCollCdInfo", map);
	}

	public List<Map<String, Object>> getAssignComboDeptCdInfo(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getAssignComboDeptCdInfo", map);
	}

	public List<Map<String, Object>> getAssignComboMajorCdInfo(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getAssignComboMajorCdInfo", map);
	}

	public List<Map<String, Object>> getAssignComboDeptMajorCdInfo(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getAssignComboDeptMajorCdInfo", map);
	}

	public List<Map<String, Object>> clauseDetailList(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "clauseDetailList", map);
	}

	public Map<String, Object> insertAgreeDltInfo(Map param) throws Exception {
		return insertQuery(SQLNAMESPACE + "insertAgreeDltInfo", param);
	}

	public List<Map<String, Object>> getNoticePopupInfo(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getNoticePopupInfo", map);
	}

	public List<Map<String, Object>> getUserInfo(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "getUserInfo", map);
	}

	public void infoSearchInsert(Map<String, Object> map) throws Exception {
		updateQuery(SQLNAMESPACE + "infoSearchInsert", map);
	}
	
	public Map<String, Object> getSiteInfo(String systemGcd) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "getSiteInfo", systemGcd);
    }
	
	public void insertSystemLog(Map<String, Object> map) throws Exception {
        insertQuery(SQLNAMESPACE + "insertSystemLog", map);
    }
	
	public List<Map<String, Object>> bindProc(Map param) throws Exception {
        return selectQuery(SQLNAMESPACE + "bindProc", param);
    }
    
    public List<Map<String, Object>> bindProc(Map param, String cnt) throws Exception {
        return selectQuery(SQLNAMESPACE + "bindProc" + cnt, param);
    }

    public Map<String, Object> bindProcMap(Map param) throws Exception {
        return executeQuery(SQLNAMESPACE + "bindProc", param);
    }
    
    public Map<String, Object> bindProcMap(Map param,String cnt) throws Exception {
        return executeQuery(SQLNAMESPACE + "bindProc" + cnt, param);
    }
}
