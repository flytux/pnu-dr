package com.onestop.core.security.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.onestop.core.security.dao.UserAuthDao;
import com.onestop.core.security.user.CustomUserDetail;

@Service("customUserDetailsService")
public class CustomUserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	UserAuthDao userAuthDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetail user = new CustomUserDetail();
		try {
			// 로그인 사용자 기본 정보 불러오기
			user = userAuthDao.getUserById(username);
		} catch (Exception e) {
			user = null;
		}

		if (user == null) {
			throw new UsernameNotFoundException(username);
		}

		return user;
	}

}
