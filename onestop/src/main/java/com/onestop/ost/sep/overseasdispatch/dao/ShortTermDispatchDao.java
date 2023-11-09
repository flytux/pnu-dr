package com.onestop.ost.sep.overseasdispatch.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;


/**
 * <pre>
 * Class Name: ShortTermDispatchDao.java
 * Description: 단기파견 DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ShortTermDispatchDao extends CommonComnDao{
    private static final String SQLNAMESPACE = "ost.sep.overseasdispatch.shorttermdispatch.";
    
    /**
     * Database로 부터 해외파견 단기파견 신청자정보를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectStdtInfo(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "selectStdtInfo", map);
    }
    /**
     * Database로 부터 해외파견 지원가능대학목록을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectUnivList(Map<String, Object> map) throws Exception{
    	return selectQuery(SQLNAMESPACE + "selectUnivList", map);
    }


    /**
     * Database로 부터 단기파견 작성 화면에 입력된 정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> saveShortTermDispatch(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "saveShortTermDispatch", param);
    }

    /**
     * Database로 부터 단기파견 작성 화면에 입력된 취소 정보를 저장한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> saveCancelShortTermDispatch(Map<String, Object> map) throws Exception{
    	return selectQuery(SQLNAMESPACE + "saveCancelShortTermDispatch", map);
    }
    
    /**
     * Database로 부터 참가해외파견 프로그램을 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProgram(Map<String, Object> param) throws Exception{
    	return selectQuery(SQLNAMESPACE + "selectProgram", param);
    }
}
