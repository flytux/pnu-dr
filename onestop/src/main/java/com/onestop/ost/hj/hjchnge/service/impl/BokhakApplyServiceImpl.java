package com.onestop.ost.hj.hjchnge.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.hj.hjchnge.dao.BokhakApplyDao;
import com.onestop.ost.hj.hjchnge.service.BokhakApplyService;

/**
 * <pre>
 * Class Name: BokhakApplyServiceImpl.java
 * Description: 복학신청 ServiceImpl
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 16.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("bokhakApplyService")
public class BokhakApplyServiceImpl extends CommonServiceImpl implements BokhakApplyService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private BokhakApplyDao bokhakApplyDao;    

    /**
     * 휴학신청내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListBokhakApply(Map<String, Object> param) throws Exception {
        return bokhakApplyDao.selectListBokhakApply(param);
    }
    
    /**
     * 휴학신청 수정, 삭제 가능여부를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectBokhakPosibleYn(Map<String, Object> param) throws Exception {
        return bokhakApplyDao.selectBokhakPosibleYn(param);
    }
    
    /**
     * 휴학신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional 
    public Map<String, Object> executeBokhakApply(Map<String, Object> param) throws Exception {
        return  bokhakApplyDao.executeBokhakApply(param);
    }

}
