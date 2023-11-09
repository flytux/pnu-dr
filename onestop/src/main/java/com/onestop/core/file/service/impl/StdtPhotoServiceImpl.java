package com.onestop.core.file.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.file.dao.StdtPhotoDao;
import com.onestop.core.file.service.StdtPhotoService;
import com.onestop.core.handler.CustomException;
import com.onestop.core.util.service.CommonServiceImpl;

/**
 * <pre>
 * Class Name: StdtPhotoServiceImpl.java
 * Description: 학생 사진파일 업로드를 위한 service클래스
 * </pre>
 * 
 * @author 강희재
 * @since 2021. 8. 12.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("stdtPhotoService")
public class StdtPhotoServiceImpl extends CommonServiceImpl implements StdtPhotoService{

    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private StdtPhotoDao stdtPhotoDao;

    /**
     * 학생사진 저장을 한다. 
     * @param Map<String, Object>
     * @throws Exception
     */    
    @Override
    @Transactional
    public void saveStdtPhoto(Map<String, Object> map) throws Exception {
        try {
            
            stdtPhotoDao.saveStdtPhoto(map);
            
        } catch (Exception ex) {
            throw new CustomException(ex, map);
        } 
    }
}
