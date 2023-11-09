package com.onestop.ost.hj.hjchnge.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: BokhakApplyDao.java
 * Description: 복학신청 DAO Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 16.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class BokhakApplyDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.hj.hjchnge.bokhakApply.";
    
    
    /**
     * 복학신청내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListBokhakApply(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectListBokhakApply", param);
    }
    
    /**
     * 복학신청가능여부를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectBokhakPosibleYn(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectBokhakPosibleYn", param);
    }
    
    /**
     * 복학신청을 저장한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> executeBokhakApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeBokhakApply", param);
    }


}
