package com.onestop.ost.cls.subjApplyInvstgt.service.impl;

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
import com.onestop.ost.cls.subjApplyInvstgt.dao.SclassApplyInvstgtDao;
import com.onestop.ost.cls.subjApplyInvstgt.service.SclassApplyInvstgtService;

/**
 * <pre>
 * Class Name: SclassApplyInvstgtServiceImpl.java
 * Description: 계절수업 수요조사 ServiceImpl
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 24.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("sclassApplyInvstgtService")
public class SclassApplyInvstgtServiceImpl extends CommonServiceImpl implements SclassApplyInvstgtService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private SclassApplyInvstgtDao sclassApplyInvstgtDao;    
    
    
    /**
     * 내가 신청한 계절수업 개설신청 교과목 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListApplySubj(Map<String, Object> param) throws Exception {
        return sclassApplyInvstgtDao.selectListApplySubj(param);
    }

    /**
     * 계절수업 수요조사 교과목 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListSclassSubj(Map<String, Object> param) throws Exception {
        return sclassApplyInvstgtDao.selectListSclassSubj(param);
    }

    
    /**
     * 계절수업 수요조사 교과목을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional 
    public Map<String, Object> executeSubjApply(List<Map<String, Object>> paramList) throws Exception {
    	List<Map<String, Object>> paramList2 = paramList;
    	if(paramList2 == null) paramList2 = (List<Map<String, Object>>) new HashMap<String, Object>();
        
        Map<String, Object> rtnMap = null;
        
        for(Map paramMap : paramList2){            
            try {                         
                rtnMap = sclassApplyInvstgtDao.executeSubjApply(paramMap);
                if(rtnMap.get("O_RSLT").equals("N")) {
                    throw new ExecuteException((String) rtnMap.get("O_MSG"));
                }
            }catch (NoTransactionException ntex) {
            	throw ntex;
            }                             
        }
        return  rtnMap;
    }
    
    
    /**
     * 순위별 계절수업 수요조사 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListSclassSubjRank(Map<String, Object> param) throws Exception {
        return sclassApplyInvstgtDao.selectListSclassSubjRank(param);
    }

}
