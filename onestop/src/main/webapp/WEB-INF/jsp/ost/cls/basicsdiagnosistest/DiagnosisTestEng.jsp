<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title"></h2>
				</div>
				<div class="header-item"></div>
			</header>
			<div class="sec-body">
			<!-- 바디 영역 -->			
				<!-- 기본 정보 -->
					<div class="search-box">
						<input type="hidden" id="STDT_NO" class="form-control" /> 						
					</div>
					<section class="sec-3">
						<header>
							<h4 class="sec-title">기본정보</h4>
						</header>
					<div class="b-table-box flex-col-3" role="table" aria-label="개인정보">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label data-lang>소속(과정)</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="DEPT" data-lang></div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학번(성명)</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="STDT_NO_NM" data-lang></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label id="YEAR_TERM" data-lang></label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="TERM_GCD" data-lang></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학적상태</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="HJ_STA_GCD" data-lang></div>
								</div>
							</div>
						</div>
					</div>
					</section>
					<!-- 영어 기초학력진단평가 응시여부 -->
					<section class="sec-3">
						<header>
							<h4 class="sec-title">영어 기초학력진단평가 응시여부 조회</h4>
						</header>
						<div class="table-box" id=grid02>
							<div class="table-body">
								<table class="table table-hover tbody-text-center" data-toggle="table" data-show-column="true">
								<caption>영어 기초학력진단평가 응시여부 내역</caption>
								<thead>
									<tr>
										<th scope="col" colspan="2"> 수능등급</th>
										<th scope="col" rowspan="2" >기초학력진단평가</th>
									</tr>
									<tr>
										<th scope="col">과목</th>
										<th scope="col" >등급</th>
									</tr>
								</thead>
								<tbody id="resultTbody"></tbody>
								</table>
							</div>
						</div>
						<ul class="list list-style-1">
							<li data-lang><strong> 영어 기초학력진단평가(CBT) 신청은 학생역량시스템 >「비교과 활동」>「참가신청」 에서 하실 수 있습니다.</strong></li>
							<li data-lang><strong> 비교과 프로그램 중 "영어기초학력진단평가 신청" 프로그램을 선택하여 신청하시기 바랍니다. </strong></li>									
						</ul>
					</section>
				<!-- /END 영어 기초학력진단평가 응시여부 -->
				<!-- 입력 버튼 -->
						<div class="text-center">
							<div class="form-group">
								<button class="btn btn-success mb-2" id="btn" type="button" onclick="fn_Apply()" style="display: none;" data-lang>비교과 참가신청</button>
							</div>
						</div>
				<!-- 입력 버튼 -->		
				<!-- 영어 기초학력진단평가 결과에 따른 수강신청 과목 -->
					<section class="sec-3">
						<header>
							<h4 class="sec-title">영어 기초학력진단평가 결과에 따른 수강신청 과목</h4>
						</header>
						<div class="table-box" id=grid02>
							<div class="table-body">
								<table class="table table-hover" data-toggle="table" data-show-column="true">
								<caption>영어 기초학력진단평가 결과에 따른 수강신청 과목내역</caption>
								<colgroup>
								    <col style="min-width: 80px;">
									<col style="min-width: 150px;">
									<col style="min-width: 80px;">
									<col style="min-width: 80px;">
								</colgroup>
								<thead>
									<tr>
									    <th scope="col">시험응시학년도</th>
										<th scope="col">과목</th>
										<th scope="col">점수</th>
										<th scope="col">합격여부</th>
									</tr> 
								</thead>
								<tbody id="resultTbody2"></tbody>
								</table>
							</div>
						</div>
					</section>
				<!-- /END 영어 기초학력진단평가 결과에 따른 수강신청 과목 -->		
				<!-- /아코디언 -->
				<section class="sec-2">
					<div class="sec-body">
						<div class="accordion" id="accordion" style="display: none;">
							<div class="card">
								<div class="card-header" id="heading1">
									<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true" data-controls="collapse1">영어 기초학력평가 면제대상 안내 </button>
								</div>
								<div id="collapse1" class="collapse show" aria-labelledby="heading1">
									<div class="card-body">										
												<!-- 테이블 -->
												<div class="table-box">
													<div class="table-body">
														<table class="table table-hover" data-toggle="table" data-show-column="true">
															<caption>영어 기초학력평가 면제대상 안내</caption>
															<colgroup>
																<col style="min-width: 50px;">

															<thead>
																<tr>
																	<th scope="col">입학년도</th>
																	<th scope="col">면제조건</th>
																</tr>
															</thead>
															<tbody id="ins">
															    <tr>
                                                                    <td>2021~2024</td>
                                                                    <td>수능 '영어 영역' 1~3등급</td>
                                                                </tr>
																<tr>
															        <td>2018~2020</td>
															        <td>수능 '영어 영역' 1~3등급</td>
															    </tr>
															    <tr>
																    <td>2017</td>
																    <td>수능 '영어 영역' 1~4등급 </td>
															    </tr>
															    <tr>
																    <td>2013~2016</td>
																    <td>수능 '영어 영역' 1~3등급 </td>
																</tr>
																<tr>
																    <td>2010~2012</td>
																    <td>면제 없음</td>
																</tr>
																<tr>
																    <td>2009</td>
																	<td>수능 '영어 영역' 1~3등급 </td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<!-- /END 테이블 -->
											</div>
										</div>
							</div>
							<div class="card">
								<div class="card-header" id="heading2">
									<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse2" data-expanded="true" data-controls="collapse2"> 영어 기초학력진단평가 결과에 따른 수강신청 안내</button>
								</div>
								<div id="collapse2" class="collapse show" aria-labelledby="heading2">
									<div class="card-body">
									    <!-- 테이블 -->
										<div class="table-box">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>2021학년도부터2024학년도 입학생의 영어 기초학력진단평가 결과에 따른 수강신청 안내</caption>
													<p class="mt-2 text-primary"><strong>&lt;2021 - 2024학년도 입학생&gt;</strong></p>
													<colgroup>
														<col style="min-width: 50px;">
														<col style="min-width: 200px;">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">수능 영어 등급</th>
															<th scope="col">영어 기초 학력 진단평가 대상 유무</th>
															<th scope="col">수간신청 교과목</th>
														</tr>
													</thead>
													<tbody id="ins">
														<tr>
													        <td>1-3 등급</td>
													        <th>영어 기초 학력 진단평가 면제</th>
													        <td><ol class="ol-style single">
													        	<li class="text-left"><strong>■ 대학영어 수강 신청</strong></li>
													        	<li class="text-left">단, 수능 영어 1등급 중 희망자에 한하여 진단평가 응시하고 30점 이상 취득시 대학영어(고급) 수강 가능</li>
													        </ol></td>
													    </tr>
													    <tr>
														    <td>4-9등급, 등급 없음</td>
														    <th rowspan="2"><strong>영어 기초 학력 진단 평가 <span class="text-danger">평가대상</span></strong></th>
														    <th rowspan="2"><ol class="ol-style single">
													        	<li class="text-left"><strong>&lt;기초학력 진단평가 결과에 따라 아래와 같이 수강신청&gt;</strong></li>
													        	<li class="text-left">ㆍ 진단평가 16점 이상 취득자</li>
													        	<li class="text-left">	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 대학영어 수강</li>
													        	<li class="text-left">ㆍ 진단평가 15점 이하 취득자 및 미응시자</li>
													        	<li class="text-left">	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 기초영어 이수 후 다음 학기 대학영어 수강</li>
													        </ol></th>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<!-- /END 테이블 -->	
										<div class="table-box">
                                            <div class="table-body">
                                                <table class="table table-hover" data-toggle="table" data-show-column="true">
                                                    <caption>2018학년도부터2020학년도 입학생의 영어 기초학력진단평가 결과에 따른 수강신청 안내</caption>
                                                    <p class="mt-2 text-primary"><strong><2018 - 2020학년도 입학생></strong></p>
                                                    <colgroup>
                                                        <col style="min-width: 50px;">
                                                        <col style="min-width: 200px;">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">수능 영어 등급</th>
                                                            <th scope="col">영어 기초 학력 진단평가 대상 유무</th>
                                                            <th scope="col">수간신청 교과목</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="ins">
                                                        <tr>
                                                            <td>1-2 등급</td>
                                                            <th rowspan="2">영어 기초 학력 진단평가 면제</th>
                                                            <td><ol class="ol-style single">
                                                                <li class="text-left"><strong>■ 대학실용영어(Ⅱ) 수강 신청</strong></li>
                                                                <li class="text-left">단, 수능 영어 1등급 중 희망자에 한하여 진단평가 응시하고 30점 이상 취득시 대학영어(고급) 수강 가능</li>
                                                            </ol></td>
                                                        </tr>
                                                        <tr>
                                                            <td>3등급</td>
                                                            <td class="text-left"><strong>■ 대학영어 수강 신청</strong></td>
                                                        </tr>
                                                        <tr>
                                                            <td>4-9등급, 등급없음</td>
                                                            <th rowspan="1"><strong>영어 기초 학력 진단 평가 <span class="text-danger">평가대상</span></strong></th>
                                                            <th rowspan="1"><ol class="ol-style single">
                                                                <li class="text-left"><strong>&lt;기초학력 진단평가 결과에 따라 아래와 같이 수강신청&gt;</strong></li>
                                                                <li class="text-left">ㆍ 진단평가 16점 이상 취득자</li>
                                                                <li class="text-left">  <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 대학영어 수강</li>
                                                                <li class="text-left">ㆍ 진단평가 15점 이하 취득자 및 미응시자</li>
                                                                <li class="text-left">  <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 기초영어 이수 후 다음 학기 대학영어 수강</li>
                                                            </ol></th>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /END 테이블 -->									
										<!-- 테이블 -->
										<div class="table-box">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>2017학년도 입학생의 영어 기초학력진단평가 결과에 따른 수강신청 안내</caption>
													<p class="mt-2 text-primary"><strong>&lt;2017학년도 입학생&gt;</strong></p>
													<colgroup>
														<col style="min-width: 50px;">
														<col style="min-width: 200px;">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">수능 영어 등급</th>
															<th scope="col">영어 기초 학력 진단평가 대상 유무</th>
															<th scope="col">수간신청 교과목</th>
														</tr>
													</thead>
													<tbody id="ins">
														<tr>
													        <td>1등급</td>
													        <th rowspan="3">영어 기초 학력 진단평가 면제</th>
													        <td class="text-left"><strong>■ 대학영어(고급) 수강 신청</strong></td>
													    </tr><tr>
														    <td>2-3등급</td>
														    <td><ol class="ol-style single">
													        	<li class="text-left"><strong>■ 대학실용영어(Ⅱ) 수강 신청</strong></li>
													        	<li class="text-left">단, 희망자에 한하여 진단평가 응시하고 35점 취득시 대학영어(고급) 수강 가능</li>
													        </ol></td>
													    </tr><tr>
														    <td>4등급</td>
														    <td><ol class="ol-style single">
													        	<li class="text-left"><strong>■ 대학영어 수강 신청</strong></li>
													        	<li class="text-left">단, 희망자에 한하여 진단평가 응시하고 35점 취득시 대학영어(고급) 수강 가능 23점 이상 취득시 대학실용영어(Ⅱ) 수강</li>
													        </ol></td>
													        </tr><tr>														        
														    <td>5-9등급, 등급없음</td>
														    <td><strong>영어 기초 학력 진단 평가 <span class="text-danger">평가대상</span></strong></td>
														    <td><ol class="ol-style single">
													        	<li class="text-left"><strong>&lt;기초학력진단평가 결과에 따라 아래와 같이 수강신청&gt;</strong></li>
													        	<li class="text-left">ㆍ 진단평가 35점 이상 취득자</li>
													        	<li class="text-left">	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 대학영어(고급) 수강</li>
													        	<li class="text-left">ㆍ 진단평가 23~34점 취득자</li>
													        	<li class="text-left">	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 대학실용영어(Ⅱ) 수강</li>
													        	<li class="text-left">ㆍ 진단평가 16~22점 취득자</li>
													        	<li class="text-left">	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 대학영어 수강</li>
													        	<li class="text-left">ㆍ 진단평가 15점 이하 취득자 및 미응시자</li>
													        	<li class="text-left">	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 기초영어 이수 후 다음 학기 대학영어 수강</li>
													        </ol></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<!-- /END 테이블 -->
										<!-- 테이블 -->
										<div class="table-box">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>2013학년도부터2016학년도 입학생의 영어 기초학력진단평가 결과에 따른 수강신청 안내</caption>
													<p class="mt-2 text-primary"><strong>&lt;2013 - 2016학년도 입학생&gt;</strong></p>
													<colgroup>
														<col style="min-width: 50px;">
														<col style="min-width: 200px;">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">수능 영어 등급</th>
															<th scope="col">영어 기초 학력 진단평가 대상 유무</th>
															<th scope="col">수간신청 교과목</th>
														</tr>
													</thead>
													<tbody id="ins">
														<tr>
													        <td>1-3 등급</td>
													        <th>영어 기초 학력 진단평가 면제</th>
													        <td class="text-left"><strong>■ 대학영어, 대학실용영어(Ⅱ) 수강 신청</strong></td>															        	
													    </tr><tr>
														    <td>4-9등급, 등급없음</td>
														    <td><strong>영어 기초 학력 진단 평가 <span class="text-danger">평가대상</strong></td>
														    <td class="text-left"><ol class="ol-style single">
													        	<li><strong>&lt;기초학력 진단평가 결과에 따라 아래와 같이 수강신청&gt;</strong></li>
													        	<li>ㆍ 진단평가 16점 이상 취득자</li>
													        	<li>	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 대학영어, 대학실용영어(Ⅱ) 수강</li>
													        	<li>ㆍ 진단평가 15점 이하 취득자 및 미응시자</li>
													        	<li>	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 기초영어 이수 후 다음 학기 대학영어, 대학실용영어(Ⅱ) 수강</li>
													        </ol></td>
													    </tr>
													</tbody>
												</table>
											</div>
										</div>
										<!-- /END 테이블 -->
										<!-- 테이블 -->
										<div class="table-box">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>2010학년도부터2012학년도 입학생의 영어 기초학력진단평가 결과에 따른 수강신청 안내</caption>
													<p class="mt-2 text-primary"><strong>&lt;2010 - 2012학년도 입학생&gt;</strong></p>
													<colgroup>
														<col style="min-width: 50px;">
														<col style="min-width: 200px;">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">진단평가 결과</th>
															<th scope="col">진단평가 합격 점수</th>
															<th scope="col">수간신청 교과목</th>
														</tr>
													</thead>
													<tbody id="ins">
														<tr>
													        <td>합격</td>
													        <th>2010-2012 모의토익 380점 이상<br/>2017학년도 이후 진단평가(CBT) 16점 이상</th>
													        <th class="text-left"><strong>■ 대학영어, 대학실용영어(Ⅱ) 수강 신청</strong></th>															        	
													    </tr><tr>
														    <td>불합격</td>
														    <th>2010-2012 모의토익 380점 미만<br/>2017학년도 이후 진단평가(CBT) 15점 이하</th>
														    <th class="text-left"><strong>■ 기초영어 이수 후 대학영어, 대학실용영어(Ⅱ) 수강 신청</strong></th>	
													    </tr>
													</tbody>
												</table>
											</div>
										</div>
										<!-- /END 테이블 -->
										<!-- 테이블 -->
										<div class="table-box">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>2009학년도 입학생의 영어 기초학력진단평가 결과에 따른 수강신청 안내</caption>
													<p class="mt-2 text-primary"><strong><2009학년도 입학생></strong></p>
													<colgroup>
														<col style="min-width: 50px;">
														<col style="min-width: 200px;">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">수능 영어 등급</th>
															<th scope="col">영어 기초 학력 진단평가 대상 유무</th>
															<th scope="col">수간신청 교과목</th>
														</tr>
													</thead>
													<tbody id="ins">
														<tr>
													        <td>1-3 등급</td>
													        <th>영어 기초 학력 진단평가 면제</th>
													        <th class="text-left"><strong>■ 대학영어, 대학실용영어(Ⅱ) 수강 신청</strong></th>															        	
													    </tr>
													    <tr>
														    <td>4-9등급, 등급없음</td>
														    <td><strong>영어 기초 학력 진단 평가 <span class="text-danger">평가대상</span></strong></td>
														    <td><ol class="ol-style single">
													        	<li class="text-left"><strong>&lt;기초학력 진단평가 결과에 따라 아래와 같이 수강신청&gt;</strong></li>
													        	<li class="text-left">ㆍ 진단평가 16점 이상 취득자</li>
													        	<li class="text-left">	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 대학영어, 대학실용영어(Ⅱ) 수강</li>
													        	<li class="text-left">ㆍ 진단평가 15점 이하 취득자 및 미응시자</li>
													        	<li class="text-left">	<i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 기초영어 이수 후 다음 학기 대학영어, 대학실용영어(Ⅱ) 수강</li>
													        	</ol>
													        </td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<!-- /END 테이블 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- /END 아코디언 -->					
			</div>
		<!-- /END 바디 영역 -->	
		</section>
	</main>
