package com.onestop.ost.md.service;

import java.util.List;
import java.util.Map;

public interface MedicalDeductService {

	
	/**
     * 급여신청 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> payApplyList(Map<String, Object> map) throws Exception;
    
    /**
     * 급여신청 상세 내역을 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> payApplyDetail(Map<String, Object> map) throws Exception;
    
    /**
     * 급여신청 상세 내역을 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executePayApplyInfo(Map<String, Object> param) throws Exception;
    
    /**
     * 환불신청 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> refundApplyList(Map<String, Object> map) throws Exception;
    
    
    /**
     * 환불신청 정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeRefundApplyInfo(Map<String, Object> param) throws Exception;
    
}
