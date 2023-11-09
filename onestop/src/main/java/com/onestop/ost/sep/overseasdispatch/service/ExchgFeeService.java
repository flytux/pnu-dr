package com.onestop.ost.sep.overseasdispatch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: ExchgFeeService.java
 * Description: 교환/교비 Service Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface ExchgFeeService {
	
	 /**
     * 신청가능년도학기를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
	public Map<String, Object> searchSchdYearTerm(Map<String, Object> param)throws Exception;
	
	/**
     * 신청기간을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
	public Map<String, Object> searchSchdChk(Map<String, Object> param)throws Exception;
	
	/**
     * 해외교환/교비 신청자 정보 조회
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
	public Map<String, Object> searchExchgStdtInfo(Map<String, Object> param)throws Exception;
	
	/**
     * 해외교환/교비 해외파견 프로그램 참가내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchDispatchApplyList(Map<String, Object> param)throws Exception;
    
    /**
     * 해외교환/교비 원어강의 참가 수를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchNativeApplyList(Map<String, Object> param)throws Exception;
    
    /**
     * 1지망 지원가능대학 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCollList01(Map<String, Object> map) throws Exception;
    
    /**
     * 2지망 지원가능대학 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCollList02(Map<String, Object> map) throws Exception;
    
    /**
     * 3지망 지원가능대학 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCollList03(Map<String, Object> map) throws Exception;
    
    /**
     * 교환/교비 신청정보를 저장한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveExchgFee(Map<String, Object> map) throws Exception;
    
    /**
     * 교환/교비 신청취소한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> cancelExchgFee(Map<String, Object> map) throws Exception;
}
