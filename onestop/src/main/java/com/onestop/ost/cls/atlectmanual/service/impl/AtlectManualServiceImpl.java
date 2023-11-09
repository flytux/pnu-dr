package com.onestop.ost.cls.atlectmanual.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.atlectmanual.dao.AtlectManualDao;
import com.onestop.ost.cls.atlectmanual.service.AtlectManualService;

/**
 * <pre>
 * Class Name: AtlectManualServiceImpl.java
 * Description: 수강편람 조회 ServiceImpl
 * </pre>
 * 
 * @author 김동영
 * @since 2022. 02. 15.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("atlectManualService")
public class AtlectManualServiceImpl extends CommonServiceImpl implements AtlectManualService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private AtlectManualDao atlectManualDao;

    /**
     * 수강편람화면의 학년도/학기/대학대학원구분 별 원어강의 조회조건을 조회한다. - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectLativeLangLectGcd(Map<String, Object> param) throws Exception {
        return atlectManualDao.selectLativeLangLectGcd(param);
    }
    /**
     * 수강편람화면의 세부구분(학과)조건을 조회한다. - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectDetailSelectList(Map<String, Object> param) throws Exception {
    	return atlectManualDao.selectDetailSelectList(param);
    }
    /**
     * 수강편람화면의 세부구분(단과대학)조건을 조회한다. - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectDetailSelectCollList(Map<String, Object> param) throws Exception {
    	return atlectManualDao.selectDetailSelectCollList(param);
    }
    /**
     * 수강편람화면의 수강편람을 조회한다. - selectBox
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectAtlectManual(Map<String, Object> param) throws Exception {
    	// 정규학기, 계절학기 조회프로시저 분기처리
    	if (param.get("SCH_TERM_GCD").equals("0011") || param.get("SCH_TERM_GCD").equals("0021")) {
    		return atlectManualDao.selectSeasonAtlectManual(param);	// 계절
    	} else {
    		return atlectManualDao.selectRegularAtlectManual(param);	// 정규
    	}
    }
    /**
     * 수강편람팝업의 제한사항을 조회한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectAtlectManualPrecaution(Map<String, Object> param) throws Exception {
    	return atlectManualDao.selectAtlectManualPrecaution(param);
    }
    /**
     * 수강편람팝업의 배정인원 조회가능 여부를 조회한다. 
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPeronnellSearchPossFg(Map<String, Object> param) throws Exception {
    	return atlectManualDao.selectPeronnellSearchPossFg(param);
    }
    /**
     * 수강편람팝업의 배정인원을 조회한다. 
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectAtlectManualPersonnel(Map<String, Object> param) throws Exception {
    	return atlectManualDao.selectAtlectManualPersonnel(param);
    }
    /**
     * 수강편람화면팝업의 혼합 개설교과목 일자별 수업유형을 조회한다. 
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectAtlectManualMixSubjTypeGcd(Map<String, Object> param) throws Exception {
    	return atlectManualDao.selectAtlectManualMixSubjTypeGcd(param);
    }
    /**
     * 수강편람화면팝업의 교수상세을 조회한다. 
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectAtlectManualDetailProf(Map<String, Object> param) throws Exception {
    	return atlectManualDao.selectAtlectManualDetailProf(param);
    }
  
    
}
