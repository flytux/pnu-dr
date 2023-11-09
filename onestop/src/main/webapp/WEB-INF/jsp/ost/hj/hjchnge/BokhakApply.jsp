<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title">복학신청</h2>
				</div>
				<div class="header-item"></div>
			</header>
			<div class="sec-body">
				<!-- 학적상태 안내문 -->
				<section class="sec-2">
					<header>
						<h3 class="sec-title"></h3>
					</header>
					<div class="sec-body">
						<div class="message-box">
							<div class="message-box-inner">
								<div class="message-body">
									<span class="dfn" id="NM"></span> 님의 학적상태는 <span class="dfn" id="HJ_STA_GCD_NM"></span> 입니다. 학적상태가 휴학인 경우에만 복학신청을 할 수 있습니다.
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- /END 학적상태 안내문 -->
				<!-- 메시지 박스 -->
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
						<div class="text-left">
							<span class="info-text" data-lang>복학 승인여부가 
								<span class="badge badge-pil badge-warning ml-1" style="border: 1px solid #000000;">접수</span>
								이면 소속학과 사무실로, 
								<span class="badge badge-pil badge-primary ml-1" style="border: 1px solid #000000;">학과승인</span>
								이면 소속 단과대학 행정실로 문의하시기 바랍니다.
							</span>
						</div>
					</div>
				</section>
				<!-- 테이블 -->
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>복학신청내역</caption>
							<colgroup>
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 140px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 140px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">학년도</th>
									<th scope="col">학기</th>
									<th scope="col">신청일자</th>
									<th scope="col">복학사유</th>
									<th scope="col">승인여부</th>
									<th scope="col">승인일시</th>
									<th scope="col">반려사유</th>
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
							<button class="btn btn-primary mb-2" id="btnApply" data-lang onclick="fn_bokhakPossibleChk('C')">신청</button>
						</div>
					</div>
				</div>

				<div class="accordion mt-4">
					<div class="card">
						<div class="card-header" id="heading1">
							<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true"
								data-controls="collapse1">복학안내</button>
						</div>
						<div id="collapse1" class="collapse show" aria-labelledby="heading1">
							<div class="card-body">
								<ul class="list list-style-1">
									<li>휴학한 학생은 휴학기간이 만료되거나 그 사유가 종료된 경우 복학하여야 한다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="heading2">
							<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse2" data-expanded="false"
								data-controls="collapse2">예비군대원 신고안내</button>
						</div>
						<div id="collapse2" class="collapse show" aria-labelledby="heading2">
							<div class="card-body">
								<ul class="list list-style-1">
									<li class="text-danger">학생예비군편성 누락으로 혜택을 보지 못하는 경우를 방지하기위하여 예비군메뉴에서 대원신고서를 작성하고 군번은 꼭 입력하여야 합니다.</li>
									<li>예비군 안내 바로가기</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="heading3">
							<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse3" data-expanded="false"
								data-controls="collapse3">복학 가능한 날짜</button>
						</div>
						<div id="collapse3" class="collapse show" aria-labelledby="heading3">
							<div class="card-body">
								<ul class="list list-style-1">
									<li>홈페이지 상의 학사일정 참고</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="heading4">
							<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse4" data-expanded="false"
								data-controls="collapse4">인터넷 복학 신청가능 대상 : 복학신청자(단, 1년 이상의 외국유학과 어학연수 제외)</button>
						</div>
						<div id="collapse4" class="collapse show" aria-labelledby="heading4">
							<div class="card-body">
								<ul class="list list-style-1">
									<li>현재 인터넷으로 신청 불가한 휴.복학은 기존의 방식대로 학과, 행정실을 통하여 신청</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="heading5">
							<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse5" data-expanded="false"
								data-controls="collapse5">참고사항</button>
						</div>
						<div id="collapse5" class="collapse show" aria-labelledby="heading5">
							<div class="card-body">
								<ul class="list list-style-1">
									<li>병역복학자는 제대 후 1년 이내 기간 중 해당되는 학기에 복학하지 않으면 제적되며, 학기 개시 후 전역한 학생은 수업일수 3분의 1 이내에 복학할 수 있다.</li>
									<li>한 학기 휴학 후 계속 휴학할 경우에는 복학신청 절차 없이 휴학원을 제출하면 된다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="heading6">
							<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse6" data-expanded="false"
								data-controls="collapse6">병역휴학 첨부서류 안내</button>
						</div>
						<div id="collapse6" class="collapse show" aria-labelledby="heading6">
							<div class="card-body">
								<ul class="list list-style-1">
									<li>전역일자 조회물 출력(병무청홈페이지), 병역사항이 기재된 초본, 전역예정증명서, 병적증명서, 전역증 사본(앞뒷면모두) 등</li>
								</ul>
							</div>
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
	    <td>#:APPLY_DATE#</td>
	    <td class="text-left"><a href="#popup">#:CHG_APPLY_REASON_NM#</a></td>
  		<td># if( :STA_GCD== "0001") {# <button class="badge badge-pil badge-warning" type="button">접수</button>#} 
				  else if ( :STA_GCD == "0002") {# <button class="badge badge-pil badge-primary" type="button">학과승인</button>#} 
				  else if ( :STA_GCD == "0003" || :STA_GCD == "0004") {# <button class="badge badge-pil badge-success" type="button">최종승인</button> #} 
				  else if ( :STA_GCD == "0005" || :STA_GCD == "0006" || :STA_GCD == "0007" || :STA_GCD == "0008") {# <button class="badge badge-pil badge-danger" type="button">반려</button> #}#
		</td>
	    <td class="applyDate">#:APPROVE_DT#</td>
	    <td class="text-left">#:APPROVE_NONPSBL_REASON_COMMENT#</td>
	</tr>
</script>
<script type="text/javascript">
	/* 전역변수 */
	var paramData = {};
	var hyuhakSchdYn = "N"; // 휴복학신청기간 여부 
	var stdtInfo = [];

	function fn_initScreen() {
		fn_sch();
		
		// 휴학상태가 아닐 때 신청버튼 hide
		if(scwin.loginUser.hjStaGcd != "0002") {
			$("#btnApply").hide();	
		}
	}

	/* 진행단계 템플릿 */
	function fn_setTemplate(obj) {
		var trData = $(obj).data();

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
			} else if ($(obj).attr("class") == "0003") { // 대학승인
				$("#level3").find(".badge-primary").closest("div").show();
				$("#level3").find(".badge-warning").closest("div").hide();
				$("#level3").removeClass("disabled");
			}
			$("#level2").find(".badge-primary").closest("div").show();
			$("#level2").find(".badge-warning").closest("div").hide();
			$("#level1").removeClass("disabled");
			$("#level2").removeClass("disabled");
		} else if ($(obj).attr("class") == "0007" || $(obj).attr("class") == "0008") {
			if ($(obj).attr("class") == "0007") { // 학과승인불가
				$("#level3").find("div:not(:first)").hide();
				$("#level3").addClass("disabled");
			} else if ($(obj).attr("class") == "0008") { // 대학승인불가
				$("#level3").find(".badge-primary").closest("div").hide();
				$("#level3").find(".badge-warning").closest("div").show();
				$("#level3").removeClass("disabled");
			}
			$("#level2").find(".badge-primary").closest("div").hide();
			$("#level2").find(".badge-warning").closest("div").show();
			$("#level2").removeClass("disabled");
		}
		$("#level1").find("span").html(trData.APPLY_DT);
		$("#level2").find(".badge-primary").next("span").html(trData.APPROVE_DATE_DEPT);
		$("#level2").find(".badge-warning").next("span").html(trData.APPROVE_DATE_DEPT);
		$("#level3").find(".badge-primary").next("span").html(trData.APPROVE_DATE_COLL);
		$("#level3").find(".badge-warning").next("span").html(trData.APPROVE_DATE_COLL);
	}

	/* 복학신청내역 조회 */
	function fn_sch(data) {
		// 페이징 정보 담기 
		$.each(scwin.pageInfo, function(k, v) {
			paramData[k] = v;
		});
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/hjchnge/bokhakApply/selectListBokhakApply",
			reqData : paramData,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data[0])) {
					stdtInfo = data[0][0]; // 학생정보

					$("#NM").html(scwin.loginUser.nm);
					$("#HJ_STA_GCD_NM").html(scwin.loginUser.hjStaGcdKorNm);

					scwin.bokhakList = data[1]; // 휴학신청목록
					scwin.authornStepGcd = stdtInfo.AUTHORN_STEP_GCD;

					$("#resultTbody").listView({
						dataSource : scwin.bokhakList,
						emptyComment : '복학신청내역이 없습니다',
						dataBound : function(e) {
							// 접수 상태일 때만 수정, 신청취소 가능
							$("#resultTbody tr[class='0001']").find("td:eq(3)").bind("click", function(e) {
								scwin.detailObj = {};
								scwin.detailObj = $(this).closest("tr").data();
								fn_getSessionInfo("U");
								fn_openPopup("U");
							});
							totalCnt = responseData.pageInfo.totCnt;
							currentData = scwin.bokhakList;
						},
						template : $("#resultTemplate"),
						totalCnt : responseData.totalCnt,
						paging : {
							pageInfo : responseData.pageInfo,
							reqData : responseData.reqData,
							func : "fn_sch"
						},
					});

					// 결제 템플릿 디자인 세팅
					if (gfn_str_parseNull(scwin.authornStepGcd) == "0001") {
						$("#level2").find("strong").html("03. 최종승인/반려");
						$("#level3").hide();
					}

					// 첫번째 row 선택
					if (!gfn_com_isEmptyObject(scwin.bokhakList)) {
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
			}
		});
	}

	/* 복학신청팝업 함수 */
	function fn_openPopup(param) {		
	
		if (param == "C") {
			scwin.rowState = 'C';
			scwin.detailObj = {};
			// 세션데이터 담기
			fn_getSessionInfo(param);
		}

		if (param == "U") {
			scwin.rowState = 'U';
		}

		// 페이징 정보 담기
		$.each(stdtInfo, function(k, v) {
			scwin.detailObj[k] = v;
		})

		gfn_com_modalPopup({
			width : 1200,
			height : 800,
			index : 1,
			target : null,
			title : "복학신청",
			include : "/html/ost/hj/hjchnge/BokhakApplyPop.html"
		});
	}

	/* 세션 정보 담는 함수 */
	function fn_getSessionInfo(param) {
		scwin.detailObj.STDT_NO = scwin.loginUser.userId;
		scwin.detailObj.STDT_KOR_NM = scwin.loginUser.nm;
		scwin.detailObj.STDT_INFO = scwin.loginUser.userId + '(' + scwin.loginUser.nm + ')';
		scwin.detailObj.DEPT_NM = scwin.loginUser.collGradGcdKorNm;

		// 대학일 때는 학년, 대학원일 때는 학기
		if (scwin.loginUser.collGradGcd == "0001") {
			scwin.detailObj.DEPT_NM += scwin.loginUser.collCdKorNm + " " + scwin.loginUser.deptCdKorNm + " "
					+ gfn_str_parseNull(scwin.loginUser.majorCdKorNm) + " " + "(" + scwin.loginUser.degCourseGcdKorNm + ")";
			scwin.detailObj.STDT_YEAR_NM = scwin.loginUser.stdtYearGcdKorNm;
		} else {
			scwin.detailObj.DEPT_NM += scwin.loginUser.gradGcdKorNm + " " + scwin.loginUser.collCdKorNm + " " + scwin.loginUser.deptCdKorNm + " "
					+ gfn_str_parseNull(scwin.loginUser.majorCdKorNm) + " " + "(" + scwin.loginUser.degCourseGcdKorNm + ")";
			scwin.detailObj.STDT_YEAR_NM = gfn_com_parseNull(scwin.loginUser.atlectTermCnt) + "학기";
		}
		scwin.detailObj.HJ_STA_NM = scwin.loginUser.hjStaGcdKorNm;
		if (param == "C") {
			scwin.detailObj.APPLY_SYEAR = stdtInfo.BOKHAK_SYEAR;
			scwin.detailObj.APPLY_TERM_GCD = stdtInfo.BOKHAK_TERM_GCD;
			scwin.detailObj.APPLY_TERM_NM = stdtInfo.BOKHAK_TERM_NM;
			scwin.detailObj.APPLY_SYEAR_TERM = stdtInfo.BOKHAK_SYEAR_TERM;
			// 신규일 때는 계산된 휴학학기수 바인딩
			scwin.detailObj.HYUHAK_TERM_CNT = stdtInfo.CAL_HYUHAK_TERM_CNT;
			scwin.detailObj.CHG_APPLY_REASON_GCD = stdtInfo.CAL_CHG_APPLY_REASON_GCD;

			// 현재날짜 세팅
			var today = new Date();
			scwin.detailObj.APPLY_YEAR = today.getFullYear();
			scwin.detailObj.APPLY_MONTH = today.getMonth() + 1;
			scwin.detailObj.APPLY_DAY = today.getDate();
		}
	}
	
	/* 복학가능여부 조회 */
	function fn_bokhakPossibleChk(type) {
		
		var param = {};

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/hjchnge/bokhakApply/selectBokhakPosibleYn",
			reqData : param,
			success : function(data, responseData) {
				if (data.O_RSLT == "N") {
					alert(data.O_MSG);
					return;
				} 
				fn_openPopup(type);				
			}
		});
	}	
</script>