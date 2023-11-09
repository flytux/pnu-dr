package com.onestop.ost.cls.atlectmanual.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.atlectmanual.dao.AtlectManualDao;
import com.onestop.ost.cls.atlectmanual.dao.ExunivStdtAtlectManualDao;
import com.onestop.ost.cls.atlectmanual.service.AtlectManualService;
import com.onestop.ost.cls.atlectmanual.service.ExunivStdtAtlectManualService;

/**
 * <pre>
 * Class Name: ExunivStdtAtlectManualServiceImpl.java
 * Description: 타대생수강편람 조회 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("exunivStdtAtlectManualService")
public class ExunivStdtAtlectManualServiceImpl extends CommonServiceImpl implements ExunivStdtAtlectManualService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ExunivStdtAtlectManualDao exunivStdtAtlectManualDao;

    /**
     * 타대생수강편람화면의 수강편람을 조회한다. 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectExunivStdtAtlectManual(Map<String, Object> param) throws Exception {
    	return exunivStdtAtlectManualDao.selectExunivStdtAtlectManual(param);
    }

  
    
}
