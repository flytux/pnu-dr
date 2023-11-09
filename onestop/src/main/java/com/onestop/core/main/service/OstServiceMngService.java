package com.onestop.core.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

public interface OstServiceMngService {
	
	/**
     * 서비스업무구분관리 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectQueryServiceTask(Map<String, Object> param) throws Exception;

	/**
     * 서비스단계 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
	public List<Map<String, Object>> selectQueryServiceStep(Map<String, Object> param) throws Exception;
	
	/**
     * 서비스단계관련 일정구분 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
	public List<Map<String, Object>> selectQuerySchd(Map<String, Object> param) throws Exception;
	
	/**
     * 서비스단계관련 메뉴 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectQueryMenu(Map<String, Object> param) throws Exception;
    
    /**
     * 일정관리에 관련된 정보를 조회한다
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListScheduleMng(Map<String, Object> param)throws Exception;
    
    /**
     * 일정관리에 관련된 정보를 조회한다
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSchedulePopMng(Map<String, Object> param)throws Exception;
}
