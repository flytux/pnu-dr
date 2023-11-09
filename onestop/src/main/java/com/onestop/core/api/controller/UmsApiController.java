package com.onestop.core.api.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.onestop.core.api.service.UmsApiService;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.controller.CommonController;

@RequestMapping(value = "/ums/api")
@RestController
public class UmsApiController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;

    @Resource(name = "umsApiService")
    private UmsApiService umsApiService;
    

    @RequestMapping(value = "/gfnUmsSendMsg")
    public Map<String, Object> gfnUmsSendMsg(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> map = new HashMap<String, Object>();
        
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

        setSuccess(result, umsApiService.gfnUmsSendMsg(param));
        return result;
    }
    
    @RequestMapping(value = "/gfnUmsGetPaymntId")
    public Map<String, Object> gfnUmsGetPaymntId(ParamMap paramMap, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        setSuccess(result, umsApiService.gfnUmsGetPaymntId(param));
        return result;
    }
    
   

}