package com.onestop.core.security.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.dao.CommonComnDao;

/**
 * @Class Name : LoginDao.java
 * @Description : 로그인 DAO Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ ----------- ----------- ------------------------------- @
 *   2018.05.17 서대영 최초생성
 */
@Repository
public class UserAuthDao extends CommonComnDao {
	private static final String SQLNAMESPACE = "security.auth.";

	/**
	 * 사용자정보 조회
	 * 
	 * @param (String)userId
	 * @return (CustomUserDetail)사용자정보
	 * @throws Exception
	 */
	public CustomUserDetail getUserById(String userId) throws Exception {
		return selectOne(SQLNAMESPACE + "getUserById", userId);
	}

	/**
	 * 사용자정보 조회
	 * 
	 * @param (String)userId
	 * @return (CustomUserDetail)사용자정보
	 * @throws Exception
	 */
	public CustomUserDetail getUserById(Map<String, Object> param) throws Exception {
		return selectOne(SQLNAMESPACE + "getUserById", param);
	}
	
	public CustomUserDetail verifyTokenLogin(Map<String, Object> param) throws Exception {
        return selectOne(SQLNAMESPACE + "verifyTokenLogin", param);
    }
}
