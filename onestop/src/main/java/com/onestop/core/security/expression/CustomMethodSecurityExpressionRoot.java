package com.onestop.core.security.expression;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.access.expression.SecurityExpressionRoot;
import org.springframework.security.access.expression.method.MethodSecurityExpressionOperations;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.IUtility;

public class CustomMethodSecurityExpressionRoot extends SecurityExpressionRoot implements MethodSecurityExpressionOperations {
	protected final Log LOGGER = LogFactory.getLog(getClass());
    private Object filterObject;
    private Object returnObject;
    private Object targetObject;

    public CustomMethodSecurityExpressionRoot(Authentication authentication) {
        super(authentication);
    }

    @Override
    public void setFilterObject(Object filterObject) {
        this.filterObject = filterObject;
    }

    @Override
    public Object getFilterObject() {
        return this.filterObject;
    }

    @Override
    public void setReturnObject(Object returnObject) {
        this.returnObject = returnObject;
    }

    @Override
    public Object getReturnObject() {
        return this.returnObject;
    }

    @Override
    public Object getThis() {
        return this.targetObject;
    }

    public void setThis(Object targetObject) {
        this.targetObject = targetObject;
    }
    
    
    public boolean customAnyMethod(String... auths) {
        boolean rtnValue = false;
        HttpServletRequest request = null;
        try {
            request = IUtility.getRequest();
        } catch (Exception e) {
        	LOGGER.info("customMethod URI = request is null!!");
        }
        
        if(request != null) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            Object principal = authentication.getPrincipal();
            String claaName = "";
            if(principal != null) claaName = IUtility.parseNull(principal.getClass().getName());
            
            if(claaName.contains("CustomUserDetail")) {
                CustomUserDetail userInfo = (CustomUserDetail) principal;
                // 체크하기
                String headerAuthStr = request.getHeader("headerAuthStr");
                                
                String authStr = IUtility.getDecStr(headerAuthStr);
                Map<String, Object> authMap = IUtility.convertJsonStrToMap(authStr);
                
                for (String auth : auths) {
                    if(IUtility.checkAccess(auth, authMap)) {
                        rtnValue = true;
                        break;
                    }
                }
                
            }

        } else {
        	LOGGER.info("customMethod URI = request is null!!");
        }
        return rtnValue;
    }
}
