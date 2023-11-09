package com.onestop.ost.hj.hjchnge.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name:BokhakApplyService.java
 * Description: 복학신청 Service Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 16.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface BokhakApplyService {
    
    /**
     * 복학신청내역을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListBokhakApply(Map<String, Object> param) throws Exception;
    
    /**
     * 복학신청가능여부를 조회한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectBokhakPosibleYn(Map<String, Object> param) throws Exception;
    
    
    /**
     * 복학신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> executeBokhakApply(Map<String, Object> param) throws Exception;

    
}
