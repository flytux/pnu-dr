package com.onestop.ost.curc.common.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: CurcCommonService.java
 * Description: 학생 교육과정 공통 Service Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface CurcCommonService {
    
    /**
     * 학생지원_교육과정 학년도 SelectBox dropDownList 시작학년도 ~ 종료학년도 조회
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSearchBoxSyear(Map<String, Object> param)throws Exception;
    
}
