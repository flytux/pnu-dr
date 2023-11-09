package com.onestop.core.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

@Repository
public class OstServiceMngDao extends CommonComnDao{

	private static final String SQLNAMESPACE = "core.main.onestop.";
	
	
	/**
     * 서비스업무구분관리 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectQueryServiceTask(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectQueryServiceTask", param);
    }
    
    
	/**
     * 서비스단계 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectQueryServiceStep(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectQueryServiceStep", param);
    }
    
    /**
     * 서비스단계관련 일정구분 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectQuerySchd(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectQuerySchd", param);
    }
    
    /**
     * 서비스단계관련 메뉴 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectQueryMenu(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectQueryMenu", param);
    }
    
    /**
     * Database로 부터 일정관리 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListScheduleMng(Map<String, Object> param) throws Exception {
    	param.put("P_SYEAR", "");
        return selectQuery(SQLNAMESPACE + "selectListScheduleMng", param);
    }
    
    /**
     * Database로 부터 일정관리 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSchedulePopMng(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListSchedulePopMng", param);
    }
}
