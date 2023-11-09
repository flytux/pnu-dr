package com.onestop.core.file.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: FilesService.java
 * Description: 첨부파일 업로드를 위한 service클래스
 * </pre>
 * 
 * @author 서혁성
 * @since 2021. 8. 2.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface FilesService {
    
    public void saveAttachFileInfo(Map<String, Object> map) throws Exception;

    public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception;
    
    public List<Map<String, Object>> selectDetail(Map<String, Object> map) throws Exception;
    
    public void deleteAttachFileInfo(Map<String, Object> map) throws Exception;
    
    public void fileTransComplete(Map<String, Object> map) throws Exception;
    
    public void fileInfoDelete(Map<String, Object> map) throws Exception;
    
    public void saveAttachFileInfoCKEDITOR(Map<String, Object> map) throws Exception;
}
