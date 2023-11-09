package com.onestop.core.util.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.ParameterMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.IUtility;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

public class CommonDao extends EgovAbstractMapper {

	@Resource(name = "comFunctionService")
	private ComFunctionService comFunctionService;

	private static final String[] EXCLUSION_ACTION_LIST = { "core.function.getCode", "core.function.getCodeByEtcParam" };

	private boolean isEmpty(String str) {
		return (str == null || str.length() == 0);
	}

	private boolean isArraysValue(String[] array, String value) {
		if (isEmpty(value)) {
			return false;
		}
		for (int i = 0; i < array.length; i++) {
			if (StringUtils.equals(value, array[i])) {
				return true;
			}
		}
		return false;
	}

	private void chkLogingExecute(String sqlID, Object params, String useHistoryGcd) throws Exception {
		if (params instanceof Map) {
			setExecutorQuery(sqlID, (Map) params, useHistoryGcd);
		}
	}

	private void setExecutorQuery(String sqlID, Map<String, Object> params, String useHistoryGcd) throws Exception {
		BoundSql bSql = getSqlSession().getConfiguration().getMappedStatement(sqlID).getBoundSql(params);
		String sql = bSql.getSql();
		Object pObj = bSql.getParameterObject();
		if (pObj != null) {
			List<ParameterMapping> paramMapping = bSql.getParameterMappings();
			for (ParameterMapping mapping : paramMapping) {
				String propValue = mapping.getProperty();
				sql = sql.replaceFirst("\\?", "'" + (IUtility.parseNull(params.get(propValue))).toString() + "'");
			}
		}

		if (params.get("SESSION_MENU_CD") != null && ((String) params.get("SESSION_MENU_CD")).length() > 0
			&& params.get("SESSION_SYSTEM_GCD") != null && ((String) params.get("SESSION_SYSTEM_GCD")).length() > 0
			&& params.get("SESSION_USER_ID") != null && ((String) params.get("SESSION_USER_ID")).length() > 0) {
			/* 로깅 (0003:정보열람, 0004:정보입력, 0005:정보삭제, 0006:정보수정, 0008:프로시저) */
			Map map = new HashMap();
			map.put("USE_HISTORY_GCD", useHistoryGcd);
			map.put("USE_HISTORY_GCD_NM", IUtility.parseNull(IUtility.USE_HISTORY_GCD_MAP.get(useHistoryGcd),"-"));
			map.put("CONN_BROWSER_INFO", IUtility.getClientBrowser(getCurrentRequest()));
			map.put("CONN_OS_INFO", IUtility.getClientOs(getCurrentRequest()));
			map.put("CONN_IP", params.get("SESSION_USER_IP"));
			map.put("USE_HISTORY_CONTENT", "SQL : " + sql + "\nPARAMETER : " + params.toString());
			map.put("FIRST_USER_ID", "");
			map.put("USER_ID", params.get("SESSION_USER_ID"));
			map.put("USER_NM", IUtility.parseNull(params.get("SESSION_USER_NM"),"-"));
            map.put("USER_GCD", IUtility.parseNull(params.get("SESSION_USER_GCD"),"-"));
			map.put("SYSTEM_GCD", params.get("SESSION_SYSTEM_GCD"));
			map.put("SYSTEM_GCD_NM", IUtility.parseNull(IUtility.SYSTEM_GCD_MAP.get(params.get("SESSION_SYSTEM_GCD")),"-"));
			map.put("MENU_CD", params.get("SESSION_MENU_CD"));
			map.put("INS_USER_ID", params.get("SESSION_USER_ID"));
			map.put("INS_USER_IP", params.get("SESSION_USER_IP"));
			map.put("INS_SYSTEM_GCD", params.get("SESSION_SYSTEM_GCD"));
			map.put("INS_MENU_CD", params.get("SESSION_MENU_CD"));
			comFunctionService.insertSystemLog(map);
		}
		logger.info("- SQL : " + sql);
	}

