<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
					<h2 class="sec-title">학적부</h2>
				</div>
				<div class="header-item"></div>
			</header>
			<!-- /END CONTENT HEADER -->

			<!-- CONTENT BODY -->
			<div class="sec-body">
				<div id="content_tabs">
					<ul class="nav nav-tabs nav-pills mb-2" id="tablist">
						<li class="nav-item" role="presentation"><a class="nav-link active" id="tab1" data-toggle="tab" href="#tab-cont1" 
							data-controls="tab-cont1" data-selected="true">학적</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" id="tab2" data-toggle="tab" href="#tab-cont2" 
							data-controls="tab-cont2" data-selected="false">입학</a></li>
						<li class="nav-item" role="presentation" id="visaTab"><a class="nav-link" id="tab3" data-toggle="tab" href="#tab-cont3" 
							data-controls="tab-cont3" data-selected="false">비자.어학</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" id="tab4" data-toggle="tab" href="#tab-cont4" 
							data-controls="tab-cont4" data-selected="false">학적변동</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" id="tab5" data-toggle="tab" href="#tab-cont5" 
							data-controls="tab-cont5" data-selected="false">장학금</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" id="tab6" data-toggle="tab" href="#tab-cont6" 
							data-controls="tab-cont6" data-selected="false">성적</a></li>
						<li clas s="nav-item" role="presentation"><a class="nav-link" id="tab7" data-toggle="tab" href="#tab-cont7" 
							data-controls="tab-cont7" data-selected="false">졸업</a></li>
					</ul>
					<div class="tab-content">
						<!-- 학적 TAB START -->
						<div class="tab-pane fade show active" id="tab-cont1"  aria-labelledby="tab1">
							<section class="sec-3">
								<header>
									<h4 class="sec-title"></h4>
								</header>
								<div class="sec-body">
									<div class="row no-gutters">
										<div class="col-2">
											<img id="stdtImg" src="/common/images/no_img.png" width="130" height="157" alt="기본이미지">
										</div>
										<div class="col-10">
											<div class="b-table-box flex-col-3" id="stdtTable" role="table" aria-label="학적 테이블">
												<div class="b-row-box" role="row">
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>학번</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: STDT_NO"></span>
														</div>
													</div>
													<div class="b-row-item merge-2">
														<div class="b-title-box" role="rowheader">
															<label data-lang>영문성명</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: STDT_ENG_NM"></span>
														</div>
													</div>
													<!-- 
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>한문성명</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: STDT_CHN_NM"></span>
														</div>
													</div>
													 -->
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>성명</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: STDT_KOR_NM"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label id="" data-lang>생년월일/성별</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: BIRTH_DATE"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>주민등록번호</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: HYPHEN_SSN"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>학적상태</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: HJ_STA_NM"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label id="" data-lang>구분</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: HJ_STA_DETAIL_NM"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>교육과정적용년도</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: CURC_APPLY_SYEAR"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>학위과정</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: DEG_COURSE_NM"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label id="" data-lang>학년/학기</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: STDT_YEAR_NM"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>이수학기</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: CMPL_TERM_CNT"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item merge-2">
														<div class="b-title-box" role="rowheader">
															<label data-lang>소속학과</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: DEPT_ALL"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>병역사항</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: MIL_SERVE_NM"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>휴학가능학기수</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: HYUHAK_CNT"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label id="" data-lang>국적</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: NATION_NM"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>최종등록학기</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: PAY_FG"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>누적휴학학기수</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: TOT_HYUHAK_CNT"></span>
														</div>
													</div>
													<div class="b-row-item merge-2">
														<div class="b-title-box" role="rowheader">
															<label data-lang>이메일</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: STDT_EMAIL_WEB"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>재외동포</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: OVRSKOR_FG"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>휴대폰번호</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: STDT_CELLULAR_NO_WEB"></span>
														</div>
													</div>
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>전화번호</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: STDT_TEL_NO"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item merge-3">
														<div class="b-title-box" role="rowheader">
															<label id="" data-lang>주소</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: STDT_ADDR_ALL"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>보호자성명</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: GUARDIAN_NM"></span>
														</div>
													</div>
													<div class="b-row-item merge-2">
														<div class="b-title-box" role="rowheader">
															<label data-lang>보호자전화번호</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: GUARDIAN_TEL_NO"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row">
													<div class="b-row-item merge-3">
														<div class="b-title-box" role="rowheader">
															<label data-lang>보호자주소</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: GUARDIAN_ADDR_ALL"></span>
														</div>
													</div>
												</div>
												<div class="b-row-box" role="row" id="profRow">
													<div class="b-row-item">
														<div class="b-title-box" role="rowheader">
															<label data-lang>지도교수</label>
														</div>
														<div class="b-con-box" role="cell">
															<span data-bind="text: ADVICE_PROF_NO"></span>
														</div>
													</div>
													<div class="b-row-item merge-2">
														<div class="b-title-box" role="rowheader">
															<label data-lang>공동지도교수</label>
														</div>
														<div class="b-con-box merge-2" role="cell">
															<span data-bind="text: JOINT_ADVICE_PROF_NO"></span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
						<!-- 학적 TAB END -->
						<!-- 입학 TAB START -->
						<div class="tab-pane fade" id="tab-cont2"  aria-labelledby="tab2">
							<section class="sec-3">
								<header>
									<h4 class="sec-title"></h4>
								</header>
								<div class="sec-body">
									<div class="table-box">
										<div class="table-body">
											<div class="table-responsive">
												<table class="table table-hover">
													<caption>입학 목록</caption>
													<colgroup>
														<col style="min-width: 50px;">
														<col style="min-width: 100px;">
														<col style="min-width: 100px;">
														<col style="min-width: 150px;">
														<col style="min-width: 100px;">
														<col style="min-width: 150px;">
														<col style="min-width: 100px;">
														<col style="min-width: 150px;">
														<col style="min-width: 150px;">
														<col style="min-width: 150px;">
														<col style="min-width: 150px;">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">No</th>
															<th scope="col">입학구분</th>
															<th scope="col">입학년도</th>
															<th scope="col">입학일자</th>
															<th scope="col">입학학년</th>
															<th scope="col">정원내외</th>
															<th scope="col">입학전형</th>
															<th scope="col">입학유형</th>
															<th scope="col">수시특기</th>
															<th scope="col">출신고교</th>
															<th scope="col">고교졸업년도</th>
														</tr>
													</thead>
													<tbody id="entTbody"></tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
						<!-- 입학 TAB END -->
						<!-- 비자 TAB START -->
						<div class="tab-pane fade" id="tab-cont3"  aria-labelledby="tab3">
							<!-- 비자정보 START -->
							<section class="sec-3">
								<header>
									<h4 class="sec-title">비자정보</h4>
								</header>
								<div class="sec-body">
									<div class="b-table-box flex-col-3" id="visaTable" role="table" aria-label="비자정보 테이블">
										<div class="b-row-box" role="row">
											<div class="b-row-item merge-2">
												<div class="b-title-box" role="rowheader">
													<label data-lang>비자종류</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: VISA_NM"></span>
													<span data-bind="text: VISA_REMARK" class="ml-1"></span>
												</div>
											</div>
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label data-lang>비자만료일</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: VISA_EXPIRE_DATE_HYPHEN"></span>
												</div>
											</div>

										</div>
										<div class="b-row-box" role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label data-lang>여권번호</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: PASSPORT_NO"></span>
												</div>
											</div>
											<div class="b-row-item merge-2">
												<div class="b-title-box" role="rowheader">
													<label data-lang>체류자격외 활동<br />취득여부</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: ACTIV_ACQ_FG_NM"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- 비자정보 END -->
							<!-- 보험 START -->
							<section class="sec-3">
								<header>
									<h4 class="sec-title">보험</h4>
								</header>
								<div class="sec-body">
									<div class="b-table-box flex-col-3" role="table" id="insuTable" aria-label="보험 테이블">
										<div class="b-row-box" role="row">
											<div class="b-row-item merge-prev">
												<div class="b-title-box" role="rowheader">
													<label for="INSURE_JOIN_FG1">가입여부</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: INSURE_JOIN_FG_NM"></span>
												</div>
											</div>
											<div class="b-row-item merge-2">
												<div class="b-title-box" role="rowheader">
													<label for="INSURE_JOIN_NM">구분</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: INSURE_JOIN_NM"></span>
													<span data-bind="text: INSURE_JOIN_COMPANY_NM" class="ml-1"></span>
												</div>
											</div>
										</div>
										<div class="b-row-box" role="row">
											<div class="b-row-item merge-3">
												<div class="b-title-box" role="rowheader">
													<label for="INSURE_START_DATE_HYPHEN">유효기간</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: INSURE_START_DATE_HYPHEN"></span>
													<span class="ml-1 mr-1">~</span>
													<span data-bind="text: INSURE_CLOSE_DATE_HYPHEN"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- 보험 END -->
							<!-- 보증인 START -->
							<section class="sec-3">
								<header>
									<h4 class="sec-title">보증인</h4>
								</header>
								<div class="sec-body">
									<div class="b-table-box flex-col-3" role="table" id="guarTable" aria-label="보증인 테이블">
										<div class="b-row-box" role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label for="GUARANTOR_TEL_NO">전화번호</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: GUARANTOR_TEL_NO"></span>
												</div>
											</div>
											<div class="b-row-item merge-2">
												<div class="b-title-box" role="rowheader">
													<label for="GUARANTOR_REL_INFO">관계</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: GUARANTOR_REL_INFO"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- 보증인 END -->
							<!-- 한국어능력시험(TOPIK) START -->
							<section class="sec-3">
								<header>
									<h4 class="sec-title">한국어능력시험(TOPIK)</h4>
								</header>
								<div class="sec-body">
									<div class="b-table-box flex-col-3" role="table" id="topikTable" aria-label="한국어능력시험 테이블">
										<div class="b-row-box" role="row">
											<div class="b-row-item merge-prev">
												<div class="b-title-box" role="rowheader">
													<label>급수</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: KAE_RATING_GCD_NM"></span>
												</div>
											</div>
											<div class="b-row-item merge-2">
												<div class="b-title-box" role="rowheader">
													<label>취득일자</label>
												</div>
												<div class="b-con-box" role="cell">
													<span data-bind="text: ACQ_DATE"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- 한국어능력시험(TOPIK) END -->
						</div>
						<!-- 비자 TAB END -->
						<!-- 학적변동 TAB START -->
						<div class="tab-pane fade" id="tab-cont4"  aria-labelledby="tab4">
							<!-- 학적변동목록 START -->
							<section class="sec-2 mb-3">
								<header>
									<h4 class="sec-title"></h4>
								</header>
								<div class="table-box">
									<div class="table-body">
										<div class="table-responsive">
											<table class="table table-hover" data-toggle="table" data-show-column="true">
												<caption>학적변동 목록</caption>
												<colgroup>
													<col style="min-width: 50px;">
													<col style="min-width: 100px;">
													<col style="min-width: 100px;">
													<col style="min-width: 150px;">
													<col style="min-width: 80px;">
													<col style="min-width: 150px;">
													<col style="min-width: 200px;">
													<col style="min-width: 200px;">
													<col style="min-width: 80px;">
													<col style="min-width: 300px;">
													<col style="min-width: 300px;">
													<col style="min-width: 250px;">
													<col style="min-width: 100px;">
												</colgroup>
												<thead>
													<tr>
														<th scope="col">No</th>
														<th scope="col">학년도</th>
														<th scope="col">학기</th>
														<th scope="col">변동일자</th>
														<th scope="col">취소여부</th>
														<th scope="col">취소일자</th>
														<th scope="col">변동구분</th>
														<th scope="col">복학예정</th>
														<th scope="col">휴학학기수</th>
														<th scope="col">변경전</th>
														<th scope="col">변경후</th>
														<th scope="col">비고</th>
														<th scope="col">공문</th>
													</tr>
												</thead>
												<tbody id="srchgTbody"></tbody>
											</table>
										</div>
									</div>
								</div>

							</section>
							<!-- 학적변동목록 END -->
							<!-- 다중전공목록 START -->
							<div class="row">
								<div class="col-6">
									<section class="sec-3 mb-3">
										<header>
											<h4 class="sec-title">다중전공</h4>
										</header>
										<div class="sec-body">
											<div class="table-box">
												<div class="table-body">
													<table class="table table-hover " data-toggle="table" data-show-column="true">
														<caption>다중전공 목록</caption>
														<colgroup>
															<col style="min-width: 50px;">
															<col style="min-width: 100px;">
															<col style="min-width: 100px;">
															<col style="min-width: 100px;">
														</colgroup>
														<thead>
															<tr>
																<th scope="col">No</th>
																<th scope="col">구분</th>
																<th scope="col">학과</th>
																<th scope="col">전공</th>
															</tr>
														</thead>
														<tbody id="mltiTbody"></tbody>
													</table>
												</div>
											</div>
										</div>
									</section>
								</div>
								<!-- 다중전공신청 목록 END -->
								<!-- 연계과정신청 목록 START -->
								<div class="col-6">
									<section class="sec-3 mb-3">
										<header>
											<h4 class="sec-title">연계과정</h4>
										</header>
										<div class="sec-body">
											<div class="table-box">
												<div class="table-body">
													<div class="table-responsive">
														<table class="table table-hover" data-toggle="table" data-show-column="true">
															<caption>연계과정 목록</caption>
															<colgroup>
																<col style="min-width: 50px;">
																<col style="min-width: 100px;">
																<col style="min-width: 100px;">
															</colgroup>
															<thead>
																<tr>
																	<th scope="col">No</th>
																	<th scope="col">신청과정</th>
																	<th scope="col">신청학년도학기</th>
																</tr>
															</thead>
															<tbody id="linkTbody"></tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
							<!-- 연계과정신청 목록 END -->
							<!-- 학사학위취득유예신청/무논문 목록 START -->
							<div class="row">
								<div class="col-6">
									<section class="sec-3 mb-3">
										<header>
											<h4 class="sec-title">학위취득</h4>
										</header>
										<div class="sec-body">
											<div class="table-box">
												<div class="table-body">
													<div class="table-responsive">
														<table class="table table-hover" data-toggle="table" data-show-column="true">
															<caption>학위취득 목록</caption>
															<colgroup>
																<col style="min-width: 50px;">
																<col style="min-width: 150px;">
																<col style="min-width: 150px;">
																<col style="min-width: 100px;">
															</colgroup>
															<thead>
																<tr>
																	<th scope="col">No</th>
																	<th scope="col">신청과정</th>
																	<th scope="col">신청학년도학기</th>
																	<th scope="col">신청횟수</th>
																</tr>
															</thead>
															<tbody id="acqTbody"></tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<!-- 학사학위취득유예신청/무논문 목록 END -->
								<!-- 편입/교류/복수.공동학위 목록 START -->
								<div class="col-6">
									<section class="sec-3">
										<header>
											<h4 class="sec-title">편입/교류/복수.공동학위</h4>
										</header>
										<div class="sec-body">
											<div class="table-box">
												<div class="table-body">
													<div class="table-responsive">
														<table class="table table-hover" data-toggle="table" data-show-column="true">
															<caption>편입/교류/복수.공동학위 목록</caption>
															<colgroup>
																<col style="min-width: 50px;">
																<col style="min-width: 100px;">
																<col style="min-width: 100px;">
																<col style="min-width: 100px;">
															</colgroup>
															<thead>
																<tr>
																	<th scope="col">No</th>
																	<th scope="col">구분</th>
																	<th scope="col">수학기간</th>
																	<th scope="col">대학교</th>
																</tr>
															</thead>
															<tbody id="etcTbody"></tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
							<!-- 편입/교류/복수.공동학위 목록 END -->
						</div>
						<!-- 학적변동 TAB END -->
						<!-- 장학금 TAB START -->
						<div class="tab-pane fade" id="tab-cont5"  aria-labelledby="tab5">
							<section class="sec-2">
								<header>
									<h4 class="sec-title"></h4>
								</header>
								<div class="sec-body">
									<div class="table-box">
										<div class="table-body">
											<div class="table-responsive">
												<table class="table table-hover">
													<caption>장학금 목록</caption>
													<colgroup>
														<col style="min-width: 50px;">
														<col style="min-width: 100px;">
														<col style="min-width: 100px;">
														<col style="min-width: 100px;">
														<col style="min-width: 100px;">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">No</th>
															<th scope="col">학년도</th>
															<th scope="col">학기</th>
															<th scope="col">장학구분</th>
															<th scope="col">교내/교외</th>
															<th scope="col">장학금명</th>
															<th scope="col">장학금액</th>
														</tr>
													</thead>
													<tbody id="schTbody"></tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
						<!-- 장학금 TAB END -->
						<!-- 성적 TAB END -->
						<div class="tab-pane fade" id="tab-cont6"  aria-labelledby="tab6">
							<div class="sec-body">
								<div class="row">
									<div class="col-6">
										<!-- 학기별 성적 목록 START -->
										<section class="sec-2">
											<header>
												<h4 class="sec-title">학기별 성적</h4>
											</header>
											<div class="sec-body">
												<div class="table-box">
													<div class="table-body">
														<div class="table-responsive">
															<table class="table table-hover">
																<caption>학기별 성적 목록</caption>
																<colgroup>
																	<col style="min-width: 50px;">
																	<col style="min-width: 70px;">
																	<col style="min-width: 120px;">
																	<col style="min-width: 80px;">
																	<col style="min-width: 80px;">
																	<col style="min-width: 100px;">
																</colgroup>
																<thead>
																	<tr>
																		<th scope="col">No</th>
																		<th scope="col">학년도</th>
																		<th scope="col">학기</th>
																		<th scope="col">취득학점</th>
																		<th scope="col">평점평균</th>
																		<th scope="col">석차</th>
																	</tr>
																</thead>
																<tbody id="termSjTbody"></tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</section>
									</div>
									<!-- 학기별 성적 목록 END -->
									<!-- 교과목 성적 목록 START -->
									<div class="col-6">
										<section class="sec-2">
											<header>
												<h4 class="sec-title">교과목 성적</h4>
											</header>
											<div class="sec-body">
												<div class="table-box">
													<div class="table-body">
														<div class="table-responsive">
															<table class="table table-hover">
																<caption>교과목 성적 목록</caption>
																<colgroup>
																	<col style="min-width: 50px;">
																	<col style="min-width: 40px;">
																	<col style="min-width: 120px;">
																	<col style="min-width: 40px;">
																	<col style="min-width: 40px;">
																	<col style="min-width: 30px;">
																</colgroup>
																<thead>
																	<tr>
																		<th scope="col">No</th>
																		<th scope="col">교과목구분</th>
																		<th scope="col">교과목</th>
																		<th scope="col">등급</th>
																		<th scope="col">학점</th>
																		<th scope="col">재수강</th>
																	</tr>
																</thead>
																<tbody id="subSjTbody"></tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</section>
									</div>
								</div>
								<!-- 교과목 성적 목록 END -->
							</div>
						</div>
						<!-- 성적 TAB END -->
						<!-- 졸업 TAB END -->
						<div class="tab-pane fade" id="tab-cont7"  aria-labelledby="tab7">
							<!-- 졸업 목록 START -->
							<section class="sec-2 mb-3">
								<header>
									<h4 class="sec-title"></h4>
								</header>
								<div class="sec-body">
									<div class="table-box">
										<div class="table-body">
											<div class="table-responsive">
												<table class="table table-hover">
													<caption>졸업 목록</caption>
													<colgroup>
														<col style="min-width: 50px;">
														<col style="min-width: 100px;">
														<col style="min-width: 120px;">
														<col style="min-width: 150px;">
														<col style="min-width: 100px;">
														<col style="min-width: 120px;">
														<col style="min-width: 200px;">
														<col style="min-width: 250px;">
														<col style="min-width: 200px;">
														<col style="min-width: 200px;">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">No</th>
															<th scope="col">학위구분</th>
															<th scope="col">졸업일자</th>
															<th scope="col">졸업증서번호</th>
															<th scope="col">과정구분</th>
															<th scope="col">학위등록번호</th>
															<th scope="col">국문학위명</th>
															<th scope="col">영문학위명</th>
															<th scope="col">이수학과/전공</th>
															<th scope="col">비고</th>
														</tr>
													</thead>
													<tbody id="degTbody"></tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- 학적변동목록 END -->
						</div>
						<!-- 졸업 TAB END -->
					</div>
				</div>
				<!-- content_tabs END -->
			</div>
			<!-- /END CONTENT  BODY-->
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="entTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:ADMS_NM#</td>
	    <td>#:ADMS_YEAR#</td>
	    <td>#:ADMS_DATE#</td>
	    <td>#:ADMS_STDT_YEAR_NM#</td>
		<td>#:ADMS_FIX_CNT_NM#</td>
	    <td class="text-left">#:ADMS_SELECTN_NM#</td>
		<td>#:ADMS_TYPE_NM#</td>
		<td class="text-left">#:OCCASION_COLLECT_SPECIAL_ABILITY_NM#</td>
		<td class="text-left">#:HIGHSCH_NM#</td>
		<td>#:HIGHSCH_JOLUP_YEAR#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="srchgTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:SYEAR#</td>
	    <td>#:TERM_NM#</td>
		<td>#:SRCHG_DATE#</td>
		<td>#:CANCEL_FG#</td>
		<td>#:CANCEL_DATE#</td>
		<td class="text-left">#:HYUHAK_REASON#</td>
		<td>#:SUPPOSE_SYEAR_TERM#</td>
		<td>#:HYUHAK_TERM_CNT#</td>
		<td class="text-left">#:PRE_CHG#</td>
		<td class="text-left">#:POST_CHG#</td>
		<td class="text-left">#:REMARK#</td>
		<td class="text-left">#:CHG_REL_LAW_INFO#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="mltiTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:MULTI_DETAIL_NM#</td>
	    <td>#:MULTI_DEPT_NM#</td>
	    <td>#:MULTI_MAJOR_NM#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="linkTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:MULTI_DETAIL_NM#</td>
	    <td>#:SYEAR_TERM#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="acqTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:DELAY_GCD_NM#</td>
	    <td>#:DELY_SYEAR_TERM#</td>
	    <td>#:APPLY_TIMESNO#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="etcTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:DEG_COURSE_ETC_NM#</td>
	    <td>#:COURSE_PERIOD#</td>
	    <td>#:UNIV_KOR_NM#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="schTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:SYEAR#</td>
	    <td>#:TERM_GCD_NM#</td>
	    <td>#:JH_GCD_NM#</td>
		<td>#:JH_CHARGE_VIA_GCD_NM#</td>
		<td>#:JH_NM#</td>
		<td class="text-right">#:SUM_JH_AMT_FORMAT#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="termSjTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:SYEAR#</td>
	    <td><a href="#popup">#:TERM_NM#</a></td>
	    <td>#:ACQ_CRDT#</td>
		<td>#:STERM_GPA#</td>
		<td>#:RANKING#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="subSjTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:SUBJ_GCD_NM#</td>
	    <td class="text-left">#:SUBJ_NM#</td>
	    <td>#:GRADE_CD#</td>
		<td>#:CRDT#</td>
		<td>#:RE_ATLECT_FG#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="degTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td class="text-left">#:DEG_NM#</td>
	    <td>#:JOLUP_DATE_HYPHEN#</td>
	    <td class="text-left">#:JOLUP_CERT_DOCU_NO#</td>
		<td class="text-left">#:DEG_COURSE_NM#</td>
		<td class="text-left">#:DEG_ENROLL_NO#</td>
		<td class="text-left">#:DEG_ASSORT_KOR_NM#</td>
		<td class="text-left">#:DEG_ASSORT_ENG_NM#</td>
		<td class="text-left">#:DEPT_MAJOR#</td>
		<td class="text-left">#:REMARK#</td>
	</tr>
