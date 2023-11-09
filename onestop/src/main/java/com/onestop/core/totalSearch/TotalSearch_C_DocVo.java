package com.onestop.core.totalSearch;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="doc")
@XmlAccessorType(XmlAccessType.FIELD)
public class TotalSearch_C_DocVo {
	
	@XmlAttribute private String id = "";
	@XmlAttribute private String sim = "";
	
	@XmlElement(name="att")
	private List<TotalSearch_D_AttVo> att = new ArrayList<TotalSearch_D_AttVo>();

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSim() {
		return sim;
	}
	public void setSim(String sim) {
		this.sim = sim;
	}
	public List<TotalSearch_D_AttVo> getAtt() {
		return att;
	}
	public void setAtt(List<TotalSearch_D_AttVo> att) {
		this.att = att;
	}
	public String get( String key){
		String value = "";
		if( att != null && att.size() > 0 ){
			for( TotalSearch_D_AttVo d : att ){
				if( d.getName().equals( key ) ){
					value = d.getAtt();
					break;
				}
			}
		}
		
		return value;
	}
	
	@Override
	public String toString() {
		return "TotalSearch_C_DocVo [id=" + id + ", sim=" + sim + ", att=" + att + "]";
	}
	
	
}
