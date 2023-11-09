package com.onestop.ost.jolup.degthesissubmitqexam.service.impl;

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
import com.onestop.ost.jolup.degthesissubmitqexam.dao.DegThesisSubmitQexamApplyDao;
import com.onestop.ost.jolup.degthesissubmitqexam.service.DegThesisSubmitQexamApplyService;



/**
 * <pre>
 * Class Name: DegThesisSubmitQexamApplyServiceImpl.java
 * Description: 학위논문자격시험 웹신청 ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("degThesisSubmitQexamApplyService")
public class DegThesisSubmitQexamApplyServiceImpl extends CommonServiceImpl implements DegThesisSubmitQexamApplyService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private DegThesisSubmitQexamApplyDao degThesisSubmitQexamApplyDao;
    
    /**
     * 학적정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtInfo(Map<String, Object> map) throws Exception {
        return degThesisSubmitQexamApplyDao.selectStdtInfo(map);
    }
    
    /**
     * 응시대상과목을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectSubject(Map<String, Object> param) throws Exception {
        return degThesisSubmitQexamApplyDao.selectSubject(param);
    }
    
    /**
     * 응시신청과목을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectApplySubject(Map<String, Object> param) throws Exception {
        return degThesisSubmitQexamApplyDao.selectApplySubject(param);
    }
    
    /**
     * 기합격과목 외국어를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectPassSubject(Map<String, Object> param) throws Exception {
        return degThesisSubmitQexamApplyDao.selectPassSubject(param);
    }
    
    /**
     * 기이수과목을 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> checkPassSubject(List<Map<String, Object>> list) throws Exception {
        Map<String, Object> map = null;
        Map<String, Object> saveRslt = null;
        Map<String, Object> param = new HashMap<String, Object>();
       
		for(int i=0; i<list.size(); i++){ 
			try {
				map = list.get(i);
        		saveRslt = degThesisSubmitQexamApplyDao.checkPassSubject(map); 
        		if(saveRslt.get("O_RSLT").equals("W")) {
        			throw new ExecuteException((String) saveRslt.get("O_MSG"));
        		}
			} catch (NoTransactionException ntex) {
        		return saveRslt;
        	}
		}
        return param;
    }
    
    /**
     * 시험신청
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> excuteSubject(List<Map<String, Object>> list) throws Exception {
        Map<String, Object> map = null;
        Map<String, Object> saveRslt = null;
        Map<String, Object> param = new HashMap<String, Object>();
       
		for(int i=0; i<list.size(); i++){ 
			map = list.get(i);
    		saveRslt = degThesisSubmitQexamApplyDao.excuteSubject(map); 
		}
        return param;
    }
      
}
