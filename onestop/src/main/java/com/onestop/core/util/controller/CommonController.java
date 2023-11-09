package com.onestop.core.util.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.onestop.core.util.IUtility;

public class CommonController extends AbstractController {

    public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        return null;
    }

    protected void setError(Map<String, Object> result, String errorCode, String errorMsg) {
        result.put("errorCode", errorCode);
        result.put("errorMsg", errorMsg);
        result.put("isError", "Y");
    }

    protected void setError(Map<String, Object> result, String errorCode) {
        switch (errorCode) {
            case "1001":
                setError(result, errorCode, "사용자 정보가 존재하지 않습니다.");
                break;

            case "1002":
                setError(result, errorCode, "학생지원시스템 사용 권한이 없습니다.");
                break;

            default:
                setError(result, errorCode, "처리 중 오류가 발생하였습니다.");
                break;
        }
    }

    protected void setSuccess(Map<String, Object> result, Object data) {
        try {
            if (data instanceof Map) {
                Map<String, Object> map = (Map<String, Object>) data;
                if (IUtility.containSystemAttr(map))
                    IUtility.removeSystemAttrData(map);

            } else if (data instanceof List) {
                List<Object> list = (List) data;
                if (list.size() > 0 && list.get(0) instanceof Map && IUtility.containSystemAttr(list.get(0))) {
                    for (int i = 0, x = list.size(); i < x; i++) {
                        Object obj = list.get(i);
                        if (obj instanceof Map) {
                            Map<String, Object> dataMap = (Map<String, Object>) obj;
                            IUtility.removeSystemAttrData(dataMap);
                        } else {
                            break;
                        }
                    }
                } else if (list.size() > 0 && list.get(0) instanceof List) {
                    for (int i = 0; i < list.size(); i++) {
                        List<Object> tlist = (List) list.get(i);
                        if (tlist.size() > 0 && tlist.get(0) instanceof Map
                                && IUtility.containSystemAttr(tlist.get(0))) {
                            for (int x = 0; tlist.size() < x; x++) {
                                Object obj = tlist.get(x);
                                if (obj instanceof Map) {
                                    Map<String, Object> dataMap = (Map<String, Object>) obj;
                                    IUtility.removeSystemAttrData(dataMap);
                                } else {
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            logger.error(e);
        }

        result.put("data", data);
        result.put("isSuccess", "Y");
        result.put("statusCode", "200");
    }

    protected void setSuccess(Map<String, Object> result) {
        result.put("data", new HashMap<String, Object>());
        result.put("isSuccess", "Y");
        result.put("statusCode", "200");
    }

    public static JSONArray convertListToJson(List<Map<String, Object>> bankCdList) {

        JSONArray jsonArray = new JSONArray();

        for (Map<String, Object> map : bankCdList) {
            jsonArray.add(convertMapToJson(map));
        }

        return jsonArray;

    }

    @SuppressWarnings({ "unchecked" })

    public static JSONObject convertMapToJson(Map<String, Object> map) {

        JSONObject json = new JSONObject();

        for (Map.Entry<String, Object> entry : map.entrySet()) {

            String key = entry.getKey();

            Object value = entry.getValue();

            // json.addProperty(key, value);

            json.put(key, value);

        }

        return json;

    }

}
