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
				<section class="sec-2">
					<div class="sec-body">
						<section class="sec-3">
							<div class="sec-body">
								<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">대학(원)</div>
											<div class="b-con-box" role="cell" id="SCH_GRAD_GCD"></div>												
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학위</div>
											<div class="b-con-box" role="cell" id="SCH_DEG_COURSE_GCD">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학과(부)</div>
											<div class="b-con-box" role="cell" id="SCH_ASSIGN_NM"></div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학번</div>
											<div class="b-con-box" role="cell" id="SCH_USER_ID"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학년</div>
											<div class="b-con-box" role="cell" id="SCH_STDT_YEAR_GCD"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">성명</div>
											<div class="b-con-box" role="cell" id="SCH_NM"></div>
										</div>
									</div>
								</div>
							</div>
						</section>						
						<section class="sec-3">
							<header>
								<h4 class="sec-title">금학기 성적 목록</h4>
							</header>
							<div class="sec-body">
								<!-- 테이블 -->
								<div class="table-box">
									<div class="table-body">
										<table class="table table-hover" data-toggle="table"  data-show-column="true">
											<caption>금학기 성적 목록</caption>
											<colgroup>
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 40px;">
												<col style="min-width: 40px;">
												<col style="min-width: 230px;">
												<col style="min-width: 30px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">교과목명</th>
													<th scope="col">교과목번호</th>
													<th scope="col">분반</th>
													<th scope="col">학점</th>
													<th scope="col">구분</th>
													<th scope="col">성적</th>
												</tr>
											</thead>
											<tbody id="resultTbody">
											</tbody>
										</table>
									</div>
								</div>
								<!-- /END 테이블 -->
							</div>
						</section>
							<section class="sec-3">
								<div class="sec-body">
									<div class="message-box">
										<div class="message-box-inner">
											<div class="message-body">
												<ul class="list list-style-1">
													<li>수강과목에 대한 강의평가 작성을 해야지만 성적조회가 가능합니다. 타대생은 강의평가에서 제외됩니다.</li>
													<li>지도교수상담제 시행 중인 학과 소속 학생은 해당 학기에 1회이상 면담에 참석해야 성적조회가 가능합니다.</li>
													<li>성적열람 및 이의신청기간내에 성적란의 [성적미입력/미확정]은 교과목개설학과 또는 담당교수에게 문의하시기바랍니다.</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</section>
					</div>
				</section>
			</div>
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
	    <td class="text-left">#:SUBJ_NM#</td>
        <td>#:SUBJ_NO#</td>
	    <td>#:CLASS_NO#</td>
		<td>#:CRDT#</td>
	    <td>#:SUBJ_GCD_NM#</td>
	    <td>
			# if( :GRADE == "강의평가미응답") { #
				<a href="javascript:selectMenu('000000000000329')">강의평가 바로가기 </a>
			#}#
			# if( :GRADE == "교육인증강의평가미응답") {#
				<a href="javascript:selectMenu('000000000000329')">교육인증강의평가 바로가기 </a>
			#}#
			# if( :GRADE != "교육인증강의평가미응답" && :GRADE != "강의평가미응답") {#
				#:GRADE#
			#}#
		</td>
	</tr>
</script>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete; // ?
	var _multi; // ?
	const ajaxUrl = '/ost/sj/sjsearch/termsjsearch';
	
	// ??
	function fn_initScreen() {
		fn_setBasicInfo(scwin.loginUser);
		gfn_ajax_request({
			url : ajaxUrl + '/selectQuery',
			reqData : {
				SYSTEM_GCD : scwin.menuInfo.SYSTEM_GCD,
				MENU_CD : scwin.menuInfo.MENU_CD,
				//STDT_NO : scwin.loginUser.userId,
				STDTGCD : scwin.loginUser.stdtGcd,
				DEPT_CD : scwin.loginUser.deptCd,
			},
			success : function(data, responseData) {
				if(data.length === 0){
					alert('성적이 확정되면 전체성적조회에서 성적을 조회하셔야 합니다.'); 
					return;
				}
				if(data.length === 1 && data[0].O_RSLT === 'N'){
					alert(data[0].O_MSG);
				}else{
					/*for(checkGRADE of data){
						if(checkGRADE.GRADE === "강의평가미응답"){
							console.log('here');
							$('#resultTbody').html('<tr style="cursor:pointer;"><td colspan="6"><a href="#none" onclick="selectMenu(\'000000000000329\')" onkeypress="this.onclick">강의평가 바로가기 </a></td></tr>');
							//return;
						}
					}*/
					$("#resultTbody").listView(
							{
								dataSource : data,
								dataBound : function(e) {
									currentData = data;
								},
								template : $("#resultTemplate"),
								totalCnt : responseData.totalCnt,
							});
				}
			}
		});
		
		
		// fn_sch();
	}
	
	function fn_setBasicInfo(userInfo){
		gfn_ajax_request({
			url : ajaxUrl + '/selectUserInfo',
			reqData : {
				//USER_ID : userInfo.userId
			},
			success : function(data, responseData) {
				$("#SCH_GRAD_GCD").text(data[0].GRAD_GCD)
				$("#SCH_DEG_COURSE_GCD").text(data[0].DEG_COURSE_GCD)
				$("#SCH_ASSIGN_NM").text(data[0].ASSIGN_NM)
				$("#SCH_USER_ID").text(data[0].USER_ID)
				$("#SCH_STDT_YEAR_GCD").text(data[0].STDT_YEAR_GCD)
				$("#SCH_NM").text(data[0].NM)
			}
		});	
	}

	function fn_sch(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sj/kp/middletermleceval/selectMiddletermLeceval",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody").listView(
						{
							dataSource : data,
							dataBound : function(e) {
								$("#resultTbody tr").find("td:not(:last)")
										.bind(
												"click",
												function(e) {
													scwin.detailObj = $(this)
															.closest("tr")
															.data();
													scwin.rowState = 'U';
													fn_openPopup({
														filename : 'samplePop',
														headertitle : '수정'
													});
												});
								$('#resultTbody .detail-btn').bind(
										"click",
										function(e) {
											scwin.detailObj = $(this).closest(
													"tr").data();
											fn_openPopup({
												filename : 'sampleDetailPop',
												headertitle : '보기'
											});
										});
								$('#resultTbody .write-btn').bind(
										"click",
										function(e) {
											scwin.detailObj = $(this).closest(
													"tr").data();
											fn_openPopup({
												filename : 'sampleDetailPop',
												headertitle : '작성'
											});
										});
								totalCnt = responseData.pageInfo.totCnt;
								currentData = data;
							},
							template : $("#resultTemplate"),
							totalCnt : responseData.totalCnt,
							paging : {
								pageInfo : responseData.pageInfo,
								reqData : responseData.reqData,
								func : "fn_sch"
							},
							excel : "fn_excelDownload"
						});
			}
		});
	}


</script>