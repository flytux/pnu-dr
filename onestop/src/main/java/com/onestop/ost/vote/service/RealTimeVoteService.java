package com.onestop.ost.vote.service;

import java.util.Map;

/**
 * <pre>
 * Class Name: ExchgFeeService.java
 * Description: 교환/교비 Service Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface RealTimeVoteService {
	
	 /**
     * 신청가능년도학기를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
	public Map<String, Object> serviceTerm(Map<String, Object> param)throws Exception;
	
}
