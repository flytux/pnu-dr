package com.onestop.ost.cls.atlectmanual.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: AtlectManualService.java
 * Description: 수강편람 조회 Service Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 15.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface AtlectManualService {
    
    /**
     * 수강편람화면의 학년도/학기/대학대학원구분 별 원어강의 조회조건을 조회한다. - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLativeLangLectGcd(Map<String, Object> param)throws Exception;
    /**
     * 수강편람화면의 세부구분조건을 조회한다. - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectDetailSelectList(Map<String, Object> param)throws Exception;

    /**
     * 수강편람화면의 세부구분조건을 조회한다. - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectDetailSelectCollList(Map<String, Object> param)throws Exception;
    /**
     * 수강편람화면의 수강편람을 조회한다. 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectAtlectManual(Map<String, Object> param)throws Exception;
    /**
     * 수강편람팝업화면의 제한사항을 조회한다. 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectAtlectManualPrecaution(Map<String, Object> param)throws Exception;
    
    /**
     * 수강편람팝업화면의 배정인원 조회가능 여부를 조회한다. 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectPeronnellSearchPossFg(Map<String, Object> param)throws Exception;
    
    /**
     * 수강편람팝업화면의 배정인원을 조회한다. 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectAtlectManualPersonnel(Map<String, Object> param)throws Exception;
    
    /**
     * 수강편람화면팝업의 혼합 개설교과목 일자별 수업유형을 조회한다. 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectAtlectManualMixSubjTypeGcd(Map<String, Object> param)throws Exception;
    /**
     * 수강편람화면팝업의 교수상세을 조회한다. 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectAtlectManualDetailProf(Map<String, Object> param)throws Exception;

}
