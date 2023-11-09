package com.onestop.core.totalSearch;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="section")
@XmlAccessorType(XmlAccessType.FIELD)
public class TotalSearch_B_SectionVo {
	
	@XmlAttribute private String name = "";
	
	@XmlElement private String usrspec = "";
	@XmlElement private String idxname = "";
	@XmlElement private String qryflag = "";
	@XmlElement private String srtflag = "";
	@XmlElement private String totcnt = "";
	@XmlElement private String maxcnt = "";
	@XmlElement private String outcnt = "";
	@XmlElement private String pagenum = "";
	@XmlElement private String elapse = "";
	
	@XmlElement(name="doc")
	private List<TotalSearch_C_DocVo> doc = new ArrayList<TotalSearch_C_DocVo>();

	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsrspec() {
		return usrspec;
	}
	public void setUsrspec(String usrspec) {
		this.usrspec = usrspec;
	}
	public String getIdxname() {
		return idxname;
	}
	public void setIdxname(String idxname) {
		this.idxname = idxname;
	}
	public String getQryflag() {
		return qryflag;
	}
	public void setQryflag(String qryflag) {
		this.qryflag = qryflag;
	}
	public String getSrtflag() {
		return srtflag;
	}
	public void setSrtflag(String srtflag) {
		this.srtflag = srtflag;
	}
	public String getTotcnt() {
		return totcnt;
	}
	public void setTotcnt(String totcnt) {
		this.totcnt = totcnt;
	}
	public String getMaxcnt() {
		return maxcnt;
	}
	public void setMaxcnt(String maxcnt) {
		this.maxcnt = maxcnt;
	}
	public String getOutcnt() {
		return outcnt;
	}
	public void setOutcnt(String outcnt) {
		this.outcnt = outcnt;
	}
	public String getPagenum() {
		return pagenum;
	}
	public void setPagenum(String pagenum) {
		this.pagenum = pagenum;
	}
	public String getElapse() {
		return elapse;
	}
	public void setElapse(String elapse) {
		this.elapse = elapse;
	}
	public List<TotalSearch_C_DocVo> getDoc() {
		return doc;
	}
	public void setDoc(List<TotalSearch_C_DocVo> doc) {
		this.doc = doc;
	}
	
	@Override
	public String toString() {
		return "TotalSearch_B_SectionVo [name=" + name + ", usrspec=" + usrspec + ", idxname=" + idxname + ", qryflag="
				+ qryflag + ", srtflag=" + srtflag + ", totcnt=" + totcnt + ", maxcnt=" + maxcnt + ", outcnt=" + outcnt
				+ ", pagenum=" + pagenum + ", elapse=" + elapse + ", doc=" + doc + "]";
	}

}
