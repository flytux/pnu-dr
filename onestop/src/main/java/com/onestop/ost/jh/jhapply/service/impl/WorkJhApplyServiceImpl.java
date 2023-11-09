package com.onestop.ost.jh.jhapply.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.exception.ExecuteException;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.jh.jhapply.dao.WorkJhApplyDao;
import com.onestop.ost.jh.jhapply.service.WorkJhApplyService;

/**
 * <pre>
 * Class Name: WorkJhApplyServiceImpl.java
 * Description: 장학생(근로)신청 ServiceImpl
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 3. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("workJhApplyService")
public class WorkJhApplyServiceImpl extends CommonServiceImpl implements WorkJhApplyService {

    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private WorkJhApplyDao workJhApplyDao;

    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 장학생(근로)신청 화면 신청기간 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return  List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListWorkJhApplySchd(Map<String, Object> param) throws Exception {
        return workJhApplyDao.selectListWorkJhApplySchd(param);
    }

    /**
     * 장학생(근로)신청 화면 신청리스트 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListWorkJhApply(Map<String, Object> param) throws Exception {
        return workJhApplyDao.selectListWorkJhApply(param);
    }

    /**
     * 장학생(근로)신청 화면 학생정보 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListStdtInfo(Map<String, Object> param) throws Exception {
        return workJhApplyDao.selectListStdtInfo(param);
    }

    /**
     * 장학생(근로)신청 화면 계좌정보 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListBank(Map<String, Object> param) throws Exception {
        return workJhApplyDao.selectListBank(param);
    }

    /**
     * 장학생(근로)신청 화면 근부부서상위 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListUpperDept(Map<String, Object> param) throws Exception {
        return workJhApplyDao.selectListUpperDept(param);
    }

    /**
     * 장학생(근로)신청 화면 근무부서하위 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListDept(Map<String, Object> param) throws Exception {
        return workJhApplyDao.selectListDept(param);
    }
    
    /**
     * 장학생(근로)신청 화면 제출서류 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListDocs(Map<String, Object> param) throws Exception {
        return workJhApplyDao.selectListDocs(param);
    }

    /**
     * 장학생(근로)신청 화면 신청내역 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListWorkJhApplySearch(Map<String, Object> param) throws Exception {
        return workJhApplyDao.selectListWorkJhApplySearch(param);
    }

    /**
     * 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> executeWorkJhApply(Map<String, Object> param) throws Exception {
    	List<Map<String, Object>> agreeDltInfo = (List<Map<String, Object>>) param.get("agreeDltInfo");
    	if(agreeDltInfo != null && agreeDltInfo.size() > 0) {
    		Map<String, Object> result = comFunctionService.insertAgreeDltInfo(agreeDltInfo); /* 개인정보동의 내용 저장 */
    		if(result != null && "Y".equals(result.get("RESULT_YN")) ) { 
    			
    			/* 정보동의 관련정보를 param에 put */
    			param.put("SYSTEM_GCD", result.get("SYSTEM_GCD"));
    			param.put("CLAUSE_SEQ_NO", result.get("CLAUSE_SEQ_NO"));
    			param.put("CLAUSE_HISTORY_SEQ_NO", result.get("CLAUSE_HISTORY_SEQ_NO"));
    			param.put("CLAUSE_AGREE_SEQ_NO", result.get("CLAUSE_AGREE_SEQ_NO"));
    			
    	    	Map<String, Object> applyrtnMap = workJhApplyDao.executeWorkJhApply(param);
    			
    	    	param.put("O_RSLT", applyrtnMap.get("O_RSLT"));
    	    	param.put("O_MSG", applyrtnMap.get("O_MSG"));
    		}
    	}

        return param;
    }

    /**
     * 	삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> deleteWorkJhApply(Map<String, Object> param) throws Exception {
    	Map<String, Object> rtnMap = null;
    	rtnMap =workJhApplyDao.deleteWorkJhApply(param);
        if(rtnMap.get("O_RSLT").equals("N")) {
            throw new ExecuteException((String) rtnMap.get("O_MSG"));
        }
        return rtnMap;
	}
    
    /**
     * 장학생(근로)신청 화면 형제/자매 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListBrothers(Map<String, Object> param) throws Exception {
        return workJhApplyDao.selectListBrothers(param);
    }

}