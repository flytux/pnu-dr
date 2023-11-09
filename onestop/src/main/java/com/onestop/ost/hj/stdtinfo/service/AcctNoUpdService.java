package com.onestop.ost.hj.stdtinfo.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: AcctNoUpdService.java
 * Description: 계좌정보 수정 Service Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 11.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface AcctNoUpdService {
	
    /**
     * 계좌정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectAcctNoUpd(Map<String, Object> map) throws Exception;

    /**
     * 계좌정보의 은행목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectBankList(Map<String, Object> map) throws Exception;
    
    /**
     * 계좌정보를 저장한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveAcctNoUpd(Map<String, Object> param) throws Exception;    

    /**
     * 본인계좌인지를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> chkAcctNoUpd(Map<String, Object> map) throws Exception;      
}
