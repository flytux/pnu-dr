package com.onestop.core.security.service;

import java.util.Map;

import org.springframework.security.core.userdetails.UserDetails;

public interface UserLoginCheckService {
	public UserDetails loginCheck(Map<String, Object> map) throws Exception;
	
	public UserDetails verifyTokenLogin(Map<String, Object> map) throws Exception;
}
