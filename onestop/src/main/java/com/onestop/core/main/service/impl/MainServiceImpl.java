package com.onestop.core.main.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.main.dao.MainDao;
import com.onestop.core.main.dao.PnuHomepageMenuDao;
import com.onestop.core.main.service.MainService;
import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.hj.stdtinfo.dao.StdtInfoUpdDao;

import egovframework.com.utl.cas.service.EgovSessionCookieUtil;

/**
 * @Class Name : LoginServiceImpl.java
 * @Description : 로그인 ServiceImpl Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ ----------- ----------- ------------------------------- @
 *   2018.05.17 서대영 최초생성
 * 
 */
@Service("mainService")
public class MainServiceImpl extends CommonServiceImpl implements MainService {

	/** mainDao */
	@Resource(name = "mainDao")
	private MainDao mainDao;
	
	@Resource(name = "pnuHomepageMenuDao")
	private PnuHomepageMenuDao mealMenuDao;
	
	@Autowired
    private StdtInfoUpdDao stdtInfoUpdDao;
	

	public List<Map<String, Object>> selectAllMenu(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> rtnList = mainDao.selectAllMenu(map);
		for (int i = 0, x = rtnList.size(); i < x; i++) {
			Map<String, Object> pgmMap = rtnList.get(i);
			pgmMap.put("AUTH_STR", IUtility.getEncStr(pgmMap.get("AUTH_STR")));
		}
		return rtnList;
	}
	
	public List<Map<String, Object>> selectAnonymousMenu(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> rtnList = mainDao.selectAnonymousMenu(map);
		for (int i = 0, x = rtnList.size(); i < x; i++) {
			Map<String, Object> pgmMap = rtnList.get(i);
			pgmMap.put("AUTH_STR", IUtility.getEncStr(pgmMap.get("AUTH_STR")));
		}
		return rtnList;
	}

	public List<Map<String, Object>> selectMenu(Map<String, Object> map) throws Exception {
		CustomUserDetail userInfo = null;
		Object userObj = IUtility.getLoginInfo();
		if ("anonymousUser".equals(userObj)) {
			userInfo = new CustomUserDetail();
		} else {
			userInfo = (CustomUserDetail) userObj;
		}

		List<String> authoritis = userInfo.getAUTHORITIS();
		if (authoritis != null) {
			String strRoles = "";
			for (int i = 0, x = authoritis.size(); i < x; i++) {
				String role = authoritis.get(i);
				strRoles += ((i == 0) ? "" : ",") + role;
			}
			map.put("ROLES", strRoles);
		}

		List<Map<String, Object>> rtnList = mainDao.selectMenu(map);
		for (int i = 0, x = rtnList.size(); i < x; i++) {
			Map<String, Object> pgmMap = rtnList.get(i);
			pgmMap.put("AUTH_STR", IUtility.getEncStr(pgmMap.get("AUTH_STR")));
		}
		return rtnList;
	}
	
	public List<Map<String, Object>> selectListUser(Map<String, Object> map) throws Exception {
        CustomUserDetail userInfo = null;
        Object userObj = IUtility.getLoginInfo();
        if("anonymousUser".equals(userObj)) {
            userInfo = new CustomUserDetail();
        } else {
            userInfo = (CustomUserDetail)userObj;
        }
        
        List<String> authoritis = userInfo.getAUTHORITIS();
        if(authoritis != null) {
            String strRoles = "";
            for(int i = 0, x = authoritis.size(); i < x; i++) {
                String role = authoritis.get(i);
                strRoles += ((i == 0) ? "" : ",") + role;
            }
            map.put("ROLES", strRoles);
        }
        
        List<Map<String, Object>> rtnList = mainDao.selectListUser(map);
        for(int i = 0, x = rtnList.size(); i < x; i++) {
            Map<String, Object> pgmMap = rtnList.get(i);
            pgmMap.put("AUTH_STR", IUtility.getEncStr(pgmMap.get("AUTH_STR")));
        }
        return rtnList;
    }

	@Override
	public List<Map<String, Object>> selectLangList(Map<String, Object> param) throws Exception {
		return mainDao.selectLangList(param);
	}

	@Override
	public void updateLangGcd(Map<String, Object> map) throws Exception {
		mainDao.updateLangGcd(map);
	}

