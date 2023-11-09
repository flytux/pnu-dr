package com.onestop.ost.curc.subjsearch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.curc.subjsearch.dao.ExdeptMajorSubjSearchDao;
import com.onestop.ost.curc.subjsearch.service.ExdeptMajorSubjSearchService;



/**
 * <pre>
 * Class Name: ExdeptMajorSubjSearchServiceImpl.java
 * Description: 타과전공인정교과목 조회 ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 28.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("exdeptMajorSubjSearchService")
public class ExdeptMajorSubjSearchServiceImpl extends CommonServiceImpl implements ExdeptMajorSubjSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private ExdeptMajorSubjSearchDao exdeptMajorSubjSearchDao;

    /**
     * 타과전공인정과목에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectExdeptMajorSubjSearch(Map<String, Object> param) throws Exception {
        return exdeptMajorSubjSearchDao.selectExdeptMajorSubjSearch(param);
    }
  
    /**
     * 타과전공 인정 대학원 구분을 조회한다.  - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectOpenGrad(Map<String, Object> param) throws Exception {
        return exdeptMajorSubjSearchDao.selectOpenGrad(param);
    }
    /**
     * 타과전공 인정 단과대학을 조회한다.  - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectOpenColl(Map<String, Object> param) throws Exception {
        return exdeptMajorSubjSearchDao.selectOpenColl(param);
    }
    
    /**
     * 타과전공 인정학과를 조회한다.  - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectOpenDept(Map<String, Object> param) throws Exception {
        return exdeptMajorSubjSearchDao.selectOpenDept(param);
    }
}
