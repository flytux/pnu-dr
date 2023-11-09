package com.onestop.ost.sep.overseasdispatch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.NoTransactionException;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.exception.ExecuteException;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.sep.overseasdispatch.dao.ExchgFeeDao;
import com.onestop.ost.sep.overseasdispatch.service.ExchgFeeService;


/**
 * <pre>
 * Class Name: ExchgFeeServiceImpl.java
 * Description: 교환/교비 ServiceImpl
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("exchgFeeService")
public class ExchgFeeServiceImpl extends CommonServiceImpl implements ExchgFeeService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ExchgFeeDao exchgFeeDao;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 신청가능년도학기를 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchSchdYearTerm(Map<String, Object> param) throws Exception {
        return exchgFeeDao.searchSchdYearTerm(param);
    }
    
    /**
     * 신청기간을 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchSchdChk(Map<String, Object> param) throws Exception {
        return exchgFeeDao.searchSchdChk(param);
    }
    
    /**
     * 해외교환/교비 신청자 정보 조회
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchExchgStdtInfo(Map<String, Object> param) throws Exception {
        return exchgFeeDao.searchExchgStdtInfo(param);
    }
    
    /**
     * 해외교환/교비 해외파견 프로그램 참가내역을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchDispatchApplyList(Map<String, Object> param) throws Exception {
        return exchgFeeDao.searchDispatchApplyList(param);
    }
    
    /**
     * 해외교환/교비 원어강의 참가 수를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchNativeApplyList(Map<String, Object> param) throws Exception {
        return exchgFeeDao.searchNativeApplyList(param);
    }
    
    /**
     * 1지망 지원가능대학 목록을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchCollList01(Map<String, Object> map) throws Exception {
        return exchgFeeDao.searchCollList01(map);
    }
    
    /**
     * 2지망 지원가능대학 목록을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override 
    public List<Map<String, Object>> searchCollList02(Map<String, Object> map) throws Exception {
        return exchgFeeDao.searchCollList02(map);
    }
    
    /**
     * 3지망 지원가능대학 목록을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchCollList03(Map<String, Object> map) throws Exception {
        return exchgFeeDao.searchCollList03(map);
    }
    
    /**
     * 교환/교비 신청정보를 저장한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     *  
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */ 
    @Override
    @Transactional
    public Map<String, Object> saveExchgFee(Map<String, Object> param) throws Exception {

    	List<Map<String, Object>> agreeDltInfo = (List<Map<String, Object>>) param.get("agreeDltInfo");
    	
    	if(agreeDltInfo != null && agreeDltInfo.size() > 0) {
    		
    		Map<String, Object> result = comFunctionService.insertAgreeDltInfo(agreeDltInfo); /* 개인정보동의 내용 저장 */

    		if(result != null && "Y".equals(result.get("RESULT_YN")) ) {
    			
    			/* 정보동의 관련정보를 param에 put */
    			param.put("SYSTEM_GCD", result.get("SYSTEM_GCD"));
    			param.put("CLAUSE_SEQ_NO", result.get("CLAUSE_SEQ_NO"));
    			param.put("CLAUSE_HISTORY_SEQ_NO", result.get("CLAUSE_HISTORY_SEQ_NO"));
    			param.put("CLAUSE_AGREE_SEQ_NO", result.get("CLAUSE_AGREE_SEQ_NO"));
    			
    			param.remove("agreeDltInfo");
    			Map<String, Object> applyRtnMap = exchgFeeDao.saveExchgFee(param);
    			
    	    	param.put("O_RSLT", applyRtnMap.get("O_RSLT"));
    	    	param.put("O_MSG", applyRtnMap.get("O_MSG"));
    		}
    	}
    	
        return param;
    }
    
    /**
     * 교환/교비 신청취소한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     *  
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> cancelExchgFee(Map<String, Object> param) throws Exception {
    	Map<String, Object> applyRtnMap = null;
    	
    	try {
    		applyRtnMap = exchgFeeDao.cancelExchgFee(param);
    		if(applyRtnMap.get("O_RSLT").equals("N")) {
    			throw new ExecuteException((String) applyRtnMap.get("O_MSG"));
    		}
		} catch (NoTransactionException ntex) {
    		return applyRtnMap;
    	}
    	
    	param.put("O_RSLT", applyRtnMap.get("O_RSLT"));
    	param.put("O_MSG", applyRtnMap.get("O_MSG"));
    	
    	return param;
    }
}
