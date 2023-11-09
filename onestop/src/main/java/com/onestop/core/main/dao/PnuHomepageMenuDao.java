package com.onestop.core.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonHomepageDao;


@Repository
public class PnuHomepageMenuDao extends CommonHomepageDao{
	private static final String SQLNAMESPACE = "core.main.";
	/**
     * 오늘의 수업 조회
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMealMenu(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectMealMenu", param);
    }
    
    /**
     * 대학공지 조회
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectPnuNoticeList(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectPnuNoticeList", param);
    }
}
