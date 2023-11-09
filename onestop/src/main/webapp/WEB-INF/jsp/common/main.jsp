<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.onestop.core.util.CommonStaticFile" %>
<c:set var="today" value="<%=new java.util.Date()%>" />
<fmt:formatDate var="today_ym" pattern="yyyy-MM" value="${today }" />
<%
	java.util.Calendar mon = java.util.Calendar.getInstance();
	mon.add(java.util.Calendar.MONTH, 1);
%>
<c:set var="today2" value="<%=mon.getTime() %>" />
<fmt:formatDate var="today_ym2" pattern="yyyy-MM" value="${today2}" />
<fmt:formatDate var="today_y" pattern="yyyy" value="${today}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expries" content="-1">
<meta http-equiv="Cache-Control" content="no-cache">
<!-- 웹취약점관련 조치 후 주소찾기 안되어서 주석처리 
<meta http-equiv="Content-Security-Policy" content="default-src *; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' 'unsafe-eval' http://www.google.com http://www.w3.org/;img-src 'self' data:">
-->
<title>부산대학교 - 학생지원시스템</title>
<link rel="shortcut icon" href="/common/images_ses/logo.ico" type="image/x-icon">
<link href="/common/bootstrap-4.6.1/css/bootstrap.min.css" rel="stylesheet">
<link href="/common/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet">
<link href="/common/css/owl.carousel.min.css" type="text/css" rel="stylesheet">

<link href="/common/css/common.css?${CommonStaticFile.makeVersion('/common/css/common.css') }" rel="stylesheet">
<link href="/common/css/common_dev.css?${CommonStaticFile.makeVersion('/common/css/common_dev.css') }" rel="stylesheet">
<link href="/common/css/style.css?${CommonStaticFile.makeVersion('/common/css/style.css') }" rel="stylesheet">
<link href="/common/css/popup.css?${CommonStaticFile.makeVersion('/common/css/popup.css') }" rel="stylesheet">
<link href="/common/css/layer-popup.css?${CommonStaticFile.makeVersion('/common/css/layer-popup.css') }" rel="stylesheet">
<c:if test ="${SESSION_LOCALE != '0001'}">
    <link href="/common/css/common_global.css?${CommonStaticFile.makeVersion('/common/css/common_global.css') }" rel="stylesheet">
    <link href="/common/css/style_global.css?${CommonStaticFile.makeVersion('/common/css/style.css') }" rel="stylesheet">    
