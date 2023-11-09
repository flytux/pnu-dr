package com.onestop.ost.hj.hjchnge.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.hj.hjchnge.dao.MltiMajorApplyDao;
import com.onestop.ost.hj.hjchnge.service.MltiMajorApplyService;

/**
 * <pre>
 * Class Name: MltiMajorApplyServiceImpl.java
 * Description: 다중전공신청 ServiceImpl Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 9.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("mltiMajorApplyService")
public class MltiMajorApplyServiceImpl extends CommonServiceImpl implements MltiMajorApplyService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private MltiMajorApplyDao mltiMajorApplyDao;

    /**
     * 다중전공신청 화면 다중전공신청내역목록 조회를 한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListMltiMajorApply(Map<String, Object> param) throws Exception {
        return mltiMajorApplyDao.selectListMltiMajorApply(param);
    }
    
    /**
     * 다중전공신청 화면 신청가능기간여부체크를 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectChkSchd(Map<String, Object> param) throws Exception {
        return mltiMajorApplyDao.selectChkSchd(param);
    }
    
    /**
     * 다중전공신청 화면 신청가능여부체크를 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectChkApply(Map<String, Object> param) throws Exception {
        return mltiMajorApplyDao.selectChkApply(param);
    }
    

    /**
     * 다중전공신청을 저장 한다.
     * @param param
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> executeMltiMajorApply(Map<String, Object> param) throws Exception {
        return mltiMajorApplyDao.executeMltiMajorApply(param);
    }
}