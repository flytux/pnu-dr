package com.onestop.core.file.service;

import java.util.Map;

/**
 * <pre>
 * Class Name: StdtPhotoService.java
 * Description: 학생사진 저장 위한 service클래스
 * </pre>
 * 
 * @author 강희재
 * @since 2021. 8. 13.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface StdtPhotoService {
    
    public void saveStdtPhoto(Map<String, Object> map) throws Exception;        
}
