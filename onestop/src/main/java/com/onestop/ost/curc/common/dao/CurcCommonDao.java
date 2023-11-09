package com.onestop.ost.curc.common.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: CurcCommonDao.java
 * Description: 학생 교육과정 공통 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class CurcCommonDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.curc.common.CurcCommon.";

    /**
     * Database로 부터 학생지원_교육과정 학년도 SelectBox dropDownList 시작학년도 ~ 종료학년도를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSearchBoxSyear(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectSearchBoxSyear", param);
    }
}
