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
import com.onestop.ost.sj.kp.dao.EndtermLecevalDao;
import com.onestop.ost.sj.kp.dao.MiddletermLecevalDao;
import com.onestop.ost.sj.kp.service.EndtermLecevalService;

/**
 * <pre>
 * Class Name: EndtermLecevalServiceImpl.java
 * Description: 기말강의평가 ServiceImpl
 * </pre>
 * 
 * @author 김수민
 * @since 2021. 12. 09.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("endtermLecevalService")
public class EndtermLecevalServiceImpl extends CommonServiceImpl implements EndtermLecevalService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private EndtermLecevalDao endtermLecevalDao;
    
    @Autowired
    private MiddletermLecevalDao middletermLecevalDao;
    
    /**
     * 기말강의평가 학사일정을 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchEndSchdChk(Map<String, Object> param) throws Exception {
        return endtermLecevalDao.searchEndSchdChk(param);
    }
    
    /**
     * 기말강의평가에 관련된 정보를 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectEndtermLeceval(Map<String, Object> param) throws Exception {
        return endtermLecevalDao.selectEndtermLeceval(param);
    }
    
    /**
     * 기말강의평가 강의평가 전체문항을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectEndtermLecevalQuestionList(Map<String, Object> param) throws Exception {
        return endtermLecevalDao.selectEndtermLecevalQuestionList(param);
    }
    
    /**
     * 기말강의평가 강의평가작성 내용을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveEndtermLecevalQuestion(List<Map<String, Object>> list) throws Exception {

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
        		endtermLecevalDao.saveEndtermLecevalQuestion(map); 
    		}
        	
        	// 학생 key 값 생성
        	middletermLecevalDao.saveStdtKey(list.get(0)); 
        	param.put("resultYn", "Y");
        	param.put("msg", "정상적으로 저장 되었습니다.");
        	
            return param;
        }
    }
    
    
    /**
     * 기말강의평가 교육인증 강의평가작성 내용을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveEduCertLecevalQuestion(List<Map<String, Object>> list) throws Exception {

        Map<String, Object> map = null;
        Map<String, Object> webMap = null;
        Map<String, Object> param = new HashMap<String, Object>();
        
        if(list.size() <= 0) {
        	param.put("msg", "저장 데이터가 없습니다.");
        	return param;
        } else {
            
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
        		endtermLecevalDao.saveEduCertLecevalQuestion(map); 
    		}
        	
        	// 학생 key 값 생성
        	//middletermLecevalDao.saveStdtKey(list.get(0)); 
        	param.put("resultYn", "Y");
        	param.put("msg", "정상적으로 저장 되었습니다.");
        	
            return param;
        }
    }
    
    /**
     * 기말강의평가 교육인증 강의평가 문항을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectEduCertLecevalQuestionList(Map<String, Object> param) throws Exception {
        return endtermLecevalDao.selectEduCertLecevalQuestionList(param);
    }
}
