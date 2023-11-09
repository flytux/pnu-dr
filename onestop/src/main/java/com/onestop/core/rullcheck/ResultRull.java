package com.onestop.core.rullcheck;

public class ResultRull {
	private String message = "";
	private boolean result = true;
	private int errorCode = 0;
	
	public ResultRull(boolean result, String message, int code) {
		setMessage(message);
		setResult(result);
		setErrorCode(code);
	}
	
	public ResultRull(boolean result, String message) {
		setMessage(message);
		setResult(result);
	}
	
	public ResultRull(boolean result) {
		setResult(result);
	}
	
	public ResultRull() {
		setResult(true);
	}
	
	public String getMessage() {
		return this.message;
	}
	
	public boolean getResult() {
		return this.result;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public void setResult(boolean result) {
		this.result = result;
	}
	
	public int getErrorCode() {
		return this.errorCode;
	}
	
	public void setErrorCode(int code) {
		this.errorCode = code;
	}
}