</div>	
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <th scope="row">#:SUBJ#</th>//과목
	    <th scope="row">#:SAT_GRADE_CD#</th> //등급
	    <td>#:TEST_FG#</td> //진단평가여부
	</tr>
</script><script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
        <td>#:SYEAR#</td>//시험응시학년도
	    <td>#:SUBJ#</td> //과목
	    <td>#:TEST_EVAL_SCORE#</td> //점수
 		<td>#:PASS_FG#</td> //합격여부
	</tr>
</script>
<script type="text/javascript">
	
	// 학번 STDT_NO
	var stdtNo = scwin.loginUser.userId;
	// 성명 STDT_KOR_NM
	var stdtNm = scwin.loginUser.nm;
	
	// 대학원구분 GRAD_GCD
	var CollGradGcdNm = scwin.loginUser.collGradGcdKorNm;
	var CollGradGcd = scwin.loginUser.collGradGcd;
	// 단과대학 COLL_CD
	var CollCdKorNm = scwin.loginUser.collCdKorNm;
	// 학과 DEPT_CD
	var deptCdNm = scwin.loginUser.deptCdKorNm;
	// 전공 MAJOR_CD
	var majorCdNm = (scwin.loginUser.majorCdKorNm == null) ? '' : scwin.loginUser.majorCdKorNm;
	// 학위과정 DEG_COURSE_GCD
	var courseGcdNm = scwin.loginUser.degCourseGcdKorNm;
	// 학년(대학일 때 표시) STDT_YEAR_GCD or 학기(대학원일 때 표시) ATLECT_TERM_CNT
	var yearGcd = (CollGradGcd == "0001") ? scwin.loginUser.stdtYearGcdKorNm : scwin.loginUser.cmplTermCnt + '학기' ;
	
	// 학적상태 HJ_STA_GCD
	var hjSta = scwin.loginUser.hjStaGcdKorNm;
	
	var _goUrl = "https://my.pusan.ac.kr/ko/extracurricular/eco/all" //TODO : 안내페이지로 이동

	function fn_initScreen() {
		
		(CollGradGcd == "0001") ? $("#YEAR_TERM").text("학년") : $("#YEAR_TERM").text("학기");
		
		// 소속(과정)
		$("#DEPT").text(CollGradGcdNm + " " + CollCdKorNm + " " + deptCdNm + " " + majorCdNm + "(" + courseGcdNm + "과정)");
		// 학번(성명)
		$("#STDT_NO_NM").text(stdtNo + " (" + stdtNm + ")");
		// 학년(학기)
		$("#TERM_GCD").text(yearGcd);
		// 학적상태
		$("#HJ_STA_GCD").text(hjSta);
		
		fn_sch();
		
	}

	/***************************************************************************
	 * 조회
	 **************************************************************************/
	function fn_sch(data) {
	
		
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}
		/* ajax처리 */gfn_ajax_request({
            url : "/ost/cls/basicsdiagnosistest/DiagnosisTestEng/searchTestFg", //응시여부 조회
        	reqData : data,
            success : function(data, responseData) {            	
            	$("#resultTbody").listView({
            		
                    dataSource : data,
                    emptyComment : '수능 등급 및 기초학력진단평가 응시여부에 관한 자료가 존재하지 않습니다.',
                    dataBound : function(e) {	                   	
                        totalCnt = responseData.totCnt;
                        currentData = data;  
                        
                        if(responseData.totalCnt!=0){
                        	$("#btn").show(); $("#accordion").show();
                        }
                    },
                    template : $("#resultTemplate"),
                    totalCnt : responseData.totalCnt,
                    paging : null                    
                });
            }
      });
		
		gfn_ajax_request({
            url : "/ost/cls/basicsdiagnosistest/DiagnosisTestEng/searchSubjList", //수강신청과목 조회
            	reqData : data,
                success : function(data, responseData) {            	
                	$("#resultTbody2").listView({                		
                        dataSource : data,
                        emptyComment : '수능 등급 및 기초학력진단평가 응시여부에 관한 자료가 존재하지 않습니다.',
                        dataBound : function(e) {	                     	
                            totalCnt = responseData.totCnt;
                            currentData = data;                          
                        },
                        template : $("#resultTemplate2"),
                        totalCnt : responseData.totalCnt,
                        paging : null
                        
                    });
                }
          });
	}


	/***************************************************************************
	 *fn_Apply() //비교과 참가신청 안내
	 **************************************************************************/
	function fn_Apply(param) {
		location.href = _goUrl;
	}
	
</script>

