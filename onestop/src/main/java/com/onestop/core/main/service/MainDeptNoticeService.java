package com.onestop.core.main.service;

import java.util.List;
import java.util.Map;

public interface MainDeptNoticeService {

	//학생지원_메인_학과게시판 설정_조회
	public List<Map<String, Object>> departConfigSearch(Map<String, Object> map) throws Exception; 
	
	//학생지원_메인_학과게시판 설정
	public Map<String, Object> departConfigUpdate(Map<String, Object> map) throws Exception;
	
	//학생지원_메인_학과게시판 학과_조회
	public List<Map<String, Object>> departSiteInfo(Map<String, Object> map) throws Exception; 
	
	
	//학생지원_메인_학과게시판 학과_게시판_조회
	public List<Map<String, Object>> departSiteBoardInfo(Map<String, Object> map) throws Exception; 
		
}
