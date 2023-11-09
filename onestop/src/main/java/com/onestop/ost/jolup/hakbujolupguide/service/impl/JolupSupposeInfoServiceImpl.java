package com.onestop.ost.jolup.hakbujolupguide.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.jolup.hakbujolupguide.dao.JolupSupposeInfoDao;
import com.onestop.ost.jolup.hakbujolupguide.service.JolupSupposeInfoService;

/**
 * <pre>
 * Class Name: JolupSupposeInfoServiceImpl.java
 * Description: 졸업예정정보 ServiceImpl
 * </pre>
 * 
 * @author 심진용
 * @since 2022. 3. 2.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("jolupSupposeInfoService")
public class JolupSupposeInfoServiceImpl extends CommonServiceImpl implements JolupSupposeInfoService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private JolupSupposeInfoDao jolupSupposeInfoDao;

    /**
     * 작성된 사정기분별 졸업예정정보를 조회한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectListJolupSupposeInfo(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.selectListJolupSupposeInfo(param);
    }
    
    public Map<String, Object> stdtJolupInfo(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.stdtJolupInfo(param);
    }
    
    public List<Map<String, Object>> hakjukList(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.hakjukList(param);
    }
    
    public List<Map<String, Object>> subjGbnList(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.subjGbnList(param);
    }
    
    public List<Map<String, Object>> mandatorySubjList(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.mandatorySubjList(param);
    }
    
    public List<Map<String, Object>> cultureChoiceList1(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.cultureChoiceList1(param);
    }
    
    public List<Map<String, Object>> cultureChoiceList2(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.cultureChoiceList2(param);
    }
    
    public List<Map<String, Object>> cultureChoiceList3(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.cultureChoiceList3(param);
    }
    
    public List<Map<String, Object>> majorList(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.majorList(param);
    }
    
    public List<Map<String, Object>> jolupReqList(Map<String, Object> param) throws Exception {
        return jolupSupposeInfoDao.jolupReqList(param);
    }
    
}
