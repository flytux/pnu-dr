<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
					<h2 class="sec-title">계절수업 수요조사</h2>
				</div>
				<div class="header-item"></div>
			</header>
			<!-- /END CONTENT HEADER -->

			<!-- CONTENT BODY -->
			<div class="sec-body">
				<div class="form-row btn-box-right">
					<div class="col-auto mb-1">
						<a class="link link-style-1" href="javascript:void(0);" onclick="fn_openPopup()">신청결과보기</a>
					</div>
				</div>
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn"></span><span id="SP_SYEAR"></span>학년도 <span id="SP_TERM"></span>에 개설을 원하는 강좌를 신청하십시오.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table"  data-show-column="true">
							<caption>내가 원하는 계절수업 개설신청 교과목</caption>
							<colgroup>
								<col style="min-width: 50px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 150px;">
								<col style="min-width: 100px;">
								<col style="min-width: 150px;">
								<col style="min-width: 200px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">교과목구분</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">학점</th>
									<th scope="col">주관학과</th>
									<th scope="col">선택</th>
								</tr>
							</thead>
							<tbody id="applySubjTbody"></tbody>
						</table>
					</div>
				</div>
				<div class="btn-box">
					<div class="form-row btn-box-right">
						<div class="col-auto">
							<button class="btn btn-delete mb-2" onclick="javascript:return fn_applyDelete();" data-lang>삭제</button>
						</div>
					</div>
				</div>
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn"></span>[ 계절수업신청대상 과목 :: 최대 2과목까지 신청 가능합니다. ]</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-4" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-4">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_GUBUN" data-lang>검색방법</label>
								</div>
								<div class="b-con-box" role="cell" aria-colspan="7">
									<select id="SCH_GUBUN" class="form-control">
										<option value="1">교양선택</option>
										<option value="2">교양필수(정보화소양)</option>
										<option value="3">전공기초/전공/교직과목(1,2,3,4학년)</option>
										<option value="4">과목명으로검색</option>
									</select>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-4">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="AREA_GCD" data-lang>영역구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="AREA_GCD" class="form-control" ></select>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-4">
								<div class="b-title-box" role="rowheader">
									<label class="req" data-lang>교과목명</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" class="form-control" id="SUBJ_NM" />
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" data-lang>대학/대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="" data-lang>대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_GRAD_GCD" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="" data-lang>단과대학</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_CD" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="" data-lang>학과(부)/전공</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_DEPT_CD" class="form-control" />
								</div>
							</div>
						</div>
					</div>
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button" onclick="javascript:return fn_sclassSubjSch();" data-lang>조회</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /END 검색 영역 -->
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-show-column="true">
							<caption>계절수업 수요조사 교과목</caption>
							<colgroup>
								<col style="min-width: 50px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 150px;">
								<col style="min-width: 100px;">
								<col style="min-width: 150px;">
								<col style="min-width: 200px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">교과목구분</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">학점</th>
									<th scope="col">주관학과</th>
									<th scope="col">선택</th>
								</tr>
							</thead>
							<tbody id="sclassSubjTbody"></tbody>
						</table>
					</div>
				</div>
				<div class="btn-box">
					<div class="form-row btn-box-right">
						<div class="col-auto">
							<button class="btn btn-search mb-3" onclick="javascript:return fn_applySave();" data-lang>신청</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /END CONTENT  BODY-->
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="applySubjTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:SUBJ_GCD_NM#</td>
	    <td>#:SUBJ_NM#</td>
		<td>#:SUBJ_NO#</td>
		<td>#:CRDT#</td>
		<td>#:MNG_DEPT_NM#</td>
		<td><input type="checkbox" name="applyChk" title="#:SUBJ_NM#"></td>
	</tr>
</script>
<script type="text/x-tbody-template" id="sclassSubjTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:SUBJ_GCD_NM#</td>
	    <td>#:SUBJ_NM#</td>
		<td>#:SUBJ_NO#</td>
		<td>#:CRDT#</td>
		<td>#:MNG_DEPT_NM#</td>
		<td><input type="checkbox" name="subjChk" title="#:SUBJ_NM#"></td>
	</tr>
