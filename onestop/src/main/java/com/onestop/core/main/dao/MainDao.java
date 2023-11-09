package com.onestop.core.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * @Class Name : LoginDao.java
 * @Description : 로그인 DAO Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ ----------- ----------- ------------------------------- @
 *   2018.05.17 서대영 최초생성
 */
@Repository
public class MainDao extends CommonComnDao {
	private static final String SQLNAMESPACE = "core.main.";

	
	public List<Map<String, Object>> selectAllMenu(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "selectAllMenu", map);
	}
	
	public List<Map<String, Object>> selectAnonymousMenu(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "selectAnonymousMenu", map);
	}

	public List<Map<String, Object>> selectMenu(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "selectMenu", map);
	}
	
	public List<Map<String, Object>> selectListUser(Map<String, Object> map) throws Exception {
        // TODO Auto-generated method stub
        return selectQuery(SQLNAMESPACE + "selectListUser", map);
    }

	public List<Map<String, Object>> selectLangList(Map<String, Object> map) throws Exception {
		return selectQuery(SQLNAMESPACE + "selectLangList", map);
	}

	public void updateLangGcd(Map<String, Object> map) throws Exception {
		updateQuery(SQLNAMESPACE + "updateLangGcd", map);
	}

	public void addLangInfo(Map<String, Object> map) throws Exception {
		insertQuery(SQLNAMESPACE + "addLangInfo", map);
	}

	/**
	 * 기준학년/학기 정보를 조회한다.
	 * 
	 * @param map
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public Map<String, Object> selectOneShafYyShtm(Map<String, Object> param) throws Exception {
		return selectQueryMap(SQLNAMESPACE + "selectOneShafYyShtm", param);
	}
	
	public List<Map<String, Object>> selectContentMngList(Map<String, Object> map) throws Exception { 
		return selectQuery(SQLNAMESPACE + "selectContentMngList", map);
	}
	
	/**
     * 즐겨찾기 조회한다.
     * @param map
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>>  selectListBookMark(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListBookMark", param);
    }
	
	/**
     * 즐겨찾기 추가 및 삭제한다.
     * @param map
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> excuteBookMark(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "excuteBookMark", param);
    }
    
    public Map<String, Object> saveChgPwd(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "saveChgPwd", param);
    }
    
    /**
     * 즐겨찾기 순서를 변경한다.
     * @param map
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public Map<String, Object> excutePositionBookMark(Map<String, Object> param) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "excutePositionBookMark", param);
    }
    
    /**
     * 오늘의 수업 조회
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectTodayClass(Map<String, Object> param) throws Exception {
    	return selectQuery(SQLNAMESPACE + "selectTodayClass", param);
    }
    
    /**
     * 학생 휴대폰,이메일정보 수정
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> saveStdtInfoUpd(Map<String, Object> map) throws Exception{
    	return selectQuery(SQLNAMESPACE + "saveStdtInfoUpd", map);
    }
    
    public List<Map<String, Object>> selectMatchedUserList(Map<String, Object> param) throws Exception {
		return selectQuery(SQLNAMESPACE + "selectMatchedUserList", param);
	}
}
