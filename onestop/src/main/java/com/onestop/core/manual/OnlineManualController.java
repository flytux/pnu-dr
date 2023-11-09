package com.onestop.core.manual;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;

@RestController
@RequestMapping(value = "/core/manual")
public class OnlineManualController extends CommonController {
	
	@Autowired
	MessageSource localeMessageSource;

    @Autowired
    private ComFunctionService comFunctionService;

    
    @RequestMapping(value = "/selectmenu", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> selectListManualMenu(HttpServletRequest request
    		, HttpServletResponse response
    		, @RequestParam Map<String, Object> data
    ) throws Exception {
    	Map<String, Object> result = new HashMap<>();
    	data.put("SCH_SYSTEM_GCD", "0002");
		String [] params = {
				"SCH_SYSTEM_GCD","SESSION_USER_ID","SCH_MENU_TEXT","SCH_CONTENT_TEXT"
		};
		data.put("params", params);
		data.put("db", "SYS");
		data.put("proc", "SYS_온라인매뉴얼_조회_JSP");
		data.put("resultCnt", 1);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	setSuccess(result, list);
    	return result;
    }
    
    @RequestMapping(value = "/selectcontents", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> selectListManualContents(HttpServletRequest request
    		, HttpServletResponse response
    		, @RequestParam Map<String, Object> data
    ) throws Exception {
    	Map<String, Object> result = new HashMap<>();
    	data.put("SCH_SYSTEM_GCD", "0002");
    	data.put("INSTRTN_GCD", "0001");
		String [] params = {
				"SCH_SYSTEM_GCD","MENU_CD","INSTRTN_GCD","SCH_CONTENT_TEXT"
		};
		data.put("params", params);
		data.put("db", "SYS");
		data.put("proc", "SYS_매뉴얼내용_조회");
		data.put("resultCnt", 2);

		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	setSuccess(result, list);
    	return result;
    }
}
