package com.onestop.core.security.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.onestop.core.security.dao.UserAuthDao;
import com.onestop.core.security.service.UserLoginCheckService;
import com.onestop.core.security.user.CustomUserDetail;

@Service("userLoginCheckService")
public class UserLoginCheckServiceImpl implements UserLoginCheckService {
	@Autowired
	UserAuthDao userAuthDao;

	public UserDetails loginCheck(Map<String, Object> param) throws Exception {
		CustomUserDetail user = new CustomUserDetail();
		try {
			// 로그인 사용자 기본 정보 불러오기
			user = userAuthDao.getUserById(param);
		} catch (Exception e) {
			user = null;
		}

		if (user == null) {
			throw new UsernameNotFoundException((String) param.get("USER_ID"));
		}
		return user;
	}
	
	public UserDetails verifyTokenLogin(Map<String, Object> param) throws Exception {
        CustomUserDetail user = new CustomUserDetail();

        try {
            // 로그인 사용자 기본 정보 불러오기
            user = userAuthDao.verifyTokenLogin(param);
        } catch (Exception e) {
            user = null;
        }

        if (user == null) {
            throw new UsernameNotFoundException((String) param.get("USER_ID"));
        }

        return user;
    }
}
