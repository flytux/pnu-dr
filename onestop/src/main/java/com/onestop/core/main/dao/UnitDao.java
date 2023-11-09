package com.onestop.core.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonUnitDao;

@Repository
public class UnitDao extends CommonUnitDao{
	private static final String SQLNAMESPACE = "core.main.deptNotice.";
	
	@SuppressWarnings("unchecked") //학생지원_메인_학과게시판설정_조회
    public List<Map<String, Object>> departSiteInfo(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE +"selectDeptSiteInfo", map);
    }
	
	@SuppressWarnings("unchecked") //학생지원_메인_학과게시판설정_조회
    public List<Map<String, Object>> departSiteBoardInfo(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE +"selectDeptSiteBoardInfo", map);
    }
}
