package com.onestop.core.security.expression;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.expression.WebSecurityExpressionRoot;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.onestop.core.exception.ExecuteException;
import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.IUtility;

public class CustomWebSecurityExpressionRoot extends WebSecurityExpressionRoot {
	protected final Log LOGGER = LogFactory.getLog(getClass());
	public CustomWebSecurityExpressionRoot(Authentication a, FilterInvocation fi) {
		super(a, fi);
	}

	public boolean customPage() throws Exception {
		boolean rtnValue = false;
		if (request != null) {
			
			LOGGER.info("====== customPage() ======> REQ URI : " + request.getRequestURI() + ", REMOTE IP : " + IUtility.getRemoteAddr(request));
			    
			if(request.getRequestURI() != null && request.getRequestURI().equals("/file/download.do") && IUtility.getRemoteAddr(request) != null && IUtility.getRemoteAddr(request).equals("10.1.7.21")) {
			        

			    //파일뷰어
	            rtnValue = true;
			} else {
				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				Object principal = authentication.getPrincipal();
				String claaName = "";
				if (principal != null)
					claaName = IUtility.parseNull(principal.getClass().getName());
	
				String uri = request.getRequestURI();
				String xPath = IUtility.parseNull(request.getParameter("w2xPath"));
	
				if (xPath.contains("/html/login.xml"))
					return true;
				if (!xPath.startsWith("/html/"))
					return true;
				if (!xPath.startsWith("/common/udc/"))
					return true;
				if (claaName.contains("CustomUserDetail")) {
					CustomUserDetail userInfo = (CustomUserDetail) principal;
					String roles = "USER,ADMIN";
					String[] paramArr = roles.split(",");
	
					if (!hasAnyRole(paramArr))
						return false;
	
					Map<String, Object> map = new HashMap<String, Object>();
					try {
						HttpSession session = request.getSession();
						ServletContext context = session.getServletContext();
						WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);
	
						map.put("SESSION_SYS_SE_CODE", IUtility.getSysSeCode());
						map.put("XPATH", xPath);
	
					} catch (Exception e) {
						LOGGER.error(e.getMessage());
					}
	
					// 권한 체크
					rtnValue = true;
				}
			}
		} else {
			LOGGER.info("customPage URI = request is null!!");
		}
		return rtnValue;
	}
	
	
	public boolean ignorePage() throws Exception {
		throw new ExecuteException("");
	}

}
