package com.onestop.ost.curc.subjsearch.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.curc.subjsearch.dao.ExdeptMajorSubjSearchDao;
import com.onestop.ost.curc.subjsearch.dao.MajorSubjSearchDao;
import com.onestop.ost.curc.subjsearch.service.ExdeptMajorSubjSearchService;
import com.onestop.ost.curc.subjsearch.service.MajorSubjSearchService;



/**
 * <pre>
 * Class Name: MajorSubjSearchServiceImpl.java
 * Description: 전공교과목 조회 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("majorSubjSearchService")
public class MajorSubjSearchServiceImpl extends CommonServiceImpl implements MajorSubjSearchService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private MajorSubjSearchDao majorSubjSearchDao;

    /**
     * 전공과목에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectMajorSubjSearch(Map<String, Object> param) throws Exception {
    	
        return majorSubjSearchDao.selectMajorSubjSearch(param);
    }
}
