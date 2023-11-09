package com.onestop.ost.kj.teachcourseguide.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.kj.teachcourseguide.dao.TeachCmplFactorMngDao;
import com.onestop.ost.kj.teachcourseguide.service.TeachCmplFactorMngService;

/**
 * <pre>
 * Class Name: TeachCmplFactorMngServiceImpl.java
 * Description: 교직이수요건관리 ServiceImpl
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 18.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("teachCmplFactorMngService")
public class TeachCmplFactorMngServiceImpl extends CommonServiceImpl implements TeachCmplFactorMngService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private TeachCmplFactorMngDao teachCmplFactorMngDao;
    
    @Autowired
    private ComFunctionService comFunctionService;

    /**
     * 교직이수요건관리 화면 대상자 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListTeachCmplFactorMng(Map<String, Object> param) throws Exception {
        return teachCmplFactorMngDao.selectListTeachCmplFactorMng(param);
    }

    /**
     * 교직이수요건관리 화면 신청및이수내역 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListTeachCmplFactorMng2(Map<String, Object> param) throws Exception {
        return teachCmplFactorMngDao.selectListTeachCmplFactorMng2(param);
    }

    /**
     * 교직이수요건관리 화면 대개설내역및신청상자 조회 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListTeachCmplFactorMng3(Map<String, Object> param) throws Exception {
        return teachCmplFactorMngDao.selectListTeachCmplFactorMng3(param);
    }

    /**
     *교직이수요건관리 화면 신청 한다.
     * @param param
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> insertTeachCmplFactorMng(Map<String, Object> param) throws Exception {

    	List<Map<String, Object>> agreeDltInfo = (List<Map<String, Object>>) param.get("agreeDltInfo");
    	
    	if(agreeDltInfo != null && agreeDltInfo.size() > 0) {
    		
    		Map<String, Object> result = comFunctionService.insertAgreeDltInfo(agreeDltInfo); /* 개인정보동의 내용 저장 */

    		if(result != null && "Y".equals(result.get("RESULT_YN")) ) { 
    			
    			/* 정보동의 관련정보를 param에 put */
    			param.put("SYSTEM_GCD", result.get("SYSTEM_GCD"));
    			param.put("CLAUSE_SEQ_NO", result.get("CLAUSE_SEQ_NO"));
    			param.put("CLAUSE_HISTORY_SEQ_NO", result.get("CLAUSE_HISTORY_SEQ_NO"));
    			param.put("CLAUSE_AGREE_SEQ_NO", result.get("CLAUSE_AGREE_SEQ_NO"));
    		}
    		
    		param.put("agreeDltInfo", "");
    	}
        return teachCmplFactorMngDao.insertTeachCmplFactorMng(param);
    }

    /**
     *교직이수요건관리 화면 신청취소 한다.
     * @param param
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> deleteTeachCmplFactorMng(Map<String, Object> param) throws Exception {
        return teachCmplFactorMngDao.deleteTeachCmplFactorMng(param);
    }
    
    /**
     *교직이수요건관리 화면 항목별점수 조회 한다.
     * @param param
     * @return
     * @throws Exception
     */
	@Override
	public Map<String, Object> selectListTeachCmplFactorMngPop(Map<String, Object> param) throws Exception {
        return teachCmplFactorMngDao.selectListTeachCmplFactorMngPop(param);
	}
    
}
    
