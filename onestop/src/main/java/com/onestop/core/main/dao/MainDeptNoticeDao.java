package com.onestop.core.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

@Repository
public class MainDeptNoticeDao extends CommonComnDao{
	private static final String SQLNAMESPACE = "core.main.deptNotice.";
	
	@SuppressWarnings("unchecked") //학생지원_메인_학과게시판설정_조회
    public List<Map<String, Object>> departConfigSearch(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE +"DEPARTBOARDINFO_001", map);
    }
	
	//학생지원_메인_학과게시판 설정
    public Map<String, Object> departConfigUpdate(Map<String, Object> map) throws Exception{ 
    	return selectQueryMap(SQLNAMESPACE +"DEPARTBOARDUPDATE_001", map);
    }
	
	
	
}
