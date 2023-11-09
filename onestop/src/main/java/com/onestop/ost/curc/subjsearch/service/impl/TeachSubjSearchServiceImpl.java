package com.onestop.ost.curc.subjsearch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.curc.subjsearch.dao.TeachSubjSearchDao;
import com.onestop.ost.curc.subjsearch.service.TeachSubjSearchService;


/**
 * <pre>
 * Class Name: TeachSubjSearchServiceImpl.java
 * Description: 교직과목 조회 ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 27.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("teachSubjSearchService")
public class TeachSubjSearchServiceImpl extends CommonServiceImpl implements TeachSubjSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private TeachSubjSearchDao teachSubjSearchDao;

    /**
     * 교직과목에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectTeachSubjSearch(Map<String, Object> param) throws Exception {
        return teachSubjSearchDao.selectTeachSubjSearch(param);
    }
}
