package com.onestop.core.resolver;


import java.io.InputStream;
import java.security.PrivateKey;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.MethodParameter;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.HandlerMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;

@Component
public class CommandMapResolver implements HandlerMethodArgumentResolver {
	
	protected final Log LOGGER = LogFactory.getLog(getClass());
	
    public boolean supportsParameter(MethodParameter parameter) {
        if (ParamMap.class.isAssignableFrom(parameter.getParameterType()) ) {
            return true;
        } else {
            return false;
        }
    }
    
    private static String getDatetime(String pattern) throws Exception {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern(pattern));
    }

    public Object resolveArgument(MethodParameter parameter,
                                  ModelAndViewContainer mavContainer, NativeWebRequest webRequest,
                                  WebDataBinderFactory binderFactory) throws Exception {

        HttpServletRequest request = (HttpServletRequest) webRequest
                .getNativeRequest();
        HttpSession session = request.getSession();
        ServletServerHttpRequest serverHttpRequest = new ServletServerHttpRequest(request);
        
        ParamMap paramMap = new ParamMap();
        Map<String, Object> authMap = new HashMap<String, Object>();
        Map<String, Object> bindMap = new HashMap<String, Object>();
        
        Iterator<String> iterator = webRequest.getParameterNames();
        
        while(iterator.hasNext()) {
        	String key = iterator.next();
        	paramMap.put(key, webRequest.getParameter(key));
        }
        
        ObjectMapper mapper = new ObjectMapper();
        InputStream stream = null;
        stream = serverHttpRequest.getBody();
        
        String streamResult = IOUtils.toString(stream, "UTF-8");
        
        if(IUtility.isJsonString(streamResult)) {
        	paramMap.putAll(mapper.readValue(streamResult, Map.class));
        }
        
        if(stream != null) stream.close();

        Map pathVariables = (Map) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
        Iterator<String> pathIter = pathVariables.keySet().iterator();
        while (pathIter.hasNext()) {
            String key = pathIter.next();
            Object value = pathVariables.get(key);
            if (value != null) {
            	paramMap.put(key, (String) value);
            }
        }

		CustomUserDetail userInfo = null;
		Object userObj = IUtility.getLoginInfo();
		if("anonymousUser".equals(userObj)) {
			userInfo = new CustomUserDetail();
		} else {
			userInfo = (CustomUserDetail)userObj;
		}
		PrivateKey privateKey = (PrivateKey) session.getAttribute(ProjectConstant.RSA_PRIVATE_KEY);
		
        String userId = IUtility.parseNull(userInfo.getUserId());
        String userNm = IUtility.parseNull(userInfo.getUsername());
        String userGcd = IUtility.parseNull(userInfo.getUserGcd());
        String userIp = IUtility.parseNull(userInfo.getUserIp());
        String userDeptCd = IUtility.parseNull(userInfo.getAssignCd());
        String locale = IUtility.parseNull(session.getAttribute("SESSION_LOCALE"));
        String auth = IUtility.parseNull(paramMap.get("AUTH_STR"));
        String bind = IUtility.parseNull(paramMap.get("BIND_STR"));
        String tdata = IUtility.parseNull(paramMap.get("_data"));
        
        String nm = IUtility.parseNull(userInfo.getNm());                                // 사용자명
        String engNm = IUtility.parseNull(userInfo.getEngNm());                          // 사용자영문명
        
        String assignNm = IUtility.parseNull(userInfo.getAssignNm());                          // 부서명
        
        String cmplTermCnt = IUtility.parseNull(userInfo.getCmplTermCnt());              // 이수학기 
        String atlectTermCnt = IUtility.parseNull(userInfo.getAtlectTermCnt());              // 수강학기 
        
        String nationCd = IUtility.parseNull(userInfo.getNationCd());                    // 국적 코드
        String nationKorNm = IUtility.parseNull(userInfo.getNationKorNm());                    // 국적명
        
        String collGradGcd = IUtility.parseNull(userInfo.getCollGradGcd());    // 대학/대학원 코드
        String collGradGcdKorNm = IUtility.parseNull(userInfo.getCollGradGcdKorNm());    // 대학/대학원명
        
        String gradGcd = IUtility.parseNull(userInfo.getGradGcd());            //  대학원코드
        String gradGcdKorNm = IUtility.parseNull(userInfo.getGradGcdKorNm());            //  대학원명
        
        String collCd = IUtility.parseNull(userInfo.getCollCd());              //  단과대학코드
        String collCdKorNm = IUtility.parseNull(userInfo.getCollCdKorNm());              //  단과대학명
        
        String deptCd = IUtility.parseNull(userInfo.getDeptCd());              // 학과(부)코드
        String deptCdKorNm = IUtility.parseNull(userInfo.getDeptCdKorNm());              // 학과(부)명
        
        String majorCd = IUtility.parseNull(userInfo.getMajorCd());            // 전공코드
        String majorCdKorNm = IUtility.parseNull(userInfo.getMajorCdKorNm());            // 전공명
        
        String hjStaGcd = IUtility.parseNull(userInfo.getHjStaGcd());          // 학적상태코드
        String hjStaGcdKorNm = IUtility.parseNull(userInfo.getHjStaGcdKorNm());          // 학적상태명
        
        String stdtGcd = IUtility.parseNull(userInfo.getStdtGcd());          // 사용자종류코드
        
        
        String stdtYearGcdKorNm = IUtility.parseNull(userInfo.getStdtYearGcdKorNm());          //학년명
        String degCourseGcdKorNm = IUtility.parseNull(userInfo.getDegCourseGcdKorNm());  //학위과정명
        
        String minorKorNm = IUtility.parseNull(userInfo.getMinorKorNm()); // 부전공
    	String doubleMajorKorNm= IUtility.parseNull(userInfo.getDoubleMajorKorNm()) ; // 복수전공
    	String unitedMajorKorNm= IUtility.parseNull(userInfo.getUnitedMajorKorNm()) ; // 연합전공
    	String admsDate= IUtility.parseNull(userInfo.getAdmsDate()) ; // 입학일자
    	String admsGcd= IUtility.parseNull(userInfo.getAdmsGcd()) ; // 입학구분
    	
    	String userGbnUpperPartGcd= IUtility.parseNull(userInfo.getUserGbnUpperPartGcd()) ; // 사용자구분 대분류
    	String userGbnMiddlePartGcd= IUtility.parseNull(userInfo.getUserGbnMiddlePartGcd()) ; // 사용자구분 중분류
    	String userGbnLowerPartGcd= IUtility.parseNull(userInfo.getUserGbnLowerPartGcd()) ; // 사용자구분 소분류
        /*
        if(!"".equals(auth)) {
        	auth = IUtility.getDecStr(auth);
        	if("".equals(auth)) auth = "{}";
        	authMap = mapper.readValue(auth, Map.class);
        	paramMap.put("AUTH", authMap);
        }
        
        if (!"".equals(bind)) {
            String[] bindArr = bind.split(",");
            if (bindArr != null && bindArr.length > 0) {
                bind = "";
                for (String _obj : bindArr) {
                    bind += IUtility.decryptRsa(privateKey, _obj);
                }
            }
            paramMap.put("BIND", mapper.readValue(bind, Map.class));
            bindMap = (Map) paramMap.get("BIND");            
        }
        */
        Object data = null;
        /*
        if (!"".equals(IUtility.parseNull(paramMap.get("data")))) {
            data = paramMap.get("data");
        } else if(!"".equals(_data) && (_data.startsWith("{") || _data.startsWith("["))) {
            data = paramMap.get("_data");
        } else {
            if (!"".equals(_data)) {
                String[] _dataArr = _data.split(",");
                if (_dataArr != null && _dataArr.length > 0) {
                    _data = "";
                    for (String _obj : _dataArr) {
                        _data += IUtility.decryptRsa(privateKey, _obj);
                    }
                }
                if (_data.startsWith("{")) {
                    data = mapper.readValue(_data, Map.class);
                } else if (_data.startsWith("[")) {
                    data = mapper.readValue(_data, List.class);
                }
            }
        }
        */
        if (!"".equals(IUtility.parseNull(paramMap.get("data")))) {
            if (!"".equals(auth)) {
                auth = IUtility.getDecStr(auth);
                if ("".equals(auth))
                    auth = "{}";
                authMap = mapper.readValue(auth, Map.class);
                paramMap.put("AUTH", authMap);
            }
            if (!"".equals(bind)) {
                bindMap = (Map) paramMap.get("BIND_STR");
            }
            data = paramMap.get("data");           
        } else if(!"".equals(tdata) && (tdata.startsWith("{") || tdata.startsWith("["))) {
            if (!"".equals(auth)) {
                auth = IUtility.getDecStr(auth);
                if ("".equals(auth))
                    auth = "{}";
                authMap = mapper.readValue(auth, Map.class);
                paramMap.put("AUTH", authMap);
            }
            if (!"".equals(bind)) {
                bindMap = (Map) paramMap.get("BIND_STR");
            }
            data = paramMap.get("_data");
        } else {            
            if (!"".equals(tdata)) {
                String[] tdataArr = tdata.split(",");
                if (tdataArr != null && tdataArr.length > 0) {
                    tdata = "";
                    for (String tobj : tdataArr) {
                        tdata += IUtility.decryptRsa(privateKey, tobj);
                    }
                }
                data = mapper.readValue(tdata, Map.class);
                if(data != null) {
                    tdata = (String)((Map)data).get("_data");
                    auth = (String)IUtility.parseNull(((Map)data).get("AUTH_STR"));
                    bind = (String)IUtility.parseNull(((Map)data).get("BIND_STR"));
                    
                    if (!"".equals(auth)) {
                        auth = IUtility.getDecStr(auth);
                        if ("".equals(auth))
                            auth = "{}";
                        authMap = mapper.readValue(auth, Map.class);
                        paramMap.put("AUTH", authMap);                        
                    }
                    
                    if (!"".equals(bind)) {
                        paramMap.put("BIND", mapper.readValue(bind, Map.class));
                        bindMap = (Map) paramMap.get("BIND");            
                    }
                    if (!"".equals(tdata)) {
                        if (tdata.startsWith("{")) {
                            data = mapper.readValue(tdata, Map.class);
                        } else if (tdata.startsWith("[")) {
                            data = mapper.readValue(tdata, List.class);
                        }
                    }
                }
            }
        }
        if(data != null) {
        	LOGGER.info("===========Request Params======================");        
        	LOGGER.info("");
        	LOGGER.info("- Call DateTime : ["+getDatetime("yyyy-MM-dd HH:mm:ss")+"]");
        	LOGGER.info("");
            
	        String className = data.getClass().getName();
	        String keyVal = null;
	        
	        if(className.contains("Map")) {
	        	
	        	((Map)data).putAll(authMap);
	        	((Map) data).putAll(bindMap);
	        	
	        	((Map)data).put("SESSION_USER_ID", userId);
	        	((Map) data).put("SESSION_USER_NM", userNm);
                ((Map) data).put("SESSION_USER_GCD", userGcd);
	        	((Map)data).put("SESSION_USER_IP", userIp);
	        	((Map)data).put("SESSION_USER_DEPT_CD", userDeptCd);
	        	((Map)data).put("SESSION_LOCALE", locale);
	        	String localeNm = "";
	        	if(locale.equals("0002")) {
	        		localeNm = "en";
	        	}else if(locale.equals("0003")) {
	        		localeNm = "cn";
	        	}else {
	        		localeNm = "ko";
	        	}
	        	((Map)data).put("SESSION_LOCALE_NM", localeNm);
	        	((Map)data).put("SESSION_BROWSER", IUtility.getClientBrowser(request));
	        	((Map)data).put("SESSION_OS", IUtility.getClientOs(request));
	        	
	        	((Map)data).put("SESSION_USER_NM", nm);
	        	((Map)data).put("SESSION_USER_ENG_NM", engNm);        								//사용자영문명
	        	
	        	((Map)data).put("SESSION_ASSIGN_NM", assignNm);        								//부서명
	        	
	        	((Map)data).put("SESSION_CMPL_TERM_CNT", cmplTermCnt);							//이수학기수
	        	((Map)data).put("SESSION_ATLECT_TERM_CNT", atlectTermCnt);   						//수강학기수
	        	
	        	((Map)data).put("SESSION_NATION_CD", nationCd);
	        	((Map)data).put("SESSION_NATION_KOR_NM", nationKorNm);							//국가코드명
	        	
	        	((Map)data).put("SESSION_COLL_GRAD_GCD", collGradGcd);
	        	((Map)data).put("SESSION_COLL_GRAD_GCD_KOR_NM", collGradGcdKorNm);		// 대학/대학원명
	        	
	        	((Map)data).put("SESSION_GRAD_GCD", gradGcd); 
	        	((Map)data).put("SESSION_GRAD_GCD_KOR_NM", gradGcdKorNm); 					// 대학원명
	        	
	        	((Map)data).put("SESSION_COLL_CD", collCd);    
	        	((Map)data).put("SESSION_COLL_CD_KOR_NM", collCdKorNm);    						 // 단과대학명
	        	
	        	((Map)data).put("SESSION_DEPT_CD", deptCd);  
	        	((Map)data).put("SESSION_DEPT_CD_KOR_NM", deptCdKorNm);  						// 학과(부)명
	        	
	        	((Map)data).put("SESSION_MAJOR_CD", majorCd);
	        	((Map)data).put("SESSION_MAJOR_CD_KOR_NM", majorCdKorNm);  					// 전공명

	        	((Map)data).put("SESSION_HJ_STA_GCD", hjStaGcd);
	        	((Map)data).put("SESSION_HJ_STA_GCD_KOR_NM", hjStaGcdKorNm); 				// 학적상태명
	        	
	        	((Map)data).put("SESSION_STDT_GCD", stdtGcd); 				// 사용자종류코드
	        	
	        	((Map)data).put("SESSION_STDT_YEAR_GCD_KOR_NM", stdtYearGcdKorNm); 		// 학년명
	        	((Map)data).put("SESSION_DEG_COURSE_GCD_KOR_NM", degCourseGcdKorNm);  //학위과정명
	        	
	        	((Map)data).put("SESSION_MINOR_KOR_NM", minorKorNm);  //부전공
	        	((Map)data).put("SESSION_DOUBLE_MAJOR_KOR_NM", doubleMajorKorNm);  //복수전공
	        	((Map)data).put("SESSION_UNITED_MAJOR_KOR_NM", unitedMajorKorNm);  //연합전공
	        	((Map)data).put("SESSION_ADMS_DATE", admsDate);  //입학일자
	        	((Map)data).put("SESSION_ADMS_GCD", admsGcd);  //입학구분
	        	
	        	((Map)data).put("SESSION_USER_GBN_UPPER_PART_GCD", userGbnUpperPartGcd);  //사용자구분 대분류
	        	((Map)data).put("SESSION_USER_GBN_MIDDLE_PART_GCD", userGbnMiddlePartGcd);  //사용자구분 중분류
	        	((Map)data).put("SESSION_USER_GBN_LOWER_PART_GCD", userGbnLowerPartGcd);  //사용자구분 소분류

	        	if(((Map)data).get("SESSION_SYSTEM_GCD") == null) {
	        	    ((Map)data).put("SESSION_SYSTEM_GCD", "0002");
	        	}
	        	
	        	if(((Map)data).get("SESSION_MENU_CD") == null) {
	        	    ((Map)data).put("SESSION_MENU_CD", "000000000000000");
	        	}

	        	LOGGER.info("- RequestURI : " + request.getRequestURI());
	        	LOGGER.info("");
	        	LOGGER.info("- Parameter Type : " + className);
	        	LOGGER.info("");
	            for(String key : ((Map<String, Object>)data).keySet()) {
	            	keyVal = IUtility.parseEmptyNull(((Map<String, Object>) data).get(key));
                    if( keyVal == null ) {
                        ((Map<String, Object>) data).put(key, null);
                    }
                    LOGGER.info(" MAP - " + key + " : " + keyVal);
	            }
	            LOGGER.info("");
	        	
	        } else if(className.contains("List")) {
	            
	        	LOGGER.info("- RequestURI : " + request.getRequestURI());
	        	LOGGER.info("");
	        	LOGGER.info("- Parameter Type : " + className);
	        	LOGGER.info("");
                
	        	List<Map<String, Object>> dataList = (List<Map<String, Object>>) data;
	        	if(dataList == null) dataList = new ArrayList<Map<String, Object>>();
	        	for(int i = 0, x = dataList.size(); i < x; i++) {
	        		Map<String, Object> objMap = dataList.get(i);
	        		objMap.putAll(authMap);
	        		objMap.putAll(bindMap);
	            	objMap.put("SESSION_USER_ID", userId);
	            	objMap.put("SESSION_USER_NM", userNm);
                    objMap.put("SESSION_USER_GCD", userGcd);
	            	objMap.put("SESSION_USER_IP", userIp);
	            	objMap.put("SESSION_USER_DEPT_CD", userDeptCd);
	            	objMap.put("SESSION_LOCALE", locale);
	            	String localeNm = "";
		        	if(locale.equals("0002")) {
		        		localeNm = "en";
		        	}else if(locale.equals("0003")) {
		        		localeNm = "cn";
		        	}else {
		        		localeNm = "ko";
		        	}
		        	objMap.put("SESSION_LOCALE_NM", localeNm);
		        	
	            	objMap.put("SESSION_BROWSER", IUtility.getClientBrowser(request));
	            	objMap.put("SESSION_OS", IUtility.getClientOs(request));

	            	if(objMap.get("SESSION_SYSTEM_GCD") == null) {
	            	    objMap.put("SESSION_SYSTEM_GCD", IUtility.parseNull(session.getAttribute("SESSION_SYSTEM_GCD")));
	                }

	            	for (String key : objMap.keySet()) {                        
                        keyVal = IUtility.parseEmptyNull(objMap.get(key));
                        if( keyVal == null ) {
                            objMap.put(key, null);
                        }
                        LOGGER.info(" LIST - " + key + " : " + keyVal);
                    }                    
                    dataList.set(i, objMap);
	                LOGGER.info("");
	        	}
	        } 
	        LOGGER.info("==========================================");
        }
        paramMap.put("data", data);
        request.setAttribute("paramMap", paramMap);
        return paramMap;
    }
}