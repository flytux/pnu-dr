package com.onestop.core.security.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetail implements UserDetails {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1671695798646591704L;
	private String userId;
	private String originId;
	private String password;
	private String integrateUnivGcd; // 통합대학교구분코드
	private String userGcd; // 사용자구분코드
	private String nm; // 사용자명
	private String birthDate; // 생년월일
	private String genderGcd; // 성별
	private String email; // 이메일
	private String telNo; // 전화번호
	private String cellularNo; // 휴대폰번호
	private String upperAssignCd; // 소속코드
	private String upperAssignNm; // 소속명
	private String assignCd; // 부서코드
	private String assignNm; // 부서명
	private String blockFg;
	private String loginBlockGcd;
	private String firstLoginDt; // 최초로그인일시
	private String finalLoginDt; // 마지막로그인일시
	private String passwordAlterDate; // 비밀번호변경일자
	private int loginFailureTimesno; // 로그인실패횟수
	private String loginLockFg; // 로그인잠김여부
	private String screenColorGcd; // 화면색상구분코드
	private String jkNm; // 직급이름
	private String divisionNm; // 부서이름
	private String idGcd; // 아이디구분코드
	private String chargeTaskContent; // 담당업무내용
	private String officeBldCd; // 사무실건물코드
	private String officeRoomNoCd; // 사무실호실코드
	private String delegateUserId; // 위임사용자아이디
	private String multiTaskUserId; // 다중업무사용자아이디
	private String validStartDate; // 유효시작일자
	private String validCloseDate; // 유효종료일자
	private String unuseUserFg; // 휴면사용자여부
	private String extUserApplyStaGcd; // 외부사용자신청상태구분코드
	private String selfAccreditEnforceFg; // 본인인증집행여부
	private String selfAccreditFg; // 본인인증여부
	private String selfAccreditDt; // 본인인증일시
	private String useFg; // 사용여부
	private String remark; // 비고
	private String extUserGcd; // 외부사용자구분코드
	private String applyDate; // 신청일자
	private String applyReasonContent; // 신청사유내용
	private String applyUserKey; // 신청사용자아이디
	private String approveUserKey; // 승인사용자아이디
	private String approveDt; // 승인일시
	private String givebackDt; // 반려일시
	private String givebackReasonContent; // 반려사유내용
	private String givebackUserKey; // 반려사용자아이디
	private String extsNo; // OFFICE_TEL_NO
	private String jkCd;
	private String jwCd;
	private String jwNm;
	private String ssoServerConnValue; // SSO서버접속값
	private String ssoLoginFg; // SSO로그인여부
	private String userGbnUpperPartGcd;
	private String userGbnMiddlePartGcd;
	private String userGbnLowerPartGcd;
	private String empStaGcd;
	private String campusGcd; // 캠퍼스구분코드
	private String collGradGcd; // 대학대학원구분코드
	private String gradGcd; // 대학원구분코드
	private String collCd; // 단과대학코드
	private String deptCd; // 학과코드
	private String majorCd; // 전공코드
	private String stdtYearGcd; // 학년구분코드
	private String hjStaGcd; // 학적상태구분코드
	private String stdtGcd; // 사용자종류코드
	private String nationKorNm; // 국가코드명
	private String loginResult;
	private String loginResultMsg;
	private String userIp; // 사용자아이피
	private String langGcd; // 언어구분코드
	private String degCourseGcd; //// 학위과정코드
	private String userChgAuthYn;

	/* 2022-02-07 추가 */
	private String engNm; // 사용자영문명
	private String cmplTermCnt; // 이수학기수
	private String atlectTermCnt; // 수강학기수
	private String curcApplySyear; // 교육과정적용년도
	private String nationCd; // 국가코드
	private String collGradGcdKorNm; // 대학/대학원명
	private String gradGcdKorNm; // 대학원명
	private String collCdKorNm; // 단과대학명
	private String deptCdKorNm; // 학과(부)명
	private String majorCdKorNm; // 전공명
	private String hjStaGcdKorNm; // 학적상태명
	private String stdtYearGcdKorNm; // 학년명
	private String degCourseGcdKorNm; // 학위과정명

	/* 2022-03-03 추가 */
	private String minorKorNm; // 부전공
	private String doubleMajorKorNm; // 복수전공
	private String unitedMajorKorNm; // 연합전공
	private String admsDate; // 입학일자
	private String admsGcd; // 입학구분
	
	/* 2022-04-13 추가 */
	private String personInfoUseAgreeFg; // 개인정보사용동의여부
	private String emailRcvAgreeFg; // 이메일수신동의
	private String smsRcvAgreeFg; // SMS수신동의
	private String kakaotalkRcvAgreeFg; // 카카오톡수신동의
	
	public String getUserChgAuthYn() {
		return userChgAuthYn;
	}

	public void setUserChgAuthYn(String userChgAuthYn) {
		this.userChgAuthYn = userChgAuthYn;
	}

	public String getLangGcd() {
		return langGcd;
	}

	public void setLangGcd(String langGcd) {
		this.langGcd = langGcd;
	}

	public String getDegCourseGcd() {
		return degCourseGcd;
	}

	public void setDegCourseGcd(String degCourseGcd) {
		this.degCourseGcd = degCourseGcd;
	}

	public String getUserIp() {
		return userIp;
	}

	public String getOriginIdId() {
		return originId;
	}

	public void setOriginIdId(String originId) {
		this.originId = originId;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	private String authority;
	private List<String> authoritis;

	public CustomUserDetail(ArrayList<String> authorities) {
		this.authoritis = new ArrayList<String>();
		this.authoritis.add("USER");
		this.authoritis.addAll(authorities);
	}

	public CustomUserDetail() {
		this.authoritis = new ArrayList<String>();
		this.authoritis.add("USER");
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		if (authoritis == null) {
			authoritis = new ArrayList<String>();
		}
		for (int i = 0, x = authoritis.size(); i < x; i++) {
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
	 * 미접속사용자정지기준일수 넘어선 유저
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

	public boolean isLoginFailNumbered() {
		return "0004".equals(this.loginResult) ? false : true;
	}

	public boolean isLoginLocked() {
		return "0009".equals(this.loginResult) ? false : true;
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
		if (aUTHORITIS != null && aUTHORITIS.size() > 0) {
			for (int i = 0; i < aUTHORITIS.size(); i++) {
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

	public String getJwNm() {
		return jwNm;
	}

	public void setJwNm(String jwNm) {
		this.jwNm = jwNm;
	}

	public String getSsoServerConnValue() {
		return ssoServerConnValue;
	}

	public void setSsoServerConnValue(String ssoServerConnValue) {
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
	

	public String getStdtGcd() {
		return stdtGcd;
	}

	public void setStdtGcd(String stdtGcd) {
		this.stdtGcd = stdtGcd;
	}

	public String getNationKorNm() {
		return nationKorNm;
	}

	public void setNationKorNm(String nationKorNm) {
		this.nationKorNm = nationKorNm;
	}

	public String getOriginId() {
		return originId;
	}

	public void setOriginId(String originId) {
		this.originId = originId;
	}

	public String getEngNm() {
		return engNm;
	}

	public void setEngNm(String engNm) {
		this.engNm = engNm;
	}

	public String getCmplTermCnt() {
		return cmplTermCnt;
	}

	public void setCmplTermCnt(String cmplTermCnt) {
		this.cmplTermCnt = cmplTermCnt;
	}

	public String getAtlectTermCnt() {
		return atlectTermCnt;
	}

	public void setAtlectTermCnt(String atlectTermCnt) {
		this.atlectTermCnt = atlectTermCnt;
	}
	
	public String getCurcApplySyear() {
		return curcApplySyear;
	}

	public void setCurcApplySyear(String curcApplySyear) {
		this.curcApplySyear = curcApplySyear;
	}

	public String getNationCd() {
		return nationCd;
	}

	public void setNationCd(String nationCd) {
		this.nationCd = nationCd;
	}

	public String getCollGradGcdKorNm() {
		return collGradGcdKorNm;
	}

	public void setCollGradGcdKorNm(String collGradGcdKorNm) {
		this.collGradGcdKorNm = collGradGcdKorNm;
	}

	public String getGradGcdKorNm() {
		return gradGcdKorNm;
	}

	public void setGradGcdKorNm(String gradGcdKorNm) {
		this.gradGcdKorNm = gradGcdKorNm;
	}

	public String getCollCdKorNm() {
		return collCdKorNm;
	}

	public void setCollCdKorNm(String collCdKorNm) {
		this.collCdKorNm = collCdKorNm;
	}

	public String getDeptCdKorNm() {
		return deptCdKorNm;
	}

	public void setDeptCdKorNm(String deptCdKorNm) {
		this.deptCdKorNm = deptCdKorNm;
	}

	public String getMajorCdKorNm() {
		return majorCdKorNm;
	}

	public void setMajorCdKorNm(String majorCdKorNm) {
		this.majorCdKorNm = majorCdKorNm;
	}

	public String getHjStaGcdKorNm() {
		return hjStaGcdKorNm;
	}

	public void setHjStaGcdKorNm(String hjStaGcdKorNm) {
		this.hjStaGcdKorNm = hjStaGcdKorNm;
	}

	public String getStdtYearGcdKorNm() {
		return stdtYearGcdKorNm;
	}

	public void setStdtYearGcdKorNm(String stdtYearGcdKorNm) {
		this.stdtYearGcdKorNm = stdtYearGcdKorNm;
	}

	public String getDegCourseGcdKorNm() {
		return degCourseGcdKorNm;
	}

	public void setDegCourseGcdKorNm(String degCourseGcdKorNm) {
		this.degCourseGcdKorNm = degCourseGcdKorNm;
	}
	

	public String getMinorKorNm() {
		return minorKorNm;
	}

	public void setMinorKorNm(String minorKorNm) {
		this.minorKorNm = minorKorNm;
	}

	public String getDoubleMajorKorNm() {
		return doubleMajorKorNm;
	}

	public void setDoubleMajorKorNm(String doubleMajorKorNm) {
		this.doubleMajorKorNm = doubleMajorKorNm;
	}

	public String getUnitedMajorKorNm() {
		return unitedMajorKorNm;
	}

	public void setUnitedMajorKorNm(String unitedMajorKorNm) {
		this.unitedMajorKorNm = unitedMajorKorNm;
	}

	public String getAdmsDate() {
		return admsDate;
	}

	public void setAdmsDate(String admsDate) {
		this.admsDate = admsDate;
	}

	public String getAdmsGcd() {
		return admsGcd;
	}

	public void setAdmsGcd(String admsGcd) {
		this.admsGcd = admsGcd;
	}
	
	public String getPersonInfoUseAgreeFg() {
		return personInfoUseAgreeFg;
	}

	public void setPersonInfoUseAgreeFg(String personInfoUseAgreeFg) {
		this.personInfoUseAgreeFg = personInfoUseAgreeFg;
	}
	
	public String getEmailRcvAgreeFg() {
		return emailRcvAgreeFg;
	}

	public void setEmailRcvAgreeFg(String emailRcvAgreeFg) {
		this.emailRcvAgreeFg = emailRcvAgreeFg;
	}

	public String getSmsRcvAgreeFg() {
		return smsRcvAgreeFg;
	}

	public void setSmsRcvAgreeFg(String smsRcvAgreeFg) {
		this.smsRcvAgreeFg = smsRcvAgreeFg;
	}

	public String getKakaotalkRcvAgreeFg() {
		return kakaotalkRcvAgreeFg;
	}

	public void setKakaotalkRcvAgreeFg(String kakaotalkRcvAgreeFg) {
		this.kakaotalkRcvAgreeFg = kakaotalkRcvAgreeFg;
	}

	public String getLoginResult() {
		return loginResult;
	}

	public void setLoginResult(String loginResult) {
		this.loginResult = loginResult;
	}

	public String getLoginResultMsg() {
		return loginResultMsg;
	}

	public void setLoginResultMsg(String loginResultMsg) {
		this.loginResultMsg = loginResultMsg;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
