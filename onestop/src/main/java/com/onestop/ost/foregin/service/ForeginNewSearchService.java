package com.onestop.ost.foregin.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: ExchgFeeService.java
 * Description: 교환/교비 Service Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface ForeginNewSearchService {
	
	/**
     * 학생별적용교육과정에 관련된 정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> fnsList(Map<String, Object> param)throws Exception;
}
