package com.onestop.ost.sj.kp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.util.IUtility;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.sj.kp.dao.MiddletermLecevalDao;
import com.onestop.ost.sj.kp.service.MiddletermLecevalService;

/**
 * <pre>
 * Class Name: MiddletermLecevalServiceImpl.java
 * Description: 중간평가관리 ServiceImpl
 * </pre>
 * 
 * @author 김수민
 * @since 2021. 12. 09.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("middletermLecevalService")
public class MiddletermLecevalServiceImpl extends CommonServiceImpl implements MiddletermLecevalService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private MiddletermLecevalDao middletermLecevalDao;
    
    /**
     * 중간강의평가 학사일정을 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchSchdChk(Map<String, Object> param) throws Exception {
        return middletermLecevalDao.searchSchdChk(param);
    }
    
    /**
     * 중간강의평가에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectMiddletermLeceval(Map<String, Object> param) throws Exception {
        return middletermLecevalDao.selectMiddletermLeceval(param);
    }
    
    /**
     * 중간강의평가 강의평가 전체문항을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectMiddletermLecevalQuestionList(Map<String, Object> param) throws Exception {
        return middletermLecevalDao.selectMiddletermLecevalQuestionList(param);
    }
    
    /**
     * 중간강의평가 강의평가작성 내용을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveMiddletermLecevalQuestion(List<Map<String, Object>> list) throws Exception {

        Map<String, Object> map = null;
        Map<String, Object> webMap = null;
        Map<String, Object> param = new HashMap<String, Object>();
        
        if(list.size() <= 0) {
        	param.put("msg", "저장 데이터가 없습니다.");
        	return param;
        } else {
        	// radioButton Name 문제 해결
            // 동일한 Name으로 변경해 줌
        	for(int i=0; i<list.size();i++) {
            	String questionNo = (String) list.get(i).get("QUESTION_NO");
            	
            	String group = (String) list.get(i).get("radioGroup"+questionNo);
            	if(group==null || group.isEmpty()) {
            		group = (String) list.get(i).get("sliderPoint"+questionNo);
            	}
            	list.get(i).put("radioGroup", group);
            }
            
            //웹제한 단어 검색
            for(int i=0; i<list.size(); i++) {
            	webMap = list.get(i);
            	if(!IUtility.parseNull(webMap.get("multipleTxt")).equals("")) {
            		List<Map<String, Object>> wordList = middletermLecevalDao.selectWebLimitWord(webMap);
            		if(wordList.size() > 0) {
            			String wordAll = "";
            			for(int j=0; j<wordList.size(); j++) {
            				String word = (String) wordList.get(j).get("LIMIT_WORD_CONTENT");
            				if(wordAll.equals("")) {
            					wordAll = word;
            				} else {
            					wordAll = wordAll + ", " + word;
            				}
            			}
            			param.put("resultYn", "N");
            			param.put("msg", wordAll+"(은)는 입력이 제한된 단어입니다.");
            			return param;
            		}
            	}
            }

        	for(int i=0; i<list.size(); i++){ 
        		map = list.get(i);
    			middletermLecevalDao.saveMiddletermLecevalQuestion(map); 
    		}
        	
        	// 학생 key 값 생성
        	middletermLecevalDao.saveStdtKey(list.get(0)); 
        	param.put("resultYn", "Y");
        	param.put("msg", "정상적으로 저장 되었습니다.");
        	
            return param;
        }
    }
}
