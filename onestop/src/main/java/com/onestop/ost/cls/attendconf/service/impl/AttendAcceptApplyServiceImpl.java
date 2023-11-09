package com.onestop.ost.cls.attendconf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.attendconf.dao.AttendAcceptApplyDao;
import com.onestop.ost.cls.attendconf.service.AttendAcceptApplyService;


/**
 * <pre>
 * Class Name: AttendAcceptApplyServiceImpl.java
 * Description: 출석인정신청 ServiceImpl
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("attendAcceptApplyService")
public class AttendAcceptApplyServiceImpl extends CommonServiceImpl implements AttendAcceptApplyService{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private AttendAcceptApplyDao attendAcceptApplyDao;

    @Autowired
    private ComFunctionService comFunctionService; 
    
    /**
     * 출석인정신청에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectAttendAcceptApply(Map<String, Object> param) throws Exception {
        return attendAcceptApplyDao.selectAttendAcceptApply(param);
    }

    /**
     * 출석인정신청에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectLecApply(Map<String, Object> param) throws Exception {
    	return attendAcceptApplyDao.selectLecApply(param);
    }

    /**
     * 학사일정을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectLecDate(Map<String, Object> map) throws Exception {
        return attendAcceptApplyDao.selectLecDate(map);
    }    
    
    /**
     * 신청내역을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveAttendAcceptApply(Map<String, Object> map) throws Exception {

        Map<String, Object> param = new HashMap<String, Object>();
        
        attendAcceptApplyDao.saveAttendAcceptApply(map); 

    	param.put("resultYn", "Y");
    	param.put("msg", "정상적으로 삭제 되었습니다.");
    	
        return param;
    }    
    
    /**
     * 출석인정 신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional 
    public Map<String, Object> saveLecApply(List<Map<String, Object>> list) throws Exception {

    	Map<String, Object> map = null;
    	Map<String, Object> param = new HashMap<String, Object>();

		//
//		List<Map<String, Object>> agreeDltInfo = (List<Map<String, Object>>) param.get("agreeDltInfo");
//    	if(agreeDltInfo != null && agreeDltInfo.size() > 0) {
//    		Map<String, Object> result = comFunctionService.insertAgreeDltInfo(agreeDltInfo); /* 개인정보동의 내용 저장 */
//    	}        		
		//
    	
        if(list.size() <= 0) {
        	param.put("msg", "저장 데이터가 없습니다.");
        	return param;
        } else {   	
        	for(int i=0; i<list.size(); i++){ 
        		map = list.get(i);
        		
        		attendAcceptApplyDao.saveLecApply(map); 
    		}
        }
    	
        return param;
    }
 
    /**
     * 개인정보 동의정보를 저장한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveClause(Map<String, Object> param) throws Exception {
    	
    	List<Map<String, Object>> agreeDltInfo = (List<Map<String, Object>>) param.get("agreeDltInfo");
    	
    	if(agreeDltInfo != null && agreeDltInfo.size() > 0) {
    		Map<String, Object> result = comFunctionService.insertAgreeDltInfo(agreeDltInfo); /* 개인정보동의 내용 저장 */
    	}
        return param;
    }       
    
}
