package com.onestop.ost.hj.hjchnge.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: HakjukbuAlterApplyService.java
 * Description: 학적부변경신청 Service Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface HakjukbuAlterApplyService {
	
    
    /**
     * 학생정보, 정정신청 내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListHakjukbuAlterApply(Map<String, Object> param) throws Exception;
    
    
    /**
     * 정정신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeHakjukbuAlterApply(Map<String, Object> param) throws Exception;

    
}
