
package com.onestop.ost.kj.teachcourseguide.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: EduServeActivDao.java
 * Description: 교육봉사활동 Dao Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class EduServeActivDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "ost.kj.teachcourseguide.EduServeActiv.";

    /**
     * Database로 부터 대상자 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListEduServeActiv(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListEduServeActiv", param);
    }

    /**
     * Database로 부터 계획서입력내역 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListEduServePlan(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListEduServePlan", param);
    }

    /**
     * Database로 부터 학점신청 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListEduServePlanCrdt(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListEduServePlanCrdt", param);
    }
    
    /**
     * Database로 부터 교육봉사활동계획신청구분코드 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListEsaItem(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListEsaItem", param);
    }
    
    /**
     * Database로 부터 세부내용 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListPlanDetailSearch(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListPlanDetailSearch", param);
    }
    
    /**
     * 계획서 저장
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executePlan(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executePlan", param);
    }
    
    /**
     * 계획서 삭제
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> deletePlan(Map<String, Object> param) throws Exception {
        return deleteQuery(SQLNAMESPACE + "deletePlan", param);
    }
    
    /**
     * Database로 부터 일지 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListPlanDaylog(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListPlanDaylog", param);
    }
    
    /**
     * 일지 저장
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executePlanDaylog(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executePlanDaylog", param);
    }
    
    /**
     * 일지 삭제
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> deletePlanDaylog(Map<String, Object> param) throws Exception {
        return deleteQuery(SQLNAMESPACE + "deletePlanDaylog", param);
    }
    
    /**
     * 일지 학점신청/취소한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeEduServeActiv(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeEduServeActiv", param);
    }
    
}