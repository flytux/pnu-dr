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


				<!-- /아코디언 -->
				<section class="sec-2">
					<div class="sec-body">
						<div class="accordion">
							<div class="card">
								<div class="card-header" id="heading1">
									<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true" data-controls="collapse1">> 기본정보</button>
								</div>
								<div id="collapse1" class="collapse show" aria-labelledby="heading1">
									<div class="card-body">
										<section class="sec-3">
											<div class="sec-body">
												<div class="search-box">
													<input type="text" id="SYEAR" class="form-control" style="display: none;" title="학년도" /> <input type="text" id="TERM_GCD" class="form-control" style="display: none;"  title="학기"/> <input type="text" id="STDT_NO" class="form-control" style="display: none;"  title="학번" />
												</div>
												<!-- 3단 테이블 -->
												<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
													<div class="b-row-box" role="row">
														<div class="b-row-item merge-3">
															<div class="b-title-box" role="rowheader">
																<label data-lang>소속(과정)</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="COLL_DEPT"></label>
															</div>
														</div>
													</div>
													<div class="b-row-box" role="row">
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>학번(성명)</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="STDT_INFO"></label>
															</div>
														</div>
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>학년(학기)</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="STDT_YEAR_TERM"></label>
															</div>
														</div>
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>학적상태</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="HJ_STA_GCD"></label>
															</div>
														</div>
													</div>
													<div class="b-row-box" role="row">
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>교육과정 적용년도</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="CURC_APPLY_SYEAR"></label>
															</div>
														</div>
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>입학일자</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="ENROLL_DT"></label>
															</div>
														</div>
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>입학구분</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="ENROLL_FG"></label>
															</div>
														</div>
													</div>
													<div class="b-row-box" role="row">
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>이수학기</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="CMPL_TERM_CNT"></label>
															</div>
														</div>
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>취득학점/신청학점</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="CRDT"></label>
															</div>
														</div>
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>평점</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="GPA"></label>
															</div>
														</div>
													</div>
													<div class="b-row-box" role="row">
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>외국인여부</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="FORIEGN_FG"></label>
															</div>
														</div>
														<div class="b-row-item">
															<div class="b-title-box" role="rowheader">
																<label data-lang>유예신청</label>
															</div>
															<div class="b-con-box" role="cell">
																<label id="YUYE"></label>
															</div>
														</div>
														<div class="b-row-item">

															<div class="b-con-box" role="cell">
																<label id="nm"></label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- 3단 테이블 END-->
										</section>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="heading2">
									<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse2" data-expanded="true" data-controls="collapse2">> 졸업요건</button>
								</div>
								<div id="collapse2" class="collapse show" aria-labelledby="heading2">
									<div class="card-body">
										<!-- 테이블 -->
										<div class="table-box">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>졸업요건기준 및 충족여부목록</caption>
													<colgroup>
														<col style="min-width: 100px;">
														<col style="min-width: 150px;">
														<col style="min-width: 200px;">
														<col style="min-width: 200px;">
														<col style="min-width: 100px;">
														<col style="min-width: 150px;">
														<col style="min-width: 50px;">
														<col style="min-width: 50px;">
														<col style="min-width: 400px;">
													</colgroup>
													<thead>
														<tr>
															<th colspan="5" scope="col">졸업요건 기준</th>
															<th colspan="4" scope="col">졸업요건 충족여부</th>
														</tr>
														<tr>
															<th scope="col">구분</th>
															<th scope="col">학과</th>
															<th scope="col">졸업요건명</th>
															<th scope="col">졸업요건기준</th>
															<th scope="col">상세졸업요건명</th>

															<th scope="col">취득일자</th>
															<th scope="col">합격구분</th>
															<th scope="col">충족여부</th>
															<th scope="col">비고 (예외사항/상세내역/점수)</th>
														</tr>
													</thead>
													<tbody id="resultTbody">
													</tbody>
												</table>
											</div>
										</div>
										<!-- /END 테이블 -->
										<ul class="list list-style-1">
											<li><span class="dfn"><strong>졸업요건기준이 입력되어 있지 않거나 궁금한 사항은 아래로 문의하세요.</strong></span>
												<p>
													<span class="dfn"> - 주전공 : 소속학과 조교에게 문의</span><br /> <span class="dfn"> - 복수전공(이수자에 한함) : 해당학과 조교에게 문의</span>
												</p></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
				<!-- /END 아코디언 -->
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td>#:HEV_GCD#</td>
	    <td class="text-left" scope="row">#:DEPT_CD#</td>
	    <td class="text-left">#:JOLUP_FACTOR_GCD#</td>
	    <td class="text-left">#:CRITERIA_DETAILS_CONTENT#</td>
	    <td class="text-left">#:JOLUP_FACTOR_UPPER_GCD#</td>
	    <td>#:EXAM_DATE#</td>
		<td>#:JOLUP_FACTOR_PASS_GCD#</td>
		<td>#:MEET_FG#</td>
		<td class="text-left">#:UNUSUAL_REASON_CONTENT#</td>
	</tr>
</script>
<script type="text/javascript">

	function fn_initScreen() {

		var colldept = scwin.loginUser.collCdKorNm+ ' ' + scwin.loginUser.deptCdKorNm; // 소속(과정)
		var stdtinfo = scwin.loginUser.userId + '(' + scwin.loginUser.nm + ')'; //학번(성명)
		var stdtyearterm = scwin.loginUser.stdtYearGcdKorNm; //학년(학기)
		var hjstagcd = scwin.loginUser.hjStaGcdKorNm; //학적상태
		var curcapplysyear = scwin.loginUser.curcApplySyear; //교육과정 적용년도
		var cmplTermCnt = scwin.loginUser.cmplTermCnt; //이수학기
		var foreignfg = scwin.loginUser.nationCd;//외국인여부				

		$("#COLL_DEPT").text(colldept);
		$("#STDT_INFO").text(stdtinfo);
		$("#STDT_YEAR_TERM").text(stdtyearterm);
		$("#HJ_STA_GCD").text(hjstagcd);
		$("#CURC_APPLY_SYEAR").text(curcapplysyear);
		$("#CMPL_TERM_CNT").text(cmplTermCnt);
		
		if(foreignfg=='0410')
			$("#FORIEGN_FG").text('N');
		else 
			$("#FORIEGN_FG").text('Y');
		
		fn_search();

	}
	/***************************************************************************
	 * 강의평가 목록 조회
	 **************************************************************************/
	function fn_search(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		
	 	/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/jolup/hakbujolupguide/jolupfactorcriteriasearch/selectJolupStdtInfo",
			reqData : data,
			success : function(data, responseData) {
				$("#ENROLL_DT").text(data.ADMS_DATE);
				$("#ENROLL_FG").text(data.ADMS_NM);       
				$("#CRDT").text(data.ACQ_CRDT+'/'+data.APPLY_CRDT);
				$("#GPA").text(data.GPA);
				$("#YUYE").text(data.CANCEL_GCD);
	            }								
		}); 
		
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/jolup/hakbujolupguide/jolupfactorcriteriasearch/selectJolupFactor",
			reqData : data,
			success : function(data, responseData) {
				var msgx = data[0].O_MSG;
				if(data[0].TOT_CNT == 0){data=[];}
				$("#resultTbody").listView({
                	dataSource : data,
                	emptyComment :msgx ,
                    dataBound : function(e) {
                    	totalCnt = responseData.pageInfo.totCnt;
 	                    currentData = data;	         

	            		},
	                     template : $("#resultTemplate"),
	                     totalCnt : responseData.totalCnt,
	                     paging : null
                    });						
			}
		});
	}

	
</script>