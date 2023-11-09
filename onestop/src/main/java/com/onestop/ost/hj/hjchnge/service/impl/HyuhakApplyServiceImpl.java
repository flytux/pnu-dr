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
import com.onestop.ost.hj.hjchnge.dao.HyuhakApplyDao;
import com.onestop.ost.hj.hjchnge.service.HyuhakApplyService;

/**
 * <pre>
 * Class Name: HyuhakApplyServiceImpl.java
 * Description: 휴학신청 ServiceImpl
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 10.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("hyuhakApplyService")
public class HyuhakApplyServiceImpl extends CommonServiceImpl implements HyuhakApplyService {
    @Autowired
    MessageSource localeMessageSource;
    
    @Autowired
    private ComFunctionService comFunctionService;

    @Autowired
    private HyuhakApplyDao hyuhakApplyDao;    
    
    
    /**
     * 군입대개월수 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListMilServeBm(Map<String, Object> param) throws Exception {
        return hyuhakApplyDao.selectListMilServeBm(param);
    }

    /**
     * 휴학신청내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListHyuhakApply(Map<String, Object> param) throws Exception {
        return hyuhakApplyDao.selectListHyuhakApply(param);
    }
    
    /**
     * 휴학신청 수정, 삭제 가능여부를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectHyuhakPosibleYn(Map<String, Object> param) throws Exception {
        return hyuhakApplyDao.selectHyuhakPosibleYn(param);
    }
    
    /**
     * 휴학신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional 
    public Map<String, Object> executeHyuhakApply(Map<String, Object> param) throws Exception {
    	
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
    			
    	    	Map<String, Object> applyRtnMap = hyuhakApplyDao.executeHyuhakApply(param);
    			
    	    	param.put("O_RSLT", applyRtnMap.get("O_RSLT"));
    	    	param.put("O_MSG", applyRtnMap.get("O_MSG"));
    		}
    	}else if(rowState.equals("U") || rowState.equals("D")){
    		Map<String, Object> applyRtnMap = hyuhakApplyDao.executeHyuhakApply(param);
			param.put("AGREE_KOR_CONTENT", "");
			
	    	param.put("O_RSLT", applyRtnMap.get("O_RSLT"));
	    	param.put("O_MSG", applyRtnMap.get("O_MSG"));
    	}
    	
        return param;
    }

}
