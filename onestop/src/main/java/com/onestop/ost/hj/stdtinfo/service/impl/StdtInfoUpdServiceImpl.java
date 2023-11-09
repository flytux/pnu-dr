package com.onestop.ost.hj.stdtinfo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.hj.stdtinfo.dao.AcctNoUpdDao;
import com.onestop.ost.hj.stdtinfo.dao.StdtInfoUpdDao;
import com.onestop.ost.hj.stdtinfo.service.AcctNoUpdService;
import com.onestop.ost.hj.stdtinfo.service.StdtInfoUpdService;


/**
 * <pre>
 * Class Name: StdtInfoUpdServiceImpl.java
 * Description: 개인정보 수정 ServiceImpl
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 14.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("stdtInfoUpdService")
public class StdtInfoUpdServiceImpl extends CommonServiceImpl implements StdtInfoUpdService{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private StdtInfoUpdDao stdtInfoUpdDao;
    
    /**
     * 개인정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectStdtInfoUpd(Map<String, Object> map) throws Exception {
        return stdtInfoUpdDao.selectStdtInfoUpd(map);
    }

    /**
     * 개인정보를 저장한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveStdtInfoUpd(Map<String, Object> param) throws Exception {
    	Map<String, Object> applyRtnMap = stdtInfoUpdDao.saveStdtInfoUpd(param);
    			
        return param;
    }   
    
    /**
     * EMAIL/SMS 수신여부를 저장한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveAgree(Map<String, Object> param) throws Exception {
    	Map<String, Object> applyRtnMap = stdtInfoUpdDao.saveAgree(param);
    			
        return param;
    }   

}
