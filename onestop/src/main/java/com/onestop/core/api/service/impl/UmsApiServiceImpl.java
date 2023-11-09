package com.onestop.core.api.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onestop.core.api.dao.UmsApiDao;
import com.onestop.core.api.service.UmsApiService;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;


import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

@Service("umsApiService")
public class UmsApiServiceImpl implements UmsApiService {
	

    private final Logger LOGGER = LoggerFactory.getLogger(getClass().getName());

    @Autowired
    private UmsApiDao umsApiDao;
    
    public Map<String, Object> gfnUmsSendMsg(Map<String, Object> map) throws Exception {
        LOGGER.info("==gfnUmsSendMsg==start==");
        Map<String, Object> returnKey = new HashMap<String, Object>();
        String verifyResult = "";

        ObjectMapper mapper = new ObjectMapper();

        String msgInfo = mapper.writeValueAsString(map.get("msg_info"));
        LOGGER.info(msgInfo);
        String rcvUserList = mapper.writeValueAsString(map.get("rcv_user_list"));

       //if (!(IUtility.getLocalServerIp()).startsWith("192.168")) {
            // api 발송
            HttpResponse<String> response = Unirest.post("https://api.pusan.ac.kr/openapi/openApiData")
                    .header("Content-Type", "application/x-www-form-urlencoded")
                    .field("serviceKey", ProjectConstant.UMS_MSG_SEND_SERVICE_KEY)
                    .field("apiKey", ProjectConstant.UMS_MSG_SEND_API_KEY)
                    .field("resultType", ProjectConstant.UMS_MSG_SEND_RESULT_TPYE).field("msg_info", msgInfo)
                    .field("rcv_user_list", rcvUserList).asString();

            verifyResult = response.getBody();
            LOGGER.info(verifyResult);

        /*} else {
            HttpResponse<String> response = Unirest.post("http://localhost:6060/openapi/openApiData")
                    .header("Content-Type", "application/x-www-form-urlencoded")
                    .field("serviceKey", ProjectConstant.UMS_MSG_SEND_SERVICE_KEY)
                    .field("apiKey", ProjectConstant.UMS_MSG_SEND_API_KEY)
                    .field("resultType", ProjectConstant.UMS_MSG_SEND_RESULT_TPYE).field("msg_info", msg_info)
                    .field("rcv_user_list", rcv_user_list).asString();

            verifyResult = response.getBody();
            LOGGER.info(verifyResult);
        }*/

        if (verifyResult != "") {
            returnKey = mapper.readValue(verifyResult, Map.class);
            returnKey = (Map<String, Object>) returnKey.get("result");
        }

        return returnKey;
    }

    /**
     * 부서별 권한에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> gfnUmsGetPaymntId(Map<String, Object> param) throws Exception {
        return umsApiDao.gfnUmsGetPaymntId(param);
    }

}
