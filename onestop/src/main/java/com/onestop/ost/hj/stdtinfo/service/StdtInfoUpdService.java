package com.onestop.ost.hj.stdtinfo.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: StdtInfoUpdService.java
 * Description: 개인정보 수정 Service Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 14.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface StdtInfoUpdService {
	
    /**
     * 개인정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtInfoUpd(Map<String, Object> map) throws Exception;

    /**
     * 개인정보를 저장한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveStdtInfoUpd(Map<String, Object> param) throws Exception;    
    

    /**
     * EMAIIL/SMS 수신여부를 저장한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveAgree(Map<String, Object> param) throws Exception;    
    
}
