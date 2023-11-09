package com.onestop.core.util.dao;


import java.util.List;
import java.util.Map;

public interface MasterDAO {
    List<Map<String, Object>> selectList(Map<String, Object> parameter) throws Exception;
    Map<String, Object> selectOne(Map<String, Object> parameter) throws Exception;
    int selectCount(Map<String, Object> parameter) throws Exception;
    int insert(Map<String, Object> parameter) throws Exception;
    int update(Map<String, Object> parameter) throws Exception;
    int delete(Map<String, Object> parameter) throws Exception;
}
