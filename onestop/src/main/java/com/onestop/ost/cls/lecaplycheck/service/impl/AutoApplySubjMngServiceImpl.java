package com.onestop.ost.cls.lecaplycheck.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.lecaplycheck.dao.AutoApplySubjMngDao;
import com.onestop.ost.cls.lecaplycheck.service.AutoApplySubjMngService;

/**
 * <pre>
 * Class Name: AutoApplySubjMngServiceImpl.java
 * Description: 자동신청교과목 확인 및 삭제 ServiceImpl
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 17.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("autoApplySubjMngService")
public class AutoApplySubjMngServiceImpl extends CommonServiceImpl implements AutoApplySubjMngService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private AutoApplySubjMngDao autoApplySubjMngDao;
    
    /**
     * 수강신청 학사일정을 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchClsSchdChk(Map<String, Object> param) throws Exception {
        return autoApplySubjMngDao.searchClsSchdChk(param);
    }
    
    /**
     * 자동신청결과확인 학사일정을 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchAutoClsSchdChk(Map<String, Object> param) throws Exception {
        return autoApplySubjMngDao.searchAutoClsSchdChk(param);
    }
    
    /**
     * 자동신청교과목 내역을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchAutoApplySubj(Map<String, Object> param) throws Exception {
        return autoApplySubjMngDao.searchAutoApplySubj(param);
    }

    /**
     * 자동신청교과목 삭제 내역을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchAutoApplyCancel(Map<String, Object> param) throws Exception {
        return autoApplySubjMngDao.searchAutoApplyCancel(param);
    }
    
    /**
     * 자동신청교과목을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveAutoApplyCancel(Map<String, Object> map) throws Exception {

        Map<String, Object> param = new HashMap<String, Object>();
        
        autoApplySubjMngDao.saveAutoApplyCancel(map); 

    	param.put("resultYn", "Y");
    	param.put("msg", "정상적으로 삭제 되었습니다.");
    	
        return param;
    }
    
    /**
     * 자동신청교과목 재이수교과목 상세정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchRecmplSubj(Map<String, Object> param) throws Exception {
        return autoApplySubjMngDao.searchRecmplSubj(param);
    }
}
