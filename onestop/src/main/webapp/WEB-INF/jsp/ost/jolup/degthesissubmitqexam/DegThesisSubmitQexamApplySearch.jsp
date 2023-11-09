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
						<input type="hidden" id="SYEAR" class="form-control" style="display: none;" /> 
						<input type="hidden" id="TERM_GCD" class="form-control" style="display: none;" /> 
						<input type="hidden" id="MONTH" class="form-control" style="display: none;" />
					</div>
					<section class="sec-3">						
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
					<!-- 학위논문 제출 자격시험 : 종합시험 신청내역 -->
					<section class="sec-3">
						<header>
							<h4 class="sec-title">학위논문제출자격시험 : 종합시험 신청내역</h4>
						</header>
						<div class="table-box" id="grid02"style="height:300px;">
							<div class="table-body">
								<table class="table table-hover tbodt-text-center"  data-toggle="table" data-show-column="true">
								<caption>학위논문제출자격시험의 종합시험 신청내역</caption>
								<thead>
									<tr>
										<th scope="col">교과목구분</th>
										<th scope="col">교과목번호</th>
										<th scope="col">교과목명</th>
										<th scope="col">시험유형</th>
										<th scope="col">시험시행년월</th>
									</tr>
								</thead>
								<tbody id="resultTbody"></tbody>
								</table>
							</div>
						</div>
					</section>
					<!-- 학위논문 제출 자격시험 : 외국어시험 신청내역 -->
					<section class="sec-3">
						<header>
							<h4 class="sec-title">학위논문제출자격시험 : 외국어시험 신청내역</h4>
						</header>
						<div class="table-box" id="grid02" style="height:300px;">
							<div class="table-body">
								<table class="table table-hover tbodt-text-center"  data-toggle="table" data-show-column="true">
								<caption>학위논문제출자격시험의 외국어시험 신청내역</caption>
								<thead>
									<tr>
										<th scope="col">외국어구분</th>
										<th scope="col">시험시행년월</th>
									</tr>
								</thead>
								<tbody id="resultTbody2"></tbody>
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
        <th >#:COMP_EXAM_SUBJ_CD#</th>
	    <th >#:SUBJ_NO#</th> 
	    <td class="text-left">#:SUBJ_NM#</td> 
		<td>#:COMP_EXAM_TYPE_GCD_NM#</td>
		<th>#:YEAR_MONTH#</th>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
        <th >#:EXAM_RESULT#</th>
	    <th >#:YEAR_MONTH#</th>
	</tr>
</script>
<script type="text/javascript">
	const ajaxPath = '/ost/jolup/degthesissubmitqexam/degthesissubmitqexamapplysearch'
	
	var stdtNo = scwin.loginUser.userId;
	var stdtNm = scwin.loginUser.nm;
	var CollGradGcdNm = scwin.loginUser.collGradGcdKorNm;
	var CollGradGcd = scwin.loginUser.collGradGcd;
	var CollCdKorNm = scwin.loginUser.collCdKorNm;
	var deptCdNm = scwin.loginUser.deptCdKorNm;
	var majorCdNm = (scwin.loginUser.majorCdKorNm == null) ? '' : scwin.loginUser.majorCdKorNm;
	var courseGcdNm = scwin.loginUser.degCourseGcdKorNm;
	var yearGcd = (CollGradGcd == "0001") ? scwin.loginUser.stdtYearGcdKorNm : scwin.loginUser.cmplTermCnt + '학기' ;
	var hjSta = scwin.loginUser.hjStaGcdKorNm;
	
	function fn_initScreen() {
		if (scwin.loginUser.collGradGcd == '0001') {
			alert("학부생은 사용할 수 없습니다.")
		} else {
			if(scwin.loginUser.userGcd == "0003") {
				$("#DEPT").text(CollGradGcdNm + " " + CollCdKorNm + " " + deptCdNm + " " + majorCdNm + "(" + courseGcdNm + "과정)");
				$("#YEAR_GCD").text(yearGcd);
			}else {
				$("#DEPT").text(scwin.loginUser.assignNm);
				$("#YEAR_GCD").text("");
			}
			$("#STDT_NO_NM").text(stdtNo + " (" + stdtNm + ")");
			$("#HJ_STA_GCD").text(hjSta);
			$("#DEG_COURSE_GCD").text(courseGcdNm);
		}
		fn_examInfoPossibleChk();
	}
	/***************************************************************************************************
	 * 학위논문제출자격시험 신청내역조회 일정 조회
	 ***************************************************************************************************/
	function fn_examInfoPossibleChk() {
		var data = {GRAD_GCD : scwin.loginUser.gradGcd};		
			
		/* ajax처리 */
		gfn_ajax_request({
			url : ajaxPath + "/selectExamInfoPosibleYn",
			reqData : data,
			success : function(data, responseData) {
				if (data.O_RSLT == "N") {
					alert(data.O_MSG);
					return;
				} 
				$('#SYEAR').val(data.SYEAR);
				$('#TERM_GCD').val(data.TERM_GCD);
				$('#MONTH').val(data.MONTH);
				fn_sch();
			}
		});
	}
	/***************************************************************************
	 * 조회
	 **************************************************************************/
	function fn_sch(data) {
		var data = new Array();
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}

		gfn_ajax_request({
			url : ajaxPath + '/selectCompExam',
			reqData : data,
			success : function(data, responseData) {            	
                $("#resultTbody").listView({
                	dataSource : data,
                	emptyComment : "검색된 내용이 없습니다.",
                    dataBound : function(e) {	                      
	                    currentData = data;                           
                     },
	                     template : $("#resultTemplate"),
	                     totalCnt : responseData.totalCnt,
	 					totalViewYn : "N" ,
                    });
                }
		});
		
		gfn_ajax_request({
			url : ajaxPath + '/selectForeignExam',
			reqData : data,
			success : function(data, responseData) {            	
                $("#resultTbody2").listView({
                	dataSource : data,
                	emptyComment : "검색된 내용이 없습니다.",
                    dataBound : function(e) {	                      
	                    currentData = data;                           
                     },
	                     template : $("#resultTemplate2"),
	                     totalCnt : responseData.totalCnt,
	 					totalViewYn : "N" ,
                    });
                }
		});
	}
	
</script>