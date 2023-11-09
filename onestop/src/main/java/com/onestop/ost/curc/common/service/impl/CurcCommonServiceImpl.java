package com.onestop.ost.curc.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.curc.common.dao.CurcCommonDao;
import com.onestop.ost.curc.common.service.CurcCommonService;


/**
 * <pre>
 * Class Name: CurcCommonServiceImpl.java
 * Description: 학생 교육과정 공통 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("curcCommonService")
public class CurcCommonServiceImpl extends CommonServiceImpl implements CurcCommonService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private CurcCommonDao curcCommonDao;

    /**
     * 학생지원_교육과정 학년도 SelectBox dropDownList 시작학년도 ~ 종료학년도 조회 //정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectSearchBoxSyear(Map<String, Object> param) throws Exception {
        return curcCommonDao.selectSearchBoxSyear(param);
    }
}
