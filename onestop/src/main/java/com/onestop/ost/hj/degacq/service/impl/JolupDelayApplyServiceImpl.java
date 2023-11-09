package com.onestop.ost.hj.degacq.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.hj.degacq.dao.JolupDelayApplyDao;
import com.onestop.ost.hj.degacq.service.JolupDelayApplyService;

/**
 * <pre>
 * Class Name: JolupDelayApplyServiceImpl.java
 * Description: 학사학위취득유예신청 ServiceImpl
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("jolupDelayApplyService")
public class JolupDelayApplyServiceImpl extends CommonServiceImpl implements JolupDelayApplyService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private JolupDelayApplyDao jolupDelayApplyDao;

    /**
     * 학사학위취득유예신청 화면 학사학위취득유예신청목록 조회를 한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListJolupDelayApply(Map<String, Object> param) throws Exception {
        return jolupDelayApplyDao.selectListJolupDelayApply(param);
    }
    
    /**
     * 학사학위취득유예신청 화면 신청가능여부체크를 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectChkApply(Map<String, Object> param) throws Exception {
        return jolupDelayApplyDao.selectChkApply(param);
    }

    /**
     *학사학위취득유예신청을 저장 한다.
     * @param param
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> executeJolupDelayApply(Map<String, Object> param) throws Exception {
        return jolupDelayApplyDao.executeJolupDelayApply(param);
    }
    
    /**
     * 학사학위취득유예신청 화면 신청가능기간여부체크를 한다.  관련된 정보를 DAO에서 호출하여 Controller에 Map으로 전달한다.
     * 
     * @param param
     * @return Map<String, Object> 
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectChkSchd(Map<String, Object> param) throws Exception {
        return jolupDelayApplyDao.selectChkSchd(param);
    }

    /**
     * 학사학위취득유예신청 화면 인터넷 성적증명서 발급 번호 조회를 한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListSjCertDocuIssueNo(Map<String, Object> param) throws Exception {
        return jolupDelayApplyDao.selectListSjCertDocuIssueNo(param);
    }
    
    
}
