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
				<div class="search-box">
					<section class="sec-3">
							<header>
							</header>
							<div class="sec-body">
								<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>대학(원)</label>
											</div>
											<div class="b-con-box" role="cell" id="COLL_GRAD_NM">												
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학위</label>
											</div>
											<div class="b-con-box" role="cell" id="DEG_COURSE_NM">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학과(부)</label>
											</div>
											<div class="b-con-box" role="cell" id="ASSIGN_NM">
											</div>
										</div>										
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학번</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_NO">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학년</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_YEAR_GCD">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>성명</label>
											</div>
											<div class="b-con-box" role="cell" id="NM">
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
				</div>
				<div class="table-box" id=grid01>
					<div class="table-body">
						<table class="table table-hover" data-toggle="table"  data-show-column="true">
							<caption>장학금환수목록</caption>
							<colgroup>
								<col style="min-width: 40px;">
								<col style="min-width: 50px;">
								<col style="min-width: 50px;">
								<col style="min-width: 80px;">
								<col style="min-width: 100px;">
								<col style="min-width: 200px;">
								<col style="min-width: 60px;">
								<col style="min-width: 80px;">
								<col style="min-width: 100px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">학년도</th>
									<th scope="col">학기</th>
									<th scope="col">차수</th>
									<th scope="col">장학금구분명</th>
									<th scope="col">장학명</th>
									<th scope="col">추가납입계</th>
									<th scope="col">납부구분</th>
									<th scope="col">납부일자</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
		<td class="text-left">#:SYEAR#</td>
		<td>#:TERM_GCD#</td>
		<td>#:SEQ_NO#</td>
		<td class="text-left">#:JH_GCD_NM#</td>
		<td>#:JH_NM#</td>
		<td>#:ADD_PAY_AMT#</td>
		<td>#:JH_PAY_GCD_NM#</td>
		<td>#:JH_PAY_DT#</td>
	</tr>
</script>
<script type="text/javascript">
	const ajaxPath = '/ost/jh/jhclawback';
	
	function fn_initScreen() {
		
		var collGradGcd = scwin.loginUser.collGradGcd;
		var collCdKorNm = scwin.loginUser.collCdKorNm;
		var gradGcdKorNm = scwin.loginUser.gradGcdKorNm;
		var assignNm = scwin.loginUser.assignNm;
		var degCourseGcdKorNm = scwin.loginUser.degCourseGcdKorNm;
		var stdtno = scwin.loginUser.userId;
		var stdtyear = scwin.loginUser.stdtYearGcdKorNm
		var nm = scwin.loginUser.nm;
		
		if(collGradGcd='0001')
			$("#COLL_GRAD_NM").text(collCdKorNm);
		else
			$("#COLL_GRAD_NM").text(gradGcdKorNm);
		
		$("#DEG_COURSE_NM").text(degCourseGcdKorNm);
		$("#ASSIGN_NM").text(assignNm);
		$("#STDT_NO").text(stdtno);
		$("#STDT_YEAR_GCD").text(stdtyear);	
		$("#NM").text(nm);
		
		search();
	}
	
	function search(data){
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}

	
		gfn_ajax_request({
			url : ajaxPath + '/selectJhBack',
			reqData : data,
			success : function(data, responseData) {            	
                $("#resultTbody").listView({
                	dataSource : data,
                	emptyComment : "조회내역이 없습니다.",
                    dataBound : function(e) {	                      
	                    totalCnt = responseData.pageInfo.totCnt;
	                    currentData = data; 

	            },
	                     template : $("#resultTemplate"),
	                     totalCnt : responseData.totalCnt,
	                     paging : {
	                     	pageInfo : responseData.pageInfo,
	                        reqData : responseData.reqData,
	                        func : "search"
	                    } 
                    });
                }
		});
	}
</script>