</script>
<script type="text/javascript">
	/* 전역변수 */
	var paramData = {
		
	};

	function fn_initScreen() {

		fn_applySubjSch();
		
		gfn_com_assignCombo({
			collGradGcd : $("#SCH_COLL_GRAD_GCD"),
			gradGcd : $("#SCH_GRAD_GCD"),
			collCd : $("#SCH_COLL_CD"),
			deptCd : $("#SCH_DEPT_CD"),
			deptCdExtUrl : {
        		url:"/core/function/getAssignComboDeptMajorCdInfo"
        	},
			comboLvl : 4,
			dataBound : function(e) {
// 미완성(2023.04.13.)
// 				if(scwin.loginUser.majorCd != null){
// 					$("#SCH_DEPT_CD").val(scwin.loginUser.majorCd);
// 				}
			}
		});

		$("#AREA_GCD").dropDownList({
			dataSource : null,
			commonCode : "0001_AREA_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			expnCondition : "AND ISNULL(CHAR_1_CONTENT, '0000') <= '2021' AND '2021' < ISNULL(CHAR_3_CONTENT, '9999')",
			hakbuGradFg : false,
			dataBound : function(e) {

			}
		});
		
		$("#AREA_GCD").closest(".b-row-box").show();
		$("#SUBJ_NM").closest(".b-row-box").hide();
		$("#SCH_COLL_GRAD_GCD").closest(".b-row-box").hide();

		/*  검색방법 변경 시 이벤트 */
		$("#SCH_GUBUN").change(function() {
			var schGubun = $(this).val();
			if (schGubun == "1") {
				$("#AREA_GCD").closest(".b-row-box").show();
				$("#SUBJ_NM").closest(".b-row-box").hide();
				$("#SCH_COLL_GRAD_GCD").closest(".b-row-box").hide();
			} else if (schGubun == "2") {
				$("#AREA_GCD").closest(".b-row-box").hide();
				$("#SUBJ_NM").closest(".b-row-box").hide();
				$("#SCH_COLL_GRAD_GCD").closest(".b-row-box").hide();
			} else if (schGubun == "3") {
				$("#AREA_GCD").closest(".b-row-box").hide();
				$("#SUBJ_NM").closest(".b-row-box").hide();
				;
				$("#SCH_COLL_GRAD_GCD").closest(".b-row-box").show();
			} else {
				$("#AREA_GCD").closest(".b-row-box").hide();
				$("#SUBJ_NM").closest(".b-row-box").show();
				$("#SCH_COLL_GRAD_GCD").closest(".b-row-box").hide();
			}
		});
	}

	/* 내가 신청한 계절수업 개설신청 교과목 목록 조회 */
	function fn_applySubjSch(data) {
		// 페이징 정보 담기 
		$.each(scwin.pageInfo, function(k, v) {
			paramData[k] = v;
		});
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/subjApplyInvstgt/sclassApplyInvstgt/selectListApplySubj",
			reqData : paramData,
			success : function(data, responseData) {
				scwin.termInfo = responseData.termInfo;
				var schdYn = data[0][0].SCLASS_SCHD_YN; 		// 학사일정

				if(gfn_str_parseNull(schdYn) == "N") {
					
					alert('교과목 수요조사 기간이 아닙니다.',function(){ location.href="/" });		
					//alert("교과목 수요조사 기간이 아닙니다.");
					//location.href="/";
					return false;
				}else {
					// 신청 안내문구 표기
					$("#SP_SYEAR").html(scwin.termInfo.SYEAR);
					if(scwin.termInfo.TERM_GCD == "0011") {
						$("#SP_TERM").html("여름계절수업");
					}else {
						$("#SP_TERM").html("겨울계절수업");
					}

					$("#applySubjTbody").listView({
						dataSource : data[1],
						emptyComment : '현재 신청한 교과목이 없습니다.',
						dataBound : function(e) {
							totalCnt = responseData.pageInfo.totCnt;
							currentData = data;
						},
						template : $("#applySubjTemplate"),
						totalCnt : responseData.totalCnt,
					});
				}
			}
		});
	}

	/* 계절수업 수요조사 교과목목록 조회 */
	function fn_sclassSubjSch(data) {

		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
			data["SYEAR"] = scwin.termInfo.SYEAR;
		}

		/* 필수체크 */
		var valObj = [ {
			"id" : "SCH_GUBUN",
			"name" : "검색방법",
			"notNull" : true
		} ];

		if ($("#SCH_GUBUN").val() == "1") {
			valObj.push({
				"id" : "AREA_GCD",
				"name" : "영역구분",
				"notNull" : true,
			});
		} else if ($("#SCH_GUBUN").val() == "3") {
			valObj.push({
				"id" : "SCH_COLL_GRAD_GCD",
				"name" : "대학",
				"notNull" : true,
			}, {
				"id" : "SCH_GRAD_GCD",
				"name" : "대학원구분",
				"notNull" : true,
			}, {
				"id" : "SCH_COLL_CD",
				"name" : "단과대학",
				"notNull" : true,
			}, {
				"id" : "SCH_DEPT_CD",
				"name" : "학과(전공)",
				"notNull" : true,
			});
		} else if ($("#SCH_GUBUN").val() == "4") {
			valObj.push({
				"id" : "SUBJ_NM",
				"name" : "교과목명",
				"notNull" : true,
			});
		}

		if (!gfn_val_validateDataMap(data, valObj))
			return false;

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/subjApplyInvstgt/sclassApplyInvstgt/selectListSclassSubj",
			reqData : data,
			success : function(data, responseData) {
				$("#sclassSubjTbody").listView({
					dataSource : data,
					emptyComment : '해당 검색방법과 조건에 일치하는 교과목이 존재하지 않습니다.',
					dataBound : function(e) {
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;
					},
					template : $("#sclassSubjTemplate"),
					totalCnt : responseData.totalCnt,
					paging : {
						pageInfo : responseData.pageInfo,
						reqData : responseData.reqData,
						func : "fn_sclassSubjSch"
					},
				});
			}
		});
	}

	/* 저장 유효성 체크 */
	function fn_saveValidate() {

		if ($("input[name='subjChk']:checked").length <= 0) {
			alert("신청할 교과목을 선택하지 않으셨습니다.");
			return;
		}

		if ($("#applySubjTbody tr").length >= 2) {
			alert("이미 2개의 계절수업개설교과목신청을 하셨습니다.");
			return;
		}

		if (($("input[name='subjChk']:checked").length + $("#resultTbody tr").length) > 2) {
			alert("계절수업 교과목 신청은 2개까지 가능합니다. \n 다시 신청해주십시오.");
			return;
		}
		return true;
	}

	/* 계절학기 수요조사 저장 함수 */
	function fn_applySave() {

		if (!fn_saveValidate())
			return false;

		confirm(gva_SAVE_CONFIRM_MSG, function(_flag) {
			if (_flag) {
				scwin.rowState = "C";
				// 체크된 행 List로 구현
				var paramList = [];

				for (var i = 0; i < $("input[name='subjChk']:checked").closest('tr').length; i++) {
					var paramObj = $("input[name='subjChk']:checked").closest('tr').eq(i).data();
					paramObj["rowState"] = scwin.rowState;
					paramObj["SYEAR"] = scwin.termInfo.SYEAR;
					paramObj["TERM_GCD"] = scwin.termInfo.TERM_GCD;

					paramList.push(paramObj);
				}
				fn_applyExecuteCallback(paramList);
			}
		});
	}

	/* 내가 신청한 계절수업 삭제 함수 */
	function fn_applyDelete() {

		if ($("#applySubjTbody tr").length <= 0) {
			alert("삭제할 교과목을 선택하지 않으셨습니다.");
			return;
		}

		confirm(gva_DELETE_CONFIRM_MSG, function(_flag) {
			if (_flag) {
				scwin.rowState = "D"
				// 체크된 행 List로 구현
				var paramList = [];

				for (var i = 0; i < $("input[name='applyChk']:checked").closest('tr').length; i++) {
					var paramObj = $("input[name='applyChk']:checked").closest('tr').eq(i).data();

					paramObj["rowState"] = scwin.rowState;
					paramObj["SYEAR"] = scwin.termInfo.SYEAR;
					paramObj["TERM_GCD"] = scwin.termInfo.TERM_GCD;

					paramList.push(paramObj);
				}
				fn_applyExecuteCallback(paramList);
			}
		});
	}

	/* 휴학가능여부 조회 */
	function fn_applyExecuteCallback(paramList) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/subjApplyInvstgt/sclassApplyInvstgt/executeSubjApply",
			reqData : paramList,
			success : function(data, responseData) {
				alert(data.O_MSG);
				// 신청 완료
				if (data.O_RSLT == "Y") {
					fn_applySubjSch();
					fn_sclassSubjSch();
				}
			}
		});
	}
	
	/* 신청결과보기 팝업 함수 */
	function fn_openPopup(param) {

		gfn_com_modalPopup({
			width : 1200,
			height : 800,
			index : 1,
			target : null,
			title : "계절수업 수요조사 결과",
			include : "/html/ost/cls/subjApplyInvstgt/SclassApplyInvstgtPop.html"
		});
	}
</script>