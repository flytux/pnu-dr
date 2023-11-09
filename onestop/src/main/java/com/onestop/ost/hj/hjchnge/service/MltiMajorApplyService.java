package com.onestop.ost.hj.hjchnge.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: MltiMajorApplyService.java
 * Description: 다중전공신청 Service Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 9.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface MltiMajorApplyService {
    
    /**
     * 다중전공신청 화면 다중전공신청내역목록 조회를 한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListMltiMajorApply(Map<String, Object> param)throws Exception;

    /**
     * 다중전공신청 화면 신청가능기간여부 조회를 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectChkSchd(Map<String, Object> param)throws Exception;
    
    /**
     * 다중전공신청 화면 신청가능여부 조회를 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectChkApply(Map<String, Object> param)throws Exception;
    
    /**
     * 다중전공신청을 저장 한다.
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> executeMltiMajorApply(Map<String, Object> param) throws Exception;
}

