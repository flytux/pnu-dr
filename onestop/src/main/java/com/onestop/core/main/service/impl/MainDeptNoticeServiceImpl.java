package com.onestop.core.main.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.onestop.core.main.dao.MainDeptNoticeDao;
import com.onestop.core.main.dao.UnitDao;
import com.onestop.core.main.service.MainDeptNoticeService;
import com.onestop.core.util.service.CommonServiceImpl;

@Service("mainDeptNoticeService")
public class MainDeptNoticeServiceImpl extends CommonServiceImpl implements MainDeptNoticeService{

	/** mainDao */
	@Resource(name = "mainDeptNoticeDao")
	private MainDeptNoticeDao mainDeptNoticeDao;
	
	/** mainDao */
	@Resource(name = "unitDao")
	private UnitDao unitDao;
	
	@Override //학생지원_메인_학과게시판설정_조회
    public List<Map<String, Object>> departConfigSearch(Map<String, Object> map) throws Exception {
        return mainDeptNoticeDao.departConfigSearch(map);
    }
	
	@Override //학생지원_메인_학과게시판 설정
    public Map<String, Object> departConfigUpdate(Map<String, Object> map) throws Exception {
        return mainDeptNoticeDao.departConfigUpdate(map);
        
    }
	
	@Override //학생지원_메인_학과게시판 학과_조회
    public List<Map<String, Object>> departSiteInfo(Map<String, Object> map) throws Exception {
        return unitDao.departSiteInfo(map);
    }
	
	@Override //학생지원_메인_학과게시판 학과_게시판_조회
    public List<Map<String, Object>> departSiteBoardInfo(Map<String, Object> map) throws Exception {
        return unitDao.departSiteBoardInfo(map);
    }
}
