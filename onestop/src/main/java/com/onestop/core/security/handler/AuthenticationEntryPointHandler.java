package com.onestop.core.security.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.onestop.core.util.IUtility;

@Component
public class AuthenticationEntryPointHandler implements AuthenticationEntryPoint {
	@Autowired
	MessageSource localeMessageSource;
	
	private static final String ERROR_PAGE = "/error/entrypoint";

	
	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		
		String isAjax = IUtility.parseNull(request.getHeader("AJAX"));
		String uri = request.getRequestURI();
		
		String entryPointMsg = "";
		try {
			entryPointMsg = IUtility.getCommonMessage(request, localeMessageSource, "access.expired");
		} catch (Exception e) {
			entryPointMsg = "session is expired!";
		}
		
		if("true".equals(isAjax)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("statusCode", 440);
			map.put("msg", entryPointMsg);
			map.put("errorMsg", authException.getLocalizedMessage());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			ObjectMapper mapper = new ObjectMapper();
			PrintWriter writer = response.getWriter();
			writer.print(mapper.writeValueAsString(map));
			writer.flush();
			
		} else {
		    String queryString = IUtility.parseNull(request.getQueryString());
		    String redirectPage = ERROR_PAGE;

		    if(!"".equals(queryString)) redirectPage += "?" + queryString;
		    
			response.sendRedirect(redirectPage);
		}
		
	}

}
