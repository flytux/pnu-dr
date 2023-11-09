package com.onestop.core.handler;

import java.util.Map;

public class CustomException extends RuntimeException {
	private Map<String, Object> data;
	private Exception exception;

	public CustomException(String msg, Throwable cause) {
		super(msg, cause);
	}
	
	public CustomException(String msg, Throwable cause, Map<String, Object> data) {
		super(msg, cause);
		this.data = data;
	}
	
	public CustomException(Exception exception, Map<String, Object> data) {
		super(exception.getMessage(), exception.getCause());
		this.data = data;
		this.exception = exception;
	}

	public Map<String, Object> getData(){
		return this.data;
	}
	
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	
	public Exception getException() {
		return this.exception;
	}
	
}
