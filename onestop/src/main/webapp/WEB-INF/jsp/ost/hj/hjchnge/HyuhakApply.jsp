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
				<!-- 학적상태 안내문 -->
				<section class="sec-2">
					<header>
						<h3 class="sec-title"></h3>
					</header>
					<div class="sec-body">
						<div class="message-box">
							<div class="message-box-inner">
								<div class="message-body">
									<span class="dfn" id="NM"></span> 님의 누적 휴학학기수는 <span class="dfn" id="HYUHAK_ACC_CNT"></span> 학기 이며, 휴학 가능한 학기수는 <span class="dfn"
										id="HYUHAK_CNT"></span> 학기 입니다.
								</div>
							</div>
						</div>
					</div>
				</section>
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
						<div class="text-left">
							<span class="info-text" data-lang>휴학 승인여부가 
								<span class="badge badge-pil badge-warning ml-1" style="border: 1px solid #000000;">접수</span>
								이면 소속학과 사무실로, 
								<span class="badge badge-pil badge-primary ml-1" style="border: 1px solid #000000;">학과승인</span>
								이면 소속 단과대학 행정실로 문의하시기 바랍니다.
							</span>
						</div>
					</div>
				</section>
				<!-- /END 진행 단계 템플릿 -->
				<!-- 테이블 -->
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>휴학신청내역</caption>
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
									<th scope="col">휴학사유</th>
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
							<button class="btn btn-primary mb-2" data-lang onclick="fn_openPopup('C')">신청</button>
						</div>
					</div>
				</div>

				<div class="accordion mt-4">
					<div class="card">
						<div class="card-header" id="heading1">
							<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true"
								data-controls="collapse1">휴학안내</button>
						</div>
						<div id="collapse1" class="collapse show" aria-labelledby="heading1">
							<div class="card-body">
								<ul class="list list-style-1">
									<li>성적우수장학금은 선발 학기 미등록(등록금 미납) 휴학 시 수혜되지 않으며, 장학금은 이월되지 않습니다.</li>
									<li>학생은 학기 개시일로부터 총 수업일수의 2분의 1 이내에 휴학할 수 있습니다.<br /> 다만, <span class="text-danger">학사과정과 의학전문대학원 의학과와 복합과정, 치의학전문대학원 치의학과와
											복합과정, 한의학전문대학원 한의학과와 복합과정, 법학전문대학원 법학과 석사과정, 학·석사통합과정 중 학사과정 신입생</span>은 입학 후 첫째 학기에는 휴학할 수 없습니다.
									</li>
									<li>등록금을 납부하고 휴학을 신청하는 학생 중 <span class="text-danger">아래의 장학금을 수혜한 경우에는 반드시 장학담당자에게 내용을 확인한 후 휴학절차를 진행</span>하여 주시기 바랍니다.(※확인처 : 학생과 장학팀
										510-1237, 1282)
									</li>
									<li><span class="dfn">대상장학금</span>
										<p>
											<span class="dfn"> - 국가우수장학금(대통령과학, 이공계, 인문100년, 예술체육비전)</span><br /> <span class="dfn"> - 중소기업 취업연계 장학금(희망사다리 Ⅰ 유형)</span><br /> <span
												class="dfn"> - 고졸후학습자 장학금(희망사다리 Ⅱ 유형)</span>
										</p></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="heading2">
							<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse2" data-expanded="false"
								data-controls="collapse2">복학 가능한 날짜</button>
						</div>
						<div id="collapse2" class="collapse show" aria-labelledby="heading2">
							<div class="card-body">
								<ul class="list list-style-1">
									<li>홈페이지 상의 학사일정 참고</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="heading3">
							<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse3" data-expanded="false"
								data-controls="collapse3">참고사항</button>
						</div>
						<div id="collapse3" class="collapse show" aria-labelledby="heading3">
							<div class="card-body">
								<ul class="list list-style-1">
									<li>일반휴학자의 경우, 한 학기 휴학 후(당초 1학기 휴학만 신청하였을 경우) 1학기 더 휴학을 원할 때에는 복학 신청 없이 바로 휴학신청이 가능</li>
									<li>현금등록을 필하고 휴학신청을 한 후 허가를 받은 학생의 그 학기 납입금은 복학하는 학기로 이월됨</li>
									<li>병역휴학자의 경우 기말고사 시작 전 까지 휴학 신청 가능</li>
									<li>질병휴학 등 일반 및 병역휴학이 아닌 경우, 대면 신청만 가능. 자세한 사항은 [학적 <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 학적변동 <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 일반휴학] 메뉴의 신청절차 참고</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="heading4">
							<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse4" data-expanded="false"
								data-controls="collapse4">병역휴학 첨부서류 안내</button>
						</div>
						<div id="collapse4" class="collapse show" aria-labelledby="heading4">
							<div class="card-body">
								<ul class="list list-style-1">
									<li>입영일자/결과조회(학사업무용)출력물(병무청홈페이지) 또는 입영통지서 사본 또는 군복무확인서 등</li>
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
	var stdtInfo = [];
	function fn_initScreen() {
		fn_sch();
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

	/* 휴학신청내역 조회 */
	function fn_sch(data) {
		// 페이징 정보 담기 
		$.each(scwin.pageInfo, function(k, v) {
			paramData[k] = v;
		});
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/hjchnge/hyuhakApply/selectListHyuhakApply",
			reqData : paramData,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data[0])) {
					stdtInfo = data[0][0]; // 학생정보
					scwin.HYUBOKHAK_SCHD_YN = stdtInfo.HYUBOKHAK_SCHD_YN; // 휴복학신청기간여부

					$("#NM").html(scwin.loginUser.nm);
					$("#HYUHAK_ACC_CNT").html(stdtInfo.HYUHAK_ACC_CNT);
					$("#HYUHAK_CNT").html(stdtInfo.HYUHAK_CNT);

					scwin.hyuhakList = data[1]; // 휴학신청목록
					scwin.authornStepGcd = stdtInfo.AUTHORN_STEP_GCD;
					scwin.milServeBmList = responseData.milServeBmList;

					$("#resultTbody").listView({
						dataSource : scwin.hyuhakList,
						emptyComment : '휴학신청내역이 없습니다',
						dataBound : function(e) {
							// 접수 상태일 때만 상세보기 가능
							$("#resultTbody tr[class='0001']").find("td:eq(3)").bind("click", function(e) {
								scwin.detailObj = {};
								scwin.detailObj = $(this).closest("tr").data();
								fn_getSessionInfo("U");
								fn_openPopup("U");
							});
							totalCnt = responseData.pageInfo.totCnt;
							currentData = scwin.hyuhakList;
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
					if (scwin.hyuhakList.length > 0) {
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
	
	/* 휴학가능여부 조회 */
	function fn_hyuhakPossibleChk(type) {
		
		var data = {APPLY_SYEAR : stdtInfo.HYUHAK_SYEAR,
						  APPLY_TERM_GCD : stdtInfo.HYUHAK_TERM_GCD};		
			
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/hjchnge/hyuhakApply/selectHyuhakPosibleYn",
			reqData : data,
			success : function(data, responseData) {
				if (data.O_RSLT == "N") {
					alert(data.O_MSG);
					return;
				}
				fn_openPopup(type);
			}
		});
	}	

	/* 휴학신청팝업 함수 */
	function fn_openPopup(param) {

		if (param == "C") {
			scwin.rowState = 'C';
			scwin.detailObj = {};
			// 세션데이터 담기
			fn_getSessionInfo(param);
		} else if (param == "U") {
			scwin.rowState = 'U';
		}

		// 학생정보담기
		$.each(stdtInfo, function(k, v) {
			scwin.detailObj[k] = v;
		})

		gfn_com_modalPopup({
			width : 1200,
			height : 800,
			index : 1,
			target : null,
			title : "휴학신청",
			include : "/html/ost/hj/hjchnge/HyuhakApplyPop.html"
		});
	}

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
			scwin.detailObj.APPLY_SYEAR = stdtInfo.HYUHAK_SYEAR;
			scwin.detailObj.APPLY_TERM_GCD = stdtInfo.HYUHAK_TERM_GCD;
			scwin.detailObj.APPLY_TERM_NM = stdtInfo.HYUHAK_TERM_NM;
			scwin.detailObj.APPLY_SYEAR_TERM = stdtInfo.HYUHAK_SYEAR_TERM;

			scwin.detailObj.SUPPOSE_SYEAR = stdtInfo.HYUHAK_SYEAR;
			scwin.detailObj.SUPPOSE_TERM_GCD = stdtInfo.HYUHAK_TERM_GCD;
			scwin.detailObj.SUPPOSE_TERM_NM = stdtInfo.HYUHAK_TERM_NM;
			// 현재날짜 세팅
			var today = new Date();
			scwin.detailObj.APPLY_YEAR = today.getFullYear();
			scwin.detailObj.APPLY_MONTH = today.getMonth() + 1;
			scwin.detailObj.APPLY_DAY = today.getDate();
		}
		if (scwin.detailObj.CHG_APPLY_REASON_GCD != "0006") {
			scwin.detailObj.MIL_CLASS_GCD = "";
			scwin.detailObj.MIL_SERVE_BM_CNT = "";
		}
	}
</script>