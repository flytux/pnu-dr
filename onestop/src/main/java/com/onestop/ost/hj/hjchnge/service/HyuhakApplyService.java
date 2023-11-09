package com.onestop.ost.hj.hjchnge.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: HyuhakApplyService.java
 * Description: 휴학신청 Service Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 10.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface HyuhakApplyService {
	
    /**
     * 군입대개월수 목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListMilServeBm(Map<String, Object> param) throws Exception;
	
    
    /**
     * 휴학신청내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListHyuhakApply(Map<String, Object> param) throws Exception;
    
    /**
     * 휴학신청 수정, 삭제 가능여부를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectHyuhakPosibleYn(Map<String, Object> param) throws Exception;
    
    
    /**
     * 휴학신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeHyuhakApply(Map<String, Object> param) throws Exception;

    
}
