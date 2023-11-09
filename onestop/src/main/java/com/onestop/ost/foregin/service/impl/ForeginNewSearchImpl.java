package com.onestop.ost.foregin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.foregin.dao.ForeginNewSearchDao;
import com.onestop.ost.foregin.service.ForeginNewSearchService;


/**
 * <pre>
 * Class Name: ExchgFeeServiceImpl.java
 * Description: 교환/교비 ServiceImpl
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("foreginNewSearchService")
public class ForeginNewSearchImpl extends CommonServiceImpl implements ForeginNewSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ForeginNewSearchDao foreginNewSearchDao;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 학생별적용교육과정에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> fnsList(Map<String, Object> param) throws Exception {
        return foreginNewSearchDao.fnsList(param);
    }
    
}
