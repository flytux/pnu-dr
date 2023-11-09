package com.onestop.ost.cls.attendconf.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: AttendAcceptApplyDao.java
 * Description: 출석인정신청 DAO Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class AttendAcceptApplyDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.attendconf.attendacceptapply.";

    /**
     * Database로 부터 출석인정신청에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectAttendAcceptApply(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectAttendAcceptApply", param);
    }

    /**
     * Database로 부터 출석인정신청에 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLecApply(Map<String, Object> param) throws Exception {
    	return listPaging(SQLNAMESPACE + "selectLecApply", param);
    }
  
    /**
     * Database로 부터 학사일정을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLecDate(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "selectLecDate", map);
    }

    /**
     * Database로 부터 신청내역을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public int saveAttendAcceptApply(Map<String, Object> param) throws Exception {
        return insert(SQLNAMESPACE + "saveAttendAcceptApply", param);
    }    
    
    /**
     * 출석인정 신청을 저장한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public int saveLecApply(Map<String, Object> param) throws Exception {
        return insert(SQLNAMESPACE + "saveLecApply", param);
    }   
    
    /**
     * Database로 부터 개인정보 동의 정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveClause(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveClause", param);
    }        
    
}
