package com.onestop.ost.hj.hjchnge.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: HakjukbuAlterApplyDao.java
 * Description: 학적부변경신청 DAO Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class HakjukbuAlterApplyDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.hj.hjchnge.hakjukbuAlterApply.";
    
    
    /**
     * 학생정보, 정정신청 내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListHakjukbuAlterApply(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListHakjukbuAlterApply", param);
    }
    
    /**
     * 정정신청을 저장한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> executeHakjukbuAlterApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeHakjukbuAlterApply", param);
    }


}
