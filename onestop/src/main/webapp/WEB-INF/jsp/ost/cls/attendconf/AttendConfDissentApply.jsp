<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
					<h2 class="sec-title">출결확인 및 이의신청</h2>
				</div>
				<div class="header-item"></div>
			</header>
			<!-- /END CONTENT HEADER -->

			<!-- CONTENT BODY -->
			<div class="sec-body">
				<section class="sec-3">
					<header>
						<h4 class="sec-title">기본정보</h4>
					</header>
					<div class="sec-body">
						<div class="b-table-box flex-col-3" id="stdtInfoTable" role="table" aria-label="기본정보 테이블">
							<div class="b-row-box" role="row">
								<div class="b-row-item merge-3">
									<div class="b-title-box" role="rowheader">
										<label data-lang>소속(과정)</label>
									</div>
									<div class="b-con-box" role="cell">
										<span data-bind="text: DEPT_NM"></span>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label data-lang>학번(성명)</label>
									</div>
									<div class="b-con-box" role="cell">
										<span data-bind="text: STDT_INFO"></span>
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label id="lbl_STDT_YEAR_NM" data-lang>학년</label>
									</div>
									<div class="b-con-box" role="cell">
										<span data-bind="text: STDT_YEAR_NM"></span>
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label data-lang>학적상태</label>
									</div>
									<div class="b-con-box" role="cell">
										<span data-bind="text: HJ_STA_NM"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-1" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>신청 학년도/학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="row">
										<div class="col-6">
											<select id="SCH_SYEAR" class="form-control" title="학년도선택" onchange="fn_schdInfoSch();" >
											</select>
										</div>
										<div class="col-6">
											<select id="SCH_TERM_GCD" class="form-control" title="학기선택" onchange="fn_schdInfoSch();" >
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<!-- /END 검색 영역 -->
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn"></span><span id="SP_SYEAR"></span>학년도 <span id="SP_TERM_GCD_NM"></span>신청기간입니다.&nbsp;<span id="SP_APPLY_PERIOD"></span></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="btn-box">
					<div class="form-row btn-box-right">
						<div class="col-auto">
							<button class="btn search-btn" id="btnApply" onclick="javascript:return fn_openPopup();" data-lang>신청</button>
						</div>
					</div>
				</div>
				<section class="sec-3">
					<header>
						<h4 class="sec-title">출결 이의신청 내역</h4>
					</header>
					<div class="sec-body">
						<div class="table-box">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table" >
									<caption>출결 이의신청 내역</caption>
									<colgroup>
										<col style="min-width: 50px;">
										<col style="min-width: 150px;">
										<col style="min-width: 100px;">
										<col style="min-width: 120px;">
										<col style="min-width: 100px;">
										<col style="min-width: 150px;">
										<col style="min-width: 100px;">
										<col style="min-width: 120px;">
										<col style="min-width: 200px;">
										<col style="min-width: 100px;">
										<col style="min-width: 120px;">
										<col style="min-width: 200px;">
										<col style="min-width: 100px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">No</th>
											<th scope="col">교과목명</th>
											<th scope="col">교과목번호</th>
											<th scope="col">강의일자</th>
											<th scope="col">요일</th>
											<th scope="col">수업시간</th>
											<th scope="col">출결</th>
											<th scope="col">신청일자</th>
											<th scope="col">이의신청사유</th>
											<th scope="col">진행상태</th>
											<th scope="col">결과</th>
											<th scope="col">반려사유</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody id="dissApplyTbody"></tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- /END CONTENT  BODY-->
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="dissApplyTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:SUBJ_NM#</td>
	    <td>#:SUBJ_NO#</td>
		<td>#:LECT_DATE_FORMAT#</td>
		<td>#:DAY_GCD_NM#</td>
		<td>#:LECT_TIME#</td>
		<td>#:APPLY_ATTEND_GCD_NM#</td>
		<td>#:APPLY_DATE#</td>
		<td>#:APPLY_REASON_GCD_NM#</td>
		<td>#:ATTEND_REQ_STA_GCD_NM#</td>
		<td>#:CONF_ATTEND_GCD_NM#</td>
		<td>#:NONPSBL_REASON_COMMENT#</td>
		<td>#  if ( :ATTEND_REQ_STA_GCD == "0001") {# <button class="badge badge-pil badge-secondary" type="button">삭제</button>#} 
				else{# <button class="badge badge-pil badge-secondary" disabled>삭제</button> #}#
		</td>
	</tr>
</script>
<script type="text/javascript">
	var date = new Date();

	function fn_initScreen() {
		fn_getSessionInfo();

		gfn_com_dataBind($("#stdtInfoTable"), scwin.sessionObj);

		/*학년도/학기 바인딩*/
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : "2021",
				"ENDYEAR" : date.getFullYear()
			},
			success : function(data, responseData) {
				$("#SCH_SYEAR").dropDownList({
					dataSource : data,
					commonCode : "",
					dataTextField : "LABEL",
					dataValueField : "CODE",
					optionLabel : "",
					optionValue : "",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {
						scwin.termInfo = responseData.termInfo;
						$("#SCH_SYEAR").val(scwin.termInfo.SYEAR);
					}
				});
				$("#SCH_TERM_GCD").dropDownList({
					dataSource : null,
					commonCode : "0001_TERM_GCD",
					dataTextField : "COMMON_DETAIL_CD_KOR_NM",
					dataValueField : "COMMON_DETAIL_CD",
					optionLabel : "",
					optionValue : "",
					defaultValue : "",
					expnCondition : "AND COMMON_DETAIL_CD IN ('0010', '0020', '0011', '0021') AND CHAR_1_CONTENT LIKE '%B%' ",
					dataBound : function(e) {
						$("#SCH_TERM_GCD").val(scwin.termInfo.TERM_GCD);
						fn_schdInfoSch();
					}
				});
			}
		});
	}

	/* 학사일정 조회 */
	function fn_schdInfoSch() {
		var param = gfn_com_inputdata($(".search-box"));
		
/* 		var paramData = {
			"SYEAR" : scwin.termInfo.SYEAR,
			"TERM_GCD" : scwin.termInfo.TERM_GCD,
		}; */
		
		var paramData = {
				"SYEAR" : param.SCH_SYEAR,
				"TERM_GCD" : param.SCH_TERM_GCD
			};

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/attendconf/attendConfDissentApply/selectSchdInfo",
			reqData : paramData,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data)) {
					//$("#SP_SYEAR").html(scwin.termInfo.SYEAR);
					//$("#SP_TERM_GCD_NM").html(scwin.termInfo.TERM_GCD_KOR_NM + " ");
					
					$("#SP_SYEAR").text($("#SCH_SYEAR option:checked").text());
					$("#SP_TERM_GCD_NM").text($("#SCH_TERM_GCD option:checked").text());
					
					$("#SP_APPLY_PERIOD").html(
							"(" + gfn_str_replaceAll(data.START_DT, "-", ".") + "~" + gfn_str_replaceAll(data.CLOSE_DT, "-", ".") + ")");

					// 신청가능여부에 따른 신청버튼 제어
					if (gfn_str_parseNull(data.APPLY_FG) == "N") {
						alert('출결이의를 신청할 수 없습니다.\n조회만 가능합니다.');
						$("#btnApply").hide();
						//$(".message-box").hide();
						$(".message-box").show('');
					}else{
						$("#btnApply").show();
						//$(".message-box").show('');
					}
					fn_sch();
				}
			}
		});
	}

	/* 출결 이의신청 내역 조회 */
	function fn_sch(data) {

		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}

		/* 필수체크 */
		if (!gfn_val_validateDataMap(data, [ {
			"id" : "SCH_SYEAR",
			"name" : "학년도",
			"notNull" : true
		}, {
			"id" : "SCH_TERM_GCD",
			"name" : "학기",
			"notNull" : true
		} ]))
			return false;

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/attendconf/attendConfDissentApply/selectListAttDisApply",
			reqData : data,
			success : function(data, responseData) {
				$("#dissApplyTbody").listView({
					dataSource : data,
					emptyComment : '출결 이의신청 내역이 없습니다.',
					dataBound : function(e) {
						$("#dissApplyTbody tr").find("td .badge-secondary").bind("click", function(e) {
							scwin.detailObj = $(this).closest("tr").data();
							fn_applyDelete();
						});
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;
					},
					template : $("#dissApplyTemplate"),
					totalCnt : responseData.totalCnt,
					paging : {
						pageInfo : responseData.pageInfo,
						reqData : responseData.reqData,
						func : "fn_sch"
					},
				});
			}
		});
	}

	/* 삭제 유효성 체크 */
	function fn_deleteValidate() {

		if (scwin.detailObj.ATTEND_REQ_STA_GCD == "0006") {
			alert("승인된 자료는 삭제 할 수 없습니다.");
			return;
		} else if (scwin.detailObj.ATTEND_REQ_STA_GCD == "0009") {
			alert("반려된 자료는 삭제 할 수 없습니다.");
			return;
		} else if (scwin.detailObj.ATTEND_REQ_STA_GCD != "0001") {
			alert("처리 중인 자료는 삭제 할 수 없습니다.");
			return;
		}

		return true;
	}

	/* 출결 이의신청 삭제 함수 */
	function fn_applyDelete() {

		if (!fn_deleteValidate())
			return false;

		confirm(gva_DELETE_CONFIRM_MSG, function(_flag) {
			if (_flag) {
				/* ajax처리 */
				gfn_ajax_request({
					url : "/ost/cls/attendconf/attendConfDissentApply/deleteDissentApply",
					reqData : scwin.detailObj,
					success : function(data, responseData) {
						alert(data.O_MSG);
						// 삭제 완료
						if (data.O_RSLT == "Y") {
							fn_sch();
						}
					}
				});
			}
		});
	}

	/* 신청 팝업 함수 */
	function fn_openPopup() {

		gfn_com_modalPopup({
			width : 1000,
			height : 800,
			index : 1,
			target : null,
			title : "출결확인 및 이의신청",
			include : "/html/ost/cls/attendconf/AttendConfDissentApplyPop.html"
		});
	}

	/* 세션 정보 담기 */
	function fn_getSessionInfo() {
		scwin.sessionObj = {};
		scwin.sessionObj.STDT_NO = scwin.loginUser.userId;
		scwin.sessionObj.STDT_KOR_NM = scwin.loginUser.nm;
		scwin.sessionObj.STDT_INFO = scwin.loginUser.userId + '(' + scwin.loginUser.nm + ')';
		scwin.sessionObj.HJ_STA_NM = scwin.loginUser.hjStaGcdKorNm;
		scwin.sessionObj.DEPT_NM = scwin.loginUser.collGradGcdKorNm;

		// 대학일 때는 학년, 대학원일 때는 학기
		if (scwin.loginUser.collGradGcd == "0001") {
			scwin.sessionObj.DEPT_NM += scwin.loginUser.collCdKorNm + " " + scwin.loginUser.deptCdKorNm + " "
					+ gfn_str_parseNull(scwin.loginUser.majorCdKorNm) + " " + "(" + scwin.loginUser.degCourseGcdKorNm + ")";
			scwin.sessionObj.STDT_YEAR_NM = scwin.loginUser.stdtYearGcdKorNm;

			$("#lbl_STDT_YEAR_NM").html("학년");
		} else {
			scwin.sessionObj.DEPT_NM += scwin.loginUser.gradGcdKorNm + " " + scwin.loginUser.collCdKorNm + " " + scwin.loginUser.deptCdKorNm + " "
					+ gfn_str_parseNull(scwin.loginUser.majorCdKorNm) + " " + "(" + scwin.loginUser.degCourseGcdKorNm + ")";
			scwin.sessionObj.STDT_YEAR_NM = gfn_com_parseNull(scwin.loginUser.atlectTermCnt) + "학기";

			$("#lbl_STDT_YEAR_NM").html("학기");
		}
	}
</script>