package com.onestop.ost.md.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.md.dao.MedicalDeductDao;
import com.onestop.ost.md.service.MedicalDeductService;

@Service("medicalDeductService")
public class MedicalDeductServiceImpl extends CommonServiceImpl implements MedicalDeductService {

	@Autowired
    private MedicalDeductDao medicalDeductDao;
    
	/**
     * 급여신청 내역을 조회한다. 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
	public List<Map<String, Object>> payApplyList(Map<String, Object> param) throws Exception {
        return medicalDeductDao.payApplyList(param);
    }
	
	/**
     * 급여신청 상세 내역을 조회한다. 
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
	public Map<String, Object> payApplyDetail(Map<String, Object> param) throws Exception {
        return medicalDeductDao.payApplyDetail(param);
    }
	
	/**
     * 급여신청 상세 내역을 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executePayApplyInfo(Map<String, Object> param) throws Exception{
    	return medicalDeductDao.executePayApplyInfo(param);
    }
	
    /**
     * 환불신청 내역을 조회한다. 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
	public List<Map<String, Object>> refundApplyList(Map<String, Object> param) throws Exception {
        return medicalDeductDao.refundApplyList(param);
    }
	
	/**
     * 환불신청 정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeRefundApplyInfo(Map<String, Object> param) throws Exception{
    	return medicalDeductDao.executeRefundApplyInfo(param);
    }
}
