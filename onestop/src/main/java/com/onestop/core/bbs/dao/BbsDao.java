package com.onestop.core.bbs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.onestop.core.util.dao.CommonComnDao;

/**
 * <pre>
 * Class Name: BbsDao.java
 * Description: 게시판 dao클래스
 * </pre>
 * 
 * @author 김우영
 * @since 2022. 02. 03.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Repository
public class BbsDao extends CommonComnDao{
	
	private static final String SQLNAMESPACE = "core.bbs.";

	public Map<String, Object> selectBbsMgrInfo( Map<String, Object> map ) throws Exception{
		 return selectQueryMap(SQLNAMESPACE + "selectBbsMgrInfo", map);
	}
	
	public List<Map<String, Object>> selectBbsAuthInfo( Map<String, Object> map ) throws Exception{
		 return selectQuery(SQLNAMESPACE + "selectBbsAuthInfo", map);
	}
	
	/**
     * 게시판 카테고리 정보를 조회한다.
     * @param  param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
	public List<Map<String, Object>> selectListBbsCate(Map<String, Object> param) throws Exception {
        return selectQuery(SQLNAMESPACE + "selectListBbsCate", param);
    }
	
	public List<Map<String, Object>> selectBbsDataList( Map<String, Object> map ) throws Exception{
		 return listPaging(SQLNAMESPACE + "selectBbsDataList", map);
	}
	
	public Map<String, Object> selectBbsPassword(Map<String, Object> map) throws Exception {
        return selectQueryMap(SQLNAMESPACE + "selectBbsPassword", map);
    }
	
	public Map<String, Object> selectBbsDetail( Map<String, Object> map ) throws Exception{
		 return selectQueryMap(SQLNAMESPACE + "selectBbsDetail", map);
	}
	
	public List<Map<String, Object>> selectBbsReplyDataList( Map<String, Object> map ) throws Exception{
		 return selectQuery(SQLNAMESPACE + "selectBbsReplyDataList", map);
	}
	
	public void updateBbsTimesno(Map<String, Object> param) throws Exception {
		updateQuery(SQLNAMESPACE + "updateBbsTimesno", param);        
    }
	
	public Map<String, Object> saveBbsInfo(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeBbsInfo", param);        
    }
	
	public Map<String, Object> saveBbsReplyInfo(Map<String, Object> param) throws Exception {
        return executeQuery(SQLNAMESPACE + "executeBbsReplyInfo", param);        
    }
	
}
