package com.onestop.ost.sep.overseasdispatch.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: ShortTermDispatchService.java
 * Description: 단기파견 Service Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface ShortTermDispatchService {
	   /**
     * 해외파견 단기파견 신청자정보를 조회한다.
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
     * 단기파견 작성 화면에 입력된 정보를 저장한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> saveShortTermDispatch(Map<String, Object> param) throws Exception;
    
    /**
     * 단기파견 작성 화면에 입력된 취소 정보를 저장한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> saveCancelShortTermDispatch(Map<String, Object> map) throws Exception;
    
    /**
     * 참가해외파견 프로그램을 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProgram(Map<String, Object> param) throws Exception;
}
