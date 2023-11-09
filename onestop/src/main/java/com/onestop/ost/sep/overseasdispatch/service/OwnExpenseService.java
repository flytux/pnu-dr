package com.onestop.ost.sep.overseasdispatch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: OwnExpenseService.java
 * Description: 자비 Service Class
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface OwnExpenseService {
	
    /**
     * 해외파견 자비 신청자정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtInfo(Map<String, Object> map) throws Exception;
    /**
     * 해외파견 지원가능대학목록을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectUnivList(Map<String, Object> map) throws Exception;

    /**
     * 자비 작성 화면에 입력된 정보를 저장한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveOwnExpense(Map<String, Object> param) throws Exception;
    
    /**
     * 자비 작성 화면에 입력된 정보를 저장한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> saveCancelOwnExpense(Map<String, Object> map) throws Exception;
    
}
