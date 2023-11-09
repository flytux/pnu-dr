
package com.onestop.ost.kj.teachcourseguide.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.kj.teachcourseguide.dao.EduServeActivDao;
import com.onestop.ost.kj.teachcourseguide.service.EduServeActivService;

/**
 * <pre>
 * Class Name: EduServeActivServiceImpl.java
 * Description: 교육봉사활동 ServiceImpl
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("eduServeActivService")
public class EduServeActivServiceImpl extends CommonServiceImpl implements EduServeActivService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private EduServeActivDao eduServeActivDao;
    
    /**
     * 교육봉사활동 화면 대상자 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListEduServeActiv(Map<String, Object> param) throws Exception {
        return eduServeActivDao.selectListEduServeActiv(param);
    }
    
    /**
     * 교육봉사활동 화면 계획서입력내역 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListEduServePlan(Map<String, Object> param) throws Exception {
        return eduServeActivDao.selectListEduServePlan(param);
    }
    
    /**
     * 교육봉사활동 화면 학점신청 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListEduServePlanCrdt(Map<String, Object> param) throws Exception {
        return eduServeActivDao.selectListEduServePlanCrdt(param);
    }
    
    /**
     * 교육봉사활동 화면 교육봉사활동계획신청구분코드 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListEsaItem(Map<String, Object> param) throws Exception {
        return eduServeActivDao.selectListEsaItem(param);
    }
    
    /**
     * 교육봉사활동 화면 세부내용 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListPlanDetailSearch(Map<String, Object> param) throws Exception {
        return eduServeActivDao.selectListPlanDetailSearch(param);
    }
    
    /**
     *교육봉사활동 화면 계획서 저장 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> executePlan(Map<String, Object> param) throws Exception {
        return eduServeActivDao.executePlan(param);
    }
    
    /**
     *교육봉사활동 화면 계획서 삭제 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> deletePlan(Map<String, Object> param) throws Exception {
        return eduServeActivDao.deletePlan(param);
    }

    /**
     * 교육봉사활동 화면 일지 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListPlanDaylog(Map<String, Object> param) throws Exception {
        return eduServeActivDao.selectListPlanDaylog(param);
    }
    
    /**
     *교육봉사활동 화면 일지 저장 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
	@Override
    @Transactional
	public Map<String, Object> executePlanDaylog(List<Map<String, Object>> list) throws Exception {
		List<Map<String, Object>> list2 = list;
        if(list2 == null) list2 = (List<Map<String, Object>>) new HashMap<String, Object>();
    	Map<String, Object> map = null;
        for(int i=0; i<list2.size(); i++){
            map = eduServeActivDao.executePlanDaylog(list2.get(i));
        }
        
        return map;
    	
	}
    
    /**
     *교육봉사활동 화면 일지 삭제 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> deletePlanDaylog(Map<String, Object> param) throws Exception {
        return eduServeActivDao.deletePlanDaylog(param);
    }
    
    /**
     *교육봉사활동 화면 학점신청/취소 저장 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
	@Override
    @Transactional
	public Map<String, Object> executeEduServeActiv(List<Map<String, Object>> list) throws Exception {
		List<Map<String, Object>> list2 = list;
        if(list2 == null) list2 = (List<Map<String, Object>>) new HashMap<String, Object>();
    	Map<String, Object> map = null;
        for(int i=0; i<list2.size(); i++){
            map = eduServeActivDao.executeEduServeActiv(list2.get(i));
        }
        return map;
	}
    
}
    
