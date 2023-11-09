package com.onestop.ost.jolup.hakbujolupguide.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.jolup.hakbujolupguide.dao.JolupFactorCriteriaSearchDao;
import com.onestop.ost.jolup.hakbujolupguide.service.JolupFactorCriteriaSearchService;



/**
 * <pre>
 * Class Name: JolupFactorCriteriaSearchServiceImpl.java
 * Description: 졸업요건기준 및 충족여부 ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 04.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("jolupFactorCriteriaSearchService")
public class JolupFactorCriteriaSearchServiceImpl extends CommonServiceImpl implements JolupFactorCriteriaSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private JolupFactorCriteriaSearchDao jolupFactorCriteriaSearchDao;
    
    /**
     * 졸업요건기준 및 충족여부를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectJolupFactor(Map<String, Object> param) throws Exception {
    	
        return jolupFactorCriteriaSearchDao.selectJolupFactor(param);
    }

    /**
     * 졸업요건기준 및 충족여부 개인정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public  Map<String, Object> selectJolupStdtInfo(Map<String, Object> param) throws Exception {
        return jolupFactorCriteriaSearchDao.selectJolupStdtInfo(param);
    }

}
