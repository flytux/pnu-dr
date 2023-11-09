package com.onestop.core.handler;

import java.util.HashMap;
import java.util.Map;

import com.onestop.core.util.IUtility;

public class ErrorResponse {
	private int status;
	private String message;
	private String errorType = "default";
	private Map<String, Object> data = new HashMap<String, Object>();
	public Exception ex;
	
	public ErrorResponse(Exception ex) {
		this.ex = ex;
	}
	
	public ErrorResponse(int status, String message, Exception ex) {
		this.ex = ex;
		this.errorType = ex.getClass().getName();
		setStatus(status);
		setMessage(message);
	}
	
	public ErrorResponse(int status, String message, Exception ex, String errorType) {
		this.ex = ex;
		setStatus(status);
		setMessage(message);
		setErrorType(errorType);
	}
	
	public ErrorResponse(int status, String message, Exception ex, String errorType, Map<String, Object> data) {
		this.ex = ex;
		setStatus(status);
		setMessage(message);
		setErrorType(errorType);
		setData(data);
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getErrorType() {
		return this.errorType;
	}
	
	public void setErrorType(String errorType) {
		this.errorType = errorType;
	}

	public Map<String, Object> getData(){
		return this.data;
	}
	
	public void setData(Map<String, Object> data) {
		IUtility.removeSystemAttrData(data);
		this.data = data;
	}
	
	/*
	public Exception getError() {
		return this.ex;
	}
	*/
}
