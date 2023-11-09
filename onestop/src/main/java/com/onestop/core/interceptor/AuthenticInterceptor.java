package com.onestop.core.interceptor; 

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.onestop.core.util.IUtility;

public class AuthenticInterceptor extends HandlerInterceptorAdapter {
	
/*	private Set<String> permittedURL;
	
	public void setPermittedURL(Set<String> permittedURL) {
		this.permittedURL = permittedURL;
	}*/

	public void setWriter(String responseCode, HttpServletResponse response, String msg) throws Exception {
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		switch (responseCode) {
		case "900":
			if(msg == null || "".equals(msg)) {
				writer.write("<script>");
				writer.write("    alert('세션이 만료되었거나 로그아웃 되었습니다.')");
				writer.write("    location.href = '/websquare/websquare.jsp?w2xPath=/html/login.xml'");
				writer.write("</script>");
			} else {
				writer.write(msg);
			}
			break;

		default:
			break;
		}
		
		writer.flush();
	}
	
	public void setWriter(String responseCode, HttpServletResponse response) throws Exception {
		setWriter(responseCode, response, "");
	}
	
	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
			) throws Exception {

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		Map<String, Object> logMap = new HashMap<String, Object>();

		String isAjax =  IUtility.parseNull(request.getHeader("isAjax"));

		HttpSession session = request.getSession();
		String requestURI = request.getRequestURI(); //요청 URI
		String loginUserId = IUtility.parseNull(session.getAttribute("SESSION_USER_ID"));
		String progId = IUtility.parseNull(request.getParameter("PROG_ID"));

		return true;
	}
}
