package com.onestop.common.sample.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: SampleDao.java
 * Description: 샘플 DAO Class
 * </pre>
 * 
 * @author 서혁성
 * @since 2021. 12. 09.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class SampleDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "common.sample.";

    /**
     * Database로 부터 샘플 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> sample1SelectList(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "sample1SelectList", param);
    }
    
    public int saveSampleInfo(Map<String, Object> param) throws Exception {
        return insert(SQLNAMESPACE + "executeSampleInfo", param);
    }
    
    public int updateSampleInfo(Map<String, Object> param) throws Exception {
        return update(SQLNAMESPACE + "executeSampleInfo", param);
    }
    
    public int deleteSampleInfo(Map<String, Object> param) throws Exception {
        return delete(SQLNAMESPACE + "executeSampleInfo", param);
    }
}
