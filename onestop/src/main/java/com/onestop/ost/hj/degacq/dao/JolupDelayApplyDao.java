package com.onestop.ost.hj.degacq.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: JolupDelayApplyDao.java
 * Description: 학사학위취득유예신청 Dao Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class JolupDelayApplyDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "ost.hj.degacq.JolupDelayApply.";
    
    /**
     * Database로 부터 학사학위취득유예신청목록 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJolupDelayApply(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListJolupDelayApply", param);
    }
    
    /**
     * Database로 부터 신청가능여부 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public  Map<String, Object> selectChkApply(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectChkApply", param);
    }
    
    /**
     * 학사학위취득유예신청을 저장 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeJolupDelayApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeJolupDelayApply", param);
    }
    
    /**
     * Database로 부터 신청가능기간여부 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public  Map<String, Object> selectChkSchd(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectChkSchd", param);
    }
    
    /**
     * Database로 부터 인터넷 성적증명서 발급 번호 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSjCertDocuIssueNo(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListSjCertDocuIssueNo", param);
    }
    
    
}
