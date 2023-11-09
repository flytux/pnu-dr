package com.onestop.ost.jolup.hakbujolupguide.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: JolupEvaltnSjService.java
 * Description: 졸업사정용성적표 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface JolupEvaltnSjService {
 
    /**
     * 학적신청내역 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectHakjukApply(Map<String, Object> param)throws Exception;
    
    /**
     * 학적변동내역 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectHakjukChange(Map<String, Object> param)throws Exception;
    
   
    /**
     * 수강신청내역 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLectApply(Map<String, Object> param)throws Exception;
    
   
    /**
     * 성적이수내역 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSjIsu(Map<String, Object> param)throws Exception;
    
   
    /**
     * 과목별 성적 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSubjSj(Map<String, Object> param)throws Exception;
    
   
}
