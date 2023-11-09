package com.onestop.core.rullcheck;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.context.MessageSource;
import org.springframework.security.access.AccessDeniedException;

import com.onestop.core.util.IUtility;

public class CustomRullChecker {
	private Map<String, Map<String, Object>> checkMap = null;
	private ResultRull resultRull = new ResultRull();
	private final MessageSource localeMessageSource;
	
	public CustomRullChecker(MessageSource localeMessageSource) {
		this.localeMessageSource = localeMessageSource;
	}
	
	public void initRulls() {
		checkMap = new HashMap<String, Map<String, Object>>();
	}
	
	public void initResultRull() {
		resultRull = new ResultRull();
	}
	
	public void addRull(String column, String name, CustomRull... rulls) throws Exception {
		if(checkMap == null) initRulls();
		Map<String, Object> map = checkMap.get(column);
		if(map == null) {
			map = new HashMap<String, Object>();
			map.put("name", name);
			checkMap.put(column, map);
		}
		
		if(rulls != null) {
			int len = rulls.length;
			for(int i = 0; i < len; i++) {
				CustomRull rull = rulls[i];
				map.put(rull.getRull(), rull.getRullValue());
			}
		}
	}
	
	public boolean getResult() {
		return this.resultRull.getResult();
	}
	
	public String getMessage() {
		return this.resultRull.getMessage();
	}
	
	public boolean checkMap(Map<String, Object> data) throws Exception {
		setResult(data);
		return getResult();
	}
	
	public Exception getException() {
		Exception rtnException = null;
		switch (this.resultRull.getErrorCode()) {
		case 101: //권한오류
			rtnException = new AccessDeniedException(this.resultRull.getMessage());
			break;
			
		case 201: //체크오류
			rtnException = new CustomRullCheckException(this.resultRull.getMessage());
			break;

		default:
			break;
		}
		
		return rtnException;
	}
	
	private void setResult(Map<String, Object> data) throws Exception {
		Map<String, Object> data2 = data;
		if(data2 == null) data2 = new HashMap<String, Object>();
		boolean isContinue = true;
		if(checkMap == null) initRulls();
		initResultRull();
		Iterator<String> iterator = checkMap.keySet().iterator();
		
		String rowStatus = IUtility.parseNull(data2.get("rowStatus"));
		
		switch (rowStatus) {
		case "C":
			if(!IUtility.checkAccess("NEW_YN", data2)) {
				resultRull.setResult(false);
				resultRull.setMessage(IUtility.getCommonMessage(localeMessageSource, "access.dinied.insert"));
				resultRull.setErrorCode(101);
				isContinue = false;
			}
			break;
			
		case "U":
			if(!IUtility.checkAccess("SAVE_YN", data2)) {
				resultRull.setResult(false);
				resultRull.setMessage(IUtility.getCommonMessage(localeMessageSource, "access.dinied.update"));
				resultRull.setErrorCode(101);
				isContinue = false;
			}
			break;
			
		case "D":
			if(!IUtility.checkAccess("DEL_YN", data2)) {
				resultRull.setResult(false);
				resultRull.setMessage(IUtility.getCommonMessage(localeMessageSource, "access.dinied.delete"));
				resultRull.setErrorCode(101);
				isContinue = false;
			}
			break;

		default:
			break;
		}
		
		if(!isContinue) return;
		
		while(iterator.hasNext()) {
			String column = iterator.next();
			Map<String, Object> rulls = checkMap.get(column);
			String name = IUtility.parseNull(rulls.get("name"));
			
			//validation 체크
			Iterator<String> iterRull = rulls.keySet().iterator();
			while(iterRull.hasNext()) {
				String value = IUtility.parseNull(data2.get(column));
				String rull = iterRull.next();
				String checkValue = IUtility.parseNull(rulls.get(rull));
				
				rull = rull.toUpperCase();
				
				switch (rull) {
				case "NOTNULL":
					if("".equals(value)) {
						resultRull.setResult(false);
						resultRull.setMessage(IUtility.getCommonMessage(localeMessageSource, "errors.required", name));
						resultRull.setErrorCode(201);
						isContinue = false;
					}
					break;
					
				case "MAXLENGTH":
					if(!"".equals(value) && value.length() > IUtility.parseInt(checkValue)) {
						resultRull.setResult(false);
						resultRull.setMessage(IUtility.getCommonMessage(localeMessageSource, "errors.maxlength", name, checkValue));
						resultRull.setErrorCode(201);
						isContinue = false;
					}
					break;
					
				case "MINLENGTH":
					if(!"".equals(value) && value.length() < IUtility.parseInt(checkValue)) {
						resultRull.setResult(false);
						resultRull.setMessage(IUtility.getCommonMessage(localeMessageSource, "errors.minlength", name, checkValue));
						resultRull.setErrorCode(201);
						isContinue = false;
					}
					break;
					
				case "MAXBYTE":
					if(!"".equals(value) && value.length() > 0) {
						int byteLen = IUtility.getStringByteLength(value);
						if(byteLen > IUtility.parseInt(checkValue)) {
							resultRull.setResult(false);
							resultRull.setMessage(IUtility.getCommonMessage(localeMessageSource, "errors.maxbyte", name, checkValue));
							resultRull.setErrorCode(201);
							isContinue = false;
						}
					}
					break;
					
				case "MINBYTE":
					if(!"".equals(value) && value.length() > 0) {
						int byteLen = IUtility.getStringByteLength(value);
						if(byteLen < IUtility.parseInt(checkValue)) {
							resultRull.setResult(false);
							resultRull.setMessage(IUtility.getCommonMessage(localeMessageSource, "errors.minbyte", name, checkValue));
							resultRull.setErrorCode(201);
							isContinue = false;
						}
					}
					break;

				default:
					break;
				}
				
				if(!isContinue) break;
			}
			if(!isContinue) break;
		}
	}
}
