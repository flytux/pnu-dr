package com.onestop.core.main.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.onestop.core.security.user.CustomUserDetail;

//import kr.hrdkorea.ncs.common.util.IUtility;
/**
 * @Class Name : CH0201ServiceImpl.java
 * @Description : 사업관리 ServiceImpl Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2017.09.08 서대영 최초생성
 * 
 * @author
 * @since 2017.09.08
 * @version 1.0
 * @see
 * 
 *      Copyright (C) by MOPAS All rights reserved.
 */
public interface MainService {
	
	public List<Map<String, Object>> selectAllMenu(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectAnonymousMenu(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectMenu(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectListUser(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectLangList(Map<String, Object> map) throws Exception;

	public void updateLangGcd(Map<String, Object> map) throws Exception;

	public void addLangInfo(List<Map<String, Object>> params) throws Exception;

	public Map<String, Object> selectOneShafYyShtm(Map<String, Object> param) throws Exception;
	
	public List<Map<String, Object>> selectContentMngList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>>  selectListBookMark(Map<String, Object> param) throws Exception ;
	
	public Map<String, Object> excuteBookMark(Map<String, Object> param) throws Exception ;
	
	public Map<String, Object> saveChgPwd(Map<String, Object> param) throws Exception ;
	
	public void excutePositionBookMark(List<Map<String, Object>> param) throws Exception;
	
	/**
     * 오늘의 수업 조회. 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectTodayClass(Map<String, Object> param)throws Exception;

    /**
     * 오늘의 식단 조회. 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectMealMenu(Map<String, Object> param)throws Exception;

    /**
     * 대학공지 조회. 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectPnuNoticeList(Map<String, Object> param)throws Exception;
    
    
    /**
     * 학생 개인정보및동의 저장
     * @param param
     * @return void
     * @throws Exception
     */
    public void excuteStdtInfo(Map<String, Object> map,HttpServletRequest request) throws Exception;

    public List<Map<String, Object>> selectMatchedUserList(Map<String, Object> param) throws Exception;
}
