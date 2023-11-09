package com.onestop.ost.cls.lecaplycheck.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.lecaplycheck.dao.CloseLectSearchDao;
import com.onestop.ost.cls.lecaplycheck.service.CloseLectSearchService;
import com.onestop.ost.curc.subjsearch.dao.TeachSubjSearchDao;
import com.onestop.ost.curc.subjsearch.service.TeachSubjSearchService;


/**
 * <pre>
 * Class Name: CloseLectSearchServiceImpl.java
 * Description: 폐강강좌 조회 ServiceImpl
 * </pre>
 * 
 * @author 최아영
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("closeLectSearchService")
public class CloseLectSearchServiceImpl extends CommonServiceImpl implements CloseLectSearchService{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private CloseLectSearchDao closeLectSearchDao;

    /**
     * 폐강강좌에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectCloseLectSearch(Map<String, Object> param) throws Exception {
        return closeLectSearchDao.selectCloseLectSearch(param);
    }
}
