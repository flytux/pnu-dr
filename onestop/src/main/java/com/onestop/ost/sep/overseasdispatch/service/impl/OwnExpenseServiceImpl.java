package com.onestop.ost.sep.overseasdispatch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.sep.overseasdispatch.dao.OwnExpenseDao;
import com.onestop.ost.sep.overseasdispatch.service.OwnExpenseService;


/**
 * <pre>
 * Class Name: OwnExpenseServiceImpl.java
 * Description: 자비 ServiceImpl
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("ownExpenseService")
public class OwnExpenseServiceImpl extends CommonServiceImpl implements OwnExpenseService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private OwnExpenseDao ownExpenseDao;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 해외파견 자비 신청자정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectStdtInfo(Map<String, Object> map) throws Exception {
        return ownExpenseDao.selectStdtInfo(map);
    }
    /**
     * 해외파견 지원가능대학목록을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectUnivList(Map<String, Object> map) throws Exception {
    	return ownExpenseDao.selectUnivList(map);
    }

    /**
     * 자비 작성 화면에 입력된 정보를 저장한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveOwnExpense(Map<String, Object> param) throws Exception {

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
    			Map<String, Object> applyRtnMap = ownExpenseDao.saveOwnExpense(param);
    		}
    	}
    	
        return param;
    }
    
    /**
     * 자비 작성 화면에 입력된 정보를 저장한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public List<Map<String, Object>> saveCancelOwnExpense(Map<String, Object> map) throws Exception {
    	return ownExpenseDao.saveCancelOwnExpense(map);
    }
}
