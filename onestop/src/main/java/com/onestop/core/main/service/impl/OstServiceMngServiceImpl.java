package com.onestop.core.main.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.main.dao.OstServiceMngDao;
import com.onestop.core.main.service.OstServiceMngService;
import com.onestop.core.util.service.CommonServiceImpl;

@Service("OstServiceMngService")
public class OstServiceMngServiceImpl extends CommonServiceImpl implements OstServiceMngService {

	@Autowired
    private OstServiceMngDao dao;
	
	
	/**
     * 서비스업무구분관리 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectQueryServiceTask(Map<String, Object> param) throws Exception {
        return dao.selectQueryServiceTask(param);
    }
	
	/**
     * 서비스단계 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectQueryServiceStep(Map<String, Object> param) throws Exception {
        return dao.selectQueryServiceStep(param);
    }
    
    /**
     * 서비스단계관련 일정구분 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectQuerySchd(Map<String, Object> param) throws Exception {
        return dao.selectQuerySchd(param);
    }
    
    /**
     * 서비스단계관련 메뉴 목록을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectQueryMenu(Map<String, Object> param) throws Exception {
        return dao.selectQueryMenu(param);
    }
    
    /**
     * 일정관리에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListScheduleMng(Map<String, Object> param) throws Exception {
        return dao.selectListScheduleMng(param);
    }
    
    /**
     * 일정관리에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListSchedulePopMng(Map<String, Object> param) throws Exception {
        return dao.selectListSchedulePopMng(param);
    }
}
