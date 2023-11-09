package com.onestop.ost.jolup.hakbujolupguide.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: JolupEvaltnSjDao.java
 * Description: 졸업사정용성적표 DAO Class
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 03. 08.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class JolupEvaltnSjDao extends CommonComnDao {
	
    private static final String SQLNAMESPACE = "ost.jolup.hakbujolupguide.jolupevaltnsj.";

    /**
     * Database로 부터 학적신청내역 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectHakjukApply(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectHakjukApply", param);
    }
    /**
     * Database로 부터 학적변동내역 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectHakjukChange(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectHakjukChange", param);
    }
    /**
     * Database로 부터 수강신청내역 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectLectApply(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectLectApply", param);
    }
    /**
     * Database로 부터 성적이수내역 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSjIsu(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectSjIsu", param);
    }
    /**
     * Database로 부터 과목별 성적 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectSubjSj(Map<String, Object> param) throws Exception {
        return listPaging(SQLNAMESPACE + "selectSubjSj", param);
    }

  
}
