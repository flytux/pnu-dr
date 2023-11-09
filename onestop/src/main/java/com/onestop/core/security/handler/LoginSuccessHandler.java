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
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.IUtility;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	protected final Log LOGGER = LogFactory.getLog(getClass());
	
	@Autowired
	ComFunctionService comFunctionService;

	/**
	 * 로그인 성공 시 로직 처리
	 */
	/**
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		String userId = IUtility.parseNull(request.getParameter("USER_ID"));

		InetAddress local;
		try {
			local = InetAddress.getLocalHost();

			CustomUserDetail customUserDetail = (CustomUserDetail) authentication.getPrincipal();
			customUserDetail.setUserIp(IUtility.getRemoteAddr(request));

			Map<String, Object> loginHistMap = new HashMap<String, Object>();
			loginHistMap.put("USE_HISTORY_GCD", "0001");
            loginHistMap.put("USE_HISTORY_GCD_NM", IUtility.USE_HISTORY_GCD_MAP.get("0001"));
			loginHistMap.put("CONN_BROWSER_INFO", IUtility.getClientBrowser(request));
			loginHistMap.put("CONN_OS_INFO", IUtility.getClientOs(request));
			loginHistMap.put("CONN_IP", IUtility.getRemoteAddr(request));
			loginHistMap.put("USE_HISTORY_CONTENT", customUserDetail.getUsername() + "(" + userId + ")이(가) " + IUtility.getDatetime() + "에 로그인 하였습니다.");
			loginHistMap.put("FIRST_USER_ID", "");
			loginHistMap.put("USER_ID", userId);
			loginHistMap.put("USER_NM", customUserDetail.getUsername());
            loginHistMap.put("USER_GCD", customUserDetail.getUserGcd());
			loginHistMap.put("SYSTEM_GCD", "0002");
			loginHistMap.put("SYSTEM_GCD_NM", IUtility.SYSTEM_GCD_MAP.get("0002"));
			loginHistMap.put("MENU_CD", ".");
			loginHistMap.put("INS_USER_ID", userId);
			loginHistMap.put("INS_USER_IP", IUtility.getRemoteAddr(request));
			loginHistMap.put("INS_SYSTEM_GCD", "0002");
			loginHistMap.put("INS_MENU_CD", ".");

			comFunctionService.insertSystemLog(loginHistMap);

			
			
		} catch (UnknownHostException e1) {
			LOGGER.error(e1.getMessage());
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
		}
		
	
		super.onAuthenticationSuccess(request, response, authentication);
	}
	*/
	
	/**
     * 로그인 성공 시 로직 처리
     */
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        InetAddress local;
        String userId = "";
        try {
            local = InetAddress.getLocalHost();
            String serverIp = local.getHostAddress();
            String clientIp = IUtility.getRemoteAddr(request);
            String datetime = IUtility.getDatetime();

            String usernm = "";
            String usergcd = "";

            CustomUserDetail customUserDetail = (CustomUserDetail) authentication.getPrincipal();
            
            customUserDetail.setFinalLoginDt(IUtility.getDatetime());
            customUserDetail.setUserIp(IUtility.getRemoteAddr(request));

            userId = customUserDetail.getUserId();
            usergcd = customUserDetail.getUserGcd();
            
            Map<String, Object> loginHistMap = new HashMap<String, Object>();
            loginHistMap.put("USE_HISTORY_GCD", "0001");
            loginHistMap.put("USE_HISTORY_GCD_NM", IUtility.USE_HISTORY_GCD_MAP.get("0001"));
            loginHistMap.put("CONN_BROWSER_INFO", IUtility.getClientBrowser(request));
            loginHistMap.put("CONN_OS_INFO", IUtility.getClientOs(request));
            loginHistMap.put("CONN_IP", clientIp);
            loginHistMap.put("USE_HISTORY_CONTENT", customUserDetail.getUsername() + "(" + userId + ")이(가) " + datetime + "에 로그인 하였습니다.");
            loginHistMap.put("FIRST_USER_ID", customUserDetail.getOriginIdId());
            loginHistMap.put("USER_ID", userId);
            loginHistMap.put("USER_NM", customUserDetail.getUsername());
            loginHistMap.put("USER_GCD", usergcd);
            loginHistMap.put("SYSTEM_GCD", "0002");
            loginHistMap.put("SYSTEM_GCD_NM", IUtility.SYSTEM_GCD_MAP.get("0002"));
            loginHistMap.put("MENU_CD", ".");
            loginHistMap.put("INS_USER_ID", userId);
            loginHistMap.put("INS_USER_IP", clientIp);
            loginHistMap.put("INS_SYSTEM_GCD", "0002");
            loginHistMap.put("INS_MENU_CD", ".");

            comFunctionService.insertSystemLog(loginHistMap);
            
            HttpSession session = request.getSession();
            
            
            session.removeAttribute("tryLoginCnt");
            session.removeAttribute("preRequestLoginId");
            session.removeAttribute("manyTryLoginYn");

        } catch (UnknownHostException e1) {
            LOGGER.error(e1.getMessage());
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
        }
        super.onAuthenticationSuccess(request, response, authentication);
    }

}
