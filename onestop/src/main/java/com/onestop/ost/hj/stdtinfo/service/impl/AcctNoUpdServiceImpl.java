package com.onestop.ost.hj.stdtinfo.service.impl;

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
import com.onestop.ost.hj.stdtinfo.dao.AcctNoUpdDao;
import com.onestop.ost.hj.stdtinfo.service.AcctNoUpdService;


/**
 * <pre>
 * Class Name: AcctNoUpdServiceImpl.java
 * Description: 계좌정보 수정 ServiceImpl
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 11.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("acctNoUpdService")
public class AcctNoUpdServiceImpl extends CommonServiceImpl implements AcctNoUpdService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private AcctNoUpdDao acctNoUpdDao;
    
    @Autowired
    private ComFunctionService comFunctionService;    
    
    /**
     * 계좌정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectAcctNoUpd(Map<String, Object> map) throws Exception {
        return acctNoUpdDao.selectAcctNoUpd(map);
    }

    /**
     * 계좌정보의 은행목록을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectBankList(Map<String, Object> map) throws Exception {
    	return acctNoUpdDao.selectBankList(map);
    }

    /**
     * 계좌정보를 저장한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveAcctNoUpd(Map<String, Object> param) throws Exception {
    	
    	List<Map<String, Object>> agreeDltInfo = (List<Map<String, Object>>) param.get("agreeDltInfo");
    	
    	if(agreeDltInfo != null && agreeDltInfo.size() > 0) {
    		
    		Map<String, Object> result = comFunctionService.insertAgreeDltInfo(agreeDltInfo); /* 개인정보동의 내용 저장 */

    		if(result != null && "Y".equals(result.get("RESULT_YN")) ) { 
    			
    			/* 정보동의 관련정보를 param에 put */
    			param.put("SYSTEM_GCD", result.get("SYSTEM_GCD"));
    			param.put("CLAUSE_SEQ_NO", result.get("CLAUSE_SEQ_NO"));
    			param.put("CLAUSE_HISTORY_SEQ_NO", result.get("CLAUSE_HISTORY_SEQ_NO"));
    			param.put("CLAUSE_AGREE_SEQ_NO", result.get("CLAUSE_AGREE_SEQ_NO"));
    			
    	    	Map<String, Object> applyRtnMap = acctNoUpdDao.saveAcctNoUpd(param);
    			
//    	    	param.put("O_RSLT", applyRtnMap.get("O_RSLT"));
//    	    	param.put("O_MSG", applyRtnMap.get("O_MSG"));
    		}
    	}
        return param;
    }    
    
    /**
     * 본인계좌인지를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> chkAcctNoUpd(Map<String, Object> map) throws Exception {
        return acctNoUpdDao.chkAcctNoUpd(map);
    }    


}
