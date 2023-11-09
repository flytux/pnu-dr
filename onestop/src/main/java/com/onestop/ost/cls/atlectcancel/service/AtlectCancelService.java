package com.onestop.ost.cls.atlectcancel.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: AtlectCancelService.java
 * Description: 수강취소 Service Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface AtlectCancelService {
	
	 /**
     * 기준학년도,학기, 학사학위추득 유예여부를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchCurcStdtYear(Map<String, Object> param)throws Exception;
	
	 /**
     * 수강신청학점, 수강신청과목수를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchLecApplyCrdtCnt(Map<String, Object> param)throws Exception;
    
    /**
     * 수강취소학점, 수강취소과목수를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchLecCancelCrdtCnt(Map<String, Object> param)throws Exception;
    
    /**
     * 수강취소 및 환불일정 학사일정을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchCancelSchdChk(Map<String, Object> param)throws Exception;
    
    /**
     * 수강취소 환불일정을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchRefundSchdInfo(Map<String, Object> param)throws Exception;
    
    /**
     * 수강취소 대상자를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchCancelSubjectChk(Map<String, Object> param)throws Exception;
    
    /**
     * 수강신청과목 선택을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelSubjectChkList(Map<String, Object> param)throws Exception;
    
    /**
     * 수강취소신청과목을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelSubjectApplyList(Map<String, Object> param)throws Exception;
    
    /**
     * 수강취소 및 환불처리 진행상황을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelRefundProgressList(Map<String, Object> param)throws Exception;
    
    /**
     * 수강취소 및 환불처리 완료된 과목을 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelRefundCompleteList(Map<String, Object> param)throws Exception;
    
    /**
     * 수강신청한 학생의 학생구분코드를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectStdtGcd(Map<String, Object> param)throws Exception;
    
    /**
     * 정규학기 수강취소 전 신청가능여부를 체크한다.
     * @param list
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectRegularSubjectCancelChk(List<Map<String, Object>> list)throws Exception;
    
    /**
     * 정규학기 수강취소신청을 저장한다.
     * @param list
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveRegularSubjectCancel(List<Map<String, Object>> list)throws Exception;
    
    /**
     * 정규학기 학생 승인확인가능일시를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchApprConfDt(Map<String, Object> param)throws Exception;
    
    /**
     * 정규학기 수강취소신청을 삭제한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveRegularCancelApplyDelete(Map<String, Object> param)throws Exception;
    
    /**
     * 계절학기 수강취소 전 대상자인지 체크한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchSeasonCancelSubjectChk(Map<String, Object> param)throws Exception;
    
    /**
     * 계절학기 수강취소 삭제 전 대상자인지 체크한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> searchSeasonCancelSubjectDeleteChk(Map<String, Object> param)throws Exception;
    
    /**
     * 계절학기 수강취소신청을 저장한다.
     * @param list
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveSeasonSubjectCancel(List<Map<String, Object>> list)throws Exception;
    
    /**
     * 계절학기 수강취소신청을 삭제한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveSeasonCancelApplyDelete(Map<String, Object> param)throws Exception;
}
