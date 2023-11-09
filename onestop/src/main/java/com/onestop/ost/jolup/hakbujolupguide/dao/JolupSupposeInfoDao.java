package com.onestop.ost.jolup.hakbujolupguide.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: JolupSupposeInfoDao.java
 * Description: 졸업예정정보 Dao Class
 * </pre>
 * 
 * @author 심진용
 * @since 2022. 3. 2.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class JolupSupposeInfoDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "ost.jolup.hakjukbujolupguide.jolupsupposeInfo.";
    
    /**
     * Database로 부터 작성된 사정기분별 졸업예정정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJolupSupposeInfo(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListJolupSupposeInfo", param);
    }
    
    public Map<String, Object> stdtJolupInfo(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "stdtJolupInfo", param);
    }
    
    public List<Map<String, Object>> hakjukList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "hakjukList", param);
    }
    
    
    public List<Map<String, Object>> subjGbnList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "subjGbnList", param);
    }
    
    public List<Map<String, Object>> mandatorySubjList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "mandatorySubjList", param);
    }
    
    public List<Map<String, Object>> cultureChoiceList1(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "cultureChoiceList1", param);
    }
    
    public List<Map<String, Object>> cultureChoiceList2(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "cultureChoiceList2", param);
    }
    
    public List<Map<String, Object>> cultureChoiceList3(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "cultureChoiceList3", param);
    }
    
    public List<Map<String, Object>> majorList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "majorList", param);
    }
    
    public List<Map<String, Object>> jolupReqList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "jolupReqList", param);
    }
    
    
    
}
