package com.onestop.common.sample.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.common.sample.dao.SampleDao;
import com.onestop.common.sample.service.SampleService;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.service.CommonServiceImpl;

/**
 * <pre>
 * Class Name: SampleImpl.java
 * Description: 관리 ServiceImpl
 * </pre>
 * 
 * @author 서혁성
 * @since 2021. 12. 09.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("SampleService")
public class SampleServiceImpl extends CommonServiceImpl implements SampleService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private SampleDao sampleDao;
    
    @Autowired
    private ComFunctionService comFunctionService;

    /**
     * 샘플에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> sample1SelectList(Map<String, Object> param) throws Exception {
        return sampleDao.sample1SelectList(param);
    }
    
    @Override
    public Map<String, Object> saveSampleInfo(Map<String, Object> param) throws Exception {

    	String rowState = IUtility.parseNull(param.get("rowState"));
    	String rowStateStr = "";

    	if (rowState.equals("C")){
    		sampleDao.saveSampleInfo(param);
    		rowStateStr = "저장";
    	} else if (rowState.equals("U")){
    		sampleDao.updateSampleInfo(param);
    		rowStateStr = "수정";
    	} else if (rowState.equals("D")){
    		sampleDao.deleteSampleInfo(param);
    		rowStateStr = "삭제";
    	}
    	param.put("msg", "정상적으로 "+rowStateStr+" 되었습니다.");
    	
        return param;
    }

    @Override
    @Transactional /* 트랜잭션 처리를 위해 transactional 선언 */
    public Map<String, Object> _saveSampleInfo(Map<String, Object> param) throws Exception {

    	List<Map<String, Object>> agreeDltInfo = (List<Map<String, Object>>) param.get("agreeDltInfo");
    	
    	if(agreeDltInfo != null && agreeDltInfo.size() > 0) {
    		
    		Map<String, Object> result = comFunctionService.insertAgreeDltInfo(agreeDltInfo); /* 개인정보동의 내용 저장 */

    		if(result != null && "Y".equals(result.get("RESULT_YN")) ) { 
    			
    			/* 정보동의 관련정보를 param에 put */
    			param.put("SYSTEM_GCD", result.get("SYSTEM_GCD"));
    			param.put("CLAUSE_SEQ_NO", result.get("CLAUSE_SEQ_NO"));
    			param.put("CLAUSE_HISTORY_SEQ_NO", result.get("CLAUSE_HISTORY_SEQ_NO"));
    			param.put("CLAUSE_AGREE_SEQ_NO", result.get("CLAUSE_AGREE_SEQ_NO"));
    			
    			String rowState = IUtility.parseNull(param.get("rowState"));
    	    	String rowStateStr = "";

    	    	if (rowState.equals("C")){
    	    		sampleDao.saveSampleInfo(param);
    	    		rowStateStr = "저장";
    	    	} else if (rowState.equals("U")){
    	    		sampleDao.updateSampleInfo(param);
    	    		rowStateStr = "수정";
    	    	} else if (rowState.equals("D")){
    	    		sampleDao.deleteSampleInfo(param);
    	    		rowStateStr = "삭제";
    	    	}
    	    	param.put("msg", "정상적으로 "+rowStateStr+" 되었습니다.");
    		}
    	}
        return param;
    }
    
}
