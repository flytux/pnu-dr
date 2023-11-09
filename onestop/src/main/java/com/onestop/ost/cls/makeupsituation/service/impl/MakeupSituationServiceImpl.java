package com.onestop.ost.cls.makeupsituation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.makeupsituation.dao.MakeupSituationDao;
import com.onestop.ost.cls.makeupsituation.service.MakeupSituationService;

/**
 * <pre>
 * Class Name: BasketApplyInwonSearchServiceImpl.java
 * Description:  희망과목담기신청인원확인 Service Impl class
 * </pre>
 * 
 * @author 구태균
 * @since 2022. 02. 21.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service
public class MakeupSituationServiceImpl extends CommonServiceImpl implements MakeupSituationService {
	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private MakeupSituationDao dao;

	/**
	 * 희망과목담기신청인원 조회한다.
	 * 
	 * @param param
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	@Override
	public List<Map<String, Object>> selectQuerySearch(Map<String, Object> param) throws Exception {
		return dao.selectQuerySearch(param);
	}
}
