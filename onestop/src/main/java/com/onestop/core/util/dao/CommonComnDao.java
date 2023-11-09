package com.onestop.core.util.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;

public class CommonComnDao  extends CommonDao{

    @Resource(name = "sqlSessionPnu")    
	public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
		super.setSqlSessionFactory(sqlSession);
	}
}
 