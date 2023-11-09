package com.onestop.core.totalSearch;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="meta_storage_list")
@XmlAccessorType(XmlAccessType.FIELD)
public class TotalSearch_A_RootVo {
	
	@XmlAttribute
	private String date = "";
	
	@XmlElement(name="section")
	private List<TotalSearch_B_SectionVo> section = new ArrayList<TotalSearch_B_SectionVo>();
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<TotalSearch_B_SectionVo> getSection() {
		return section;
	}
	public void setSection(List<TotalSearch_B_SectionVo> sectionList) {
		this.section = sectionList;
	}

	@Override
	public String toString() {
		return "TotalSearch_A_RootVo [date=" + date + ", section=" + section + "]";
	}
	
}
