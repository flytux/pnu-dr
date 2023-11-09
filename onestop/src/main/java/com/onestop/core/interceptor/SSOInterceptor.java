package com.onestop.core.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.onestop.core.util.IUtility;

import WiseAccess.SSO;

public class SSOInterceptor extends HandlerInterceptorAdapter {
	
	public void setReturnMsgScript(String msgDiv, HttpServletResponse response, String _msg) throws Exception {
        String msg = "";
        String rtnUrl = "";
        String script = "";
        switch(msgDiv){
        case"endSession": /* 세션 만료 */
            msg = "사용자 세션이 만료되었거나<br />다른 브라우저에 로그인 되었습니다.<br /><br />로그인 페이지로 이동합니다.";
            response.setStatus(response.SC_UNAUTHORIZED);
            script = msg;
            break;
        }
        response.setContentType("text/html; charset=utf-8");
         PrintWriter pr = response.getWriter();
         pr.print(script);
         pr.flush();
    }
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        String callURL = IUtility.parseNull(request.getRequestURL());
        String callURI = IUtility.parseNull(request.getRequestURI());
        String sToken = IUtility.parseNull(session.getAttribute("_sToken"));
        boolean sTokenChk = ((session.getAttribute("_sTokenChk") != null) ? (boolean)session.getAttribute("_sTokenChk") : false);
        String cIp = IUtility.getRemoteAddr(request);

        if(!"anonymousUser".equals(IUtility.getLoginInfo()) && !"".equals(sToken) && sTokenChk && !callURL.startsWith("http://localhost") && !callURL.startsWith("http://127.0.0.1") && !cIp.startsWith("192.168.2") && !cIp.startsWith("10.125.10.92") ) {
            SSO sso = IUtility.ssoGet(cIp);
            if( sso.verifyToken( sToken, cIp ) < 0 ) {
                
            	RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_USER_ID", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_USER_IP", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_CHG_PWD", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_GIGWAN", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_USER_NM", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_BIRTH_DT", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_GEN_FG", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_BUSEO_CD", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_BUSEO_NM", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_JK_FG", RequestAttributes.SCOPE_SESSION);
        		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_LOGIN_MAP", RequestAttributes.SCOPE_SESSION);
                
                RequestContextHolder.getRequestAttributes().removeAttribute("_sToken", RequestAttributes.SCOPE_SESSION);
                RequestContextHolder.getRequestAttributes().removeAttribute("_sTokenChk", RequestAttributes.SCOPE_SESSION);
                RequestContextHolder.getRequestAttributes().removeAttribute("_resetFg", RequestAttributes.SCOPE_SESSION);

                session.invalidate();
                
                String requestHeader =  IUtility.parseNull(request.getHeader("x-requested-with"));
                if("XMLHttpRequest".equals(requestHeader)){
                    setReturnMsgScript("endSession",response,"");   
                }else{
                    response.sendRedirect("/login.do");
                }
                return false;
            }
        }
        return true;
    }
}
