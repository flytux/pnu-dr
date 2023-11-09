package com.onestop.ost.cls.makeupsituation.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: BasketApplyInwonSearchDao.java
 * Description:  희망과목담기신청인원확인 Dao class
 * </pre>
 * 
 * @author 구태균
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class MakeupSituationDao extends CommonComnDao {
    
    private static final String SQLNAMESPACE = "ost.cls.makeupsituation.MakeupSituation.";

   
    /**
     * 희망과목담기신청인원 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectQuerySearch(Map<String, Object> param) throws Exception {
    	return listPaging(SQLNAMESPACE + "selectQuerySearch", param);
    }
}
