package com.onestop.core.security.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class ChangeUserDetail implements UserDetails {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1671695798646591704L;
	private String userId;
	private String changeId;	
	private String password;
	private String integrateUnivGcd;
	private String userGcd;
	private String nm;
	private String birthDate;
	private String genderGcd;
	private String email;
	private String telNo;
	private String cellularNo;
	private String upperAssignCd;
	private String upperAssignNm;
	private String assignCd;
	private String assignNm;
	private String blockFg;
	private String loginBlockGcd;
	private String firstLoginDt;
	private String finalLoginDt;
	private String passwordAlterDate;
	private int loginFailureTimesno;
	private String loginLockFg;
	private String screenColorGcd;
	private String jkNm;
	private String divisionNm;
	private String idGcd;
	private String chargeTaskContent;
	private String officeBldCd;
	private String officeRoomNoCd;
	private String delegateUserId;
	private String multiTaskUserId;
	private String validStartDate;
	private String validCloseDate;
	private String unuseUserFg;
	private String extUserApplyStaGcd;
	private String selfAccreditEnforceFg;
	private String selfAccreditFg;
	private String selfAccreditDt;
	private String useFg;
	private String remark;
	private String extUserGcd;
	private String applyDate;
	private String applyReasonContent;
	private String applyUserKey;
	private String approveUserKey;
	private String approveDt;
	private String givebackDt;
	private String givebackReasonContent;
	private String givebackUserKey;
	private String extsNo;
	private String jkCd;
	private String jwCd;
	private int jwNm;
	private int ssoServerConnValue;
	private String ssoLoginFg;
	private String userGbnUpperPartGcd;
	private String userGbnMiddlePartGcd;
	private String userGbnLowerPartGcd;
	private String empStaGcd;
	private String campusGcd;
	private String collGradGcd;
	private String gradGcd;
	private String collCd;
	private String deptCd;
	private String majorCd;
	private String stdtYearGcd;
	private String hjStaGcd;
	private String nationKorNm;
	private String loginResult;
	private String userIp;
	
    public String getUserIp() {
        return userIp;
    }

    public String getChangeId() {
        return changeId;
    }

    public void setChangeId(String changeId) {
        this.changeId = changeId;
    }

    public void setUserIp(String userIp) {
        this.userIp = userIp;
    }

    private String authority;
    private List<String> authoritis;
    
    
    public ChangeUserDetail(ArrayList<String> authorities) {
    	this.authoritis = new ArrayList<String>();
    	this.authoritis.add("USER");
    	this.authoritis.addAll(authorities);
    }
    
    public ChangeUserDetail() {
    	this.authoritis = new ArrayList<String>();
    	this.authoritis.add("USER");
	}
    
    public String toString(){
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		if(authoritis == null) {
			authoritis = new ArrayList<String>();			
		}
		for(int i = 0, x = authoritis.size(); i < x; i++) {
			auth.add(new SimpleGrantedAuthority("ROLE_" + authoritis.get(i)));
		}

		return auth;
	}

	@Override
	public String getPassword() {
		return this.password;
	}

	@Override
	public String getUsername() {
		return this.nm;
	}

	/**
	 * 미접속사용자정지기준일수 넘어선  유저 
	 */
	@Override
	public boolean isAccountNonExpired() {
		return "0005".equals(this.loginResult) ? false : true;
	}

	/**
	 * 차단 유저
	 */
	@Override
	public boolean isAccountNonLocked() {
		return "0007".equals(this.loginResult) ? false : true;
	}

	/**
	 * 비밀번호교체 기준일수 넘어선 유저
	 */
	@Override
	public boolean isCredentialsNonExpired() {
		return "0003".equals(this.loginResult) ? false : true;
	}

	/**
	 * 차단여부
	 */
	@Override
	public boolean isEnabled() {
		return "0002".equals(this.loginResult) ? false : true;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAUTHORITY() {
		return authority;
	}

	public void setAUTHORITY(String aUTHORITY) {
		authority = aUTHORITY;
	}

	public List<String> getAUTHORITIS() {
		return authoritis;
	}

	public void setAUTHORITIS(List<String> aUTHORITIS) {
		if(aUTHORITIS != null && aUTHORITIS.size() > 0) {
		    for(int i = 0; i < aUTHORITIS.size(); i++) {
		        authoritis.add(aUTHORITIS.get(i));
		    }		    
		}	    
	}

    public String getIntegrateUnivGcd() {
        return integrateUnivGcd;
    }

    public void setIntegrateUnivGcd(String integrateUnivGcd) {
        this.integrateUnivGcd = integrateUnivGcd;
    }

    public String getUserGcd() {
        return userGcd;
    }

    public void setUserGcd(String userGcd) {
        this.userGcd = userGcd;
    }

    public String getNm() {
        return nm;
    }

    public void setNm(String nm) {
        this.nm = nm;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getGenderGcd() {
        return genderGcd;
    }

    public void setGenderGcd(String genderGcd) {
        this.genderGcd = genderGcd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelNo() {
        return telNo;
    }

    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    public String getCellularNo() {
        return cellularNo;
    }

    public void setCellularNo(String cellularNo) {
        this.cellularNo = cellularNo;
    }

    public String getUpperAssignCd() {
        return upperAssignCd;
    }

    public void setUpperAssignCd(String upperAssignCd) {
        this.upperAssignCd = upperAssignCd;
    }

    public String getUpperAssignNm() {
        return upperAssignNm;
    }

    public void setUpperAssignNm(String upperAssignNm) {
        this.upperAssignNm = upperAssignNm;
    }

    public String getAssignCd() {
        return assignCd;
    }

    public void setAssignCd(String assignCd) {
        this.assignCd = assignCd;
    }

    public String getAssignNm() {
        return assignNm;
    }

    public void setAssignNm(String assignNm) {
        this.assignNm = assignNm;
    }

    public String getBlockFg() {
        return blockFg;
    }

    public void setBlockFg(String blockFg) {
        this.blockFg = blockFg;
    }

    public String getLoginBlockGcd() {
        return loginBlockGcd;
    }

    public void setLoginBlockGcd(String loginBlockGcd) {
        this.loginBlockGcd = loginBlockGcd;
    }

    public String getFirstLoginDt() {
        return firstLoginDt;
    }

    public void setFirstLoginDt(String firstLoginDt) {
        this.firstLoginDt = firstLoginDt;
    }

    public String getFinalLoginDt() {
        return finalLoginDt;
    }

    public void setFinalLoginDt(String finalLoginDt) {
        this.finalLoginDt = finalLoginDt;
    }

    public String getPasswordAlterDate() {
        return passwordAlterDate;
    }

    public void setPasswordAlterDate(String passwordAlterDate) {
        this.passwordAlterDate = passwordAlterDate;
    }

    public int getLoginFailureTimesno() {
        return loginFailureTimesno;
    }

    public void setLoginFailureTimesno(int loginFailureTimesno) {
        this.loginFailureTimesno = loginFailureTimesno;
    }

    public String getLoginLockFg() {
        return loginLockFg;
    }

    public void setLoginLockFg(String loginLockFg) {
        this.loginLockFg = loginLockFg;
    }

    public String getScreenColorGcd() {
        return screenColorGcd;
    }

    public void setScreenColorGcd(String screenColorGcd) {
        this.screenColorGcd = screenColorGcd;
    }

    public String getJkNm() {
        return jkNm;
    }

    public void setJkNm(String jkNm) {
        this.jkNm = jkNm;
    }

    public String getDivisionNm() {
        return divisionNm;
    }

    public void setDivisionNm(String divisionNm) {
        this.divisionNm = divisionNm;
    }

    public String getIdGcd() {
        return idGcd;
    }

    public void setIdGcd(String idGcd) {
        this.idGcd = idGcd;
    }

    public String getChargeTaskContent() {
        return chargeTaskContent;
    }

    public void setChargeTaskContent(String chargeTaskContent) {
        this.chargeTaskContent = chargeTaskContent;
    }

    public String getOfficeBldCd() {
        return officeBldCd;
    }

    public void setOfficeBldCd(String officeBldCd) {
        this.officeBldCd = officeBldCd;
    }

    public String getOfficeRoomNoCd() {
        return officeRoomNoCd;
    }

    public void setOfficeRoomNoCd(String officeRoomNoCd) {
        this.officeRoomNoCd = officeRoomNoCd;
    }

    public String getDelegateUserId() {
        return delegateUserId;
    }

    public void setDelegateUserId(String delegateUserId) {
        this.delegateUserId = delegateUserId;
    }

    public String getMultiTaskUserId() {
        return multiTaskUserId;
    }

    public void setMultiTaskUserId(String multiTaskUserId) {
        this.multiTaskUserId = multiTaskUserId;
    }

    public String getValidStartDate() {
        return validStartDate;
    }

    public void setValidStartDate(String validStartDate) {
        this.validStartDate = validStartDate;
    }

    public String getValidCloseDate() {
        return validCloseDate;
    }

    public void setValidCloseDate(String validCloseDate) {
        this.validCloseDate = validCloseDate;
    }

    public String getUnuseUserFg() {
        return unuseUserFg;
    }

    public void setUnuseUserFg(String unuseUserFg) {
        this.unuseUserFg = unuseUserFg;
    }

    public String getExtUserApplyStaGcd() {
        return extUserApplyStaGcd;
    }

    public void setExtUserApplyStaGcd(String extUserApplyStaGcd) {
        this.extUserApplyStaGcd = extUserApplyStaGcd;
    }

    public String getSelfAccreditEnforceFg() {
        return selfAccreditEnforceFg;
    }

    public void setSelfAccreditEnforceFg(String selfAccreditEnforceFg) {
        this.selfAccreditEnforceFg = selfAccreditEnforceFg;
    }

    public String getSelfAccreditFg() {
        return selfAccreditFg;
    }

    public void setSelfAccreditFg(String selfAccreditFg) {
        this.selfAccreditFg = selfAccreditFg;
    }

    public String getSelfAccreditDt() {
        return selfAccreditDt;
    }

    public void setSelfAccreditDt(String selfAccreditDt) {
        this.selfAccreditDt = selfAccreditDt;
    }

    public String getUseFg() {
        return useFg;
    }

    public void setUseFg(String useFg) {
        this.useFg = useFg;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getExtUserGcd() {
        return extUserGcd;
    }

    public void setExtUserGcd(String extUserGcd) {
        this.extUserGcd = extUserGcd;
    }

    public String getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(String applyDate) {
        this.applyDate = applyDate;
    }

    public String getApplyReasonContent() {
        return applyReasonContent;
    }

    public void setApplyReasonContent(String applyReasonContent) {
        this.applyReasonContent = applyReasonContent;
    }

    public String getApplyUserKey() {
        return applyUserKey;
    }

    public void setApplyUserKey(String applyUserKey) {
        this.applyUserKey = applyUserKey;
    }

    public String getApproveUserKey() {
        return approveUserKey;
    }

    public void setApproveUserKey(String approveUserKey) {
        this.approveUserKey = approveUserKey;
    }

    public String getApproveDt() {
        return approveDt;
    }

    public void setApproveDt(String approveDt) {
        this.approveDt = approveDt;
    }

    public String getGivebackDt() {
        return givebackDt;
    }

    public void setGivebackDt(String givebackDt) {
        this.givebackDt = givebackDt;
    }

    public String getGivebackReasonContent() {
        return givebackReasonContent;
    }

    public void setGivebackReasonContent(String givebackReasonContent) {
        this.givebackReasonContent = givebackReasonContent;
    }

    public String getGivebackUserKey() {
        return givebackUserKey;
    }

    public void setGivebackUserKey(String givebackUserKey) {
        this.givebackUserKey = givebackUserKey;
    }

    public String getExtsNo() {
        return extsNo;
    }

    public void setExtsNo(String extsNo) {
        this.extsNo = extsNo;
    }

    public String getJkCd() {
        return jkCd;
    }

    public void setJkCd(String jkCd) {
        this.jkCd = jkCd;
    }

    public String getJwCd() {
        return jwCd;
    }

    public void setJwCd(String jwCd) {
        this.jwCd = jwCd;
    }

    public int getJwNm() {
        return jwNm;
    }

    public void setJwNm(int jwNm) {
        this.jwNm = jwNm;
    }

    public int getSsoServerConnValue() {
        return ssoServerConnValue;
    }

    public void setSsoServerConnValue(int ssoServerConnValue) {
        this.ssoServerConnValue = ssoServerConnValue;
    }

    public String getSsoLoginFg() {
        return ssoLoginFg;
    }

    public void setSsoLoginFg(String ssoLoginFg) {
        this.ssoLoginFg = ssoLoginFg;
    }

    public String getUserGbnUpperPartGcd() {
        return userGbnUpperPartGcd;
    }

    public void setUserGbnUpperPartGcd(String userGbnUpperPartGcd) {
        this.userGbnUpperPartGcd = userGbnUpperPartGcd;
    }

    public String getUserGbnMiddlePartGcd() {
        return userGbnMiddlePartGcd;
    }

    public void setUserGbnMiddlePartGcd(String userGbnMiddlePartGcd) {
        this.userGbnMiddlePartGcd = userGbnMiddlePartGcd;
    }

    public String getUserGbnLowerPartGcd() {
        return userGbnLowerPartGcd;
    }

    public void setUserGbnLowerPartGcd(String userGbnLowerPartGcd) {
        this.userGbnLowerPartGcd = userGbnLowerPartGcd;
    }

    public String getEmpStaGcd() {
        return empStaGcd;
    }

    public void setEmpStaGcd(String empStaGcd) {
        this.empStaGcd = empStaGcd;
    }

    public String getCampusGcd() {
        return campusGcd;
    }

    public void setCampusGcd(String campusGcd) {
        this.campusGcd = campusGcd;
    }

    public String getCollGradGcd() {
        return collGradGcd;
    }

    public void setCollGradGcd(String collGradGcd) {
        this.collGradGcd = collGradGcd;
    }

    public String getGradGcd() {
        return gradGcd;
    }

    public void setGradGcd(String gradGcd) {
        this.gradGcd = gradGcd;
    }

    public String getCollCd() {
        return collCd;
    }

    public void setCollCd(String collCd) {
        this.collCd = collCd;
    }

    public String getDeptCd() {
        return deptCd;
    }

    public void setDeptCd(String deptCd) {
        this.deptCd = deptCd;
    }

    public String getMajorCd() {
        return majorCd;
    }

    public void setMajorCd(String majorCd) {
        this.majorCd = majorCd;
    }

    public String getStdtYearGcd() {
        return stdtYearGcd;
    }

    public void setStdtYearGcd(String stdtYearGcd) {
        this.stdtYearGcd = stdtYearGcd;
    }

    public String getHjStaGcd() {
        return hjStaGcd;
    }

    public void setHjStaGcd(String hjStaGcd) {
        this.hjStaGcd = hjStaGcd;
    }

    public String getNationKorNm() {
        return nationKorNm;
    }

    public void setNationKorNm(String nationKorNm) {
        this.nationKorNm = nationKorNm;
    }

    public String getLoginResult() {
        return loginResult;
    }

    public void setLoginResult(String loginResult) {
        this.loginResult = loginResult;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public void setPassword(String password) {
        this.password = password;
    }
	
}