</script>
<script type="text/javascript">
	/* 전역변수 */
	var paramData = {
	};

	function fn_initScreen() {
		if (gfn_str_parseNull(scwin.loginUser.nationCd) == "" || gfn_str_parseNull(scwin.loginUser.nationCd) == "0410") {
			$("#visaTab").hide();
		}else {
			fn_visaInfoSearch();
		}

		loadscript($("body"), "/common/js/tabs.js");

		//$("#content_tabs").tabfocuser();
		tabFocusAccessibilityCtl('content_tabs');

		fn_stdtInfoSearch();
		fn_entListSearch();
		fn_srchgSearch();
		fn_mltiListSearch();
		fn_linkListSearch();
		fn_acqListSearch();
		fn_etcListSearch();
		fn_schListSearch();
		fn_termSjListSearch();
		fn_degListSearch();

		$("#visaTable input").attr("disabled", true);
		$("#insuTable input").attr("disabled", true);
		$("#guarTable input").attr("disabled", true);
		$("#topikTable input").attr("disabled", true);

		$("#profRow").hide();

	}

	/* 학생정보 조회 */
	function fn_stdtInfoSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectStdtInfo",
			reqData : paramData,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data)) {
					gfn_com_dataBind($("#stdtTable"), data);
					$("#stdtImg").attr(
							"src",
							gfn_str_parseNull(data.PIC) == "" ? "data:image/png;base64," + "/common/images/no_img.png" : "data:image/png;base64,"
									+ data.PIC);

					/* 대학원생일 때 지도교수, 공동지도교수 데이터 VISIBLE true */
					if (gfn_str_parseNull(data.COLL_GRAD_GCD) != "0001") {
						$("#profRow").show();
					}
				}
			}
		});
	}

	/* 입학목록 조회 */
	function fn_entListSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListEnt",
			reqData : paramData,
			success : function(data, responseData) {
				$("#entTbody").listView({
					dataSource : data,
					emptyComment : '입학내역이 없습니다',
					dataBound : function(e) {
					},
					template : $("#entTemplate"),
					totalCnt : responseData.totalCnt,
				});

			}
		});
	}

	/* 비자정보 조회 */
	function fn_visaInfoSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListVisa",
			reqData : paramData,
			success : function(data, responseData) {
				if (data.length > 0) {
					gfn_com_dataBind($("#visaTable"), data[0][0]);
					gfn_com_dataBind($("#insuTable"), data[0][0]);
					gfn_com_dataBind($("#topikTable"), data[0][0]);	//외국학생정보에 어학성적 포함
					gfn_com_dataBind($("#guarTable"), data[0][0]);
				}
			}
		});
	}

	/* 학적변동 목록 조회 */
	function fn_srchgSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListSrchg",
			reqData : paramData,
			success : function(data, responseData) {
				$("#srchgTbody").listView({
					dataSource : data,
					emptyComment : '학적변동 내역이 없습니다',
					dataBound : function(e) {
					},
					template : $("#srchgTemplate"),
					totalCnt : responseData.totalCnt,
				});
			}
		});
	}

	/* 다중전공신청 목록 조회 */
	function fn_mltiListSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListMultiMajor",
			reqData : paramData,
			success : function(data, responseData) {
				$("#mltiTbody").listView({
					dataSource : data,
					emptyComment : '다중전공 내역이 없습니다',
					dataBound : function(e) {
					},
					template : $("#mltiTemplate"),
					totalCnt : responseData.totalCnt,
				});
			}
		});
	}

	/* 연계과정신청 목록 조회 */
	function fn_linkListSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListLinkProc",
			reqData : paramData,
			success : function(data, responseData) {
				$("#linkTbody").listView({
					dataSource : data,
					emptyComment : '연계과정 내역이 없습니다',
					dataBound : function(e) {
					},
					template : $("#linkTemplate"),
					totalCnt : responseData.totalCnt,
				});

			}
		});
	}

	/* 학사/무논문학위취득유예신청 목록 조회 */
	function fn_acqListSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListAcqDelay",
			reqData : paramData,
			success : function(data, responseData) {
				$("#acqTbody").listView({
					dataSource : data,
					emptyComment : '학사학위취득유예/무논문학위취득 내역이 없습니다',
					dataBound : function(e) {
					},
					template : $("#acqTemplate"),
					totalCnt : responseData.totalCnt,
				});

			}
		});
	}

	/* 편입/교류/복수.공동학위 목록 조회 */
	function fn_etcListSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListCourseEtc",
			reqData : paramData,
			success : function(data, responseData) {
				$("#etcTbody").listView({
					dataSource : data,
					emptyComment : '편입/교류/복수.공동학위 내역이 없습니다',
					dataBound : function(e) {
					},
					template : $("#etcTemplate"),
					totalCnt : responseData.totalCnt,
				});

			}
		});
	}

	/* 장학금 목록 조회 */
	function fn_schListSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListJangHak",
			reqData : paramData,
			success : function(data, responseData) {
				$("#schTbody").listView({
					dataSource : data,
					emptyComment : '장학금 내역이 없습니다',
					dataBound : function(e) {
					},
					template : $("#schTemplate"),
					totalCnt : responseData.totalCnt,
				});

			}
		});
	}

	/* 학기별성적 목록 조회 */
	function fn_termSjListSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListTermSj",
			reqData : paramData,
			success : function(data, responseData) {
				$("#termSjTbody").listView({
					dataSource : data,
					emptyComment : '학기별성적 내역이 없습니다',
					dataBound : function(e) {
						$("#termSjTbody tr").find("td").bind("click", function(e) {
							var idx = $(this).closest("tr").index();
							fn_subSjListSearch(data[idx].SYEAR, data[idx].TERM_GCD);
						});
					},
					template : $("#termSjTemplate"),
					totalCnt : responseData.totalCnt,
				});
				if (!gfn_com_isEmptyObject(data)) {
					fn_subSjListSearch(data[0].SYEAR, data[0].TERM_GCD);
				}
				// 학기별 성적 합계 조회
				/* 학적부조회 메뉴에서는 최종 성적 미표기
				if (!gfn_com_isEmptyObject(responseData.totTermSj)) {
					var appendHtml = "<tr style='cursor:pointer;'>";
					appendHtml += "<td colspan='3'>계</td>";
					appendHtml += "<td>" + responseData.totTermSj.ACQ_CRDT + "</td>";
					appendHtml += "<td>" + responseData.totTermSj.SSUM_GPA + "</td>";
					appendHtml += "<td>" + responseData.totTermSj.RANKING + "</td>";
					appendHtml += "</tr>";
					$("#termSjTbody").append(appendHtml);
					$("#termSjTbody tr:last").css("background-color", "rgba(0, 0, 0, .080)");
				}*/
			}
		});
	}

	/* 교과목성적 목록 조회 */
	function fn_subSjListSearch(syear, termGcd) {

		var param = {
			"SYEAR" : syear,
			"TERM_GCD" : termGcd,
		}

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListSubjSj",
			reqData : param,
			success : function(data, responseData) {
				$("#subSjTbody").listView({
					dataSource : data,
					emptyComment : '교과목성적 내역이 없습니다',
					dataBound : function(e) {
					},
					template : $("#subSjTemplate"),
					totalCnt : responseData.totalCnt,
				});
				// 교과목 성적 합계 조회
				if (!gfn_com_isEmptyObject(data)) {
					var sumSubSj = 0;
					data.forEach(function(trData) {
						sumSubSj += Number(trData.CRDT);
					});
					var appendHtml = "<tr style='cursor:pointer;'>";
					appendHtml += "<td colspan='4'>계</td>";
					appendHtml += "<td>" + sumSubSj + "</td>";
					appendHtml += "<td></td>";
					appendHtml += "</tr>";
					$("#subSjTbody").append(appendHtml);
					$("#subSjTbody tr:last").css("background-color", "rgba(0, 0, 0, .080)");
				}
			}
		});
	}

	/* 졸업 목록 조회 */
	function fn_degListSearch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/hakjukbuSearch/selectListDeg",
			reqData : paramData,
			success : function(data, responseData) {
				$("#degTbody").listView({
					dataSource : data,
					emptyComment : '졸업 내역이 없습니다',
					dataBound : function(e) {
						$("#degTbody").append();
					},
					template : $("#degTemplate"),
					totalCnt : responseData.totalCnt,
				});

			}
		});
	}
</script>