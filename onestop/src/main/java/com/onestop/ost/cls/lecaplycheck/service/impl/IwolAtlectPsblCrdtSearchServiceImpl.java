package com.onestop.ost.cls.lecaplycheck.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.lecaplycheck.dao.IwolAtlectPsblCrdtSearchDao;
import com.onestop.ost.cls.lecaplycheck.service.IwolAtlectPsblCrdtSearchService;
import com.onestop.ost.hj.stdtinfo.dao.AcctNoUpdDao;
import com.onestop.ost.hj.stdtinfo.dao.StdtInfoUpdDao;
import com.onestop.ost.hj.stdtinfo.service.AcctNoUpdService;
import com.onestop.ost.hj.stdtinfo.service.StdtInfoUpdService;


/**
 * <pre>
 * Class Name: IwolAtlectPsblCrdtSearchServiceImpl.java
 * Description: 학점이월제 수강가능학점 조회 ServiceImpl
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("iwolAtlectPsblCrdtSearchService")
public class IwolAtlectPsblCrdtSearchServiceImpl extends CommonServiceImpl implements IwolAtlectPsblCrdtSearchService{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private IwolAtlectPsblCrdtSearchDao iwolAtlectPsblCrdtSearchDao;
    
    /**
     * 학점이월제 수강가능학점을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectIwolAtlectPsblCrdtSearch(Map<String, Object> map) throws Exception {
        return iwolAtlectPsblCrdtSearchDao.selectIwolAtlectPsblCrdtSearch(map);
    }





}
