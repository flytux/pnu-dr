package com.onestop.ost.bus.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: BusApplyDao.java
 * Description: 통학버스 신청 DAO Class
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class BusApplyDao extends CommonComnDao{
	private static final String SQLNAMESPACE = "ost.bus.busapply.";
	
    /**
     * Database로 부터 통학버스 진행학기를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectDateCheck(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "selectDateCheck", map);
    }
    
    /**
     * Database로 부터 통학버스 이용신청을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectBusApply(Map<String, Object> param) throws Exception{
    	return selectQuery(SQLNAMESPACE + "selectBusApply", param);
    }
    
    /**
     * Database로 부터 통학버스 승차시간,장소코드/ 하차시간,장소코드를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectBusCd(Map<String, Object> param) throws Exception{
    	return selectQuery(SQLNAMESPACE + "selectBusCd", param);
    }
    
    /**
     * Database로 부터 통학버스 현재 월의 탑승정보를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMonthApplyList(Map<String, Object> param) throws Exception{
    	return selectQuery(SQLNAMESPACE + "selectMonthApplyList", param);
    }
    
    /**
     * Database로 부터 통학버스 이용신청을 신규,수정 한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> executeBusApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeBusApply", param);
    }
    
    /**
     * Database로 부터 통학버스 이용신청_마스터를 저장 한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> executeBusApplyMaster(Map<String, Object> param) throws Exception {
    	return executeQuery(SQLNAMESPACE + "executeBusApplyMaster", param);
    }
    
    /**
     * Database로 부터 통학버스 이용신청을 삭제 한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> cancelDetailBusApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "cancelDetailBusApply", param);
    }
    public Map<String, Object> cancelBusApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "cancelBusApply", param);
    }
    
    /**
     * Database로 부터 통학버스 이용신청 학생의 사진을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectStdtPhoto(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectStdtPhoto", param);
    }
    
    /**
     * Database로 부터 통학버스 이용신청 학생의 사진을 저장한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public void saveStdtPhoto(Map<String, Object> map) throws Exception {
        executeQuery(SQLNAMESPACE + "saveStdtPhoto", map);
    }
    
    /**
     * Database로 부터 통학버스 고지서 출력가능여부를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> printChkBusApply(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "printChkBusApply", param);
    }
}
