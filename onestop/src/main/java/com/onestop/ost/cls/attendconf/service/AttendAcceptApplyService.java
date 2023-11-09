package com.onestop.ost.cls.attendconf.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: AttendAcceptApplyService.java
 * Description: 출석인정신청 Service Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface AttendAcceptApplyService {
    
    /**
     * 출석인정신청에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectAttendAcceptApply(Map<String, Object> param)throws Exception;

    /**
     * 출석인정신청에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLecApply(Map<String, Object> param)throws Exception;
    
    /**
     * 학사일정을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLecDate(Map<String, Object> map) throws Exception;    

    /**
     * 신청내역을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveAttendAcceptApply(Map<String, Object> params)throws Exception;
    
    /**
     * 출석인정 신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveLecApply(List<Map<String, Object>> list) throws Exception;
    
    /**
     * 개인정보동의 정보를 저장한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveClause(Map<String, Object> param) throws Exception;    
 
    
}
