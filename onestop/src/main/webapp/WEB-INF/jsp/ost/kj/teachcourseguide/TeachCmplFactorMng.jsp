<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
	                <h2 class="sec-title"></h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<!-- /END CONTENT HEADER -->		
			
			<!-- CONTENT BODY -->		
			<div class="sec-body">
				<section class="sec-2">
					<div class="sec-body">
						<div id="download_target"></div> 
					
						<section class="sec-2">
							<header>
								<h4 class="sec-title">학적정보</h4>
							</header>
							<div class="sec-body">
								<div class="b-table-box flex-col-3" id="STDT_TABLE" role="table" aria-label="학적정보 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label data-lang>소속(과정)</label>
											</div>
					                        <div class="b-con-box" role="cell" data-bind="text: SOSOK_NM">
					                        </div>											
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>학번(성명)</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_INFO"></div>											
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="STDT_YEAR_TERM" data-lang>학년</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_YEAR_NM"></div>											
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>학적상태</label>
											</div>
											<div class="b-con-box" role="cell" id="HJ_STA_NM"></div>											
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item merge-prev">
											<div class="b-title-box" role="rowheader">
												<label data-lang>이수학기수</label>
											</div>
											<div class="b-con-box" role="cell" id="CMPL_TERM_CNT"></div>											
										</div>
										<div class="b-row-item merge-2">
											<div class="b-title-box" role="rowheader">
												<label data-lang>교직복수(연계)<br>전공</label>
											</div>
					                        <div class="b-con-box" role="cell" data-bind="text: DEPT_NM">
					                        </div>																					
										</div>
									</div>
								</div>
							</div>
						</section>
						<section class="sec-2">
							<header>
								<h4 class="sec-title">교직요건선택</h4> 
							</header>
							<div class="sec-body">
								<div class="b-table-box flex-col-1 search-box" id="" role="table" aria-label="학적정보 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-con-box" role="cell">
												<div class="custom-control custom-radio custom-control-inline">
									                  <input class="custom-control-input" type="radio" name="PROGRAM_GCD" id="radio1" value="0001" checked onclick="fn_Check('0001')" checked>
									                  <label class="custom-control-label" for="radio1" data-lang>응급처치및심폐소생술</label>
									            </div>
									            <div class="custom-control custom-radio custom-control-inline">
									                  <input class="custom-control-input" type="radio" name="PROGRAM_GCD" id="radio2" value="0002" onclick="fn_Check('0002')">
									                  <label class="custom-control-label" for="radio2" data-lang>교직적성및인성검사</label>
									            </div>
									            <div class="custom-control custom-radio custom-control-inline">
									                  <input class="custom-control-input" type="radio" name="PROGRAM_GCD" id="radio3" value="0003" onclick="fn_Check('0003')">
									                  <label class="custom-control-label" for="radio3" data-lang>성인지 교육</label>
									            </div>
									            <div class="custom-control custom-radio custom-control-inline">
									                  <input class="custom-control-input" type="radio" name="PROGRAM_GCD" id="radio4" value="9999" onclick="fn_Check('9999')">
									                  <label class="custom-control-label" for="radio4" data-lang>성적</label>
									            </div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<!-- 테이블 -->                
						<section class="sec-2">
							<header>
								<h4 class="sec-title">신청 및 이수내역</h4>
							</header>
							<div class="sec-body">
							<!-- 응급처치 및 심폐소생 -->
								<div class="table-box" id="grid01">
									<div class="table-body" >                    
										<table class="table table-hover" data-toggle="table" data-show-column="true">
											<caption>신청 및 이수내역</caption>
											<colgroup>
											    <col style="min-width: 230px;">
												<col style="min-width: 80px;">
												<col style="min-width: 80px;">
												<col style="min-width: 80px;">
												<col style="min-width: 200px;">
												<col style="min-width: 150px;">
												<col style="min-width: 100px;">
												<col style="min-width: 120px;">
											</colgroup>
											<thead>
												<tr>
												    <th scope="col">구분</th>
													<th scope="col">학년도</th>
													<th scope="col">학기</th>
													<th scope="col">실습차수</th>
													<th scope="col">실습일시</th>
													<th scope="col">장소</th>
													<th scope="col">상태</th>
													<th scope="col">취소</th>
												</tr> 
											</thead>
											<tbody id="resultTbody">
											</tbody>
										</table>
									</div>					
								</div>
								<!-- 교직적성및인성검사 -->
								<div class="table-box" id="grid03">
									<div class="table-body" >                    
										<table class="table table-hover" data-toggle="table" data-show-column="true">
											<caption>신청 및 이수내역</caption>
											<colgroup>
											    <col style="min-width: 260px;">
												<col style="min-width: 80px;">
												<col style="min-width: 80px;">
												<col style="min-width: 80px;">
												<col style="min-width: 150px;">
												<col style="min-width: 150px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
												    <th scope="col">구분</th>
													<th scope="col">학년도</th>
													<th scope="col">학기</th>
													<th scope="col">시행일</th>
													<th scope="col">적격여부</th>
													<th scope="col">항목별점수</th>
													<th scope="col">취소</th>
												</tr> 
											</thead>
											<tbody id="resultTbody3">
											</tbody>
										</table>
									</div>					
								</div>
								<!-- 성인지교육 -->
								<div class="table-box" id="grid05">
									<div class="table-body" >                    
										<table class="table table-hover" data-toggle="table" data-show-column="true">
											<caption>신청 및 이수내역</caption>
											<colgroup>
											    <col style="min-width: 180px;">
												<col style="min-width: 70px;">
												<col style="min-width: 70px;">
												<col style="min-width: 80px;">
												<col style="min-width: 180px;">
												<col style="min-width: 180px;">
												<col style="min-width: 60px;">
												<col style="min-width: 60px;">
											</colgroup>
											<thead>
												<tr>
												    <th scope="col">구분</th>
													<th scope="col">학년도</th>
													<th scope="col">학기</th>
													<th scope="col">교육차수</th>
													<th scope="col">시행일시</th>
													<th scope="col">교육기간</th>
													<th scope="col">상태</th>
													<th scope="col">취소</th>
												</tr> 
											</thead>
											<tbody id="resultTbody5">
											</tbody>
										</table>
									</div>					
								</div>
								<!-- 성적 -->
								<div class="table-box" id="grid07">
									<div class="table-body" >                    
										<table class="table table-hover" data-toggle="table" data-show-column="true">
											<caption>신청 및 이수내역</caption>
											<colgroup>
												<col style="min-width: 150px;">
												<col style="min-width: 150px;">
												<col style="min-width: 150px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">전공과목 평균성적</th>
													<th scope="col">교직과목 평균성적</th>
													<th scope="col">전체 평균성적</th>
												</tr> 
											</thead>
											<tbody id="resultTbody7">
											</tbody>
										</table>
									</div>					
								</div>
							</div>
						</section>
						<!-- /END 테이블 -->
						<section class="sec-2">
							<div class="sec-body" id="INFO">
								<p class="info-text info-text-style-2 mb-0">교원자격 무시험검정 요건</p>
								<!-- 응급처치 및 심폐소생술 -->
								<div id="grp-1">
									<ul class="mb-0">
										<li>
											<ul class="list list-style-1">
												<li>2017년도 2월 졸업자까지 1회 이상 실습</li>
												<li>2017년도 8월 졸업자부터 2회 이상 실습</li>
											</ul>
										</li>
									</ul>
									<p class="info-text info-text-style-1 mb-0 text-danger"> 매학기 1회의 수강신청 및 실습만 가능하므로 결시로 인한 불이익을 받지 않도록 주의 바랍니다. (폐강강좌의 수강신청자는 예외)</p>
									<p class="info-text info-text-style-1 text-danger mb-0" >실습 신청인원이 10명 미만이면 폐강되므로 폐강예정일에 개설상태를 확인하시기 바랍니다.</p>
								</div>
								<!-- 교직적성및인성검사 -->
								<div id="grp-2">
									<ul>
										<li>
											<ul class="list list-style-1">
												<li>2012학번 이전 1회 이상 적격판정을 받아야 함.</li>
												<li>2013학번 이후 2회 이상 적격판정을 받아야 함.</li>
											</ul>
										</li>
									</ul>
									<p class="info-text info-text-style-2 mb-0">1학기 1회 검사 가능</p>
								</div>
								<!-- 성인지 교육 -->
								<div id="grp-3">
									<ul>
										<li>
											<ul class="list list-style-1">
												<li>사범대학 : 4회 이상(연 1회 이상)</li>
												<li>일반대학 교직과정, 교육대학원생 : 2회 이상(연 1회 이상)</li>
												<li>※ 21년 입학자부터 상기 기준을 적용하며, 21년 2월 9일 기준, 기존 재학생 및 복학생은 2022년 8월 졸업자부터 재학 중 2회 이수</li>
											</ul>
										</li>
									</ul>
								</div>
								<!-- 성적 -->
								<div id="grp-4">
									<ul>
										<li>
											<ul class="list list-style-1">
												<li>2012학번 이전 졸업전체 평균성적 75/100.</li>
												<li>2013학번 이후 전공과목 평균성적 75/100, 교직과목 평균성적 80/100</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</section>
						<!-- 테이블 -->
						<section class="sec-2">
							<header>
								<h4 class="sec-title" id="title">개설내역 및 신청-<span id="SYEAR_TERM"></span></h4>
									<div class="btn-box">
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-danger" type="button" onclick="javascript:return fn_clause();" id="clause" data-lang>개인정보 제3자제공 동의</button>
											</div>
										</div>
									</div>
							</header>
							<div class="sec-body">
							<!-- 응급처치및심폐소생술 -->
								<div class="table-box" id="grid02">
									<div class="table-body">                    
										<table class="table table-hover" data-toggle="table" data-show-column="true" >
											<caption>개설내역 및 신청</caption>
											<colgroup>
											    <col style="min-width: 40px;">
												<col style="min-width: 170px;">
												<col style="min-width: 160px;">
												<col style="min-width: 160px;">
												<col style="min-width: 80px;">
												<col style="min-width: 80px;">
												<col style="min-width: 110px;">
												<col style="min-width: 80px;">
												<col style="min-width: 110px;">
											</colgroup>
											<thead>
												<tr>
												    <th scope="col">실습차수</th>
													<th scope="col">신청기간</th>
													<th scope="col">실습일시</th>
													<th scope="col">장소</th>
													<th scope="col">제한인원</th>
													<th scope="col">신청인원</th>
													<th scope="col">신청</th>
													<th scope="col">개설상태</th>
													<th scope="col">폐강예정일</th>
												</tr> 
											</thead>
											<tbody id="resultTbody2">
											</tbody>
										</table>
									</div>					
								</div>
								<!-- 교직적성및인성검사 -->
								<div class="table-box" id="grid04">
									<div class="table-body">                    
										<table class="table table-hover" data-toggle="table" data-show-column="true" >
											<caption>개설내역 및 신청</caption>
											<colgroup>
												<col style="min-width: 230px;">
												<col style="min-width: 270px;">
												<col style="min-width: 230px;">
												<col style="min-width: 120px;">
												<col style="min-width: 120px;">
											</colgroup>
											<thead>
												<tr>
												    <th scope="col">검사일시</th>
												    <th scope="col">신청기간</th>
												    <th scope="col">장소</th>
												    <th scope="col">신청</th>
												    <th scope="col">장소 및 유의사항</th>
												</tr> 
											</thead>
											<tbody id="resultTbody4">
											</tbody>
										</table>
									</div>					
								</div>
								<!-- 성인지교육 -->
								<div class="table-box" id="grid06">
									<div class="table-body">                    
										<table class="table table-hover" data-toggle="table" data-show-column="true" >
											<caption>개설내역 및 신청</caption>
											<colgroup>
												<col style="min-width: 250px;">
												<col style="min-width: 200px;">
												<col style="min-width: 200px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">신청기간</th>
													<th scope="col">시행일시</th>
													<th scope="col">교육기간</th>
													<th scope="col">신청</th>
													<th scope="col">유의사항</th>
												</tr> 
											</thead>
											<tbody id="resultTbody6">
											</tbody>
										</table>
									</div>					
								</div>
							</div>
						</section>
						<!-- /END 테이블 -->
								
					</div>
				</section>
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td>#:GUBUN#</td>
        <td>#:SYEAR#</td>
	    <td>#:TERM_NM#</td>
	    <td>#:PROGRAM_SERIAL_NO#</td>
	    <td>#:PRAC_DT#</td>
	    <td class="text-left">#:PRAC_ORGAN_NM#</td>
	    <td>#:PROGRAM_APPLY_STA_GCD#</td>
		<td>#if( :CANCEL_FG == "OK"){#<button class="btn btn-delete detail-btn" type="button">취소하기</button>#}
				else {##}#
		</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
        <td class="text-right">#:PROGRAM_SERIAL_NO#</td>
        <td>#:APPLY_DT#</td>
        <td>#:PROGRAM_IMPLMTN_DT#</td>
        <td class="text-left">#:LOCATION_INFO#</td>
        <td class="text-right">#:LIMIT_INWON_CNT#</td>
        <td class="text-right">#:CNT#</td>
		<td>#if( :STA == "신청가능"){#<button class="btn btn-new detail-btn" type="button">신청하기</button>#}
				else {#:STA#}#
		</td>
        <td>#:PROGRAM_STA_NM#</td>
        <td>#:CLOSE_LECT_SUPPOSE_DATE#</td>
</script>
<script type="text/x-tbody-template" id="resultTemplate3">
	<tr style="cursor:pointer;">
        <td>#:GUBUN#</td>
        <td>#:SYEAR#</td>
	    <td>#:TERM_NM#</td>
	    <td>#:PROGRAM_IMPLMTN_DT#</td>
	    <td>#:PROGRAM_APPLY_STA_GCD#</td>
	    <td class="text-primary">항목별점수보기</td>
		<td>#if( :CANCEL_FG == "OK"){#<button class="btn btn-delete detail-btn" type="button">취소하기</button>#}
				else {##}#
		</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate4">
	<tr style="cursor:pointer;">
        <td class="text-left">#:PROGRAM_IMPLMTN_DT#</td>
        <td>#:APPLY_DT#</td>
        <td class="text-left">#:LOCATION_INFO#</td>
		<td>#if( :STA == "신청가능"){#<button class="btn btn-new detail-btn" type="button">신청하기</button>#}
				else {#:STA#}#
		</td>
        <td class="text-primary">#:FILE_NM#</td>
</script>
<script type="text/x-tbody-template" id="resultTemplate5">
	<tr style="cursor:pointer;">
        <td>#:GUBUN#</td>
        <td>#:SYEAR#</td>
	    <td>#:TERM_NM#</td>
	    <td>#:PROGRAM_SERIAL_NO#</td>
        <td>#:PRAC_DT#</td>
	    <td class="text-left">#:PRAC_ORGAN_NM#</td>
	    <td>#:PROGRAM_APPLY_STA_GCD#</td>
		<td>#if( :CANCEL_FG == "OK"){#<button class="btn btn-delete detail-btn" type="button">취소하기</button>#}
				else {##}#
		</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate6">
	<tr style="cursor:pointer;">
        <td>#:APPLY_DT#</td>
        <td>#:PROGRAM_IMPLMTN_DT#</td>
        <td class="text-left">#:LOCATION_INFO#</td>
		<td>#if( :STA == "신청가능"){#<button class="btn btn-new detail-btn" type="button">신청하기</button>#}
				else {#:STA#}#
		</td>
        <td class="text-primary">#:FILE_NM#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate7">
	<tr style="cursor:pointer;">
	    <td>#:MAJOR#</td>
	    <td>#:KJ#</td>
	    <td>#:TOTAL#</td>
	</tr>
</script>
<script type="text/javascript">
	function fn_initScreen() {
		var majorNm = scwin.loginUser.majorCdKorNm == null ? '' : scwin.loginUser.majorCdKorNm;
		$("#STDT_INFO").text(scwin.loginUser.userId + '(' + scwin.loginUser.nm + ')');
		$("#HJ_STA_NM").text(scwin.loginUser.hjStaGcdKorNm);
		$("#CMPL_TERM_CNT").text(scwin.loginUser.cmplTermCnt);
		if(scwin.loginUser.collGradGcd == '0001'){
			//대학
			$("#STDT_YEAR_NM").text(scwin.loginUser.stdtYearGcdKorNm);
		}else{
			//대학원
			$("#STDT_YEAR_NM").text(scwin.loginUser.atlectTermCnt);
			$("label[for='STDT_YEAR_TERM']").text('학기');
		}

		fn_hide();	
		fn_Check('0001');
		
		agreeDltInfo = [];
		
	}
	

	var termInfo = []; //기준학년도/학기
	/***************************************************************************************************
	* 대상자 조회
	***************************************************************************************************/
	function fn_sch() {
		var searchParam = {};
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/TeachCmplFactorMng/selectListTeachCmplFactorMng",
			reqData : searchParam,
			success : function(data, responseData) {
				termInfo = responseData.termInfo;
				$("#title #SYEAR_TERM").text(termInfo.SYEAR+'학년도 '+termInfo.TERM_GCD_KOR_NM);
	        	if (gfn_com_isEmptyObject(data)) {
					//location.href="/"
	        		//alert('대상자가 아닙니다.');
					alert('교직이수 대상자가 아닙니다.',function(){ location.href="/" });					
	        	}else{
					gfn_com_dataBind($("#STDT_TABLE"), data[0]);
					//대상자인경우 신청및이수내역, 개설내역및신청 조회
					var radio = $(':radio[name="PROGRAM_GCD"]:checked').val();
					fn_sch2(radio);
					fn_sch3(radio);
	        	}

			}
		});
	}

	/***************************************************************************************************
	* 신청 및 이수내역 조회
	***************************************************************************************************/
	function fn_sch2(gbn) {
		var  searchParam = gfn_com_searchData($(".search-box"));

		var template = 'resultTemplate';
		var tBody = 'resultTbody';
		if(gbn == '0002'){
			template =  'resultTemplate3';
			 tBody =  'resultTbody3';
		}else if(gbn == '0003'){
			template =  'resultTemplate5';
			tBody =  'resultTbody5';
		}else if(gbn == '9999'){
			template =  'resultTemplate7';
			tBody =  'resultTbody7';
		}
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/TeachCmplFactorMng/selectListTeachCmplFactorMng2",
			reqData : searchParam,
			success : function(data, responseData) {
	        	$("#"+tBody).listView({
	                dataSource : data,
	                emptyComment : '내역이 없습니다.',
	                dataBound : function(e) {
	                    $('#'+tBody+' .detail-btn').bind("click", function(e){
	                    	scwin.detailObj = $(this).closest("tr").data();   
	    					var radio = $(':radio[name="PROGRAM_GCD"]:checked').val();
	                    	fn_delete(radio);
	                    });
	                    
                    	$("#resultTbody3 tr").find("td:eq(5)").bind("click", function(e) {
	                    	scwin.detailObj = $(this).closest("tr").data();   
                        	fn_scorePop();
                        });
	                },
	                template : $("#"+template),
					totalCnt : responseData.totalCnt
	            });
			}
		});
	}

	/***************************************************************************************************
	* 개설 내역 및 신청 조회 
	***************************************************************************************************/
	function fn_sch3(gbn) {
		if(gbn == '9999') return;
		var  searchParam = gfn_com_searchData($(".search-box"));
		searchParam.SYEAR = termInfo.SYEAR;
		searchParam.TERM_GCD = termInfo.TERM_GCD;
		
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/TeachCmplFactorMng/selectListTeachCmplFactorMng3",
			reqData : searchParam,
			success : function(data, responseData) {
				var template = 'resultTemplate2';
				var tBody = 'resultTbody2';
				if(gbn == '0002') template =  'resultTemplate4';
				if(gbn == '0002') tBody =  'resultTbody4';
				if(gbn == '0003') template =  'resultTemplate6';
				if(gbn == '0003') tBody =  'resultTbody6';
				
	        	$("#"+tBody).listView({
	                dataSource : data,
	                emptyComment : '신청내역이 없습니다.',
	                dataBound : function(e) {
	                    $('#'+tBody+' .detail-btn').bind("click", function(e){
	                    	scwin.detailObj = $(this).closest("tr").data();   
	    					var radio = $(':radio[name="PROGRAM_GCD"]:checked').val();
	                    	fn_apply(radio);
	                    });
						$("#"+tBody+" tr").find("td:last").bind("click", function(e) {
							if(gbn=="0002" || gbn=="0003"){
						    	scwin.detailObj = $(this).closest("tr").data();   
						    	fn_fileDownload();
							}
						});
	                },
	                template : $("#"+template),
					totalCnt : responseData.totalCnt
	            });
			}
		});
	}

	/***************************************************************************************************
	* 교직요건 선택시
	***************************************************************************************************/
	function fn_Check(gbn) {
		switch (gbn){
			case '0001':
				fn_hide();
				$("#INFO #grp-1").show();
				$("#grid01").show();
				$("#grid02").show();
				$("#clause").show();
				$("#title").show();
				break;
			case '0002':
				fn_hide();
				$("#INFO #grp-2").show();
				$("#grid03").show();
				$("#grid04").show();
				$("#title").show();
				break;
			case '0003':
				fn_hide();
				$("#INFO #grp-3").show();
				$("#grid05").show();
				$("#grid06").show();
				$("#title").show();
				break;
			case '9999':
				fn_hide();
				$("#INFO #grp-4").show();
				$("#grid07").show();
				break;
			}
		fn_sch();
	}

	/***************************************************************************************************
	* hide
	***************************************************************************************************/
	function fn_hide() {
		$("#INFO #grp-1").hide();
		$("#INFO #grp-2").hide();
		$("#INFO #grp-3").hide();
		$("#INFO #grp-4").hide();
		$("#grid01").hide();
		$("#grid02").hide();
		$("#grid03").hide();
		$("#grid04").hide();
		$("#grid05").hide();
		$("#grid06").hide();
		$("#grid07").hide();
		$("#clause").hide();
		$("#title").hide();
	}
	
	/***************************************************************************************************
	* 취소하기
	***************************************************************************************************/
	function fn_delete(gbn) {
		 confirm('취소 하시겠습니까?',function(_flag){
			if(_flag) {
				gfn_ajax_request({
					url : "/ost/kj/teachcourseguide/TeachCmplFactorMng/deleteTeachCmplFactorMng",
					reqData : scwin.detailObj,
					success : function(data, responseData){
						alert(data.O_MSG);
						var radio = $(':radio[name="PROGRAM_GCD"]:checked').val();
						fn_sch2(radio);
						fn_sch3(radio);
					}
				});
			}
		});
	}

	/***************************************************************************************************
	* 신청하기
	***************************************************************************************************/
	function fn_apply(gbn) {
		 confirm('신청 하시겠습니까?',function(_flag){
			if(_flag) {
				if(gbn=='0001'){
					if (gfn_com_isEmptyObject(agreeDltInfo)) {
			            alert('개인정보 제3자제공 동의 후 신청가능합니다.');
			            return;
			        }
					scwin.detailObj["agreeDltInfo"] = agreeDltInfo;
				}
				gfn_ajax_request({
					url : "/ost/kj/teachcourseguide/TeachCmplFactorMng/insertTeachCmplFactorMng",
					reqData : scwin.detailObj,
					success : function(data, responseData){
						alert(data.O_MSG);
						var radio = $(':radio[name="PROGRAM_GCD"]:checked').val();
						fn_sch2(radio);
						fn_sch3(radio);
					}
				});
			}
		});
	}

	var agreeDltInfo = [];
	
	/***************************************************************************************************
	* 정보동의팝업 호출
	***************************************************************************************************/
	function fn_clause() {
		/* 정보동의팝업 호출 */
		gfn_com_clausePop({
			title : '정보동의팝업',
			systemGcd : '0002', /* 공통.약관관리(SYS_CLAUSE_MNG) 테이블의 시스템구분코드(SYSTEM_GCD) */
			clauseSeqNo : 3, /* 공통.약관관리(SYS_CLAUSE_MNG) 테이블의 약관순번(CLAUSE_SEQ_NO) */
			params : { /*  ${syearTerm}로 입력 된 문자열에 대해 치환할 값을 정의 */
				syearTerm : termInfo.SYEAR + "학년도 " + termInfo.TERM_GCD_KOR_NM
			},
			callbackFunc : function(data){
				/* 필수동의 사항에 동의한 경우 콜백 실행 */
				agreeDltInfo = data; /* 콜백함수에서 전달받은 결과를 별도 변수에 담음 */
			}
		});
	}

	/***************************************************************************************************
	* 항목별점수보기 팝업 
	***************************************************************************************************/
	function fn_scorePop() {
		gfn_com_modalPopup({
			width : 300,
			height : 700,
			index : 1,
			target : null,
			title : "적인성검사 항목별 점수",
			include : "/html/ost/kj/teachcourseguide/TeachCmplFactorMngPop.html"
		});
	}

	/***************************************************************************************************
	* 첨부파일 다운로드
	***************************************************************************************************/
	function fn_fileDownload() {
		if(scwin.detailObj.ATTACH_FILE_REL_INFO != null){
			 gfn_com_modalPopup({
				width : 800,
				height : 300,
				index : 1,
				target : null,
				title : "첨부파일 다운로드",
				include : "/html/ost/kj/teachcourseguide/TeachCmplFactorMngDownloadPop.html"
			}); 
		}
	}
	
</script>