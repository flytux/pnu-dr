package com.onestop.ost.curc.subjsearch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.curc.subjsearch.dao.SameSubjSearchDao;
import com.onestop.ost.curc.subjsearch.service.SameSubjSearchService;


/**
 * <pre>
 * Class Name: SameSubjSearchServiceImpl.java
 * Description: 동일교과목 조회 ServiceImpl
 * </pre>
 * 
 * @author 김지윤
 * @since 2022. 01. 28.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("sameSubjSearchService")
public class SameSubjSearchServiceImpl extends CommonServiceImpl implements SameSubjSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private SameSubjSearchDao sameSubjSearchDao;

    /**
     * 동일교과목에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectSameSubjSearch(Map<String, Object> param) throws Exception {
        return sameSubjSearchDao.selectSameSubjSearch(param);
    }
}
