package com.onestop.core.totalSearch;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlValue;

@XmlRootElement(name="att")
@XmlAccessorType(XmlAccessType.FIELD)
public class TotalSearch_D_AttVo {
	
	@XmlAttribute
	private String name = "";
	
	@XmlValue
	private String att = "";
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAtt() {
		return att;
	}
	public void setAtt(String att) {
		this.att = att;
	}
	
	@Override
	public String toString() {
		return "TotalSearch_D_AttVo [name=" + name + ", att=" + att + "]";
	}
	
}
