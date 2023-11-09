package com.onestop.ost.cls.profintro.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: ProfIntroDao.java
 * Description: 교수소개 조회 DAO Class
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 24.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class ProfIntroDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.profintro.profintro.";

   
    /**
     * Database로 부터 교수소개화면의 대학원목록 을 조회. - selectBox
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfIntroGrad(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectProfIntroGrad", param);
    }
    /**
     * Database로 부터 교수소개화면의 단과대학목록 을 조회 - selectBox
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfIntroColl(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectProfIntroColl", param);
    }
    /**
     * Database로 부터 교수소개화면의 학과목록 을 조회 - selectBox
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfIntroDept(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectProfIntroDept", param);
    }
    /**
     * Database로 부터 교수소개화면의 교수소개를 조회 -
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectProfIntro(Map<String, Object> param) throws Exception {
    	return listPaging(SQLNAMESPACE + "selectProfIntro", param);
    }
    /**
     * Database로 부터 교수소개화면의 교수소개 상세를 조회 - 팝업
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> selectProfDetailIntro(Map<String, Object> param) throws Exception {
    	return selectQueryMap(SQLNAMESPACE + "selectProfDetailIntro", param);
    }

}
