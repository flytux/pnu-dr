package com.onestop.ost.hj.hjchnge.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: MltiMajorApplyDao.java
 * Description: 다중전공신청 Dao Class
 * </pre>
 * 
 * @author 이주은
 * @since 2022. 2. 9.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class MltiMajorApplyDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "ost.hj.hjchnge.MltiMajorApply.";
    
    /**
     * Database로 부터 다중전공신청내역목록 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListMltiMajorApply(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListMltiMajorApply", param);
    }

    /**
     * Database로 부터 신청가능기간여부 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public  Map<String, Object> selectChkSchd(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectChkSchd", param);
    }
    
    /**
     * Database로 부터 신청가능여부 관련된 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public  Map<String, Object> selectChkApply(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectChkApply", param);
    }
    
    /**
     * 다중전공신청을 저장 한다.
     * @param param
     * @return
     * @throws Exception
     */
    public Map<String, Object> executeMltiMajorApply(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeMltiMajorApply", param);
    }

    
}