	@Override
	@Transactional
	public void addLangInfo(List<Map<String, Object>> list) throws Exception {
		Map<String, Object> map = null;
		for (int i = 0; i < list.size(); i++) {
			map = list.get(i);
			mainDao.addLangInfo(map);
		}
	}

	@Override
	public Map<String, Object> selectOneShafYyShtm(Map<String, Object> map) throws Exception {
		Map<String, Object> result = mainDao.selectOneShafYyShtm(map);
		if( IUtility.parseNull(map.get("SESSION_LOCALE")).equals("0002")) {
			result.put("TERM_GCD_KOR_NM", result.get("TERM_GCD_ENG_NM"));
		}else if(IUtility.parseNull(map.get("SESSION_LOCALE")).equals("0003")) {
			result.put("TERM_GCD_KOR_NM", result.get("TERM_GCD_CHN_NM"));
		}
		
		return result;
	}
	
	public List<Map<String, Object>> selectContentMngList(Map<String, Object> map) throws Exception {
		return mainDao.selectContentMngList(map);
	}
	
	/**
     * 즐겨찾기 조회한다.
     * @param List<Map<String, Object>>
     * @throws Exception
     */
    /*@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)*/
    public List<Map<String, Object>>  selectListBookMark(Map<String, Object> param) throws Exception {
        return mainDao.selectListBookMark(param);
    }
	
	/**
     * 즐겨찾기 추가 및 삭제한다.
     * @param List<Map<String, Object>>
     * @throws Exception
     */
    /*@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)*/
    public Map<String, Object> excuteBookMark(Map<String, Object> param) throws Exception {
        return mainDao.excuteBookMark(param);
    }
    
    public Map<String, Object> saveChgPwd(Map<String, Object> param) throws Exception {
        return mainDao.saveChgPwd(param);
    }
    
    /**
     * 즐겨찾기 순서를 변경한다.
     * @param List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    @Transactional
    public void excutePositionBookMark(List<Map<String, Object>> list) throws Exception {
        Map<String, Object> map = null;
        for(int i=0; i<list.size(); i++){
            map = list.get(i);
            mainDao.excutePositionBookMark(map);
            
        }    
                
    }
    
    /**
     * 오늘의수업 조회 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectTodayClass(Map<String, Object> param) throws Exception {
    	return mainDao.selectTodayClass(param);
    }
    
    /**
     * 오늘의 식단 조회 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectMealMenu(Map<String, Object> param) throws Exception {
    	return mealMenuDao.selectMealMenu(param);
    }
    
    /**
     * 대학공지 조회 
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectPnuNoticeList(Map<String, Object> param) throws Exception {
    	return mealMenuDao.selectPnuNoticeList(param);
    }
    
    
public void excuteStdtInfo(Map<String, Object> map,HttpServletRequest request) throws Exception{
    	
		//복사된 세션 Authentication 저장
		Authentication authentication = (Authentication) EgovSessionCookieUtil.getSessionAttribute(request, "sessionAuthStdtInfo");
		SecurityContextHolder.getContext().setAuthentication(authentication); //재로그인
		EgovSessionCookieUtil.removeSessionAttribute(request, "sessionAuthStdtInfo"); 
		CustomUserDetail userInfo = (CustomUserDetail) IUtility.getLoginInfo();

    	map.put("STDT_NO", userInfo.getUserId());
    	map.put("SESSION_USER_ID", userInfo.getUserId());
    	map.put("SESSION_USER_IP", userInfo.getUserIp());
    	try {
    		//학생 휴대폰,이메일정보 수정
        	mainDao.saveStdtInfoUpd(map);
        	
        	//학생 동의정보 수정
        	stdtInfoUpdDao.saveAgree(map);
        	
        	userInfo.setPersonInfoUseAgreeFg("Y"); // 개인정보활용동의 
		} catch (Exception e) {
			// TODO: handle exception
			new SecurityContextLogoutHandler().logout(request, null, authentication); //로그아웃
			
		}
    	
    }

	@Override
	public List<Map<String, Object>> selectMatchedUserList(Map<String, Object> param) throws Exception {
		return mainDao.selectMatchedUserList(param);
	}

}
