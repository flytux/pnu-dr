package com.onestop.ost.cls.attendconf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.NoTransactionException;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.exception.ExecuteException;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.attendconf.dao.AttendConfDissentApplyDao;
import com.onestop.ost.cls.attendconf.service.AttendConfDissentApplyService;

/**
 * <pre>
 * Class Name: AttendConfDissentApplyServiceImpl.java
 * Description: 출결확인 및 이의신청 ServiceImpl
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("attendConfDissentApplyService")
public class AttendConfDissentApplyServiceImpl extends CommonServiceImpl implements AttendConfDissentApplyService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private AttendConfDissentApplyDao attendConfDissentApplyDao;    
    
    /**
     *학사일정을 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectSchdInfo(Map<String, Object> param) throws Exception {
        return attendConfDissentApplyDao.selectSchdInfo(param);
    }

    
    /**
     * 출결 이의신청 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListAttDisApply(Map<String, Object> param) throws Exception {
        return attendConfDissentApplyDao.selectListAttDisApply(param);
    }

    /**
     * 출결 이의신청을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional 
    public Map<String, Object> deleteDissentApply(Map<String, Object> param) throws Exception {
        Map<String, Object> map = attendConfDissentApplyDao.deleteDissentApply(param);
        if(map.get("O_RSLT").equals("N")) {
            throw new ExecuteException((String) map.get("O_MSG"));
        }
        return  map;
    }
    
    /**
     * 수강신청 교과목 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListApplySubj(Map<String, Object> param) throws Exception {
        return attendConfDissentApplyDao.selectListApplySubj(param);
    }
    
    
    /**
     * 출결사항 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListAttend(Map<String, Object> param) throws Exception {
        return attendConfDissentApplyDao.selectListAttend(param);
    }
    
    
    /**
     * 출결 이의신청을 입력한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional 
    public Map<String, Object> insertDissentApply(List<Map<String, Object>> paramList) throws Exception {
    	List<Map<String, Object>> paramList2 = paramList;
    	if(paramList2 == null) paramList2 = (List<Map<String, Object>>) new HashMap<String, Object>();
        
        Map<String, Object> rtnMap = null;
        
        for(Map paramMap : paramList2){            
            try {                         
                rtnMap = attendConfDissentApplyDao.insertDissentApply(paramMap);
                if(rtnMap.get("O_RSLT").equals("N")) {
                    throw new ExecuteException((String) rtnMap.get("O_MSG"));
                }
            }catch (NoTransactionException ntex) {
            	throw ntex;
            }                             
        }
        return  rtnMap;
    }

}
