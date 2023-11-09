package com.onestop.ost.jolup.hakbujolupguide.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: JolupNeedCrdtService.java
 * Description: 졸업소요학점 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface JolupNeedCrdtService {
	
	 /**
     * 해당학년도에 해당하는 학과를 조회한다.  - selectBox
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectDept(Map<String, Object> param)throws Exception;
   
    /**
     * 졸업소요학점을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSOYO(Map<String, Object> param) throws Exception;
    
    /**
     * 교양선택 영역별 소요학점을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectCult(Map<String, Object> param) throws Exception;
}
