package com.onestop.core.security.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.csrf.InvalidCsrfTokenException;
import org.springframework.security.web.csrf.MissingCsrfTokenException;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.onestop.core.util.IUtility;

@Component
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	protected final Log LOGGER = LogFactory.getLog(getClass());
	@Autowired
	MessageSource localeMessageSource;
	
	private String errorPage = "/error/accessdenied";
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		String isAjax = IUtility.parseNull(request.getHeader("AJAX"));
		String uri = request.getRequestURI();
		int intCode = 403;
		String accessDiniedMsg = "";
		try {
			accessDiniedMsg = IUtility.getCommonMessage(request, localeMessageSource, "access.dinied");
			
			if("anonymousUser".equals(IUtility.getLoginInfo())) {
				accessDiniedMsg = "";
				intCode = 440;
			} else if(accessDeniedException instanceof InvalidCsrfTokenException) {
				accessDiniedMsg = IUtility.getCommonMessage(request, localeMessageSource, "access.tocken.invalid");
				intCode = 401;
			} else if(accessDeniedException instanceof MissingCsrfTokenException) {
				accessDiniedMsg = IUtility.getCommonMessage(request, localeMessageSource, "access.tocken.missing");
				intCode = 401;
			}
		} catch (Exception e) {
			accessDiniedMsg = "access denied!";
		}
		
		if("true".equals(isAjax)) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("statusCode", intCode);
			map.put("msg", accessDiniedMsg);
			map.put("errorMsg", accessDeniedException.getLocalizedMessage());
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			ObjectMapper mapper = new ObjectMapper();
			PrintWriter writer = response.getWriter();
			writer.print(mapper.writeValueAsString(map));
			writer.flush();
			
		} else {
			if(intCode == 401) {
			    errorPage = "/error/entrypoint";
			}
			String queryString = IUtility.parseNull(request.getQueryString());
			String redirectPage = errorPage;

			LOGGER.info("access denied Page = " + request.getRequestURI() + "/param=" + request.getQueryString());
			
			if(!"".equals(queryString)) {
			    redirectPage += "?" + queryString;
			}
			
			response.sendRedirect(redirectPage);
		}
		
	}

}
