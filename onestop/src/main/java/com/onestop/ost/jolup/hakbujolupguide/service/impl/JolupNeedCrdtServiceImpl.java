package com.onestop.ost.jolup.hakbujolupguide.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.jolup.hakbujolupguide.dao.JolupNeedCrdtDao;
import com.onestop.ost.jolup.hakbujolupguide.service.JolupNeedCrdtService;



/**
 * <pre>
 * Class Name: JolupNeedCrdtServiceImpl.java
 * Description: 졸업소요학점ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("jolupNeedCrdtService")
public class JolupNeedCrdtServiceImpl extends CommonServiceImpl implements JolupNeedCrdtService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private JolupNeedCrdtDao jolupNeedCrdtDao;
    
    /**
     * 해당학년도에 해당하는 학과를 조회한다.  - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectDept(Map<String, Object> param) throws Exception {
        return jolupNeedCrdtDao.selectDept(param);
    }
    
    /**
     * 졸업소요학점을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectSOYO(Map<String, Object> param) throws Exception {
        return jolupNeedCrdtDao.selectSOYO(param);
    }
    
    /**
     * 교양선택 영역별 소요학점을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectCult(Map<String, Object> param) throws Exception {
        return jolupNeedCrdtDao.selectCult(param);
    }
    
}
