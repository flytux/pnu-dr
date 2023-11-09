package com.onestop.core.bbs.service;


import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;


/**
 * <pre>
 * Class Name: BbsService.java
 * Description: 게시판 service인터페이스
 * </pre>
 * 
 * @author 김우영
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface BbsService {
	
	public Map<String, Object> selectBbsMgrInfo( Map<String, Object> map ) throws Exception;
	
	public List<Map<String, Object>> selectBbsDataList(Map<String, Object> map) throws Exception;
	
	public void updateBbsTimesno( Map<String, Object> map ) throws Exception;
	
	public void setMainBbsListConstructor( Map<String, Object> map ,ModelAndView view) throws Exception;
	
	public void setBbsConstructor( Map<String, Object> map ,ModelAndView view) throws Exception;
	
	public Map<String, Object> selectBbsPassword(Map<String, Object> map) throws Exception ;
	
	public Map<String, Object> selectBbsDetail( Map<String, Object> map ) throws Exception;
	
	public Map<String, Object> saveBbsInfo( Map<String, Object> map ) throws Exception;
	
	public Map<String, Object> saveBbsReplyInfo( Map<String, Object> map ) throws Exception;
}
