package com.onestop.ost.bus.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.exception.ExecuteException;
import com.onestop.core.handler.CustomException;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.bus.service.BusApplyService;
import com.onestop.ost.bus.dao.BusApplyDao;


/**
 * <pre>
 * Class Name: BusApplyServiceImpl.java
 * Description: 통학버스 신청 ServiceImpl
 * </pre>
 * 
 * @author 신재원
 * @since 2022. 02. 07.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("busApplyService")
public class BusApplyServiceImpl extends CommonServiceImpl implements BusApplyService{
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private BusApplyDao busApplyDao;
    
    /**
     * 통학버스 진행학기를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<Map<String, Object>> selectDateCheck(Map<String, Object> map) throws Exception {
        return busApplyDao.selectDateCheck(map);
    }
    
    /**
     * 통학버스 이용신청을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public List<Map<String, Object>>selectBusApply(Map<String, Object> param) throws Exception {
    	return busApplyDao.selectBusApply(param);
    }
    
    /**
     * 통학버스 승차시간,장소코드/ 하차시간,장소코드를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public List<Map<String, Object>>selectBusCd(Map<String, Object> param) throws Exception {
    	return busApplyDao.selectBusCd(param);
    }
    
    /**
     * 통학버스 현재 월의 탑승정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public List<Map<String, Object>>selectMonthApplyList(Map<String, Object> param) throws Exception {
    	return busApplyDao.selectMonthApplyList(param);
    }
    
    /**
     * 통학버스 이용신청을 신규,수정 한다.
     * @param list
     * @return <Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional 
    public void executeBusApply(List<Map<String, Object>> list) throws Exception {
    	Map<String, Object> map = null;
        for(int i=0; i<list.size(); i++){
            map = busApplyDao.executeBusApply(list.get(i));
            map.put("O_RSLT", map.get("O_RSLT"));
        	map.put("O_MSG", map.get("O_MSG"));
        }
    }

    /**
     * 통학버스 이용신청_마스터를 저장 한다.
     * @param list
     * @return <Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional 
    public void executeBusApplyMaster(Map<String, Object> param) throws Exception {
    	Map<String, Object> map = null;

    		map = busApplyDao.executeBusApplyMaster(param);
    		map.put("O_RSLT", map.get("O_RSLT"));
    		map.put("O_MSG", map.get("O_MSG"));

    }
    
    /**
     * 통학버스 이용신청을 삭제 한다.
     * @param list
     * @return <Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional 
    public void cancelDetailBusApply(List<Map<String, Object>> list) throws Exception {
    	Map<String, Object> map = null;
        for(int i=0; i<list.size(); i++){
            map = busApplyDao.cancelDetailBusApply(list.get(i));
            map.put("O_RSLT", map.get("O_RSLT"));
        	map.put("O_MSG", map.get("O_MSG"));
        	
            if (map.get("O_RSLT").equals("N")) {
                throw new ExecuteException((String) map.get("O_MSG"));
            }
        }
    }
    @Override
    @Transactional 
    public void cancelBusApply(List<Map<String, Object>> list) throws Exception {
    	Map<String, Object> map = null;
        for(int i=0; i<list.size(); i++){
            map = busApplyDao.cancelBusApply(list.get(i));
            map.put("O_RSLT", map.get("O_RSLT"));
        	map.put("O_MSG", map.get("O_MSG"));
        }
    }
    
    /**
     * 통학버스 이용신청 학생의 사진을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectStdtPhoto(Map<String, Object> param) throws Exception {
        return busApplyDao.selectStdtPhoto(param);
    }
    
    /**
     * 통학버스 이용신청을 신규,수정 한다.
     * @param list
     * @return <Map<String, Object>
     * @throws Exception
     */
    @Override
    public void saveStdtPhoto(Map<String, Object> map) throws Exception {
        try {
            
        	busApplyDao.saveStdtPhoto(map);
            
        } catch (Exception ex) {
            throw new CustomException(ex, map);
        } 
    }
    
    /**
     * 통학버스 고지서 출력가능여부를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> printChkBusApply(Map<String, Object> param) throws Exception {
        return busApplyDao.printChkBusApply(param);
    }
}
