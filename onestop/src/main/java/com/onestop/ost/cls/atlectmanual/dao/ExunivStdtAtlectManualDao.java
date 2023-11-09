package com.onestop.ost.cls.atlectmanual.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: ExunivStdtAtlectManualDao.java
 * Description: 타대생수강편람 조회 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ExunivStdtAtlectManualDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.atlectmanual.exunivstdtatlectmanual.";

   

    /**
     * Database로 부터 수강편람화면의 수강편람을 조회한다. 
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectExunivStdtAtlectManual(Map<String, Object> param) throws Exception {
    	return listPaging(SQLNAMESPACE + "selectExunivStdtAtlectManual", param);
    }

  
}
