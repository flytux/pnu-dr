package com.onestop.ost.cls.attendconf.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: AttendConfDissentApplyService.java
 * Description: 출결확인 및 이의신청 Service Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface AttendConfDissentApplyService {
	
    /**
     * 학사일정을 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectSchdInfo(Map<String, Object> paramList) throws Exception;	
	
	
    /**
     * 출결 이의신청 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListAttDisApply(Map<String, Object> param) throws Exception;
    
    /**
     * 출결 이의신청을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> deleteDissentApply(Map<String, Object> paramList) throws Exception;	
    
    /**
     * 수강신청 교과목 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListApplySubj(Map<String, Object> param) throws Exception;
    
    /**
     * 출결사항 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListAttend(Map<String, Object> param) throws Exception;
    
    /**
     * 출결 이의신청을 입력한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> insertDissentApply(List<Map<String, Object>> paramList) throws Exception;

    
}