</c:if>
</head>
<body class="logged-in">
	<jsp:include page="inc/incCommonJs.jsp" flush="false" />
	<div id="root">
		<jsp:include page="inc/incHeader.jsp" flush="false" />
		<main id="main">
			<div class="sec-box sec-box-major">
				<div class="container">
					<div class="row">
						<div class="col-xl-4">
							<section class="sec-1 sec-auth">
								<div class="sec-body">
									<div class="logged-in-view">
										<h3 class="user-name">
                                            _<span class="user-number"></span>
                                        </h3>
                                        <ul class="list list-with-separator user-info-list">_
                                        </ul>
										<ul class="list list-logged">
										    <c:choose>
                                                <c:when test="${SITE_INFO.SSO_USE_FG =='Y' && _host == 'onestop.pusan.ac.kr' }">
													<li><a href="javascript:openLinkSSO('mailForm','https://webmail.pusan.ac.kr/sso/waraon/portal');" id="webMail" title="새창열기"><i class="bi bi-envelope-fill" aria-hidden="true"></i> 웹메일</a></li>
												    <!--
													<li><a href="javascript:openLinkSSO('survey','https://survey.pusan.ac.kr/rSSO/verify_process.jsp');" title="새창열기"><i class="bi bi-file-earmark-text-fill" aria-hidden="true"></i> 설문조사</a></li>
													-->
													<c:if test="${loginUser.hjStaGcd =='0001' or loginUser.hjStaGcd =='0002' or loginUser.hjStaGcd =='0003'}">
													<li><a href="https://bd.pusan.ac.kr/rSSO/verify_process.php" onclick="openLinkSSO('bd',this.href);return false;" onkeypress="this.onclick;" title="새창열기"><i class="bi bi-bar-chart-fill" aria-hidden="true"></i> 학업성취분석</a></li>
													</c:if>
                                                </c:when>
	                                            <c:otherwise>
	                                                <li><a href="https://webmail.pusan.ac.kr" id="webMail" target="_blank" title="새창열기"><i class="bi bi-envelope-fill" aria-hidden="true"></i> 웹메일</a></li>
	                                                <li><a href="https://bd.pusan.ac.kr" target="_blank" title="새창열기"><i class="bi bi-bar-chart-fill" aria-hidden="true"></i> 학업성취분석</a></li>
	                                            </c:otherwise>
	                                        </c:choose>
											<!-- SSO사용여부가져오자 테스트  -->
											
										</ul>
										<button class="btn btn-icon setting-btn" type="button" onClick="selectMenu('000000000000331');" title="개인정보 수정 바로가기">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 25 25" src="/common/images/setting.svg" alt="설정" fill="currentcolor">
												<path d="M26.519,16.5a3.088,3.088,0,0,1,1.981-2.88,12.237,12.237,0,0,0-1.481-3.568,3.13,3.13,0,0,1-1.256.269,3.081,3.081,0,0,1-2.819-4.336A12.206,12.206,0,0,0,19.381,4.5a3.086,3.086,0,0,1-5.763,0A12.243,12.243,0,0,0,10.05,5.981a3.081,3.081,0,0,1-2.819,4.336,3.029,3.029,0,0,1-1.256-.269A12.507,12.507,0,0,0,4.5,13.623a3.086,3.086,0,0,1,.006,5.761,12.237,12.237,0,0,0,1.481,3.568,3.082,3.082,0,0,1,4.069,4.068A12.315,12.315,0,0,0,13.625,28.5a3.08,3.08,0,0,1,5.75,0,12.243,12.243,0,0,0,3.569-1.481,3.086,3.086,0,0,1,4.069-4.068,12.308,12.308,0,0,0,1.481-3.568A3.1,3.1,0,0,1,26.519,16.5Zm-9.962,4.992a5,5,0,1,1,5-5A5,5,0,0,1,16.556,21.489Z" transform="translate(-4.5 -4.5)"></path>
											</svg>
										</button>
										<button class="btn btn-icon logout-btn" type="button" onClick="javascript:fn_chgPwd();" title="비밀번호변경">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16" alt="비밀번호변경" >
												<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z" />
											</svg>
										</button>
									</div>
								</div>
							</section>
							<!-- 스마트 검색 -->
							<section class="sec-1 sec-smart-search">
								<header>
									<h2 class="sec-title"  data-lang>스마트 검색</h2>
								</header>
								<form method="post" onsubmit="smartSearch();return false;" >
									<div class="sec-body">
										<div class="input-group">

											<input type="text" id="total_keyword" class="form-control smart-search-input" placeholder="검색어를 입력해 주세요" title="검색어" aria-describedby="smart-search-btn" autocomplete="off">
											<div class="input-group-append">
												<button class="btn btn-icon" id="smart-search-btn" title="검색">
													<img src="/common/images/search_white.svg" alt="검색">
												</button>
											</div>

										</div>
										<ul class="list search-term-list">
											<li><a href="#total_keyword" onclick="smartSearch('수강편람');return false;"  onkeypress="this.onclick;"  title="학부 수강편람 스마트검색 새창 바로가기">수강편람</a></li>
											<li><a href="#total_keyword" onclick="smartSearch('수강신청)');return false;"  onkeypress="this.onclick;"   title="학부 수강편람 스마트검색 새창 바로가기">수강신청</a></li>
										</ul>
									</div>
								</form>
							</section>
							<!-- /END 스마트 검색 -->
						</div>
						<div class="col-xl-8">
							<div id="ost_tabs1">
							<section class="sec-1 sec-smart-flow" >
								<header>
									<h2 class="sec-title">
										<label data-lang>One-Stop 서비스</label> <span>${termInfo.SYEAR }학년도 ${termInfo.TERM_GCD_KOR_NM }</span>
									</h2>
									<div class="tab-wrap">
										<div class="owl-carousel owl-theme nav nav-pills" style="margin-bottom: 0px"  id="tablist">
											<c:forEach var="item" items="${ostStep1List}" varStatus="status">
												<div class="item">
													<div class="nav-item" role="presentation">
														<a class="nav-link <c:if test ="${status.index == 0}">active</c:if>" id="smart-tab${item.COMMON_DETAIL_CD }" data-toggle="pill" href="#smart-cont${item.COMMON_DETAIL_CD }"   data-selected="<c:if test ="${status.index == 0}">true</c:if><c:if test ="${status.index != 0}">false</c:if>">${item.COMMON_DETAIL_CD_KOR_NM }</a>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</header>
								<div class="sec-body">
									<div class="tab-content" id="pills-tabContent">
										<c:if test="${fn:length(ostStep1List) > 0}">
											<c:forEach var="item" items="${ostStep1List}" varStatus="status">
												<div class="tab-pane fade show <c:if test ="${status.index == 0}">active</c:if>" id="smart-cont${item.COMMON_DETAIL_CD }"  aria-labelledby="smart-tab${item.COMMON_DETAIL_CD }">
													<c:if test="${item.STEP2_CNT > 0}">
														<div class="smart-flow-wrap">

															<c:forEach var="item2" items="${ostStep2List}" varStatus="status2">
																<c:if test="${item.COMMON_DETAIL_CD == item2.CHAR_1_CONTENT}">
																	<c:set var="active_class" value="" />
																	<c:set var="active_boolean" value="false" />
																	<c:set var="active_nm" value="" />
																	<c:set var="cnt" value="0" />
																	<c:if test="${fn:length(ostSchList) > 0}">
																		<c:forEach var="sch_item" items="${ostSchList}" varStatus="sch_status">
																			<c:if test="${item2.CHAR_1_CONTENT == sch_item.SERVICE_TASK_GCD 
																							&& item2.COMMON_DETAIL_CD == sch_item.SERVICE_TASK_STEP_GCD}">
																				<c:set var="active_class" value="${sch_item.active_class }" />
																				<c:set var="active_boolean" value="${sch_item.active_boolean }" />
																				<c:set var="active_nm" value="${sch_item.active_nm }" />
																				<c:set var="cnt" value="${cnt+1 }" />
																			</c:if>

																			<c:if test="${sch_status.last && cnt == 0}">
																				<c:set var="active_class" value="" />
																				<c:set var="active_boolean" value="" />
																				<c:set var="active_nm" value="${sch_item.active_nm }" />
																			</c:if>
																		</c:forEach>
																	</c:if>
																	<div class="smart-flow ${active_class }">
																		<p class="sr-only">${active_nm }</p>
																		<h4 role="menuitem" data-haspopup="${active_boolean }" data-expanded="true">${item2.COMMON_DETAIL_CD_KOR_NM}</h4>

																		<div class="link-box">
																			<ul>

																				<c:forEach var="item3" items="${ostStep3List}" varStatus="status3">
																					<c:if test="${item2.CHAR_1_CONTENT == item3.SERVICE_TASK_GCD && item2.COMMON_DETAIL_CD == item3.SERVICE_TASK_STEP_GCD }">
																						<li><a href="#none" onclick="selectMenu('${item3.MENU_CD }');" onkeypress="this.onclick">${item3.MENU_ABBR_KOR_NM }</a></li>
																					</c:if>
																				</c:forEach>
																			</ul>
																		</div>
																	</div>
																</c:if>
															</c:forEach>
														</div>
													</c:if>
													<c:if test="${item.STEP2_CNT == 0}">
														<p class="non-info" data-lang>서비스 준비중입니다.</p>
													</c:if>
												</div>
											</c:forEach>
										</c:if>
										<c:if test="${fn:length(ostStep1List) < 1}">
											<p class="non-info"  data-lang>임시페이지 운영 중에는 정보가 제공되지 않습니다.</p>
										</c:if>
									</div>
								</div>
							</section>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="sec-box">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-xl-4">
							<section class="sec-smart-credit">
								<header>
									<h2 class="sec-title" data-lang>나의 학점현황</h2>
								</header>
								<div class="sec-body">
									<div class="row credit-charts">
										<div class="col-6" id="svg_chart_1"></div>
										<div class="col-6" id="svg_chart_2"></div>
									</div>
								</div>
							</section>
						</div>
						<div class="col-lg-6 col-xl-4">
							<section class="sec-1 sec-smart-schedule">
								<header>
									<h2 class="sec-title" data-lang>학사 일정</h2>
									<a class="more-link" href="#popup" onclick="openSchPop();return false;" onkeypress="this.onclick;"><span class="sr-only">학사일정 레이어팝업 열기</span></a>
								</header>
								<div class="sec-body">
									<div class="schedule-date">
										<span class="schedule-month">${month }</span> <span>${year }</span>
									</div>
									<ul class="schedule-list">
										<c:forEach var="item" items="${scheduleList}" varStatus="status">
											<fmt:parseDate var="startDtFmt" pattern="yyyyMMddHHmmss" value="${item.SCHD_START_DT }" />
											<fmt:parseDate var="closeDtFmt" pattern="yyyyMMddHHmmss" value="${item.SCHD_CLOSE_DT }" />
											<fmt:formatDate var="startDt_ym" pattern="yyyy-MM" value="${startDtFmt }" />
											<fmt:formatDate var="startDt_y" pattern="yyyy" value="${startDtFmt }" />
											<fmt:formatDate var="closeDt_y" pattern="yyyy" value="${closeDtFmt }" />
											<%-- <c:if test="${today_ym == startDt_ym or today_ym2 == startDt_ym}"> --%>
											<c:if test="${today_y == closeDt_y}">
												<fmt:formatDate var="startDt" pattern="yyyy-MM-dd (E)" value="${startDtFmt }" />
												<fmt:formatDate var="closeDt" pattern="yyyy-MM-dd (E)" value="${closeDtFmt }" />
												<li><span class="list-date">${startDt} ~ ${closeDt }</span> <span class="subject">${item.TERM_GCD_NM } ${item.SCHD_GCD_NM }</span></li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</section>
						</div>

						<div class="col-xl-4">
							<section class="sec-smart-class">
								<header>
									<h2 class="sec-title">
										<label data-lang>오늘의 수업</label> <span>${today_str }</span>
									</h2>
									<div class="col-auto">
										<a class="link link-style-1" href="javascript:openLinkSSO('plato','https://plato.pusan.ac.kr/rSSO/verify_process.php');" title="plato 홈페이지 새창바로가기">PLATO</a>
									</div>
									<c:if test="${fn:length(todayClassList) > 4}">
										<div class="btn-control">
											<button class="carousel-control-prev" type="button" data-target="#carousel-class" data-slide="prev">
												<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16" stroke="currentcolor" stroke-width="1">
												<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
											</svg>
												<span class="sr-only">이전</span>
											</button>
											<button class="carousel-control-next" type="button" data-target="#carousel-class" data-slide="next">
												<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16" stroke="currentcolor" stroke-width="1">
												<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
											</svg>
												<span class="sr-only">다음</span>
											</button>
										</div>
									</c:if>
								</header>
								<div class="sec-body">
									<div id="carousel-class" class="carousel slide" data-touch="false" data-interval="false">
										<div class="carousel-inner">
											<c:if test="${ptValidYn.R_CHK == 'N' }">
												<div class="carousel-item active">
													<p class="non-info">
														<i class="bi bi-book" aria-hidden="true"></i>${ptValidYn.R_MSG }
													</p>
												</div>
											</c:if>
											<c:if test="${ptValidYn.R_CHK == 'Y' }">
												<c:if test="${fn:length(todayClassList) > 0}">
													<div class="carousel-item active">
														<ul class="class-item">
															<c:forEach var="item" items="${todayClassList}" varStatus="status">
																<c:if test="${status.index  <= 3 }">
																	<li>
																		<div class="time">${item.LECT_START_TIME }- ${item.LECT_CLOSE_TIME }</div>
																		<div class="info">
																			<h4>${item.SUBJ_NM }</h4>
																			<p>
																				<span>${item.PROF_NM }</span>
																				<c:if test="${item.CLASS_TYPE_GCD_NM == '원격' }">
																					<span class="remote" data-lang>원격수업</span>
																				</c:if>
																				<c:if test="${item.CLASS_TYPE_GCD_NM != '원격' }">
																					<span>${item.BLD_CD } ${item.BLD_NM } ${item.FACILITY_NO }호</span>
																				</c:if>

																			</p>
																		</div>
																	</li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</c:if>

												<c:if test="${fn:length(todayClassList) > 4}">
													<div class="carousel-item">
														<ul class="class-item">
															<c:forEach var="item" items="${todayClassList}" varStatus="status">
																<c:if test="${status.index  >= 4 && status.index  <= 7 }">
																	<li>
																		<div class="time">${item.START_TIME }- ${item.CLOSE_TIME }</div>
																		<div class="info">
																			<h4>${item.SUBJ_NM }</h4>
																			<p>
																				<span>${item.PROF_NM }</span>
																				<c:if test="${item.CLASS_TYPE_GCD_NM == '원격' }">
																					<span class="remote" data-lang>원격수업</span>
																				</c:if>
																				<c:if test="${item.CLASS_TYPE_GCD_NM != '원격' }">
																					<span>${item.BLD_CD } ${item.BLD_NM } ${item.FACILITY_NO }호</span>
																				</c:if>
																			</p>
																		</div>
																	</li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</c:if>
												<c:if test="${fn:length(todayClassList) > 8}">
													<div class="carousel-item">
														<ul class="class-item">
															<c:forEach var="item" items="${todayClassList}" varStatus="status">
																<c:if test="${status.index  >= 8  && status.index  <= 11}">
																	<li>
																		<div class="time">${item.START_TIME }- ${item.CLOSE_TIME }</div>
																		<div class="info">
																			<h4>${item.SUBJ_NM }</h4>
																			<p>
																				<span>${item.PROF_NM }</span>
																				<c:if test="${item.CLASS_TYPE_GCD_NM == '원격' }">
																					<span class="remote" data-lang>원격수업</span>
																				</c:if>
																				<c:if test="${item.CLASS_TYPE_GCD_NM != '원격' }">
																					<span>${item.BLD_CD } ${item.BLD_NM } ${item.FACILITY_NO }호</span>
																				</c:if>
																			</p>
																		</div>
																	</li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</c:if>
												<c:if test="${fn:length(todayClassList) > 12}">
													<div class="carousel-item">
														<ul class="class-item">
															<c:forEach var="item" items="${todayClassList}" varStatus="status">
																<c:if test="${status.index  >= 12  }">
																	<li>
																		<div class="time">${item.START_TIME }- ${item.CLOSE_TIME }</div>
																		<div class="info">
																			<h4>${item.SUBJ_NM }</h4>
																			<p>
																				<span>${item.PROF_NM }</span>
																				<c:if test="${item.CLASS_TYPE_GCD_NM == '원격' }">
																					<span class="remote" data-lang>원격수업</span>
																				</c:if>
																				<c:if test="${item.CLASS_TYPE_GCD_NM != '원격' }">
																					<span>${item.BLD_CD } ${item.BLD_NM } ${item.FACILITY_NO }호</span>
																				</c:if>
																			</p>
																		</div>
																	</li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</c:if>
												<c:if test="${fn:length(todayClassList) == 0}">
													<div class="carousel-item active">
														<p class="non-info">
															<i class="bi bi-book" aria-hidden="true"></i><label  data-lang>오늘 수업은 없습니다</label>														</p>
													</div>
												</c:if>
											</c:if>
										</div>
									</div>
								</div>
							</section>
						</div>

						<div class="col-xl-8">
							<section class="sec-1 sec-smart-board">
								<!-- 탭 -->
								<ul class="nav nav-tabs" id="tablist">
									<li class="nav-item">
										<a class="nav-link active" id="board-tab-1" data-toggle="tab" href="#board-tabpanel-1"  data-selected="true" data-lang>학생지원시스템공지</a>
										<div class="tab-content">
											<!-- '학생지원' 탭 패널 -->
											<c:set var="bbsMgrAuth" value="${bbsMgrAuth}" />
											<div class="tab-pane fade show active" id="board-tabpanel-1"  aria-labelledby="board-tab-1">
												<c:if test="${fn:length(bbsDataList) ==0}">
													<p class="non-info mb" data-lang>조회된 게시물이 없습니다.</p>
												</c:if>
												<c:if test="${fn:length(bbsDataList) > 0}">
													<ul class="board-list">
														<c:forEach var="item" items="${bbsDataList}" varStatus="status">
															<!-- board item -->
															<c:if test="${item.LEVEL == 0}">
																<li class="board-item"><c:if test="${item.SECRET_FG == 'Y'}">
																		<c:if test="${bbsMgrAuth.SECRET_POSTING_SEARCH_AUTH_FG == 'Y'
																					|| item.INS_USER_ID == loginUser.userId}">
																			<a class="board-link" href="#popup" onclick="openBbsDetailPop('${bbsMgrAuth.MENU_CD }','${item.POSTING_SEQ_NO }', '${item.ATTACH_FILE_GRP_CD }');" onkeypress="this.onclick"  >
																		</c:if>
																		<c:if test="${bbsMgrAuth.SECRET_POSTING_SEARCH_AUTH_FG != 'Y'
																					&& item.INS_USER_ID != loginUser.userId}">
																			<a class="board-link" href="#popup" onclick="openPassChkPop('${bbsMgrAuth.MENU_CD }','${item.BBS_TYPE_GCD }','${item.BBS_TYPE_SEQ_NO }', '${item.POSTING_SEQ_NO }')" onkeypress="this.onclick">
																		</c:if>
																	</c:if> <c:if test="${item.SECRET_FG != 'Y'}">
																		<a class="board-link" href="#popup" onclick="openBbsDetailPop('${bbsMgrAuth.MENU_CD }','${item.POSTING_SEQ_NO }', '${item.ATTACH_FILE_GRP_CD }');" onkeypress="this.onclick"  >
																	</c:if>
																	<div class="item-title">
																		<c:if test="${item.NOTICE_FG =='Y' && item.RN == '0'}">
																			<span class="noti" data-lang>공지</span>
																		</c:if>
																		<span class="board-title"><c:if test="${item.CATE_TYPE_NM !='' }">[${item.CATE_TYPE_NM }]</c:if>${item.TITLE_CONTENT }<c:if test="${item.ATTACH_FILE_GRP_CD !='' }">
																				<img src="/common/images_ses/icon-file.gif" alt="파일있음"/>
																			</c:if>
																			<c:if test="${item.SECRET_FG == 'Y'}">
																				<i class="bi bi-lock"><span class="sr-only">비밀글</span></i>
																			</c:if></span>
																		<c:if test="${item.DATE_CNT <3 }">
																			<span class="icon-new">NEW</span>
																		</c:if>
																	</div>
																	<div class="item-writer">
																		<span>${item.WRITEOUT_USER_NM }</span>
																	</div> <time datetime="${fn:substring(item.INS_DT,0,10) }" class="item-date">${fn:substring(item.INS_DT,0,10) }</time> </a></li>
															</c:if>
															<c:if test="${item.LEVEL != 0}">
																<li class="board-item"><c:if test="${item.ORIGIN_POSTING_INS_USER_ID != loginUser.userId 
																				&& bbsMgrAuth.REPLY_SEARCH_AUTH_FG == 'N'}">
																		<a class="board-link" href="#popup" onclick="alert('조회 권한이 없습니다.')" onkeypress="this.onclick">
																	</c:if> <c:if test="${item.ORIGIN_POSTING_INS_USER_ID == loginUser.userId 
																				|| bbsMgrAuth.REPLY_SEARCH_AUTH_FG == 'Y'}">
																		<a class="board-link" href="#popup" onclick="openBbsDetailPop('${bbsMgrAuth.MENU_CD }','${item.POSTING_SEQ_NO }', '${item.ATTACH_FILE_GRP_CD }')" onkeypress="this.onclick">
																	</c:if>
																	<div class="item-title" style="padding-left: ${item.LEVEL*2}0px;">
																		<c:if test="${item.NOTICE_FG =='Y' && item.RN == '0'}">
																			<span class="noti" data-lang>공지</span>
																		</c:if>
																		<span class="board-title">┗ Re :<c:if test="${item.CATE_TYPE_NM !='' }">[${item.CATE_TYPE_NM }]</c:if>${item.TITLE_CONTENT }<c:if test="${item.ATTACH_FILE_GRP_CD !='' }">
																				<img src="/common/images_ses/icon-file.gif" alt="파일있음"/>
																			</c:if>
																			<c:if test="${item.SECRET_FG == 'Y'}">
																				<i class="bi bi-lock"><span class="sr-only">비밀글</span></i>
																			</c:if></span>
																		<c:if test="${item.DATE_CNT <3 }">
																			<span class="icon-new">NEW</span>
																		</c:if>
																	</div>
																	<div class="item-writer">
																		<span>${item.WRITEOUT_USER_NM }</span>
																	</div> <time datetime="${fn:substring(item.INS_DT,0,10) }" class="item-date">${fn:substring(item.INS_DT,0,10) }</time> </a></li>
															</c:if>
															<!-- board item -->
														</c:forEach>
													</ul>
												</c:if>
												<a class="more-link" href="#none" onclick="selectMenu('${bbsMgrAuth.MENU_CD }');" onkeypress="this.onclick"><span class="sr-only">학생지원시스템공지 바로가기</span></a>
											</div>
									
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="board-tab-2" data-toggle="tab" href="#board-tabpanel-2"  data-selected="false" onclick="f_pnuNotice('${bbsPageSize}');return false;" onkeypress="this.onclick;" data-lang>대학공지</a>
										<div class="tab-content">
											<!-- '대학공지' 탭 패널 -->
											<div class="tab-pane fade" id="board-tabpanel-2"  aria-labelledby="board-tab-2">
												<p class="non-info mb" data-lang>조회된 게시물이 없습니다.</p>
												
											</div>
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="board-tab-3" data-toggle="tab" href="#board-tabpanel-3"  data-selected="false" onclick="f_getDepartConfig('${bbsPageSize}');return false;" onkeypress="this.onclick;" data-lang>학과공지</a>
										<div class="tab-content">
											<!-- '학과공지' 탭 패널 -->
											<div class="tab-pane fade departNoticeList" id="board-tabpanel-3"  aria-labelledby="board-tab-3" ></div>
											<div class="tab-pane fade departNonInfo" id="board-tabpanel-3"  aria-labelledby="board-tab-3" style="display:none;">
														<div class="accordion">
															<div class="card">
																<div class="card-header" id="heading1">
																	<button class="btn btn-block  collapsed" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="false" >
																		<span class="info-text"><b data-lang>학과공지 서비스 이용안내</b> : (홈페이지통합시스템(http://his.pusan.ac.kr) 개편. 2017.12.)</span>
																	</button>
																</div>
																<div id="collapse1" class="collapse" aria-labelledby="heading1" style="">
																	<div class="card-body">
																		<span data-lang>학과공지는 부산대학교 홈페이지통합시스템에서 운영하는 RSS 정보를 이용합니다.<br/>
																		해당 학과를 검색하여 게시판을 선택하면 해당 게시판의 리스트가 연동되어 보여집니다.<br/>
																		설정된 내용이 나타나지 않을 경우  아래 내용을 참고하시어 다시 설정하시기 바랍니다.<br>
																		</span>
																		<ul class="list list-style-1">
																			<li data-lang>서비스 지연: 인지과학협동과정, 일반대학원 융합학부<br>※ 2018학년도 1학기 중 오픈예정. 기간은 변동될 수 있습니다.</li>
																			<li data-lang>서비스 중단: 사회학과, 의료산업관리전공, 생명의료정보학교실, 전기컴퓨터공학부<br>※ 서비스중단 관련 문의는 각 학과로 문의하시기 바랍니다.</li>
																			<li data-lang>외부홈페이지 사용: 문헌정보학과, 국제학부</li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
														<section class="sec-3">
														<div class="sec-body">
															<div class="b-table-box flex-col-1" role="table" aria-label="1단 테이블">
																<div class="b-row-box" role="row">
																	<div class="b-row-item">
																		<div class="b-title-box" role="rowheader" >
																			<label for="departName" data-lang>학과 검색</label>
																		</div>
																		<div class="b-con-box" role="cell">
																			<div class="row">
																				<div class="col-auto">
																					<input type="text" class="form-control" id="departName" onkeypress="javascript:handleDepart(event);">
																				</div>
																				<div class="col-auto">
																					<button class="btn btn-primary" onclick="f_departSearch()" type="button" data-lang>검색</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="b-row-box "  role="row" id="departDivBox" style="display:none;">
																	<div class="b-row-item">
																		<div class="b-title-box" role="rowheader">
																			<label data-lang>학과 목록</label>
																		</div>
																		<div class="b-con-box"  role="cell" >
																				<div class="row">
																					<div class="col-auto" id="departDiv" ></div>
																				</div>
																		</div>
																	</div>
																</div>
																<div class="b-row-box" role="row" id="departBoardDivBox" style="display:none;">
																	<div class="b-row-item">
																		<div class="b-title-box" role="rowheader">
																			<label data-lang>게시판 목록</label>
																		</div>
																		<div class="b-con-box" role="cell" >
																			<div class="row">
																				<div class="col-auto" id="departBoardDiv" ></div>
																				<div class="col-auto" id="departBoardBtn" style="display:none;">
																				<button class="btn btn-danger mb-2 " id="departNoticeConfBtn" onclick="f_submit()" type="button" data-lang>적용</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</section>
													
											</div>
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="board-tab-4" data-toggle="tab" href="#board-tabpanel-4"  data-selected="false" onclick="f_mainBbsList('4','000000000000062','${bbsPageSize}');return false;" onkeypress="this.onclick;" data-lang>장학공지</a>
										<div class="tab-content">
											<!-- '장학공지' 탭 패널 -->
											<div class="tab-pane fade" id="board-tabpanel-4"  aria-labelledby="board-tab-4">
												<p class="non-info mb" data-lang>조회된 게시물이 없습니다.</p>
											</div>
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="board-tab-5" data-toggle="tab" href="#board-tabpanel-5"  data-selected="false" onclick="f_mainBbsList('5','000000000000384','${bbsPageSize}');return false;" onkeypress="this.onclick;" >Q&amp;A</a>
										<div class="tab-content">
											<!-- 'Q&A' 탭 패널 -->
											<c:set var="bbsMgrAuth" value="${bbsMgrAuth5}" />
											<div class="tab-pane fade" id="board-tabpanel-5"  aria-labelledby="board-tab-5">
												<p class="non-info mb" data-lang>조회된 게시물이 없습니다.</p>
											</div>	
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="board-tab-6" data-toggle="tab" href="#board-tabpanel-6"  data-selected="false" onclick="f_mainBbsList('6','000000000000385','${bbsPageSize}');return false;" onkeypress="this.onclick;" >FAQ</a>
										<div class="tab-content">
											<!-- 'FAQ' 탭 패널 -->
											<c:set var="bbsMgrAuth" value="${bbsMgrAuth6}" />
											<div class="tab-pane fade" id="board-tabpanel-6"  aria-labelledby="board-tab-6">
												<p class="non-info mb" data-lang>조회된 게시물이 없습니다.</p>
											</div>
										</div>
									</li>
								</ul>
							</section>
						</div>


						<div class="col-xl-4 ">
							<section class="sec-my-schedule">
								<header>
									<h2 class="sec-title">
										<label data-lang>나의 시간표</label> <span>${termInfo.SYEAR }<label data-lang>학년도</label> ${termInfo.TERM_GCD_KOR_NM }</span>
									</h2>
									<a class="more-link" href="#none" onclick="selectMenu('000000000000366');" onkeypress="this.onclick" ><span class="sr-only">나의시간표 메뉴 이동</span></a>
								</header>
								<div id="schedule-body" class="sec-body">
									<c:if test="${ptValidYn.R_CHK == 'Y' }">
										<c:if test="${fn:length(ptList) > 0}">

											<div class="table-wrap">
												<table id="ptTable">
													<caption>나의 시간표 상세내용입니다.</caption>
													<thead>
														<tr>
															<th scope="col"></th>
															<th scope="col">월</th>
															<th scope="col">화</th>
															<th scope="col">수</th>
															<th scope="col">목</th>
															<th scope="col">금</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="item" items="${ptList}" varStatus="status">
															<!-- 문자 줄수 계산 -->
															<fmt:formatNumber value="${item.MON_LECT_SISU*4}" var="MON_LINE_NUM" />
															<fmt:formatNumber value="${item.TUE_LECT_SISU*4}" var="TUE_LINE_NUM" />
															<fmt:formatNumber value="${item.WED_LECT_SISU*4}" var="WED_LINE_NUM" />
															<fmt:formatNumber value="${item.THU_LECT_SISU*4}" var="THU_LINE_NUM" />
															<fmt:formatNumber value="${item.FRI_LECT_SISU*4}" var="FRI_LINE_NUM" />

															<!-- 수업 시간(분) 계산-->
															<fmt:formatNumber value="${item.MON_LECT_SISU*50}" var="MON_MIN" />
															<fmt:formatNumber value="${item.TUE_LECT_SISU*50}" var="TUE_MIN" />
															<fmt:formatNumber value="${item.WED_LECT_SISU*50}" var="WED_MIN" />
															<fmt:formatNumber value="${item.THU_LECT_SISU*50}" var="THU_MIN" />
															<fmt:formatNumber value="${item.FRI_LECT_SISU*50}" var="FRI_MIN" />

															<fmt:formatNumber value="${ fn:split(item.START_TIME,':')[0]}" var="START_HOUR" />
															<fmt:formatNumber value="${ fn:split(item.START_TIME,':')[1]}" var="START_MIN" />
															<fmt:formatNumber value="${item.LECTTIME}" var="lecttime" />
															<c:set var="lecttime_len" value="${fn:length(lecttime)}" />
															<c:if test="${(item.MON_LECT_SISU != null || item.TUE_LECT_SISU != null || item.WED_LECT_SISU != null || item.THU_LECT_SISU != null || item.FRI_LECT_SISU != null)
																		|| (START_HOUR >=9 && START_HOUR <19) }">
																<tr>

																	<th scope="row"><c:if test="${START_MIN == 0}">${START_HOUR}</c:if></th>


																	<td class="mon_class${item.MON_CLASS_NO }"><c:if test="${item.MON_CLASS_NO != '' && item.MON_CLASS_NO != null}">
																			<button class="item-btn type${item.MON_BG_COLOR }" type="button" data-toggle="modal" href="#schedule-item${item.MON_SUBJ_NO }" data-expanded="false">
																				<span class="txt-wrap" style="-webkit-line-clamp: ${MON_LINE_NUM };"><strong>${item.MON_SUBJ_NM }[${item.MON_CLASS_NO }]</strong> ${MON_MIN }분/${item.MON_BLD_CD }-${item.MON_FACILITY_NO }</span>
																			</button>
																		</c:if></td>
																	<td class="tue_class"><c:if test="${item.TUE_CLASS_NO != '' && item.TUE_CLASS_NO != null}">
																			<button class="item-btn type${item.TUE_BG_COLOR }" type="button" data-toggle="modal" href="#schedule-item${item.TUE_SUBJ_NO }" data-expanded="false">
																				<span class="txt-wrap" style="-webkit-line-clamp: ${TUE_LINE_NUM};"><strong>${item.TUE_SUBJ_NM }[${item.TUE_CLASS_NO }]</strong> ${TUE_MIN}분/${item.TUE_BLD_CD }-${item.TUE_FACILITY_NO }</span>
																			</button>
																		</c:if></td>
																	<td class="wed_class"><c:if test="${item.WED_CLASS_NO != '' && item.WED_CLASS_NO != null}">
																			<button class="item-btn type${item.WED_BG_COLOR }" type="button" data-toggle="modal" href="#schedule-item${item.WED_SUBJ_NO }" data-expanded="false">
																				<span class="txt-wrap" style="-webkit-line-clamp: ${WED_LINE_NUM };"><strong>${item.WED_SUBJ_NM }[${item.WED_CLASS_NO }]</strong> ${WED_MIN}분/${item.WED_BLD_CD }-${item.WED_FACILITY_NO }</span>
																			</button>
																		</c:if></td>
																	<td class="thu_class"><c:if test="${item.THU_CLASS_NO != '' && item.THU_CLASS_NO != null}">
																			<button class="item-btn type${item.THU_BG_COLOR }" type="button" data-toggle="modal" href="#schedule-item${item.THU_SUBJ_NO }" data-expanded="false">
																				<span class="txt-wrap" style="-webkit-line-clamp: ${THU_LINE_NUM};"><strong>${item.THU_SUBJ_NM }[${item.THU_CLASS_NO }]</strong> ${THU_MIN}분/${item.THU_BLD_CD }-${item.THU_FACILITY_NO }</span>
																			</button>
																		</c:if></td>
																	<td class="fri_class"><c:if test="${item.FRI_CLASS_NO != '' && item.FRI_CLASS_NO != null}">
																			<button class="item-btn type${item.FRI_BG_COLOR }" type="button" data-toggle="modal" href="#schedule-item${item.FRI_SUBJ_NO }" data-expanded="false">
																				<span class="txt-wrap" style="-webkit-line-clamp: ${FRI_LINE_NUM };"><strong>${item.FRI_SUBJ_NM }[${item.FRI_CLASS_NO }]</strong> ${FRI_MIN}분/${item.FRI_BLD_CD }-${item.FRI_FACILITY_NO }</span>
																			</button>
																		</c:if></td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
											</div>

										</c:if>

									</c:if>


									<c:if test="${ptValidYn.R_CHK == 'Y' }">


										<c:if test="${fn:length(subjSetList) > 0}">
											<!-- <div class="collapse show" id="schedule-item01" data-parent="#schedule-body">
												<p class="non-info">
													<i class="bi bi-calendar-week"></i>시간표를 선택해주세요.
												</p>
											</div> -->
											<c:forEach var="item" items="${subjSetList}" varStatus="status">
												<div class="schedule-info modal fade" id="schedule-item${item.SUBJ_NO}" tabindex="0" role="dialog" aria-hidden="true">
													<div class="modal-dialog " role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">
																	<i class="bi bi-journal-bookmark-fill" aria-hidden="true"></i> ${item.SUBJ_NM}[${item.CLASS_NO}]<span>${item.DEPT_KOR_NM}, ${item.CLASS_CHARGE_TEL_NO}</span>
																</h5>
																<button  type="button" tabindex="0" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">×</span>
																</button>
															</div>
															<div class="modal-body">
															<div id="schedule-item${item.SUBJ_NO}" data-parent="#schedule-body">
																
																<div class="detail-item">
																	<h5>
																		<span class="text-danger">${item.CLASS_TYPE_GCD_NM}수업</span><span class="text-primary">${item.SUBJ_GCD_NM}</span><span>${item.SUBJ_NO}</span><span>${item.CLASS_NO}분반</span><span>${item.CRDT}학점</span>

																	</h5>
																	<dl>
																		<c:forEach var="subjLectTimeInfo" items="${item.subjLectTimeList}" varStatus="status">
																			<dt data-lang>교수명</dt>
																			<dd>${subjLectTimeInfo.PROF_NM}
																				<span class="text-primary" onclick="fn_openProPlanReport('${termInfo.SYEAR }','${termInfo.TERM_GCD }','${subjLectTimeInfo.PROF_NO }','${item.SUBJ_NO }','${item.CLASS_NO }','${item.EDUCERT_GCD}');" style="cursor: pointer" data-lang>교수계획표 조회</span>
																			</dd>
																			<dt data-lang>강의일자</dt>
																			<dd>${subjLectTimeInfo.LECT_START_DATE}~ ${subjLectTimeInfo.LECT_CLOSE_DATE }</dd>
																			<dt data-lang>강의시간</dt>
																			<dd>${subjLectTimeInfo.DAY_GCD_NM}${subjLectTimeInfo.LECT_START_TIME} ~ ${subjLectTimeInfo.LECT_CLOSE_TIME } (${subjLectTimeInfo.LECT_RUN_TIME }분)</dd>
																			<dt style="padding-bottom: 10px; border-bottom: 1px solid #dbdcdc; margin-bottom: 8px;" data-lang>강의실</dt>
																			<dd style="border-bottom: 1px solid #dbdcdc;">${subjLectTimeInfo.BLD_CD}-${subjLectTimeInfo.FACILITY_NO}</dd>
																		</c:forEach>
																	</dl>
																</div>
															</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>

										</c:if>
									</c:if>

								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
			<div class="main-quickmenu-wr">
				<div class="container">
					<div class="content-wrap">
						<div class="sec sec-quick">
							<h2 class="sec-title-1">
								<strong>Quick</strong> Menu
							</h2>
							<div class="carousel-wrapper quick-carousel-wrapper">
								<div class="owl-carousel quick-carousel">
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="/page?menuCD=000000000000403" title="기초학력진단평가메뉴이동"> <img src="/common/images/main-quick-icon01.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>기초학력<br>진단평가
										</span>
										</a>
									</div>
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="https://pnu.certpia.com/" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon02.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title" data-lang>인터넷<br>증명발급
										</span>
										</a>
									</div>
									<!-- item 
									<div class="item">
										<a class="quick-link" href="javascript:void(0)"> <img src="/common/images/main-quick-icon03.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title">서식<br>다운로드
										</span>
										</a>
									</div> -->
									<!-- item -->
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="/page?menuCD=000000000000414" title="서식 및 안내 파일 메뉴이동"> <img src="/common/images/main-quick-icon03.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>서식 및 안내 파일
										</span>
										</a>
									</div>
									<div class="item">
										<a class="quick-link" href="/page?menuCD=000000000000304"> <img src="/common/images/main-quick-icon04.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title" data-lang>우편신청 및 기타<br>증명발급
										</span>
										</a>
									</div>
									<!-- item
									<div class="item">
										<a class="quick-link" href="javascript:void(0)"> <img src="/common/images/main-quick-icon05.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title">설문조사</span>
										</a>
									</div> -->
									<!-- item -->
									<!-- 
									<div class="item">
										<a class="quick-link" href="javascript:void(0)"> <img src="/common/images/main-quick-icon06.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title">Course List<br>(English)
										</span>
										</a>
									</div>
									-->
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="javascript:openLinkSSO('plato','https://plato.pusan.ac.kr/rSSO/verify_process.php');" title="새창열림"> <img src="/common/images/main-quick-icon07.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title" data-lang>스마트교육플랫폼 PLATO</span>
										</a>
									</div>
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="https://labs-safety.pusan.ac.kr" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon08.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title" data-lang>PNU-연구실안전정보망</span>
										</a>
									</div>
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="https://pims.pusan.ac.kr" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon09.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title" data-lang>특허관리(PIMS)</span>
										</a>
									</div>
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="https://space.pusan.ac.kr" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon06.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title" data-lang>교육공간 예약시스템
										</span>
										</a>
									</div>
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="https://pusan.ac.kr" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon06.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>부산대학교 홈페이지
										</span>
										</a>
									</div>
								</div>
								<button class="prev-btn" type="button">
									<span>이전</span>
								</button>
								<button class="next-btn" type="button">
									<span>다음</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--PUN SNS-->
			<div class="main-sns">
				<div class="container">
					<div class="content-wrap">
						<div class="sec sec-sns">
							<div class="sec-body">
								<div class="row">
									<div class="col-md-7">
										<h2 class="sec-title-1">
											<strong>PNU</strong> SNS
										</h2>
										<section class="sec-sns-1">
											<a href="https://www.youtube.com/channel/UC2C8QLSMp3QMFS96xQc7WRA" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon01.png" alt="유튜브 바로가기" />
												</div>
												<span data-lang>유튜브<br>바로가기
											</span></a> <a href="https://www.instagram.com/pusan.ac.kr/?hl=ko" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon02.png" alt="인스타그램 바로가기" />
												</div>
												<span data-lang>인스타그램<br>바로가기
											</span></a> <a href="https://www.facebook.com/PusanNationalUniv" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon03.png" alt="페이스북 바로가기" />
												</div>
												<span data-lang>페이스북<br>바로가기
											</span></a> <a href="https://www.pusan.ac.kr/news/Main.do" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon04.png" alt="PNU NEWSLETTER" />
												</div>
												<span>PNU<br>NEWSLETTER
											</span></a>
										</section>
									</div>
									<div class="col-md-3">
										<h2 class="sec-title-1">
											<strong data-lang>총학생회</strong> SNS
										</h2>
										<section class="sec-sns-1">
											<a href="https://pf.kakao.com/_Cazxij" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon05.png" alt="카카오채널 바로가기" />
												</div>
												<span data-lang>카카오채널<br>바로가기
											</span></a> <a href="https://www.instagram.com/pnu_students_/?hl=ko" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon02.png" alt="인스타그램 바로가기" />
												</div>
												<span data-lang>인스타그램<br>바로가기
											</span></a>
										</section>
									</div>
									<div class="col-md-2">
										<h2 class="sec-title-1">
											<strong data-lang>언론사</strong>
										</h2>
										<section class="sec-sns-2">
											<a href="https://channelpnu.pusan.ac.kr" target="_blank" title="새창열기">
												<div class="icon">
													<img src="/common/images/main-sns-icon06.png" alt="부산대 언론사 바로가기" />
												</div>
												<span data-lang>홈페이지<br>바로가기</span>
											</a>
										</section>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/END PUN SNS-->
		</main>
		<jsp:include page="inc/incFooter.jsp" flush="false" />
        <jsp:include page="inc/incChatbot.jsp" flush="false" />
	</div>
	<!-- Scripts -->
	<script src="/common/js/ibootstrap.min.js"></script>
	<script src="/common/js/owl.carousel.min.js"></script>
	<script src="/common/js/gfn/gfn_bbs.js?1118"></script>
	<script src="/common/js/common_main.js?1118"></script>
	<script src="/common/js/gfn/gfn_report.js"></script>
	<script>
		$(document).ready(
				function() {
					if (gfn_str_parseNull('${_msg}') != "") {
						alert('${_msg}');
						<c:remove var="_msg" scope="session" />
					}
				    var hjstaStr = ""; 
				    if(scwin.loginUser.hjStaGcdKorNm != null && scwin.loginUser.hjStaGcdKorNm != ""){
				    	hjstaStr = "("+scwin.loginUser.hjStaGcdKorNm+")";
				    } 
					if (scwin.loginUser) {
						$(".logged-in-view .user-name")
								.text(scwin.loginUser.nm + " (" + scwin.loginUser.userId + ")" + hjstaStr );
						$(".logged-in-view .user-number").text(
								scwin.loginUser.userId);
						$(".logged-in-view .user-info-list").html("");
						$(".logged-in-view .user-info-list").append(
								"<li>" + scwin.loginUser.assignNm + "</li>");
						//$("#ptTable").rowspans(0); //th cell merge
						$("#ptTable").rowspan(0);
						$("#ptTable").rowspan(1);
						$("#ptTable").rowspan(2);
						$("#ptTable").rowspan(3);
						$("#ptTable").rowspan(4);
					}

					$('img[src$=".svg"]').each(function() {
						var img = jQuery(this);
						var imgURL = img.attr('src');
						var attributes = img.prop("attributes");

						$.get(imgURL, function(data) {
							var svg = $(data).find('svg');
							svg = svg.removeAttr('xmlns:a');
							$.each(attributes, function() {
								svg.attr(this.name, this.value);
							});
							img.replaceWith(svg);
						}, 'xml');
					});

					
					//나의 학점 현황
					if (scwin.loginUser.userGcd == "0003") {

						gfn_ajax_request({
							url : "/core/main/AtlectList",
							reqData : {
								SCH_SYEAR : "${termInfo.SYEAR }",
								SCH_TERM_GCD : "${termInfo.TERM_GCD }",
								STDT_NO : scwin.loginUser.userId
							},
							success : function(data, responseData) {
								var tot1 = gfn_str_parseNullZero(responseData.TERM_TOT_CRDT);
								var tot2 = gfn_str_parseNullZero(responseData.TERM_TOTAL_CRDT);
								
								var _x1 = '-28';
								//var _x2 = '0';
								
								if(tot2 > 0) {
									if(tot1.toString().length == 2) {
										_x1 = '-38';
									}else if(tot1.toString().length == 3) {
										_x1 = '-48';
									}else if(tot1.toString().length > 3) {
										_x1 = '-48'
									}
								}else {
									_x1 = '-10';
									if(tot1.toString().length == 2) {
										_x1 = '-20';
									}else if(tot1.toString().length == 3) {
										_x1 = '-28';
									}
								}
								
								var _txt = "<svg xmlns='http://www.w3.org/2000/svg' width='100%' viewBox='0 0 180 180' style='max-width: 200px;'>";
								_txt += "<g id='_1' data-name='1' transform='translate(-360 -685)' style='cursor:pointer;' onclick='selectMenu(\"000000000000355\")'>";
								_txt += "		<circle id='Ellipse_1_1' data-name='Ellipse 4 copy 5' cx='90' cy='90' r='90' transform='translate(360 685)' fill='#fff' />";
								_txt += "		<g id='value'>";
								_txt += "			<circle id='Ellipse_1_1-2' data-name='Ellipse 4 copy 5' cx='75' cy='75' r='75' transform='translate(375 700)' fill='none' stroke='rgba(0,143,247,0.2)' stroke-linecap='round' stroke-width='20' />";
								_txt += "			<path id='Ellipse_1_1-3' data-name='Ellipse 4 copy 5' d='M75,0A75.088,75.088,0,1,1,74,0' transform='translate(375 700)' fill='none' stroke='#0d84ea' stroke-linecap='round' stroke-width='20' style='stroke-dashoffset: 471.239; stroke-dasharray: 471.239;' />";
								_txt += "		</g>";
								_txt += "		<text id='_16_20' transform='translate(450 801)' fill='#0d84ea' font-size='32' font-family='ProximaNova-Bold, Proxima Nova' font-weight='700'>";
								_txt += "			<tspan id='TERM_ACQ_CRDT' x='"+ _x1 +"' y='0'>0</tspan>";
								if(tot2 > 0) {
									_txt += "			<tspan id='TOT_TERM_ACQ_CRDT' x='8' y='0' fill='#333' font-size='20' font-family='ProximaNova-Light, Proxima Nova' font-weight='300'>/ 0</tspan>";
								}
								_txt += "		</text>";
								_txt += "		<text id='학기_수강학점' data-name='학기 수강학점' transform='translate(450 761)' fill='#333' font-size='14' font-family='NotoSansCJKkr-Medium, Noto Sans CJK KR' font-weight='500' letter-spacing='-0.05em'>";
								_txt += "			<tspan x='-38.115' y='0' data-lang>학기 수강학점</tspan>";
								_txt += "		</text>";
								_txt += "	</g>";
								_txt += "</svg>";
								$('#svg_chart_1').html(_txt);
								
								$("#TERM_ACQ_CRDT").html(tot1);
								if(tot2 > 0) {
									$("#TOT_TERM_ACQ_CRDT").html("/ "+tot2);
									var bar1 = document.querySelector('#Ellipse_1_1-3');
									var term_per = tot1 / tot2 * 100;
									progress(term_per,bar1);
								}
								if(tot1.toString().length > 3) {
									$("#TERM_ACQ_CRDT").css("font-size","22px");
								}
							}
						});
						
						
						/* ajax처리 */
						gfn_ajax_request({
							url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListTermSj",
							reqData : {
								STDT_NO : scwin.loginUser.userId
							},
							success : function(data, responseData) {

								var acqCrdt = responseData.totTermSj != null ? gfn_str_parseNullZero(responseData.totTermSj.ACQ_CRDT) : "0";
								var totAcqCrdt = responseData.totTermSj != null ? gfn_str_parseNullZero(responseData.totTermSj.TOT_ACQ_CRDT) : "0";
								
								var _x1 = '-28';
								//var _x2 = '0';
								
								if(totAcqCrdt > 0) {
									if(acqCrdt.toString().length == 2) {
										_x1 = '-38';
									}else if(acqCrdt.toString().length == 3) {
										_x1 = '-48';
									}else if(acqCrdt.toString().length > 3) {
										_x1 = '-48';	
									}
								}else {
									_x1 = '-10';
									if(acqCrdt.toString().length == 2) {
										_x1 = '-20';
									}else if(acqCrdt.toString().length == 3) {
										_x1 = '-28';
									}
								}
								
								var _txt = "<svg xmlns='http://www.w3.org/2000/svg' width='100%' viewBox='0 0 180 180' style='max-width: 200px;'>";
								_txt += "	<g id='_2' data-name='2' transform='translate(-541 -685)' style='cursor:pointer;' onclick='selectMenu(\"000000000000145\")'>";
								_txt += "		<circle id='Ellipse_2_1' data-name='Ellipse 4 copy 5' cx='90' cy='90' r='90' transform='translate(541 685)' fill='#fff' />";
								_txt += "		<g id='value' transform='translate(212)'>";
								_txt += "			<circle id='Ellipse_2_1-2' data-name='Ellipse 4 copy 5' cx='75' cy='75' r='75' transform='translate(344 700)' fill='none' stroke='rgba(136,208,98,0.2)' stroke-linecap='round' stroke-width='20' />";
								_txt += "			<path id='Ellipse_2_1-3' data-name='Ellipse 4 copy 5' d='M75,0A75.088,75.088,0,1,1,74,0' transform='translate(344 700)' fill='none' stroke='#009a54' stroke-linecap='round' stroke-width='20' style='stroke-dashoffset: 471.239; stroke-dasharray: 471.239;' />";
								_txt += "		</g>";
								_txt += "		<text id='_32_140' transform='translate(631 801)' fill='#009a54' font-size='32' font-family='ProximaNova-Bold, Proxima Nova' font-weight='700'>";
								_txt += "			<tspan id='ACQ_CRDT' x='"+ _x1 +"' y='0'>0</tspan>";
								if(totAcqCrdt > 0) {
									_txt += "			<tspan id='TOT_ACQ_CRDT' x='8' y='0' fill='#333' font-size='20' font-family='ProximaNova-Light, Proxima Nova' font-weight='300'>/ 0</tspan>";
								}
								_txt += "		</text>";
								_txt += "		<text id='총_이수학점' data-name='총 이수학점' transform='translate(631 761)' fill='#333' font-size='14' font-family='NotoSansCJKkr-Medium, Noto Sans CJK KR' font-weight='500' letter-spacing='-0.05em'>";
								_txt += "			<tspan x='-32.025' y='0' data-lang>총 이수학점</tspan>";
								_txt += "		</text>";
								_txt += "	</g>";
								_txt += "</svg>";
								$('#svg_chart_2').html(_txt);
							    
						        //총 이수학점
								$("#ACQ_CRDT").html(acqCrdt);
								if(totAcqCrdt > 0) {
									$("#TOT_ACQ_CRDT").html("/ "+totAcqCrdt);
									var bar2 = document.querySelector('#Ellipse_2_1-3');
									var tot_per = acqCrdt / totAcqCrdt * 100;
									progress(tot_per,bar2);
								}
								
								if(acqCrdt.toString().length > 3) {
									$("#ACQ_CRDT").css("font-size","22px");
								}
							}
						});
					}else {
						var _txt = "<svg xmlns='http://www.w3.org/2000/svg' width='100%' viewBox='0 0 180 180' style='max-width: 200px;'>";
						_txt += "<g id='_1' data-name='1' transform='translate(-360 -685)' style='cursor:pointer;' onclick='selectMenu(\"000000000000355\")'>";
						_txt += "		<circle id='Ellipse_1_1' data-name='Ellipse 4 copy 5' cx='90' cy='90' r='90' transform='translate(360 685)' fill='#fff' />";
						_txt += "		<g id='value'>";
						_txt += "			<circle id='Ellipse_1_1-2' data-name='Ellipse 4 copy 5' cx='75' cy='75' r='75' transform='translate(375 700)' fill='none' stroke='rgba(0,143,247,0.2)' stroke-linecap='round' stroke-width='20' />";
						_txt += "			<path id='Ellipse_1_1-3' data-name='Ellipse 4 copy 5' d='M75,0A75.088,75.088,0,1,1,74,0' transform='translate(375 700)' fill='none' stroke='#0d84ea' stroke-linecap='round' stroke-width='20' style='stroke-dashoffset: 471.239; stroke-dasharray: 471.239;' />";
						_txt += "		</g>";
						_txt += "		<text id='_16_20' transform='translate(450 801)' fill='#0d84ea' font-size='32' font-family='ProximaNova-Bold, Proxima Nova' font-weight='700'>";
						_txt += "			<tspan id='TERM_ACQ_CRDT' x='-30' y='0'>0</tspan>";
						_txt += "			<tspan id='TOT_TERM_ACQ_CRDT' x='5' y='0' fill='#333' font-size='20' font-family='ProximaNova-Light, Proxima Nova' font-weight='300'>/ 0</tspan>";
						_txt += "		</text>";
						_txt += "		<text id='학기_수강학점' data-name='학기 수강학점' transform='translate(450 761)' fill='#333' font-size='14' font-family='NotoSansCJKkr-Medium, Noto Sans CJK KR' font-weight='500' letter-spacing='-0.05em'>";
						_txt += "			<tspan x='-38.115' y='0' data-lang>학기 수강학점</tspan>";
						_txt += "		</text>";
						_txt += "	</g>";
						_txt += "</svg>";
						$('#svg_chart_1').html(_txt);
						
						_txt = "<svg xmlns='http://www.w3.org/2000/svg' width='100%' viewBox='0 0 180 180' style='max-width: 200px;'>";
						_txt += "	<g id='_2' data-name='2' transform='translate(-541 -685)' style='cursor:pointer;' onclick='selectMenu(\"000000000000145\")'>";
						_txt += "		<circle id='Ellipse_2_1' data-name='Ellipse 4 copy 5' cx='90' cy='90' r='90' transform='translate(541 685)' fill='#fff' />";
						_txt += "		<g id='value' transform='translate(212)'>";
						_txt += "			<circle id='Ellipse_2_1-2' data-name='Ellipse 4 copy 5' cx='75' cy='75' r='75' transform='translate(344 700)' fill='none' stroke='rgba(136,208,98,0.2)' stroke-linecap='round' stroke-width='20' />";
						_txt += "			<path id='Ellipse_2_1-3' data-name='Ellipse 4 copy 5' d='M75,0A75.088,75.088,0,1,1,74,0' transform='translate(344 700)' fill='none' stroke='#009a54' stroke-linecap='round' stroke-width='20' style='stroke-dashoffset: 471.239; stroke-dasharray: 471.239;' />";
						_txt += "		</g>";
						_txt += "		<text id='_32_140' transform='translate(631 801)' fill='#009a54' font-size='32' font-family='ProximaNova-Bold, Proxima Nova' font-weight='700'>";
						_txt += "			<tspan id='ACQ_CRDT' x='-30' y='0'>0</tspan>";
						_txt += "			<tspan id='TOT_ACQ_CRDT' x='5' y='0' fill='#333' font-size='20' font-family='ProximaNova-Light, Proxima Nova' font-weight='300'>/ 0</tspan>";
						_txt += "		</text>";
						_txt += "		<text id='총_이수학점' data-name='총 이수학점' transform='translate(631 761)' fill='#333' font-size='14' font-family='NotoSansCJKkr-Medium, Noto Sans CJK KR' font-weight='500' letter-spacing='-0.05em'>";
						_txt += "			<tspan x='-32.025' y='0' data-lang>총 이수학점</tspan>";
						_txt += "		</text>";
						_txt += "	</g>";
						_txt += "</svg>";
						$('#svg_chart_2').html(_txt);
					}
					
				
				});
		/* 
		function fn_stdtMyInfoPop(){
			var data = {};
			data.userId = scwin.loginUser.userId;
			gfn_bbs_modalPopup({
	        	width : 800,
	            height : 600,
	            index : 1,
	            target : null,                                
	            title : "학생 개인정보 수정(확인) 안내",
	            include : "/core/main/stdtMyInfoPop.do",
	            reqData : data
	        });
		} */
		
		function fn_chgPwd() {
			gfn_com_modalPopup({
	        	width : 430,
	            height : 430,                            
	            title : "비밀번호변경",
	            include : "/html/ost/core/popup/chgPwdPop.html"
	        });
		}
		
		function progress(per,bar) {
			var RADIUS = 75;
			var CIRCUMFERENCE = 2 * Math.PI * RADIUS;	
			var progress = per / 100;
			var dashoffset = CIRCUMFERENCE * (1 - progress);

			bar.style.strokeDasharray = CIRCUMFERENCE;
			var i =CIRCUMFERENCE;
			var func1 = setInterval(function(){
				if(i>dashoffset){
					bar.style.strokeDashoffset = i;
					i--;
				}else{
					clearInterval(func1);
				}
			},5);
			 
		}

	</script>
	<script>
		var $firstMenuitems = $('.smart-flow h4[role="menuitem"]');
		$firstMenuitems.on("click", function() {
			$firstMenuitems.not(this).attr("data-expanded", "false");
			toggleMenuItemExpanded($(this));
		});
		function toggleMenuItemExpanded($menuItem) {
			if ($menuItem.attr("data-expanded") === "true") {
				$menuItem.attr("data-expanded", "false");
			} else {
				$menuItem.attr("data-expanded", "true");
			}
		}
		
	</script>


	<!-- /END Scripts -->
</body>
</html>