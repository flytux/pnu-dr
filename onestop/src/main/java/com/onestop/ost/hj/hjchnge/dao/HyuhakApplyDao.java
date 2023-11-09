package com.onestop.ost.hj.hjchnge.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: HyuhakApplyDao.java
 * Description: 휴학신청 DAO Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 10.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class HyuhakApplyDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.hj.hjchnge.hyuhakApply.";
    
    /**
     * 군입대개월수 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListMilServeBm(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListMilServeBm", param);
    }
    
    
    /**
     * 휴학신청내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListHyuhakApply(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectListHyuhakApply", param);
    }
    
    /**
     * 휴학신청 수정, 삭제 가능여부를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectHyuhakPosibleYn(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectHyuhakPosibleYn", param);
    }
    
    /**
     * 휴학신청을 저장한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> executeHyuhakApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeHyuhakApply", param);
    }


}
