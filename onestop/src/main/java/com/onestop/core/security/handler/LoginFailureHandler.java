package com.onestop.core.security.handler;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.onestop.core.security.exception.IPNotPermitedException;
import com.onestop.core.security.exception.LoginFailNumberException;
import com.onestop.core.security.exception.LoginLockedException;
import com.onestop.core.util.IUtility;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	protected final Log LOGGER = LogFactory.getLog(getClass());
	
	@Autowired
	MessageSource localeMessageSource;

	/**
	 * 로그인 실패 시 로직 처리
	 */
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String userId = IUtility.parseNull(request.getParameter("USER_ID"));
		String errorMsg = "";

		// setUseForward(true);
		InetAddress local;
		HttpSession session = request.getSession();
		try {
			errorMsg = IUtility.getCommonMessage(request, localeMessageSource, "login.fail.default");
			// 패스워드 불일치
			if (exception instanceof BadCredentialsException) {

				local = InetAddress.getLocalHost();
				String serverIp = local.getHostAddress();
				Map<String, Object> loginHistMap = new HashMap<String, Object>();
				loginHistMap.put("USER_ID", userId);
				loginHistMap.put("SYS_SE_CODE", "01");
				loginHistMap.put("SERVER_IP", serverIp);
				loginHistMap.put("SSO_YN", "N");
				loginHistMap.put("USER_IP", IUtility.getRemoteAddr(request));
				loginHistMap.put("LOGIN_YN", "N"); // "Y" : 로그인 성공, "N" : 로그인 실패
				// userDetailsUpdateService.saveLoginHistory(loginHistMap);

				errorMsg = IUtility.getCommonMessage(request, localeMessageSource, exception.getMessage()); //비밀번호를 확인해 주세요!
				// 사용하지 않는 유저
			} else if (exception instanceof DisabledException) {
				errorMsg = IUtility.getCommonMessage(request, localeMessageSource, exception.getMessage()); //사용할 수 없는 아이디입니다.
			} else if (exception instanceof LockedException) {
				// 계정잠김
				errorMsg = IUtility.getCommonMessage(request, localeMessageSource, exception.getMessage()); //사용할 수 없는 아이디입니다.
			} else if (exception instanceof AccountExpiredException) {
				// 접속 유효기간이 아님
				errorMsg = IUtility.getCommonMessage(request, localeMessageSource, exception.getMessage()); //"기간이 만료된 아이디입니다."
				/*
				 * } else if (exception instanceof CredentialsExpiredException) { // 비밀번호 변경기간이
				 * 지났음 errorMsg = IUtility.getCommonMessage(request, localeMessageSource,
				 * "패스워드변경 유효기간이 지났습니다. 비밀번호를 변경해주세요");
				 */
			} else if (exception instanceof UsernameNotFoundException) {
				// 회원 정보가 없음
				errorMsg = IUtility.getCommonMessage(request, localeMessageSource, "회원정보가 없습니다. 다시 로그인해주세요");

			} else if (exception instanceof LoginFailNumberException) {
				// 로그인 실패횟수 증가
				errorMsg = IUtility.getCommonMessage(request, localeMessageSource,exception.getMessage()); //"로그인실패가 5회를 넘었습니다.관리자에게 문의하시기 바랍니다."
			} else if (exception instanceof LoginLockedException) {
				// 로그인잠금 유저
				errorMsg = IUtility.getCommonMessage(request, localeMessageSource,exception.getMessage()); //"계정이 잠겨있어 사용할 수 없는 아이디입니다. 관리자에게 문의하시기 바랍니다."
			} else if (exception instanceof IPNotPermitedException) {
				// 허용아이피 목록에 없는 유지
				errorMsg = IUtility.getCommonMessage(request, localeMessageSource, "접근할 수 없는 아이피입니다.");
				session.setAttribute("errorCode", 450);
			}

		} catch (UnknownHostException e1) {
			LOGGER.error(e1.getMessage());
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
		}

		session.setAttribute("loginFailMsg", errorMsg);

		super.onAuthenticationFailure(request, response, exception);
	}

}
