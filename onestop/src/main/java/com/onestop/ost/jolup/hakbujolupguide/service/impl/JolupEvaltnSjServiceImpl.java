package com.onestop.ost.jolup.hakbujolupguide.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.jolup.hakbujolupguide.dao.JolupEvaltnSjDao;
import com.onestop.ost.jolup.hakbujolupguide.service.JolupEvaltnSjService;
import com.onestop.ost.sj.kp.dao.MiddletermLecevalDao;
import com.onestop.ost.sj.kp.service.MiddletermLecevalService;

/**
 * <pre>
 * Class Name: JolupEvaltnSjlServiceImpl.java
 * Description: 졸업사정용성적표 ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("jolupEvaltnSjService")
public class JolupEvaltnSjServiceImpl extends CommonServiceImpl implements JolupEvaltnSjService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private JolupEvaltnSjDao jolupEvaltnSjDao;
 
    /**
     * 학적신청내역 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectHakjukApply(Map<String, Object> param) throws Exception {
        return jolupEvaltnSjDao.selectHakjukApply(param);
    }
    /**
     * 학적변동내역 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectHakjukChange(Map<String, Object> param) throws Exception {
        return jolupEvaltnSjDao.selectHakjukChange(param);
    }
    /**
     * 수강신청내역 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectLectApply(Map<String, Object> param) throws Exception {
        return jolupEvaltnSjDao.selectLectApply(param);
    }
    /**
     * 성적이수내역 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectSjIsu(Map<String, Object> param) throws Exception {
        return jolupEvaltnSjDao.selectSjIsu(param);
    }
    /**
     * 과목별 성적 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectSubjSj(Map<String, Object> param) throws Exception {
        return jolupEvaltnSjDao.selectSubjSj(param);
    }
}
