package com.onestop.core.security.authentication;

import java.security.PrivateKey;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.onestop.core.security.exception.LoginFailNumberException;
import com.onestop.core.security.exception.LoginLockedException;
import com.onestop.core.security.service.UserLoginCheckService;
import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;

import WiseAccess.SSO;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private final Logger LOGGER = LoggerFactory.getLogger(getClass().getName());
	
	@Autowired
	UserDetailsService customUserDetailsService;

	@Autowired
	UserLoginCheckService userLoginCheckService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication;

		RequestAttributes attribs = RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = ((ServletRequestAttributes) attribs).getRequest();
		PrivateKey privateKey = (PrivateKey) (request.getSession()).getAttribute(ProjectConstant.RSA_PRIVATE_KEY);
		
		String userid = ""; 
        String pwd = ""; 
        String orginid = "";
        String sToken = IUtility.parseNull(request.getParameter("_sToken"));
        String sTokenChk = IUtility.parseNull(request.getParameter("_sTokenChk"),"N");
        String appLoginCheck = IUtility.parseNull(request.getParameter("_appLoginCheck"),"N");
        boolean verifyTokenFlag = false; 
        
        Map<String, Object> param = new HashMap<String, Object>();
        UserDetails userInfo = null;
        
        int nResult = -1;
    	SSO sso = null;
    	HttpSession session = request.getSession();
    	
        try {
            if(!"".equals(sToken)) {
            	
                String cIp = IUtility.getRemoteAddr(request);
                sso = IUtility.ssoGet(cIp);

                nResult = sso.verifyToken( sToken, cIp );
                if( nResult >= 0 ) {
                    param.put("USER_ID", sso.getValue("UserID"));
                    userInfo = userLoginCheckService.verifyTokenLogin(param);
                    if (userInfo != null) {
                    	if("Y".equals(sTokenChk)) {
                    		session.setAttribute("_sToken", sToken);
                    		session.setAttribute("_sTokenChk", true);
                    		session.setAttribute("_resetFg", IUtility.parseNull(sso.getValue("ResetFg")));
                        } else {
                        	session.setAttribute("_sToken", "");
                        	session.setAttribute("_sTokenChk", false);
                    		session.setAttribute("_resetFg", "");
                        }
                    	verifyTokenFlag = true;
                    }
                }
            }
        } catch (Exception e) {
        	LOGGER.error(e.getMessage());
        }
        
        try {
	        if(appLoginCheck.equals("Y")) {
	        	String userId = IUtility.parseNull(request.getParameter("USER_ID"));
	        	String menuCD = IUtility.parseNull(request.getParameter("menuCD"));
	        	param.put("USER_ID", userId);
	        	userInfo = userLoginCheckService.verifyTokenLogin(param);
	        	if (userInfo != null) {
	        		verifyTokenFlag = true;
	                session.setAttribute("appRedirectUrl", "/page?menuCD="+menuCD);
	            }
	        }
        } catch (Exception e) {
        	LOGGER.error(e.getMessage());
        }
        
        if((!"".equals(sToken) || appLoginCheck.equals("Y")) && !verifyTokenFlag) {
            session.setAttribute("_sToken", "");
            session.setAttribute("_sTokenChk", false);
            session.setAttribute("_resetFg", "");
            sso.unregUserSession( sToken );
        } else {
        	if(!verifyTokenFlag) {
            	try {
                    userid = IUtility.decryptRsa(privateKey, authToken.getName()); 
                    pwd = (!"".equals(IUtility.parseNull(authToken.getCredentials()))) ? IUtility.decryptRsa(privateKey, (String) authToken.getCredentials()) : ""; 
                    orginid = (request != null && !"".equals(IUtility.parseNull(request.getParameter("ORIGIN_ID")))) ? IUtility.decryptRsa(privateKey, request.getParameter("ORIGIN_ID")) : "";
                } catch (Exception e) {
                	LOGGER.error(e.getMessage());
                }

        		param.put("USER_ID", userid);
        		param.put("PASSWORD", pwd);
        		param.put("SYSTEM_GCD", "0002");
        		param.put("ORIGIN_ID", orginid);

        		if (!IUtility.parseNull(param.get("USER_ID")).equals(IUtility.parseNull(param.get("ORIGIN_ID"))) && !"".equals(IUtility.parseNull(param.get("ORIGIN_ID")))) {

        			CustomUserDetail cuserInfo = null;
        			Object userObj = null;
        			try {
        				userObj = IUtility.getLoginInfo();
        			} catch (Exception e) {
        				LOGGER.error(e.getMessage());
        			}
        			if ("anonymousUser".equals(userObj)) {
        				throw new UsernameNotFoundException(authToken.getName());
        			} else {
        				cuserInfo = (CustomUserDetail) userObj;
        			}

        			if (!"Y".equals(IUtility.parseNull(cuserInfo.getUserChgAuthYn()))) {
        				throw new UsernameNotFoundException(authToken.getName());
        			}
        		}

        		try {
        			userInfo = userLoginCheckService.loginCheck(param);
        		} catch (Exception e) {
        			LOGGER.error(e.getMessage());
        		}
            }
        }

		if (userInfo == null) {
			throw new UsernameNotFoundException(authToken.getName());
		}

		// 패스워드 불일치
		if ("0008".equals(((CustomUserDetail) userInfo).getLoginResult())) {
			throw new BadCredentialsException(((CustomUserDetail) userInfo).getLoginResultMsg());
		}

		// 사용하지 않는 유저
		if (!userInfo.isEnabled()) {
			throw new DisabledException(((CustomUserDetail) userInfo).getLoginResultMsg());
		}

		// 계정잠김
		if (!userInfo.isAccountNonLocked()) {
			throw new LockedException(((CustomUserDetail) userInfo).getLoginResultMsg());
		}

		// 접속 유효기간이 아님
		if (!userInfo.isAccountNonExpired()) {
			throw new AccountExpiredException(((CustomUserDetail) userInfo).getLoginResultMsg());
		}
		/*
		 * //패스워드 유효기간이 아님 if(!userInfo.isCredentialsNonExpired()) { throw new
		 * CredentialsExpiredException(""); }
		 */

		// 로그인 실패횟수 넘어감
		if (!((CustomUserDetail) userInfo).isLoginFailNumbered()) {
			throw new LoginFailNumberException(((CustomUserDetail) userInfo).getLoginResultMsg());
		}

		// 로그인 잠금된 유저 넘어감
		if (!((CustomUserDetail) userInfo).isLoginLocked()) {
			throw new LoginLockedException(((CustomUserDetail) userInfo).getLoginResultMsg());
		}

		List<GrantedAuthority> authorities = (List<GrantedAuthority>) userInfo.getAuthorities();

		return new UsernamePasswordAuthenticationToken(userInfo, authToken.getCredentials(), authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
}
