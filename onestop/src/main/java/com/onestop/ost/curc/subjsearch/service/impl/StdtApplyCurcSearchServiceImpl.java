package com.onestop.ost.curc.subjsearch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.curc.subjsearch.dao.StdtApplyCurcSearchDao;
import com.onestop.ost.curc.subjsearch.service.StdtApplyCurcSearchService;


/**
 * <pre>
 * Class Name: StdtApplyCurcSearchServiceImpl.java
 * Description: 학생별적용교육과정 조회 ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("stdtApplyCurcSearchService")
public class StdtApplyCurcSearchServiceImpl extends CommonServiceImpl implements StdtApplyCurcSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private StdtApplyCurcSearchDao stdtApplyCurcSearchDao;

    /**
     * 학생별적용교육과정에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectStdtApplyCurcSearch(Map<String, Object> param) throws Exception {
        return stdtApplyCurcSearchDao.selectStdtApplyCurcSearch(param);
    }
    /**
     * 해당학년도학과를 조회한다.  - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectOpenDept(Map<String, Object> param) throws Exception {
        return stdtApplyCurcSearchDao.selectOpenDept(param);
    }
}
