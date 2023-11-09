package com.onestop.core.rullcheck;

public class CustomRull {
	private final String rullKey;
	private Object rullValue = null;
	
	public CustomRull(String rull, Object value) {
		this.rullKey = rull;
		this.rullValue = value;
	}
	
	public CustomRull(String rull) {
		this.rullKey = rull;
	}
	
	public String getRull() {
		return this.rullKey;
	}
	
	public Object getRullValue() {
		return this.rullValue;
	}
}
