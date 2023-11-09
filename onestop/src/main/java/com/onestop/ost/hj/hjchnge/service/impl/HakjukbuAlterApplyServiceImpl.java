package com.onestop.ost.hj.hjchnge.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.hj.hjchnge.dao.HakjukbuAlterApplyDao;
import com.onestop.ost.hj.hjchnge.service.HakjukbuAlterApplyService;

/**
 * <pre>
 * Class Name: HakjukbuAlterApplyServiceImpl.java
 * Description: 학적부변경신청 ServiceImpl
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("hakjukbuAlterApplyService")
public class HakjukbuAlterApplyServiceImpl extends CommonServiceImpl implements HakjukbuAlterApplyService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private HakjukbuAlterApplyDao hakjukbuAlterApplyDao;
    
    @Autowired
    private ComFunctionService comFunctionService;
    

    /**
     * 학생정보, 정정신청 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListHakjukbuAlterApply(Map<String, Object> param) throws Exception {
        return hakjukbuAlterApplyDao.selectListHakjukbuAlterApply(param);
    }
    
    /**
     * 정정신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional /* 트랜잭션 처리를 위해 transactional 선언 */
    public Map<String, Object> executeHakjukbuAlterApply(Map<String, Object> param) throws Exception {
    	
    	List<Map<String, Object>> agreeDltInfo = (List<Map<String, Object>>) param.get("agreeDltInfo");
    	String rowState = IUtility.parseNull(param.get("rowState"));
    	if(agreeDltInfo != null && agreeDltInfo.size() > 0 ) {
    		Map<String, Object> result = comFunctionService.insertAgreeDltInfo(agreeDltInfo); /* 개인정보동의 내용 저장 */

    		if(result != null && "Y".equals(result.get("RESULT_YN")) ) { 
    			
    			/* 정보동의 관련정보를 param에 put */
    			param.put("SYSTEM_GCD", result.get("SYSTEM_GCD"));
    			param.put("CLAUSE_SEQ_NO", result.get("CLAUSE_SEQ_NO"));
    			param.put("CLAUSE_HISTORY_SEQ_NO", result.get("CLAUSE_HISTORY_SEQ_NO"));
    			param.put("CLAUSE_AGREE_SEQ_NO", result.get("CLAUSE_AGREE_SEQ_NO"));
    			param.put("agreeDltInfo", ""); //오류나서 '' 처리 , agreeDltInfo 이후 필요없음
    			
    	    	Map<String, Object> applyRtnMap = hakjukbuAlterApplyDao.executeHakjukbuAlterApply(param);
    			
    	    	param.put("O_RSLT", applyRtnMap.get("O_RSLT"));
    	    	param.put("O_MSG", applyRtnMap.get("O_MSG"));
    		}
    	}else if(rowState.equals("U")){
    		Map<String, Object> applyRtnMap = hakjukbuAlterApplyDao.executeHakjukbuAlterApply(param);
			param.put("AGREE_KOR_CONTENT", "");
			
	    	param.put("O_RSLT", applyRtnMap.get("O_RSLT"));
	    	param.put("O_MSG", applyRtnMap.get("O_MSG"));
    	}
        return param;
    }

}
