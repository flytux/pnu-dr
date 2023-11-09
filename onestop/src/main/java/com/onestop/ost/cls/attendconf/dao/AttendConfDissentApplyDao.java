package com.onestop.ost.cls.attendconf.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: AttendConfDissentApplyDao.java
 * Description: 출결확인 및 이의신청 DAO Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class AttendConfDissentApplyDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.attendconf.attendConfDissentApply.";
    
    /**
     * 출결 이의신청 내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListAttDisApply(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectListAttDisApply", param);
    } 
    
    /**
     * 학사일정을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectSchdInfo(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectSchdInfo", param);
    }   
    
    /**
     * 출결 이의신청을 삭제한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> deleteDissentApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "deleteDissentApply", param);
    }
    
    /**
     * 수강신청 교과목 내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListApplySubj(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectListApplySubj", param);
    }
    
    /**
     * 출결사항 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListAttend(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectListAttend", param);
    }
    
    /**
     * 출결 이의신청을 입력한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> insertDissentApply(Map<String, Object> param) throws Exception {
        return insertQuery(SQLNAMESPACE + "insertDissentApply", param);
    }
}
