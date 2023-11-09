<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.onestop.core.util.CommonStaticFile" %>
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
<link href="/common/css/owl.carousel.min.css" type="text/css" rel="stylesheet">

<link href="/common/css/common.css?${CommonStaticFile.makeVersion('/common/css/common.css') }" rel="stylesheet">
<link href="/common/css/style.css?${CommonStaticFile.makeVersion('/common/css/style.css') }" rel="stylesheet">
<link href="/common/css/popup.css?${CommonStaticFile.makeVersion('/common/css/popup.css') }" rel="stylesheet">
<link href="/common/css/layer-popup.css?${CommonStaticFile.makeVersion('/common/css/layer-popup.css') }" rel="stylesheet">
<link href="/common/css/common_dev.css?${CommonStaticFile.makeVersion('/common/css/common_dev.css') }" rel="stylesheet">
<c:if test ="${SESSION_LOCALE != '0001'}">
    <link href="/common/css/common_global.css?${CommonStaticFile.makeVersion('/common/css/common_global.css') }" rel="stylesheet">
    <link href="/common/css/style_global.css?${CommonStaticFile.makeVersion('/common/css/style.css') }" rel="stylesheet">    
</c:if>
</head>
<body>
	<jsp:include page="inc/incCommonJs.jsp" flush="false" />
	<div id="root">
		<jsp:include page="inc/incHeader.jsp" flush="false" />
		<main id="main">
			<!-- 인증, 스마트 검색, One-Stop 서비스 -->
			<div class="sec-box sec-box-major">
				<div class="container">
					<div class="row">
						<div class="col-xl-4">
							<section class="sec-1 sec-auth">
								<!-- <header>
									<ul class="nav nav-tabs" id="login-tab" id="tablist">
										<li class="nav-item" role="presentation"><a class="nav-link active" id="login-tab01" data-toggle="tab" href="#login-cont01"  data-controls="login-cont01" data-selected="true"  data-lang>아이디 로그인</a></li>
										<li class="nav-item" role="presentation"><a class="nav-link" id="login-tab02" data-toggle="tab" href="#login-cont02"  data-controls="login-cont02" data-selected="false"  data-lang>인증서 로그인</a></li>
										<li class="nav-item" role="presentation"><a class="nav-link" id="login-tab03" data-toggle="tab" href="#login-cont03"  data-controls="login-cont03" data-selected="false"  data-lang>스마트 로그인</a></li>
									</ul>
								</header> -->
								<div class="sec-body">
									<c:choose>
									<c:when test="${SITE_INFO.SSO_USE_FG =='Y' && _host == 'onestop.pusan.ac.kr' }">
									<div class="logged-out-view">
											<p class="text-secondary">로그인이 필요한 시스템입니다.</p>
											<button class="btn btn-lg btn-primary" type="button" onclick="ssoOpen();return false;"><i class="bi bi-lock-fill" aria-hidden="true"></i> 로그인</button>
									</div>   
									</c:when>
									<c:otherwise>
									<div class="tab-content logged-out-view">
										<div class="tab-pane fade show active" id="login-cont01"  aria-labelledby="login-tab01">
											<p class="login-info">
												&nbsp;
											</p>
											<div class="login-box">
												<div class="login-item" id="login-item">
													<div class="form-group">
														<input class="form-control" type="text" id="userID" title="학번" placeholder="학번">
													</div>
													<div class="form-group">
														<input class="form-control" type="password" id="userPW" title="비밀번호" placeholder="비밀번호" onKeyUp="gfn_com_enterFunc(event,fn_login);" autocomplete="off">
													</div>
												</div>
												<div class="login-item">
													<button class="btn btn-primary login-btn" type="button" onclick="javascript:fn_login();" data-lang>로그인</button>
												</div>
											</div>
											<ul class="list list-center list-with-separator">
											
												<li><a href="#" onclick="popupOpen('FindID_step1',770,560);" onkeypress="this.onclick;" title="학번 찾기" data-lang>학번 찾기</a></li>
												<li><a href="#" onclick="popupOpen('FindPassword_step1',770,640);" onkeypress="this.onclick;" title="비밀번호 찾기" data-lang>비밀번호 찾기</a></li>
											</ul>
										</div>
										<div class="tab-pane fade" id="login-cont02"  aria-labelledby="login-tab02">
											<p class="login-info">
												<span  data-lang>공동인증서를</span> <span class="text-danger"  data-lang>발급/재발급/갱신</span>한 경우 반드시 <span class="text-danger"  data-lang>인증서를 재등록</span>. <br class="d-none d-lg-block"  data-lang>행정전자서명 외 <span class="text-danger"  data-lang>인증서(은행용, 증권용)</span> <span  data-lang>등록 가능</span>
											</p>
											<div class="text-center mb-3">
												<button class="btn btn-primary" type="button"  data-lang>공인인증서 로그인</button>
											</div>
											<ul class="list list-center list-with-separator">
												<li><a href="#"  data-lang>인증서</a></li>
												<li><a href="#"  data-lang>인증 등록/해지</a></li>
											</ul>
										</div>
										<div class="tab-pane fade" id="login-cont03"  aria-labelledby="login-tab03">
											<p class="login-info">
												<span class="text-danger"  data-lang>생체인증(지문, 얼굴) 또는 OTP 6자리 비밀번호 로</span> <br class="d-none d-lg-block"  data-lang>대체하는 서비스로, 인증서가 없는 PC에서도 로그인이 가능합니다.
											</p>
											<div class="text-center mb-3">
												<button class="btn btn-primary" type="button"  data-lang>OTP 로그인</button>
												<button class="btn btn-secondary" type="button"  data-lang>생체인증 로그인</button>
											</div>
											<ul class="list list-center list-with-separator">
												<li><a href="#"  data-lang>신규등록</a></li>
												<li><a href="#"  data-lang>인증하기</a></li>
												<li><a href="#"  data-lang>이용방법</a></li>
												<li><a href="#"  data-lang>인증 등록/해지</a></li>
											</ul>
										</div>
									</div>
									</c:otherwise>
									</c:choose>
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
											<input type="text" id="total_keyword" class="form-control smart-search-input" placeholder="검색어를 입력해 주세요" title="검색어를 입력해 주세요" aria-label="검색어" aria-describedby="smart-search-btn"  autocomplete="off">
											<div class="input-group-append">
												<button class="btn btn-icon" id="smart-search-btn" title="검색">
													<img src="/common/images/search_white.svg" alt="검색">
												</button>
											</div>
										</div>
										<ul class="list search-term-list">
											<li><a href="#total_keyword" onclick="smartSearch('수강편람');return false;"  onkeypress="this.onclick;"  title="학부 수강편람 스마트검색 새창 바로가기">수강편람</a></li>
											<li><a href="#total_keyword" onclick="smartSearch('수강신청');return false;"  onkeypress="this.onclick;"   title="학부 수강편람 스마트검색 새창 바로가기">수강신청</a></li>
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
										<label data-lang>One-Stop 서비스</label> <span  data-lang>${termInfo.SYEAR }학년도 ${termInfo.TERM_GCD_KOR_NM }</span>
									</h2>
									<div class="tab-wrap">
										<div class="owl-carousel owl-theme nav nav-pills" style="margin-bottom: 0px" id="tablist">

											<c:forEach var="item" items="${ostStep1List}" varStatus="status">
												<div class="item">
													<div class="nav-item" role="presentation">
														<a class="nav-link <c:if test ="${status.index == 0}">active</c:if>" id="smart-tab${item.COMMON_DETAIL_CD }" data-toggle="pill" href="#smart-cont${item.COMMON_DETAIL_CD }"  data-selected="<c:if test ="${status.index == 0}">true</c:if><c:if test ="${status.index != 0}">false</c:if>">${item.COMMON_DETAIL_CD_KOR_NM }</a>
													</div>
												</div>
											</c:forEach>

										</div>
									</div>
								</header>
								<div class="sec-body" style="<c:if test="${SITE_INFO.SSO_USE_FG =='N' || _host != 'onestop.pusan.ac.kr' }">min-height: 293px;</c:if>">
									<div class="tab-content" id="pills-tabContent">
										<c:if test="${fn:length(ostStep1List) > 0}">
											<c:forEach var="item" items="${ostStep1List}" varStatus="status">
												<div class="tab-pane fade show <c:if test ="${status.index == 0}">active</c:if>" id="smart-cont${item.COMMON_DETAIL_CD }"  aria-labelledby="smart-tab${item.COMMON_DETAIL_CD }">
													<c:if test="${item.STEP2_CNT > 0}">
														<div class="smart-flow-wrap" style="width:${item.STEP2_CNT * 172}px">

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
																						<li><a href="javascript:selectMenu('${item3.MENU_CD }');">${item3.MENU_ABBR_KOR_NM }</a></li>
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
														<p class="non-info"  data-lang>서비스 준비중입니다.</p>
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
			<!-- /END 인증, 스마트 검색, One-Stop 서비스 -->
			<!-- 학사일정, 공지사항 -->
			<div class="sec-box sec-box-board">
				<div class="container">
					<div class="row">
						<div class="col-xl-5 ">
							<section class="sec-smart-meal" id="meal_tabs">
								<header>
									<h2 class="sec-title"  data-lang>오늘의 식단</h2>
									<ul class="nav nav-tabs" id="tablist">
										<li class="nav-item" role="presentation"><a class="nav-link <c:if test="${mealMenuActiveB =='true' }">active</c:if>" id="maea1-1-tab" data-toggle="tab" href="#maea1-1"   data-selected="<c:if test="${mealMenuActiveB =='true' }">true</c:if>"  data-lang>조식<span>07:00 - 08:30</span></a></li>
										<li class="nav-item" role="presentation"><a class="nav-link <c:if test="${mealMenuActiveL =='true' }">active</c:if>" id="maea1-2-tab" data-toggle="tab" href="#maea1-2"   data-selected="<c:if test="${mealMenuActiveL =='true' }">true</c:if>"  data-lang>중식<span>11:30 - 13:30</span></a></li>
										<li class="nav-item" role="presentation"><a class="nav-link <c:if test="${mealMenuActiveD =='true' }">active</c:if>" id="maea1-3-tab" data-toggle="tab" href="#maea1-3"  data-selected="<c:if test="${mealMenuActiveD =='true' }">true</c:if>"  data-lang>석식<span>18:00 - 19:30</span></a></li>
									</ul>
								</header>
								<div class="sec-body">
									<div class="tab-content">
										<div class="tab-pane fade <c:if test="${mealMenuActiveB =='true' }">show active</c:if>" id="maea1-1"  aria-labelledby="maea1-1-tab">
											<c:if test="${fn:length(mealMenuBList) == 0}">
												<p class="non-info"  data-lang>금일은 운영하지 않습니다.</p>
											</c:if>
											<c:if test="${fn:length(mealMenuBList) > 0}">
												<div id="carousel-meal01" class="carousel slide" data-touch="false" data-interval="false">
													<div class="carousel-inner">

														<div class="carousel-item active">
															<ul class="meal-item">
																<c:forEach var="item" items="${mealMenuBList}" varStatus="status">
																	<c:if test="${status.index  <= 3}">
																		<li>
																			<a href="https://www.pusan.ac.kr/kor/CMS/MenuMgr/menuListOnBuilding.do?mCode=MN202&campus_gb=PUSAN&building_gb=${item.BUILDING_GB}&restaurant_code=${item.RESTAURANT_CODE}" target="_blank" title="식단표 새창열기">
																			<div class="header">
																				<h4>${item.MENU_TITLE }</h4>
																				<span class="place">${item.BUILDING_NAME} ${item.RESTAURANT_NAME }</span>
																			</div>
																			<p>${item.MENU_CONTENT }</p>
																			</a>
																		</li>
																	</c:if>
																</c:forEach>
															</ul>
														</div>
														<c:if test="${fn:length(mealMenuBList) > 4}">
															<div class="carousel-item">
																<ul class="meal-item">
																	<c:forEach var="item" items="${mealMenuBList}" varStatus="status">
																		<c:if test="${status.index  >= 4 && status.index  <= 7 }">
																			<li>
																				<a href="https://www.pusan.ac.kr/kor/CMS/MenuMgr/menuListOnBuilding.do?mCode=MN202&campus_gb=PUSAN&building_gb=${item.BUILDING_GB}&restaurant_code=${item.RESTAURANT_CODE}" target="_blank" title="식단표 새창열기">
																				<div class="header">
																					<h4>${item.MENU_TITLE }</h4>
																					<span class="place">${item.BUILDING_NAME} ${item.RESTAURANT_NAME }</span>
																				</div>
																				<p>${item.MENU_CONTENT }</p>
																				</a>
																			</li>
																		</c:if>
																	</c:forEach>
																</ul>
															</div>
														</c:if>
														<c:if test="${fn:length(mealMenuBList) > 8}">
															<div class="carousel-item">
																<ul class="meal-item">
																	<c:forEach var="item" items="${mealMenuBList}" varStatus="status">
																		<c:if test="${status.index  >= 8 && status.index  <= 11 }">
																			<li>
																				<a href="https://www.pusan.ac.kr/kor/CMS/MenuMgr/menuListOnBuilding.do?mCode=MN202&campus_gb=PUSAN&building_gb=${item.BUILDING_GB}&restaurant_code=${item.RESTAURANT_CODE}" target="_blank" title="식단표 새창열기">
																				<div class="header">
																					<h4>${item.MENU_TITLE }</h4>
																					<span class="place">${item.BUILDING_NAME} ${item.RESTAURANT_NAME }</span>
																				</div>
																				<p>${item.MENU_CONTENT }</p>
																				</a>
																			</li>
																		</c:if>
																	</c:forEach>
																</ul>
															</div>
														</c:if>
													</div>
													<c:if test="${fn:length(mealMenuBList) > 4}">
														<div class="btn-control">
															<button class="carousel-control-prev" type="button" data-target="#carousel-meal01" data-slide="prev">
																<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16" stroke="currentcolor" stroke-width="1">
																	<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
																</svg>
																<span class="sr-only">이전</span>
															</button>
															<button class="carousel-control-next" type="button" data-target="#carousel-meal01" data-slide="next">
																<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16" stroke="currentcolor" stroke-width="1">
																	<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
																</svg>
																<span class="sr-only">다음</span>
															</button>
														</div>
													</c:if>
												</div>
											</c:if>
										</div>
										<div class="tab-pane fade <c:if test="${mealMenuActiveL =='true' }">show active</c:if>" id="maea1-2"  aria-labelledby="maea1-2-tab">
											<c:if test="${fn:length(mealMenuLList) == 0}">
												<p class="non-info">금일은 운영하지 않습니다.</p>
											</c:if>
											<c:if test="${fn:length(mealMenuLList) > 0}">
												<div id="carousel-meal02" class="carousel slide" data-touch="false" data-interval="false">
													<div class="carousel-inner">

														<div class="carousel-item active">
															<ul class="meal-item">
																<c:forEach var="item" items="${mealMenuLList}" varStatus="status">
																	<c:if test="${status.index  <= 3}">
																		<li>
																			<a href="https://www.pusan.ac.kr/kor/CMS/MenuMgr/menuListOnBuilding.do?mCode=MN202&campus_gb=PUSAN&building_gb=${item.BUILDING_GB}&restaurant_code=${item.RESTAURANT_CODE}" target="_blank" title="식단표 새창열기">
																			<div class="header">
																				<h4>${item.MENU_TITLE }</h4>
																				<span class="place">${item.BUILDING_NAME} ${item.RESTAURANT_NAME }</span>
																			</div>
																			<p>${item.MENU_CONTENT }</p>
																			</a>
																		</li>
																	</c:if>
																</c:forEach>
															</ul>
														</div>
														<c:if test="${fn:length(mealMenuLList) > 4}">
															<div class="carousel-item">
																<ul class="meal-item">
																	<c:forEach var="item" items="${mealMenuLList}" varStatus="status">
																		<c:if test="${status.index  >= 4 && status.index  <= 7 }">
																			<li>
																				<a href="https://www.pusan.ac.kr/kor/CMS/MenuMgr/menuListOnBuilding.do?mCode=MN202&campus_gb=PUSAN&building_gb=${item.BUILDING_GB}&restaurant_code=${item.RESTAURANT_CODE}" target="_blank" title="식단표 새창열기">
																				<div class="header">
																					<h4>${item.MENU_TITLE }</h4>
																					<span class="place">${item.BUILDING_NAME} ${item.RESTAURANT_NAME }</span>
																				</div>
																				<p>${item.MENU_CONTENT }</p>
																				</a>
																			</li>
																		</c:if>
																	</c:forEach>
																</ul>
															</div>
														</c:if>
														<c:if test="${fn:length(mealMenuLList) > 8}">
															<div class="carousel-item">
																<ul class="meal-item">
																	<c:forEach var="item" items="${mealMenuLList}" varStatus="status">
																		<c:if test="${status.index  >= 8 && status.index  <= 11 }">
																			<li>
																				<a href="https://www.pusan.ac.kr/kor/CMS/MenuMgr/menuListOnBuilding.do?mCode=MN202&campus_gb=PUSAN&building_gb=${item.BUILDING_GB}&restaurant_code=${item.RESTAURANT_CODE}" target="_blank" title="식단표 새창열기">
																				<div class="header">
																					<h4>${item.MENU_TITLE }</h4>
																					<span class="place">${item.BUILDING_NAME} ${item.RESTAURANT_NAME }</span>
																				</div>
																				<p>${item.MENU_CONTENT }</p>
																				</a>
																			</li>
																		</c:if>
																	</c:forEach>
																</ul>
															</div>
														</c:if>
													</div>
													<c:if test="${fn:length(mealMenuLList) > 4}">
														<div class="btn-control">
															<button class="carousel-control-prev" type="button" data-target="#carousel-meal02" data-slide="prev">
																<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16" stroke="currentcolor" stroke-width="1">
																	<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
																</svg>
																<span class="sr-only">다음</span>
															</button>
															<button class="carousel-control-next" type="button" data-target="#carousel-meal02" data-slide="next">
																<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16" stroke="currentcolor" stroke-width="1">
																	<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
																</svg>
																<span class="sr-only">이전</span>
															</button>
														</div>
													</c:if>
												</div>
											</c:if>
										</div>
										<div class="tab-pane fade <c:if test="${mealMenuActiveD =='true' }">show active</c:if>" id="maea1-3"  aria-labelledby="maea1-3-tab">
											<c:if test="${fn:length(mealMenuDList) == 0}">
												<p class="non-info"  data-lang>금일은 운영하지 않습니다.</p>
											</c:if>
											<c:if test="${fn:length(mealMenuDList) > 0}">
												<div id="carousel-meal03" class="carousel slide" data-touch="false" data-interval="false">
													<div class="carousel-inner">

														<div class="carousel-item active">
															<ul class="meal-item">
																<c:forEach var="item" items="${mealMenuDList}" varStatus="status">
																	<c:if test="${status.index  <= 3}">
																		<li>
																			<a href="https://www.pusan.ac.kr/kor/CMS/MenuMgr/menuListOnBuilding.do?mCode=MN202&campus_gb=PUSAN&building_gb=${item.BUILDING_GB}&restaurant_code=${item.RESTAURANT_CODE}" target="_blank" title="식단표 새창열기">
																			<div class="header">
																				<h4>${item.MENU_TITLE }</h4>
																				<span class="place">${item.BUILDING_NAME} ${item.RESTAURANT_NAME }</span>
																			</div>
																			<p>${item.MENU_CONTENT }</p>
																			</a>
																		</li>
																	</c:if>
																</c:forEach>
															</ul>
														</div>
														<c:if test="${fn:length(mealMenuDList) > 4}">
															<div class="carousel-item">
																<ul class="meal-item">
																	<c:forEach var="item" items="${mealMenuDList}" varStatus="status">
																		<c:if test="${status.index  >= 4 && status.index  <= 7 }">
																			<li>
																				<a href="https://www.pusan.ac.kr/kor/CMS/MenuMgr/menuListOnBuilding.do?mCode=MN202&campus_gb=PUSAN&building_gb=${item.BUILDING_GB}&restaurant_code=${item.RESTAURANT_CODE}" target="_blank" title="식단표 새창열기">
																				<div class="header">
																					<h4>${item.MENU_TITLE }</h4>
																					<span class="place">${item.BUILDING_NAME} ${item.RESTAURANT_NAME }</span>
																				</div>
																				<p>${item.MENU_CONTENT }</p>
																				</a>
																			</li>
																		</c:if>
																	</c:forEach>
																</ul>
															</div>
														</c:if>
														<c:if test="${fn:length(mealMenuDList) > 8}">
															<div class="carousel-item">
																<ul class="meal-item">
																	<c:forEach var="item" items="${mealMenuDList}" varStatus="status">
																		<c:if test="${status.index  >= 8 && status.index  <= 11 }">
																			<li>
																				<a href="https://www.pusan.ac.kr/kor/CMS/MenuMgr/menuListOnBuilding.do?mCode=MN202&campus_gb=PUSAN&building_gb=${item.BUILDING_GB}&restaurant_code=${item.RESTAURANT_CODE}" target="_blank" title="식단표 새창열기">
																				<div class="header">
																					<h4>${item.MENU_TITLE }</h4>
																					<span class="place">${item.BUILDING_NAME} ${item.RESTAURANT_NAME }</span>
																				</div>
																				<p>${item.MENU_CONTENT }</p>
																				</a>
																			</li>
																		</c:if>
																	</c:forEach>
																</ul>
															</div>
														</c:if>
													</div>
													<c:if test="${fn:length(mealMenuDList) > 4}">
														<div class="btn-control">
															<button class="carousel-control-prev" type="button" data-target="#carousel-meal03" data-slide="prev">
																<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16" stroke="currentcolor" stroke-width="1">
																	<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
																</svg>
																<span class="sr-only">다음</span>
															</button>
															<button class="carousel-control-next" type="button" data-target="#carousel-meal03" data-slide="next">
																<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16" stroke="currentcolor" stroke-width="1">
																	<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
																</svg>
																<span class="sr-only">이전</span>
															</button>
														</div>
													</c:if>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</section>


							<!-- 학사일정 -->
							<section class="sec-1 sec-smart-schedule" style="max-height: 300px">
								<header>
									<h2 class="sec-title"  data-lang>학사 일정</h2>
									<a class="more-link" href="#popup" onclick="openSchPop();return false;" onkeypress="this.onclick;"><span class="sr-only">학사일정 레이어팝업 열기</span></a>
								</header>
								<div class="sec-body">
									<div class="schedule-date">
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<%
											java.util.Calendar mon = java.util.Calendar.getInstance();
											mon.add(java.util.Calendar.MONTH, 1);
										%>
										<c:set var="today2" value="<%=mon.getTime() %>" />
										<fmt:formatDate var="today_ym" pattern="yyyy-MM" value="${today }" />
										<fmt:formatDate var="today_ym2" pattern="yyyy-MM" value="${today2}" />
										<fmt:formatDate var="today_y" pattern="yyyy" value="${today }" />
										<fmt:formatDate var="today_m" pattern="MM" value="${today }" />
										<span class="schedule-month">${today_m }</span> <span>${today_y }</span>
									</div>
									<ul class="schedule-list" style="height: 220px">
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
							<!-- /END 학사일정 -->
						</div>



						<div class="col-xl-7 order-xl-last">
							<section class="sec-1 sec-smart-board">
								<!-- 탭 -->
								<ul class="nav nav-tabs" id="tablist">
									<li class="nav-item">
										<a class="nav-link active" id="board-tab-1" data-toggle="tab" href="#board-tabpanel-1"   data-selected="true" data-lang>학생지원시스템공지</a>
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
																			<a class="board-link" href="javascript:openBbsDetailPop('${bbsMgrAuth.MENU_CD }','${item.POSTING_SEQ_NO }', '${item.ATTACH_FILE_GRP_CD }')" title="레이어팝업열기">
																		</c:if>
																		<c:if test="${bbsMgrAuth.SECRET_POSTING_SEARCH_AUTH_FG != 'Y'
																					&& item.INS_USER_ID != loginUser.userId}">
																			<a class="board-link" href="javascript:openPassChkPop('${bbsMgrAuth.MENU_CD }','${item.BBS_TYPE_GCD }','${item.BBS_TYPE_SEQ_NO }', '${item.POSTING_SEQ_NO }')" title="레이어팝업열기">
																		</c:if>
																	</c:if> <c:if test="${item.SECRET_FG != 'Y'}">
																		<a class="board-link" href="javascript:openBbsDetailPop('${bbsMgrAuth.MENU_CD }','${item.POSTING_SEQ_NO }', '${item.ATTACH_FILE_GRP_CD }')" title="레이어팝업열기">
																	</c:if>
																	<div class="item-title">
																		<c:if test="${item.NOTICE_FG =='Y' && item.RN == '0'}">
																			<span class="noti" data-lang>공지</span>
																		</c:if>
																		<span class="board-title"><c:if test="${item.CATE_TYPE_NM !='' }">[${item.CATE_TYPE_NM }]</c:if>${item.TITLE_CONTENT }<c:if test="${item.ATTACH_FILE_GRP_CD !='' }">
																				<img src="/common/images_ses/icon-file.gif" alt="첨부파일있음"/>
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
																		<a class="board-link" href="javascript:alert('조회 권한이 없습니다.')">
																	</c:if> <c:if test="${item.ORIGIN_POSTING_INS_USER_ID == loginUser.userId 
																				|| bbsMgrAuth.REPLY_SEARCH_AUTH_FG == 'Y'}">
																		<a class="board-link" href="javascript:openBbsDetailPop('${bbsMgrAuth.MENU_CD }','${item.POSTING_SEQ_NO }', '${item.ATTACH_FILE_GRP_CD }')" title="레이어팝업열기">
																	</c:if>
																	<div class="item-title" style="padding-left: ${item.LEVEL*2}0px;">
																		<c:if test="${item.NOTICE_FG =='Y' && item.RN == '0'}">
																			<span class="noti" data-lang>공지</span>
																		</c:if>
																		<span class="board-title">┗ Re :<c:if test="${item.CATE_TYPE_NM !='' }">[${item.CATE_TYPE_NM }]</c:if>${item.TITLE_CONTENT }<c:if test="${item.ATTACH_FILE_GRP_CD !='' }">
																				<img src="/common/images_ses/icon-file.gif" alt="첨부파일있음"/>
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
												<a class="more-link" href="javascript:selectMenu('${bbsMgrAuth.MENU_CD }');" ><span class="sr-only">학생지원시스템공지 바로가기</span></a>
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
											<div class="tab-pane fade" id="board-tabpanel-3"  aria-labelledby="board-tab-3">
												<!-- <a class="more-link" href="#none" aria-label="더보기" title="더보기"></a> -->
												<p class="non-info mb"  data-lang>로그인이 필요한 서비스 입니다.</p>
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





					</div>
				</div>
			</div>
			<!-- /END 학사일정, 공지사항 -->
			<!-- quick menu -->
			<!--s: main-quickmenu-wr-->
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
										<a class="quick-link" href="https://pnu.certpia.com/" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon02.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>인터넷<br>증명발급
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
									<div class="item">
										<a class="quick-link" href="/page?menuCD=000000000000414" title="서식 및 안내 파일 메뉴이동"> <img src="/common/images/main-quick-icon03.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>서식 및 안내 파일
										</span>
										</a>
									</div>
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="/page?menuCD=000000000000304"> <img src="/common/images/main-quick-icon04.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>우편신청 및 기타<br>증명발급
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
										<a class="quick-link" href="https://plato.pusan.ac.kr" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon07.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>스마트교육플랫폼 PLATO</span>
										</a>
									</div>
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="https://labs-safety.pusan.ac.kr" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon08.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>PNU-연구실안전정보망</span>
										</a>
									</div>
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="https://pims.pusan.ac.kr" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon09.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>특허관리(PIMS)</span>
										</a>
									</div>
									<!-- item -->
									<div class="item">
										<a class="quick-link" href="https://space.pusan.ac.kr" target="_blank" title="새창열림"> <img src="/common/images/main-quick-icon06.svg" alt="" class="rotate-in-2-cw"> <span class="quick-title"  data-lang>교육공간 예약시스템
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
				<!--e: main-quickmenu-wr-->
			</div>
			<!-- /END quick menu -->
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
												<span  data-lang>유튜브<br>바로가기
											</span></a> <a href="https://www.instagram.com/pusan.ac.kr/?hl=ko" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon02.png" alt="인스타그램 바로가기" />
												</div>
												<span  data-lang>인스타그램<br>바로가기
											</span></a> <a href="https://www.facebook.com/PusanNationalUniv" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon03.png" alt="페이스북 바로가기" />
												</div>
												<span  data-lang>페이스북<br>바로가기
											</span></a> <a href="https://www.pusan.ac.kr/news/Main.do" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon04.png" alt="PNU NEWSLETTER" />
												</div>
												<span>PNU<br>NEWSLETTER
											</span></a>
										</section>
									</div>
									<div class="col-md-3">
										<h2 class="sec-title-1">
											<strong  data-lang>총학생회</strong> SNS
										</h2>
										<section class="sec-sns-1">
											<a href="https://pf.kakao.com/_Cazxij" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon05.png" alt="카카오채널 바로가기" />
												</div>
												<span  data-lang>카카오채널<br>바로가기
											</span></a> <a href="https://www.instagram.com/pnu_students_/?hl=ko" target="_blank" title="새창열기"><div class="icon">
													<img src="/common/images/main-sns-icon02.png" alt="인스타그램 바로가기" />
												</div>
												<span  data-lang>인스타그램<br>바로가기
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
	
	
	<script>
	
	

	
		if (gfn_str_parseNull('${_msg}') != "") {
			alert('${_msg}');
			<c:remove var="_msg" scope="session" />
		}
		if (gfn_str_parseNull('${loginFailMsg}') != "") {
			alert('${loginFailMsg}');
			<c:remove var="loginFailMsg" scope="session" />
		}

		$(document).ready(function() {
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
			
			
			if("${stdtInfo.userId}" != ""){
				fn_stdtMyInfoPop();
			}
			
			/* 5분마다 화면 새로고침 */
	        setInterval(function(){
	            window.location.reload();
	        }, 5*60*1000);
		});
		
		function fn_stdtMyInfoPop(){
			var data = {};
			data.userId = gfn_str_parseNullDefault("${stdtInfo.userId}",scwin.loginUser.userId);
			data.nm = "${stdtInfo.nm}";
			data.personInfoUseAgreeFg = "${stdtInfo.personInfoUseAgreeFg}";
			data.smsRcvAgreeFg = "${stdtInfo.smsRcvAgreeFg}";
			data.kakaotalkRcvAgreeFg = "${stdtInfo.kakaotalkRcvAgreeFg}";
			data.emailRcvAgreeFg = "${stdtInfo.emailRcvAgreeFg}";
			data.cellularNo = "${stdtInfo.cellularNo}";
			data.email = "${stdtInfo.email}";
			gfn_bbs_modalPopup({
	        	width : 800,
	            height : 600,
	            index : 1,
	            target : null,                                
	            title : "학생 개인정보 수정(확인) 안내",
	            include : "/core/main/stdtMyInfoPop.do",
	            reqData : data
	        });
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
		var fn_login = function() {

			gCsrfTokenHeaderName = '${_csrf.headerName}';
			gCsrfTokenParameterName = '${_csrf.parameterName}';
			gCsrfToken = '${_csrf.token}';

			//document.cookie = "MENU_CD=";
			var param = gfn_com_inputdata($("#login-item"));
			if (!fn_login_validate(param)) return false;

			var form = $('<form method="POST" action="/login/loginCheck">');
			form.append('<input type="hidden" name="USER_ID" value="' + fn_ajax_enc_param($('#userID').val()) + '">');
			form.append('<input type="hidden" name="PWD" value="' + fn_ajax_enc_param($('#userPW').val()) + '">');
			form.append('<input type="hidden" name="'+gCsrfTokenParameterName+'" value="'+gCsrfToken+'" />');
			$('body').append(form);
			form.submit().remove();
		}
		var fn_login_validate = function(param) {
			var rtnValue = true;
			rtnValue = gfn_val_validateDataMap(param, [{
				"id" : "userID",
				"name" : "학번",
				"notNull" : true,
			},{
				"id" : "userPW",
				"name" : "비밀번호",
				"notNull" : true,
			}
			]); 
			if (!rtnValue) return rtnValue;

			return rtnValue;
		}
		function popupOpen(name, w, h) {			
			var formId = "popupFindChkForm";
			var form = $("#"+formId);
			
			if(form.length>0){
				$(form).remove();	
			}
			form = $("<form id='"+formId+"' name='"+formId+"' method='post'  style='display:none;'>");
			$("body").append(form);
			form.attr("action","https://login.pusan.ac.kr/common/popup/" + name);
			form.attr("target","popupFindChk");
			window.open('', 'popupFindChk', "width="+w+",height="+h);		
            form.submit().remove();
		}
	</script>

	<!-- /END Scripts -->
</body>
</html>