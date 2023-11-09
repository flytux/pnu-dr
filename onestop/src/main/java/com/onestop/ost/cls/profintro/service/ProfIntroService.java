package com.onestop.ost.cls.profintro.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: ProfIntroService.java
 * Description: 교수소개 조회 Service Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 24.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface ProfIntroService {
    
    /**
     * 교수소개 대학원목록 조회. - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfIntroGrad(Map<String, Object> param)throws Exception;
    /**
     * 교수소개 단과대학목록 조회 - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfIntroColl(Map<String, Object> param)throws Exception;

    /**
     * 교수소개 학과목록 조회. - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfIntroDept(Map<String, Object> param)throws Exception;
    /**
     * 교수소개 조회. - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfIntro(Map<String, Object> param)throws Exception;
    /**
     * 교수소개 상세조회. - 팝업
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectProfDetailIntro(Map<String, Object> param)throws Exception;

}
