package com.onestop.ost.jolup.hakbujolupguide.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * Class Name: JolupSupposeInfoService.java
 * Description: 졸업예정정보 Service Class
 * </pre>
 * 
 * @author 심진용
 * @since 2022. 3. 2.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
public interface JolupSupposeInfoService {
    
    /**
     * 작성된 사정기분별 졸업예정정보를 조회한다.
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    public List<Map<String, Object>> selectListJolupSupposeInfo(Map<String, Object> param)throws Exception;
    
    public Map<String, Object> stdtJolupInfo(Map<String, Object> param) throws Exception ;
    
    public List<Map<String, Object>> hakjukList(Map<String, Object> param) throws Exception ;
    
    public List<Map<String, Object>> subjGbnList(Map<String, Object> param) throws Exception ;
    
    public List<Map<String, Object>> mandatorySubjList(Map<String, Object> param) throws Exception ;
    
    public List<Map<String, Object>> cultureChoiceList1(Map<String, Object> param) throws Exception ;
    
    public List<Map<String, Object>> cultureChoiceList2(Map<String, Object> param) throws Exception ;
    
    public List<Map<String, Object>> cultureChoiceList3(Map<String, Object> param) throws Exception ;
    
    public List<Map<String, Object>> majorList(Map<String, Object> param) throws Exception ;
    
    public List<Map<String, Object>> jolupReqList(Map<String, Object> param) throws Exception ;
    
}
