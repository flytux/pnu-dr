package com.onestop.ost.cls.subjApplyInvstgt.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: SclassApplyInvstgtDao.java
 * Description: 계절수업 수요조사 DAO Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 24.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class SclassApplyInvstgtDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.subjApplyInvstgt.sclassApplyInvstgt.";
    
    /**
     * 내가 신청한 계절수업 개설신청 교과목 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListApplySubj(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListApplySubj", param);
    }   
    
    /**
     * 계절수업 수요조사 교과목 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSclassSubj(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectListSclassSubj", param);
    }
    
    /**
     * 계절수업 수요조사 교과목을 저장한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> executeSubjApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeSubjApply", param);
    }

    
    /**
     * 순위별 계절수업 수요조사 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSclassSubjRank(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListSclassSubjRank", param);
    }
}
