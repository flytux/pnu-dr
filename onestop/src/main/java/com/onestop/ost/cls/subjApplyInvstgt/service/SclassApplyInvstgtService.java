package com.onestop.ost.cls.subjApplyInvstgt.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: SclassApplyInvstgtService.java
 * Description: 계절수업 수요조사 Service Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 24.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface SclassApplyInvstgtService {
	
	
    /**
     * 내가 신청한 계절수업 개설신청 교과목 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListApplySubj(Map<String, Object> param) throws Exception;
	
    
    /**
     * 계절수업 수요조사 교과목 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSclassSubj(Map<String, Object> param) throws Exception;
    
    
    /**
     * 계절수업 수요조사 교과목을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeSubjApply(List<Map<String, Object>> paramList) throws Exception;
    
    
    /**
     * 순위별 계절수업 수요조사 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSclassSubjRank(Map<String, Object> param) throws Exception;

    
}
