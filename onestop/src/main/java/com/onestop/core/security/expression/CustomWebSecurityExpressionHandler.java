package com.onestop.core.security.expression;

import org.springframework.security.access.expression.SecurityExpressionOperations;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;
import org.springframework.security.web.access.expression.WebSecurityExpressionRoot;
import org.springframework.stereotype.Component;

@Component
public class CustomWebSecurityExpressionHandler extends DefaultWebSecurityExpressionHandler {
	@Override
	protected SecurityExpressionOperations createSecurityExpressionRoot(Authentication authentication, FilterInvocation fi) {

		WebSecurityExpressionRoot expressionRoot = new CustomWebSecurityExpressionRoot(authentication, fi);
		
		return expressionRoot;
	}
}
