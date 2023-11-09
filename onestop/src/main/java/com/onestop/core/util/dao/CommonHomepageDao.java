package com.onestop.core.util.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;

public class CommonHomepageDao extends CommonDao {

    @Resource(name = "sqlSessionHomepage")
    public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
        super.setSqlSessionFactory(sqlSession);
    }
}
