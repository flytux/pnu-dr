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
						<input type="hidden" id="STDT_NO" class="form-control"  /> 						
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
									<label id="" data-lang>학년</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="YEAR_GCD" data-lang></div>
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
							<h4 class="sec-title">수학 기초학력진단평가 성적</h4>
						</header>
						<div class="table-box" id="grid02" style="height:150px;">
							<div class="table-body">
								<table class="table table-hover tbodt-text-center"  data-toggle="table" data-show-column="true">
								<caption>수학 기초학력진단평가 성적</caption>
								<thead>
									<tr>
										<th scope="col">시험응시학년도</th>
										<th scope="col">과목</th>
										<th scope="col">객관식 점수</th>
										<th scope="col">단답형 점수</th>
										<th scope="col">총점</th>
										<th scope="col">합격여부</th>
									</tr>
								</thead>
								<tbody id="resultTbody"></tbody>
								</table>
							</div>
						</div>
					</section>
			</div>
		<!-- /END 바디 영역 -->	
		</section>
		<div class="contents-page">
			<section class="sec-2">
				<div class="accordion mb-4">
					<div class="card">
						<div class="card-header" id="heading1">
							<button data-controls="collapse1" data-expanded="true"
								class="btn btn-block text-left" data-target="#collapse1"
								data-toggle="collapse" type="button"> 수학기초학력진단시험 결과에 따른 기초수학 수강신청 안내</button>
						</div>

						<div aria-labelledby="heading1" class="collapse show"
							id="collapse1">
							<div class="card-body">
								<ol class="ol-style-single">
									<li>수강대상 : <strong>수학기초학력진단시험 불합격자(결시자 포함)</strong></li>
									<li>수강정정기간에 수학(I), 공학미적분학(I), 공학미적분학을 기초수학으로 반드시 수강변경하시기 바랍니다.<br/> 현재 수강신청되어 있는 수학과목은 일괄삭제 예정
									</li>
									<li>개강일부터 아래 시간표의 분반 중 한 분반을 선택하여 기초수학 수업에 참석.</li>
								</ol>
								<hr class="line-gap" />
								<div class="table-box">
									<div class="table-body">
										<div class="table-responsive">
											<table class="table table-hover tbody-text-left">
												<caption>수학기초학력진단시험 결과에 따른 기초수학 수강신청 안내</caption>
												<thead>
													<tr>
														<th scope="col">수강대상학과(부)</th>
														<th scope="col">교과구분</th>
														<th scope="col">교과목번호</th>
														<th scope="col">교과목명</th>
														<th scope="col">분반</th>
														<th scope="col">수업시간</th>
														<th scope="col" width="100">강의실</th>
														<th scope="col">비고</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td style="text-align:center; word-break: break-all;">자연과학대학, 공과대학, 나노과학기술대학, 정보의생명공학대학</td>
														<td style="text-align:center">일반선택</td>
														<td style="text-align:center">MA35696</td>
														<td style="text-align:center">기초수학</td>
														<td style="text-align:center">030</td>
														<td style="text-align:center">월,수 18:00~19:30</td>
														<td style="text-align:center">607-110</td>
														<td ></td>
													</tr>
													<tr>
														<td style="text-align:center; word-break: break-all;">자연과학대학, 공과대학, 나노과학기술대학, 정보의생명공학대학</td>
														<td style="text-align:center">일반선택</td>
														<td style="text-align:center">MA35696</td>
														<td style="text-align:center">기초수학</td>
														<td style="text-align:center">031</td>
														<td style="text-align:center">월,수 18:00~19:30</td>
														<td style="text-align:center">607-207</td>
														<td ></td>
													</tr>
													<tr>
														<td style="text-align:center; word-break: break-all;">자연과학대학, 공과대학, 나노과학기술대학, 정보의생명공학대학</td>
														<td style="text-align:center">일반선택</td>
														<td style="text-align:center">MA35696</td>
														<td style="text-align:center">기초수학</td>
														<td style="text-align:center">032</td>
														<td style="text-align:center">월,수 18:00~19:30</td>
														<td style="text-align:center">607-208</td>
														<td ></td>
													</tr>
													<tr>
														<td style="text-align:center; word-break: break-all;">자연과학대학, 공과대학, 나노과학기술대학, 정보의생명공학대학</td>
														<td style="text-align:center">일반선택</td>
														<td style="text-align:center">MA35696</td>
														<td style="text-align:center">기초수학</td>
														<td style="text-align:center">033</td>
														<td style="text-align:center">화,목 18:00~19:30</td>
														<td style="text-align:center">607-110</td>
														<td ></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>


					
				</div>
					</section>
			</div>
	</main>
</div>	
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <th >#:SYEAR#</th>//시험응시년도
	    <th >#:SUBJ_NM#</th> //과목
	    <td class="text-right">#:MULTI_CHOICE_TOTAL_SOCRE#</td> //객관식점수
		<th class="text-right">#:SHORT_ANSWER_TOTAL_SOCRE#</th>//단답형점수
		<th class="text-right">#:ALL_SCORE#</th>//단답형점수
	    <th >#:PASS_GCD#</th> //합격여부
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

	function fn_initScreen() {
		
		// 소속(과정)
		$("#DEPT").text(CollGradGcdNm + " " + CollCdKorNm + " " + deptCdNm + " " + majorCdNm + "(" + courseGcdNm + "과정)");
		// 학번(성명)
		$("#STDT_NO_NM").text(stdtNo + " (" + stdtNm + ")");
		// 학년
		$("#YEAR_GCD").text(yearGcd);
		// 학적상태
		$("#HJ_STA_GCD").text(hjSta);
		
		fn_sch();
		
	}

	/***************************************************************************
	 * 조회
	 **************************************************************************/
	 const ajaxPath = '/ost/cls/basicsdiagnosistest/DiagnosisTestMath' 
	function fn_sch(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		
		gfn_ajax_request({
			url : ajaxPath + '/selectQuery',
			reqData : data,
			success : function(data, responseData) {            	
                $("#resultTbody").listView({
                	dataSource : data,
                	emptyComment : "기초학력진단평가 성적에 관한 데이터가 존재하지 않습니다.",
                    dataBound : function(e) {	                      
	                    currentData = data;                           
                     },
	                     template : $("#resultTemplate"),
	                     totalCnt : responseData.totalCnt,
                    });
                }
		});
	}


	/***************************************************************************
	 *fn_Apply() //비교과 참가신청 안내
	 **************************************************************************/
	function fn_Apply(param) {
		
	}
	
</script>

