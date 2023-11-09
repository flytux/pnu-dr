package com.onestop.ost.vote.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.vote.dao.RealTimeVoteDao;
import com.onestop.ost.vote.service.RealTimeVoteService;


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
@Service("realTimeVoteService")
public class RealTimeVoteImpl extends CommonServiceImpl implements RealTimeVoteService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private RealTimeVoteDao realTimeVoteDao;
    
    @Autowired
    private ComFunctionService comFunctionService;
    
    /**
     * 신청가능년도학기를 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> serviceTerm(Map<String, Object> param) throws Exception {
        return realTimeVoteDao.serviceTerm(param);
    }
}
