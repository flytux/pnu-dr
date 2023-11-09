package com.onestop.ost.hj.stdtinfo.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: HakjukbuSearchDao.java
 * Description: 학적부 DAO Class
 * </pre>
 * 
 * @author 김현주
 * @since 2022. 02. 18.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class HakjukbuSearchDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.hj.stdtinfo.hakjukbuSearch.";
    
    
    /**
     * 학생정보를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectStdtInfo(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectStdtInfo", param);
    }
    
    /**
     * 입학목록을 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListEnt(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListEnt", param);
    }
    
    /**
     * 출신대학교 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListOunv(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListOunv", param);
    }
    
    /**
     * 비자정보를 조회한다.
     * @param  param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListVisa(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListVisa", param);
    }    
    
    /**
     * 학적변동 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSrchg(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListSrchg", param);
    }
    
    /**
     * 다중전공신청 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListMultiMajor(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListMultiMajor", param);
    }
    
    /**
     * 연계과정신청 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListLinkProc(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListLinkProc", param);
    }
    
    /**
     * 학사/무논문학위취득유예신청 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListAcqDelay(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListAcqDelay", param);
    }
    
    /**
     * 편입/교류/복수.공동학위 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListCourseEtc(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListCourseEtc", param);
    }
    
    /**
     * 장학금 목록을 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJangHak(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListJangHak", param);
    }
    
    /**
     * 학기별성적 목록을  조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListTermSj(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListTermSj", param);
    }
    
    
    /**
     * 학기별성적 합계를  조회한다.
     * @param  param
     * @return  Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectListTotTermSj(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectListTotTermSj", param);
    }
    
    /**
     * 교과목성적 목록을  조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListSubjSj(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListSubjSj", param);
    }
    
    /**
     * 졸업 목록을  조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListDeg(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListDeg", param);
    }


}
