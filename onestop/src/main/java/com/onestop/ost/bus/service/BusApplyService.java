package com.onestop.ost.bus.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: BusApplyService.java
 * Description: 통학버스 신청 Service Class
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface BusApplyService {
    /**
     * 통학버스 진행학기를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectDateCheck(Map<String, Object> map) throws Exception;
    
    /**
     * 통학버스 이용신청을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectBusApply(Map<String, Object> map) throws Exception;
    
    /**
     * 통학버스 승차시간,장소코드/ 하차시간,장소코드를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectBusCd(Map<String, Object> map) throws Exception;
    
    /**
     * 통학버스 현재 월의 탑승정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMonthApplyList(Map<String, Object> map) throws Exception;
    
    /**
     * 통학버스 이용신청을 신규,수정 한다.
     * @param list
     * @return <Map<String, Object>
     * @throws Exception
     */
    void executeBusApply(List<Map<String, Object>> list) throws Exception;

    /**
     * 통학버스 이용신청_마스터를 저장한다.
     * @param list
     * @return <Map<String, Object>
     * @throws Exception
     */
    void executeBusApplyMaster(Map<String, Object> param) throws Exception;
    
    /**
     * 통학버스 이용신청을 삭제 한다.
     * @param list
     * @return <Map<String, Object>
     * @throws Exception
     */
    void cancelDetailBusApply(List<Map<String, Object>> list) throws Exception;
    void cancelBusApply(List<Map<String, Object>> list) throws Exception;
    
    /**
     * 통학버스 이용신청 학생의 사진을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectStdtPhoto(Map<String, Object> param) throws Exception;
    
    /**
     * 통학버스 이용신청 학생의 사진을 저장한다.
     * @param list
     * @return <Map<String, Object>
     * @throws Exception
     */
    public void saveStdtPhoto(Map<String, Object> map) throws Exception;
    
    /**
     * 통학버스 고지서 출력가능여부를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> printChkBusApply(Map<String, Object> param) throws Exception;
}
