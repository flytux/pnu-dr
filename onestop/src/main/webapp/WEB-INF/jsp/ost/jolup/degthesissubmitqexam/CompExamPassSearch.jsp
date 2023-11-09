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
			<div class="sec-body" style="height: 1000px;">
			<!-- 바디 영역 -->			
				<!-- 기본 정보 -->
					<div class="search-box" >
						<input type="hidden" id="STDT_NO" class="form-control"  title="학번"/> 						
					</div>
					<section class="sec-2">						
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
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label data-lang>학위</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="DEG_COURSE_GCD" data-lang></div>
									</div>
								</div>
								<div class="b-row-item merge-2">
														
								</div>
							</div>
						</div>
					</section>
					<!-- 학위청구시험 : 외국어시험 합격조회 -->
					<section class="sec-2">
						<header>
							<h4 class="sec-title">학위논문제출자격시험 : 종합시험 결과조회</h4>
						</header>
						<div class="table-box" id="grid01"style="height:300px;">
							<div class="table-body">
								<table class="table table-hover tbodt-text-center"  data-toggle="table" data-show-column="true">
								<caption>종합시험 합격과목 내역</caption>
								<thead>
									<tr>
										<th scope="col">교과목구분</th>
										<th scope="col">교과목번호</th>
										<th scope="col">교과목</th>
										<th scope="col">시험시행년월</th>
										<th scope="col">시험결과</th>
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
	</main>
</div>	
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <th>#:SUBJ_GCD#</th>
	    <th>#:SUBJ_NO#</th> 
	    <td>#:SUBJ_NM#</td> 
		<th>#:YEAR_MONTH#</th>
		<th>#:EXAM_RESULT#</th>
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
		
		
		if (scwin.loginUser.collGradGcd == '0001') {
			//대학
			alert("학부생은 사용할 수 없습니다.")
		} else {
			//대학원
			if(scwin.loginUser.userGcd == "0003") {
				// 소속(과정)
				$("#DEPT").text(CollGradGcdNm + " " + CollCdKorNm + " " + deptCdNm + " " + majorCdNm + "(" + courseGcdNm + "과정)");
				// 학년
				$("#YEAR_GCD").text(yearGcd);
			}else {
				// 소속(과정)
				$("#DEPT").text(scwin.loginUser.assignNm);
				// 학년
				$("#YEAR_GCD").text("");
			}
			// 학번(성명)
			$("#STDT_NO_NM").text(stdtNo + " (" + stdtNm + ")");
			// 학적상태
			$("#HJ_STA_GCD").text(hjSta);
			// 학적상태
			$("#DEG_COURSE_GCD").text(courseGcdNm);

		}
		fn_sch();
		
	}

	/***************************************************************************
	 * 조회
	 **************************************************************************/
	 
	 const ajaxPath = '/ost/jolup/degthesissubmitqexam/compexampasssearch' 
	function fn_sch(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		
		gfn_ajax_request({
			url : ajaxPath + '/selectExamPass',
			reqData : data,
			success : function(data, responseData) {            	
                $("#resultTbody").listView({
                	dataSource : data,
                	emptyComment : "합격한 과목이 없습니다.",
                    dataBound : function(e) {	                      
	                    currentData = data;                           
                     },
	                     template : $("#resultTemplate"),
	                     totalCnt : responseData.totalCnt,
						 totalViewYn : "N" ,
                    });
                }
		});
	}	
</script>