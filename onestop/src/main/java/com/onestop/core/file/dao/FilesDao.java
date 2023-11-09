package com.onestop.core.file.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: FilesDao.java
 * Description: 첨부파일 업로드를 위한 dao클래스
 * </pre>
 * 
 * @author 서혁성
 * @since 2021. 8. 2.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class FilesDao extends CommonComnDao {

    private static final String SQLNAMESPACE = "core.file.";

    public void saveAttachFileInfo(Map<String, Object> parameter) throws Exception {
        executeQuery(SQLNAMESPACE + "saveAttachFileInfo", parameter);
    }
    
    public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception{
        return selectQuery(SQLNAMESPACE + "selectList", map);
    }
    
    public void deleteAttachFileInfo(Map<String, Object> map) throws Exception{
        deleteQuery(SQLNAMESPACE + "deleteAttachFileInfo", map);
    }
    
    public void saveAttachFileContentInfo(Map<String, Object> map) throws Exception{
        updateQuery(SQLNAMESPACE + "saveAttachFileContentInfo", map);
    }
    
    public void fileTransComplete(Map<String, Object> map) throws Exception{
        updateQuery(SQLNAMESPACE + "fileTransComplete", map);
    }
    
    public void fileInfoDelete(Map<String, Object> map) throws Exception{
        deleteQuery(SQLNAMESPACE + "fileInfoDelete", map);
    }
}