	public List<Map<String, Object>> selectQuery(String sqlID, Map<String, Object> map) throws Exception {

		if (!isArraysValue(EXCLUSION_ACTION_LIST, sqlID)) {
			chkLogingExecute(sqlID, map, "0003");
		}

		List<Map<String, Object>> list = selectList(sqlID, map);

		if (!isArraysValue(EXCLUSION_ACTION_LIST, sqlID)) {
			logger.info("- [" + sqlID + "] Result Count : " + (list == null ? 0 : list.size()) + " 건");
			logger.info("");
			/* logger.info(list.toString()); */
		}
		return list == null ? new ArrayList<Map<String, Object>>() : list;
	}

	public List<Map<String, Object>> selectQueryNoParam(String sqlID) throws Exception {

		List<Map<String, Object>> list = selectList(sqlID);

		if (!isArraysValue(EXCLUSION_ACTION_LIST, sqlID)) {
			logger.info("- [" + sqlID + "] Result Count : " + (list == null ? 0 : list.size()) + " 건");
			logger.info("");
			/* logger.info(list.toString()); */
		}
		return list == null ? new ArrayList<Map<String, Object>>() : list;
	}

	public List<Map<String, Object>> listPaging(String sqlID, Map<String, Object> map) throws Exception {
		int iPageIndex = IUtility.parseInt(map.get("pageIndex"));
		int iPageSize = IUtility.parseInt(map.get("pageSize"));
		int iSkip = (iPageIndex * iPageSize);

		map.put("FIRSTINDEX", iSkip + 1);
		map.put("LASTINDEX", iSkip + iPageSize);

		return this.selectQuery(sqlID, map);
	}

	public Map<String, Object> selectQueryMap(String queryId, Object parameterObject) throws Exception {

		if (!isArraysValue(EXCLUSION_ACTION_LIST, queryId)) {
			chkLogingExecute(queryId, parameterObject, "0003");
		}

		Map<String, Object> map = (Map<String, Object>) selectOne(queryId, parameterObject);

		if (!isArraysValue(EXCLUSION_ACTION_LIST, queryId)) {

			logger.info("- [" + queryId + "] Result map : " + (map != null ? map.toString() : "{}"));
			logger.info("");
		}
		return map == null ? new HashMap<String, Object>() : map;
	}

	public void save(String queryId, Map<String, Object> map) throws Exception {
		if (!isArraysValue(EXCLUSION_ACTION_LIST, queryId)) {
			chkLogingExecute(queryId, map, "0006");
		}
		update(queryId, map);
	}

	public Map<String, Object> insertQuery(String queryId, Map<String, Object> map) throws Exception {
		if (!isArraysValue(EXCLUSION_ACTION_LIST, queryId)) {
			chkLogingExecute(queryId, map, "0004");
		}
		return selectOne(queryId, map);
	}

	public Map<String, Object> updateQuery(String queryId, Map<String, Object> map) throws Exception {
		if (!isArraysValue(EXCLUSION_ACTION_LIST, queryId)) {
			chkLogingExecute(queryId, map, "0006");
		}
		return selectOne(queryId, map);
	}

	public Map<String, Object> deleteQuery(String queryId, Map<String, Object> map) throws Exception {
		if (!isArraysValue(EXCLUSION_ACTION_LIST, queryId)) {
			chkLogingExecute(queryId, map, "0005");
		}
		return selectOne(queryId, map);
	}

	public Map<String, Object> executeQuery(String queryId, Map<String, Object> map) throws Exception {
		if (!isArraysValue(EXCLUSION_ACTION_LIST, queryId)) {
			chkLogingExecute(queryId, map, "0008");
		}
		return selectOne(queryId, map);
	}

	private HttpServletRequest getCurrentRequest() throws Exception {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest hsr = sra.getRequest();
		return hsr;
	}

}
