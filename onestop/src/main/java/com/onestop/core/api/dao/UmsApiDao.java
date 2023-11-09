package com.onestop.core.api.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: UserMngDao.java
 * Description: 사용자 DAO Class
 * </pre>
 * 
 * @author 최현우
 * @since 2022. 04.27.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository("umsApiDao")
public class UmsApiDao extends CommonComnDao {
    
    private static final String SQL_NAME_SPACE = "ums.api.";

    /**
     * Database로 부터 SMS발송을 위한 결재아이디 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> gfnUmsGetPaymntId(Map<String, Object> param) throws Exception {
        return selectQuery(SQL_NAME_SPACE + "gfnUmsGetPaymntId", param);
    }
    

    
}
