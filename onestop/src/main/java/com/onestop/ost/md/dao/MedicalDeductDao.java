package com.onestop.ost.md.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

@Repository
public class MedicalDeductDao extends CommonComnDao{
	private static final String SQLNAMESPACE = "ost.md.medicaldeduct.";
	
	/**
     * 급여신청내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> payApplyList(Map<String, Object> param) throws Exception{
        return selectQuery(SQLNAMESPACE + "payApplyList", param);
    }
    
    /**
     * 급여신청 상세 내역을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> payApplyDetail(Map<String, Object> param) throws Exception{
        return selectQueryMap(SQLNAMESPACE + "payApplyDetail", param);
    }
    
    
    /**
     * 급여신청 상세 내역을 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executePayApplyInfo(Map<String, Object> param) throws Exception{
        return executeQuery(SQLNAMESPACE + "executePayApplyInfo", param);
    }
    
    /**
     * 환불신청내역을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> refundApplyList(Map<String, Object> param) throws Exception{
        return selectQuery(SQLNAMESPACE + "refundApplyList", param);
    }
    
    /**
     * 환불신청 정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeRefundApplyInfo(Map<String, Object> param) throws Exception{
        return executeQuery(SQLNAMESPACE + "executeRefundApplyInfo", param);
    }
}
