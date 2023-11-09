package com.onestop.ost.sep.overseasdispatch.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: ExchgFeeDao.java
 * Description: 교환/교비 DAO Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ExchgFeeDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.sep.overseasdispatch.exchgfee.";
    
    /**
     * Database로 부터 신청가능년도학기를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchSchdYearTerm(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchSchdYearTerm", param);
    }
    
    /**
     * Database로 부터 신청기간을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchSchdChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchSchdChk", param);
    }
    
    /**
     * Database로 부터 해외교환/교비 신청자 정보 조회
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchExchgStdtInfo(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchExchgStdtInfo", param);
    }
    
    /**
     * Database로 부터 해외교환/교비 해외파견 프로그램 참가내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchDispatchApplyList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchDispatchApplyList", param);
    }
    
    /**
     * Database로 부터 해외교환/교비 원어강의 참가 수를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchNativeApplyList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchNativeApplyList", param);
    }
    
    /**
     * Database로 부터 1지망 지원가능대학 목록을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCollList01(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "searchCollList01", map);
    }
    
    /**
     * Database로 부터 2지망 지원가능대학 목록을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCollList02(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "searchCollList02", map);
    }
    
    /**
     * Database로 부터 3지망 지원가능대학 목록을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCollList03(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "searchCollList03", map);
    }
    
    /**
     * Database로 부터 교환/교비 신청정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveExchgFee(Map<String, Object> map) throws Exception{
        return executeQuery(SQLNAMESPACE + "saveExchgFee", map);
    }
    
    /**
     * Database로 부터 교환/교비 신청취소한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> cancelExchgFee(Map<String, Object> map) throws Exception{
        return executeQuery(SQLNAMESPACE + "cancelExchgFee", map);
    }
}
