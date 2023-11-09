package com.onestop.ost.jolup.hakbujolupguide.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.jolup.hakbujolupguide.dao.JolupEvaltnResultDao;
import com.onestop.ost.jolup.hakbujolupguide.service.JolupEvaltnResultService;

/**
 * <pre>
 * Class Name: JolupEvaltnResultServiceImpl.java
 * Description: 졸업사정결과 ServiceImpl
 * </pre>
 * 
 * @author 심진용
 * @since 2022. 3. 8.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("jolupEvaltnResultService")
public class JolupEvaltnResultServiceImpl extends CommonServiceImpl implements JolupEvaltnResultService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private JolupEvaltnResultDao jolupEvaltnResultDao;

    /**
     * 작성된 사정기분별 졸업예정정보를 조회한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListJolupEvaltnResult(Map<String, Object> param) throws Exception {
        return jolupEvaltnResultDao.selectListJolupEvaltnResult(param);
    }
}
