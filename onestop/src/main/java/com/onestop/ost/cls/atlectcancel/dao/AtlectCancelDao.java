package com.onestop.ost.cls.atlectcancel.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: AtlectCancelDao.java
 * Description: 수강취소 DAO Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class AtlectCancelDao extends CommonComnDao {
	
    private static final String SQLNAMESPACE = "ost.cls.atlectcancel.atlectcancel.";
    
    /**
     * Database로 부터 기준학년도,학기, 학사학위추득 유예여부를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchCurcStdtYear(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchCurcStdtYear", param);
    }
    
    /**
     * Database로 부터 수강신청학점, 수강신청과목수를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchLecApplyCrdtCnt(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchLecApplyCrdtCnt", param);
    }
    
    /**
     * Database로 부터 수강취소학점, 수강취소과목수를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchLecCancelCrdtCnt(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchLecCancelCrdtCnt", param);
    }
    
    /**
     * Database로 부터 수강취소 및 환불일정 학사일정을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchCancelSchdChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchCancelSchdChk", param);
    }
    
    /**
     * Database로 부터 수강취소 및 환불일정 계절학기 학사일정을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchCancelSeaSchdChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchCancelSeaSchdChk", param);
    }
    
    /**
     * Database로 부터 수강취소 환불일정을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchRefundSchdInfo(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchRefundSchdInfo", param);
    }
    
    /**
     * Database로 부터 수강취소 대상자를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchCancelSubjectChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchCancelSubjectChk", param);
    }
    
    /**
     * Database로 부터 정규학기 수강신청과목 선택을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelSubjectChkRegularList(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "searchCancelSubjectChkRegularList", param);
    }
    
    /**
     * Database로 부터 계절학기 수강신청과목 선택을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelSubjectChkSeasonList(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "searchCancelSubjectChkSeasonList", param);
    }
    
    /**
     * Database로 부터 정규학기 수강취소신청과목을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelSubjectApplyRegularList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchCancelSubjectApplyRegularList", param);
    }
    
    /**
     * Database로 부터 계절학기 수강취소신청과목을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelSubjectApplySeasonList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchCancelSubjectApplySeasonList", param);
    }
    //////////////
    /**
     * Database로 부터 정규학기 수강취소 및 환불처리 진행상황을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelRefundProgressRegularList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchCancelRefundProgressRegularList", param);
    }
    
    /**
     * Database로 부터 계절학기 수강취소 및 환불처리 진행상황을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelRefundProgressSeasonList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchCancelRefundProgressSeasonList", param);
    }
    
    /**
     * Database로 부터 계절학기 수강취소 및 환불처리 완료된 과목을 조회한다. 
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> searchCancelRefundCompleteList(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "searchCancelRefundCompleteList", param);
    }
    
    /**
     * Database로 부터 수강신청한 학생의 학생구분코드를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectStdtGcd(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "selectStdtGcd", param);
    }
    
    /**
     * Database로 부터 정규학기 수강취소 전 신청가능여부를 체크한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectRegularSubjectCancelChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "selectRegularSubjectCancelChk", param);
    }
    
    /**
     * Database로 부터 정규학기 수강취소신청을 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveRegularSubjectCancel(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveRegularSubjectCancel", param);
    }
    
    /**
     * Database로 부터 정규학기 학생 승인확인가능일시를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchApprConfDt(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchApprConfDt", param);
    }
    
    /**
     * Database로 부터 정규학기 수강취소신청을 삭제한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveRegularCancelApplyDelete(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveRegularCancelApplyDelete", param);
    }
    
    /**
     * Database로 부터 계절학기 수강취소 전 대상자인지 체크한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchSeasonCancelSubjectChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchSeasonCancelSubjectChk", param);
    }
    
    /**
     * Database로 부터 계절학기 수강취소 삭제 전 대상자인지 체크한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> searchSeasonCancelSubjectDeleteChk(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "searchSeasonCancelSubjectDeleteChk", param);
    }
    
    /**
     * Database로 부터 계절학기 수강취소신청을 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveSeasonSubjectCancel(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveSeasonSubjectCancel", param);
    }
    
    /**
     * Database로 부터 계절학기 수강취소신청을 삭제한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveSeasonCancelApplyDelete(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveSeasonCancelApplyDelete", param);
    }
}
