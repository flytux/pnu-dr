<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title">휴학신청</h2>
				</div>
				<div class="header-item"></div>
			</header>
			<div class="sec-body">
				<!-- /END 학적상태 안내문 -->
				<section class="sec-2">
					<div class="sec-body">
						<ol class="flow-list">
							<li id="level1">
								<div class="txt-box">
									<strong>01. 접수</strong><span></span>
								</div>
							</li>
							<li id="level2">
								<div class="txt-box">
									<strong>02. 학과승인/반려</strong>
									<div>
										<span class="badge badge-primary mr-2">승인</span> <span></span>
									</div>
									<div>
										<span class="badge badge-warning mr-2">반려</span> <span></span>
									</div>
								</div>
							</li>
							<li id="level3">
								<div class="txt-box">
									<strong>03. 최종승인/반려</strong>
									<div>
										<span class="badge badge-primary mr-2">승인</span><span></span>
									</div>
									<div>
										<span class="badge badge-warning mr-2">반려</span><span></span>
									</div>
								</div>
							</li>
						</ol>
					
					</div>
				</section>
				<!-- /END 진행 단계 템플릿 -->
				<!-- 테이블 -->
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>휴학신청내역</caption>
							<colgroup>
								<col style="min-width: 60px;">
								<col style="min-width: 60px;">
								<col style="min-width: 70px;">
								<col style="min-width: 120px;">
								<col style="min-width: 120px;">
								<col style="min-width: 80px;">
								<col style="min-width: 200px;">
								<col style="min-width: 30px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">학년도</th>
									<th scope="col">학기</th>
									<th scope="col">신청일자</th>
									<th scope="col">이수구분</th>
									<th scope="col">전공(인증구분)</th>
									<th scope="col">승인여부</th>
									<th scope="col">반려사유</th>
									<th scope="col">이수인증신청</th>
								</tr>
							</thead>
							<tbody id="resultTbody"></tbody>
						</table>
					</div>
				</div>
				<!-- /END 테이블 -->
				<div class="btn-box mt-4">
					<div class="form-row btn-box-right">
						<div class="col-auto">
							<button class="btn btn-primary mb-2" data-lang onclick="fn_openPopup()">신청</button>
						</div>
					</div>
				</div>

			</div>
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;" class=#:STA_GCD# onclick = "fn_setTemplate(this)">
        <td>#:APPLY_SYEAR#</td>
	    <td>#:APPLY_TERM_NM#</td>
	    <td>#:APPLY_DT#</td>
	    <td class="text-left"><a href="#popup">#:CHG_APPLY_REASON_GCD#</a></td>
	    <td class="text-left">#:PRE_CHG_MAJOR_CD#</a></td>
  		<td># if( :STA_GCD== "0001") {# <button class="badge badge-pil badge-warning" type="button">접수</button>#} 
				  else if ( :STA_GCD == "0002") {# <button class="badge badge-pil badge-primary" type="button">학과승인</button>#} 
				  else if ( :STA_GCD == "0003" || :STA_GCD == "0004") {# <button class="badge badge-pil badge-success" type="button">최종승인</button> #} 
				  else if ( :STA_GCD == "0005" || :STA_GCD == "0006" || :STA_GCD == "0007" || :STA_GCD == "0008") {# <button class="badge badge-pil badge-danger" type="button">반려</button> #}#
		</td>
	    <td class="">#:APPROVE_NONPSBL_REASON_COMMENT#</td>
	    <td class="text-center"><button class="btn btn-outline-secondary conf-apply" type="button"><i class="bi bi-display" aria-hidden="true"></i><a style="font-size:13px;">이수인증신청</a></button></td>
	</tr>
</script>
<script type="text/javascript">
	/* 전역변수 */
	var paramData = {};
	var stdtInfo = [];
	function fn_initScreen() {
		fn_sch();
	}

	/* 진행단계 템플릿 */
	function fn_setTemplate(obj) {
		var trData = $(obj).data();
		console.log(trData);
		console.log($(obj).attr("class"));
		// 템플릿 결제진행 단계(0001 : 2단계, 0002 : 3단계)
		if ($(obj).attr("class") == "0001") {
			$("#level1").find("span").show();
			$("#level2").find("div:not(:first)").hide();
			$("#level3").find("div:not(:first)").hide();

			$("#level1").removeClass("disabled");
			$("#level2").addClass("disabled");
			$("#level3").addClass("disabled");
		} else if ($(obj).attr("class") == "0002" || $(obj).attr("class") == "0003") {
			if ($(obj).attr("class") == "0002") { // 학과승인	
				$("#level3").find("div:not(:first)").hide();
				$("#level3").addClass("disabled");
			} else if ($(obj).attr("class") == "0004") { // 대학승인
				$("#level3").find(".badge-primary").closest("div").show();
				$("#level3").find(".badge-warning").closest("div").hide();
				$("#level3").removeClass("disabled");
			}
			$("#level2").find(".badge-primary").closest("div").show();
			$("#level2").find(".badge-warning").closest("div").hide();
			$("#level1").removeClass("disabled");
			$("#level2").removeClass("disabled");
		} else if ($(obj).attr("class") == "0007" || $(obj).attr("class") == "0005") {
			if ($(obj).attr("class") == "0007") { // 학과승인불가
				$("#level3").find("div:not(:first)").hide();
				$("#level3").addClass("disabled");
				$("#level2").find(".badge-primary").closest("div").hide();
				$("#level2").find(".badge-warning").closest("div").show();
			} else if ($(obj).attr("class") == "0005") { // 대학승인불가
				$("#level2").find(".badge-primary").closest("div").show();
				$("#level2").find(".badge-warning").closest("div").hide();
				$("#level3").find(".badge-primary").closest("div").hide();
				$("#level3").find(".badge-warning").closest("div").show();
				$("#level3").removeClass("disabled");
			}
			$("#level2").removeClass("disabled");
		}else if($(obj).attr("class") == "0000"){
			$("#level2").find("div:not(:first)").hide();
			$("#level2").addClass("disabled");
			$("#level3").find("div:not(:first)").hide();
			$("#level3").addClass("disabled");
		}
		$("#level1").find("span").html(trData.APPLY_DT);
		$("#level2").find(".badge-primary").next("span").html(trData.APPROVE_DATE_DEPT);
		$("#level2").find(".badge-warning").next("span").html(trData.APPROVE_DATE_DEPT);
		$("#level3").find(".badge-primary").next("span").html(trData.APPROVE_DATE_COLL);
		$("#level3").find(".badge-warning").next("span").html(trData.APPROVE_DATE_COLL);
	}

	/* 휴학신청내역 조회 */
	function fn_sch(data) {
		var paramData = gfn_com_searchData($(".search-box"));
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/smallmajor/listenApply/selectListListenApply",
			reqData : paramData,
			success : function(data, responseData) {
					$("#resultTbody").listView({
						dataSource : data,
						dataBound : function(e) {
							//이수인증신청버튼 이벤트설정//////////////////
							$('#resultTbody .conf-apply').bind(
									"click",
									function(e) {
										scwin.rowData = $(this).closest("td").closest("tr").data();//클릭한 row 데이터
										fn_openPopup({
											width : 800,
											height : 200,
											filename : 'ListenConfApplyPop',
											headertitle : '이수인증신청'
										}); 
										
									});
							////////////////////////////////////////////
							totalCnt = responseData.pageInfo.totCnt;
							currentData = data;
						},
						template : $("#resultTemplate"),
						totalCnt : responseData.pageInfo.totCnt,
						paging : {
							pageInfo : responseData.pageInfo,
							reqData : responseData.reqData,
							func : "fn_sch"
						},
					});


					// 첫번째 row 선택
					if (data.length > 0) {
						fn_setTemplate($("#resultTbody tr:eq(0)"));
						$("#resultTbody tr:eq(0)").find("td").addClass("active");
					} else {
						$("#level1").addClass("disabled");
						$("#level2").addClass("disabled");
						$("#level3").addClass("disabled");
						$("#level1").find("span").hide();
						$("#level2").find("span").hide();
						$("#level2").find("div:not(:first)").hide();
						$("#level3").find("div:not(:first)").hide();
					}
			}
		});
	}
	

	/* 휴학신청팝업 함수 */
	function fn_openPopup(param) {
		scwin.detailObj = {};
		gfn_com_modalPopup({
			width : 1300,
			height : 450,
			index : 1,
			target : null,
			title : "이수신청",
			include : "/html/ost/hj/smallmajor/ListenApplyPop.html"
		});
	}

</script>