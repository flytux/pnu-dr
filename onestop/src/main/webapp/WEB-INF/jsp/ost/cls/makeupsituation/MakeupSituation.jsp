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
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label>소속(과정)</label>
											</div>
											<div class="b-con-box" role="cell" id="AFFILIATION">
												
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학번(성명)</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_NO">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학년</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_YEAR_GCD_KOR_NM">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학적상태</label>
											</div>
											<div class="b-con-box" role="cell" id="HJ_STA_GCD_KOR_NM">
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
							<caption>보충과목부과현황</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 200px;">
								<col style="min-width: 70px;">
								<col style="min-width: 100px;">
								<col style="min-width: 70px;">
								<col style="min-width: 70px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">학점</th>
									<th scope="col">교과목구분</th>
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
		<td class="text-left">#:SUBJ_NM#</td>
		<td>#:SUBJ_NO#</td>
		<td>#:CRDT#</td>
		<td class="text-left">#:MAKEUP_GCD#</td>
	</tr>
</script>
<script type="text/javascript">
	const ajaxPath = '/ost/cls/makeupsituation/MakeupSituation';
	
	function fn_initScreen() {
		
		var collGradGcdKorNm = scwin.loginUser.collGradGcdKorNm;
		var collCdKorNm = scwin.loginUser.collCdKorNm;
		var assignNm = scwin.loginUser.assignNm;
		var degCourseGcdKorNm = scwin.loginUser.degCourseGcdKorNm;
		var affiliation = "";
		if(scwin.loginUser.userGcd == "0003") {
			affiliation = collGradGcdKorNm + ' ' + collCdKorNm + ' ' + assignNm+ ' ' + '('+degCourseGcdKorNm+')';
		}else {
			affiliation = assignNm;
		}
		
		$("#AFFILIATION").text(affiliation)
		
		var userId = scwin.loginUser.userId;
		var nm = scwin.loginUser.nm;
		let stdtNo = userId + ' ' + '('+nm+')';
		$("#STDT_NO").text(stdtNo)
		$("#STDT_YEAR_GCD_KOR_NM").text(scwin.loginUser.stdtYearGcdKorNm)
		$("#HJ_STA_GCD_KOR_NM").text(scwin.loginUser.hjStaGcdKorNm)
		if(scwin.loginUser.collGradGcd === '0002'){
			search();	
		}
	}
	function search(data){
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		gfn_ajax_request({
			url : ajaxPath + '/selectQuerySearch',
			reqData : data,
			success : function(data, responseData) {            	
                $("#resultTbody").listView({
                	dataSource : data,
                	emptyComment : "등록된 보충과목 부과 현황이 없습니다",
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