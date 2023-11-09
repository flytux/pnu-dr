package com.onestop.core.api.service;

import java.util.List;
import java.util.Map;

public interface UmsApiService {	

	public Map<String, Object> gfnUmsSendMsg(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> gfnUmsGetPaymntId(Map<String, Object> map) throws Exception;
        
}
