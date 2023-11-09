package com.onestop.ost.hj.degacq.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: JolupDelayApplyService.java
 * Description: 학사학위취득유예 Service Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface JolupDelayApplyService {
    
    /**
     * 학사학위취득유예신청 화면 학사학위취득유예신청목록 조회를 한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJolupDelayApply(Map<String, Object> param)throws Exception;
    

    /**
     * 학사학위취득유예신청 화면 신청가능여부 조회를 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectChkApply(Map<String, Object> param)throws Exception;
    
    /**
     * 학사학위취득유예신청을 저장 한다.
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> executeJolupDelayApply(Map<String, Object> param) throws Exception;

    /**
     * 학사학위취득유예신청 화면 신청가능기간여부 조회를 한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectChkSchd(Map<String, Object> param)throws Exception;
    
    /**
     * 학사학위취득유예신청 화면 인터넷 성적증명서 발급 번호 조회를 한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSjCertDocuIssueNo(Map<String, Object> param)throws Exception;
    

    
    
}
