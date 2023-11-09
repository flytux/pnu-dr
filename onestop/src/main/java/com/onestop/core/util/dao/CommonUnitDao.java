package com.onestop.core.util.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;

public class CommonUnitDao extends CommonDao {

    @Resource(name = "sqlSessionUnit")
    public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
        super.setSqlSessionFactory(sqlSession);
    }
}
