package com.onestop.core.file.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: StdtPhotoDao.java
 * Description: 첨부파일 업로드를 위한 dao클래스
 * </pre>
 * 
 * @author 강희재
 * @since 2021. 8. 12.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class StdtPhotoDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "core.stdtPhoto.";

    /**
     * 학생사진 업로드 관리 사진 저장을 한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */    
    public void saveStdtPhoto(Map<String, Object> map) throws Exception {
        executeQuery(SQLNAMESPACE + "saveStdtPhoto", map);
    }    
}
