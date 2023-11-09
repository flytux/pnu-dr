package com.onestop.core.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.onestop.core.main.service.MainService;
import com.onestop.core.util.IUtility;

public class SystemInterceptor extends HandlerInterceptorAdapter {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		Map<String, Object> logMap = new HashMap<String, Object>();

		String isAjax = IUtility.parseNull(request.getHeader("AJAX"));

		HttpSession session = request.getSession();
		String requestURI = request.getRequestURI(); // 요청 URI
		String remoteIP = request.getRemoteAddr();


		return true;
	}
}
