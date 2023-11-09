package com.onestop.core.util.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

public class CommonServiceImpl extends EgovAbstractServiceImpl{
	public Map<String, Map<String, Object>> checkMap = null;
	
	protected DefaultTransactionDefinition definition;         // 기본 트랜잭션 정의
	
	@Resource(name="txManagerNcom")
    protected DataSourceTransactionManager transactionManager; // Datasource 기반 트랜잭션 매니저
    protected TransactionStatus            status;             // 트랜잭션 상태
    protected boolean                      doCommit;           // commit 여부
	
    public CommonServiceImpl() {
        definition = new DefaultTransactionDefinition();
    }
    
	public void setDoRollBack(){
		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	}
	/*
	 * 2020-07-30 jbhwang 추가
	 * 트랜잭션의 commit 여부 설정
	 * */
	public void setDoCommit(boolean doCommit){
	    if(!doCommit){
	        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	    }
	}
	
	protected void startTransaction(){
        definition.setName("ncomDefinition");
        resetPropagationBehavior();
        status   = transactionManager.getTransaction(definition);
        doCommit = true;
        
    }
	
	protected void endTransaction(){
        
        endTransaction(doCommit);
    }
    
    protected void endTransaction(boolean doCommit){
        try{
            if(doCommit) commitTransaction();
            else         rollbackTransaction();
        }finally{
            rollbackTransaction();
            resetPropagationBehavior();
        }
    }
    
    protected void rollbackTransaction(){
        if(!status.isCompleted()){
            transactionManager.rollback(status);
        }
    }
    
    protected void commitTransaction(){
        if(!status.isCompleted()){
            transactionManager.commit(status);
        }
    }
    
    protected void resetPropagationBehavior(){
        definition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
    }
}
