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
			<div class="sec-body" id="search">
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-2" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>학년도/학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="SCH_SYEAR" class="form-control" type="number" style="width: 20%;" title="학년도입력"></input>&nbsp; <select id="SCH_TERM_GCD" class="form-control" style="width: 20%;" title="학기선택"></select> <input id="SCH_STDT_NO" class="form-control" type="hidden"></input>
								</div>
							</div>
						</div>
					</div>
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
							</div>
						</div>
					</div>
					<!-- 메세지Box 영역 -->
					<div class="message-box">
						<div class="message-box-inner">
							<div class="message-body">
								<ul class="list list-style-1">
									<li><span class="dfn" data-lang></span><strong>자동신청된 교과목만 조회됩니다.</strong></li>
									<li><span class="dfn" data-lang></span>자동신청된 교과목 중 본인이 삭제한 교과목은 삭제취소되지 않습니다.</li>
									<li><span class="dfn" data-lang></span>삭제된 교과목은 수강신청 기간에 직접 수강신청할 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 메세지Box 영역 END-->
					<!-- 자동신청교과목 내역 테이블 -->
					<div id="SubjTable">
						<header>
							<h4 class="sec-title">자동신청교과목 내역</h4>
						</header>
						<div class="table-box">
							<div class="table-body">
								<table class="table" data-toggle="table">
									<caption>자동신청교과목 내역</caption>
									<colgroup>
										<col style="min-width: 50px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">NO</th>
											<th scope="col">교과목명</th>
											<th scope="col">교과목번호</th>
											<th scope="col">분반</th>
											<th scope="col">학점</th>
											<th scope="col">교과목구분</th>
											<th scope="col">강의시간</th>
											<th scope="col">재이수</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody id="resultTbody_Subj">
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<br>
					<!-- 자동신청교과목 내역 테이블 END  -->

					<!-- 자동신청교과목 삭제 내역 테이블 -->
					<div id="CancelTable" style="display: none;">
						<header>
							<h4 class="sec-title">자동신청교과목 삭제 내역</h4>
						</header>
						<div class="table-box">
							<div class="table-body">
								<table class="table" data-toggle="table">
									<caption>자동신청교과목 삭제 내역</caption>
									<colgroup>
										<col style="min-width: 50px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">NO</th>
											<th scope="col">교과목명</th>
											<th scope="col">교과목번호</th>
											<th scope="col">분반</th>
											<th scope="col">학점</th>
											<th scope="col">교과목구분</th>
											<th scope="col">강의시간</th>
											<th scope="col">재이수</th>
											<th scope="col">삭제일자</th>
										</tr>
									</thead>
									<tbody id="resultTbody_Cancel">
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 자동신청교과목 삭제 내역 테이블 END  -->

				</div>
				<!-- /END 검색 영역 -->
			</div>

			<div class="sec-body" id="info01" style="display: none;">
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li id="schkInfoTxt"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="sec-body" id="info02" style="display: none;">
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li id="schkInfo"></li>
								<li class="text-primary" id="schkDateTxt"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplateSubj">
	<tr style="cursor:pointer;">
        <td>
			#:RN#
			<input class="form-control" id="SYEAR" type="text" style="display:none;" value="#:SYEAR#"> 
			<input class="form-control" id="TERM_GCD" type="text" style="display:none;" value="#:TERM_GCD#"> 
			<input class="form-control" id="SUBJ_NO" type="text" style="display:none;" value="#:SUBJ_NO#"> 
			<input class="form-control" id="CLASS_NO" type="text" style="display:none;" value="#:CLASS_NO#"> 
		</td>
	    <td class="text-left" scope="row">#:SUBJ_NM#</td>
	    <td>#:SUBJ_NO#</td>
		<td>#:CLASS_NO#</td>
		<td>#:CRDT#</td>
		<td scope="row">#:SUBJ_GCD_NM#</td>
		<td scope="row">#:TIMETABLE_SUMMARY_INFO#</td>
		<td>
			# if( :RECMPL_FG == "") { #
	               <div></div>
	        #} else { #
	               <button class="btn btn-outline-primary mb-2 detail-btn">#:RECMPL_FG#</button>
	        #}#
		</td>
		<td><button class="btn btn-outline-primary mb-2" onclick="fn_autoSubjDelete('#:SYEAR#', '#:TERM_GCD#', '#:SUBJ_NO#', '#:CLASS_NO#','#:SUBJ_NM#')">삭제</button></td>
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplateCancel">
	<tr style="cursor:pointer;">
        <td>
			#:RN#
		</td>
	    <td class="text-left" scope="row">#:SUBJ_NM#</td>
	    <td>#:SUBJ_NO#</td>
		<td>#:CLASS_NO#</td>
		<td>#:CRDT#</td>
		<td scope="row">#:SUBJ_GCD_NM#</td>
		<td scope="row">#:TIMETABLE_SUMMARY_INFO#</td>
		<td>#:RECMPL_FG#</td>
		<td scope="row">#:ATLECT_CANCEL_DT#</td>
	</tr>
</script>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	var Tsyear = '';
	var Tterm = '';

	function fn_initScreen() {
		gfn_com_DropDownLists([ {
			elements : $("#SCH_TERM_GCD"),
			commonCode : "0001_TERM_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "AND CHAR_1_CONTENT LIKE'%B%'",
			hakbuGradFg : false,
			dataBound : function(e) {
			}
		} ]);
		
	
		var data = gfn_com_inputdata($(".search-box"));


		/* 학사일정 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AutoApplySubjMng/searchSchdChk",
			reqData : data,
			success : function(data, responseData) {
				if (data.clsFg == "N" && data.autoFg == "N") {
					$("#info01").show();
					$("#info02").hide();
					$("#search").hide();
					$("#schkInfoTxt").text(data.msg);
					return;
				} else if (data.clsFg == "Y" && data.autoFg == "N") {
					$("#info02").show();
					$("#info01").hide();
					$("#search").hide();
					$("#schkInfo").text(data.msg);
					$("#schkDateTxt").text(
							"조회기간 : " + data.SCHD_START_DT + ' ~ '
									+ data.SCHD_CLOSE_DT);
					return;
				}

				$("#SCH_SYEAR").val(data.SYEAR);
				$("#SCH_TERM_GCD").val(data.TERM_GCD);
				Tsyear = data.SYEAR;
				Tterm = data.TERM_GCD;
			}
		});
	}

	/***************************************************************************
	 * 자동신청교과목 내역 조회
	 **************************************************************************/
	function fn_sch(data) {
		var rtnValue = true;
		var param = gfn_com_inputdata($(".search-box"));
		var valInfo1 = [ {
			"id" : "SCH_SYEAR",
			"name" : "학년도",
			"notNull" : true,
		}, {
			"id" : "SCH_TERM_GCD",
			"name" : "학기",
			"notNull" : true,
		} ];

		rtnValue = gfn_val_validateDataMap(param, valInfo1);
		param.SCH_STDT_NO = scwin.loginUser.userId;
		if (!rtnValue) {
			return;
		}

		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AutoApplySubjMng/searchAutoApplySubj",
			reqData : param,
			success : function(data, responseData) {
				$("#resultTbody_Subj")
						.listView(
								{
									dataSource : data,
									dataBound : function(e) {
										$('#resultTbody_Subj .detail-btn')
												.bind(
														"click",
														function(e) {
															scwin.detailObj = $(
																	this)
																	.closest(
																			"tr")
																	.data();
															fn_openPopup({
																filename : 'AutoApplySubjMngPop',
																headertitle : '재이수 내역 확인'
															});
														});
										totalCnt = responseData.totalCnt;
										currentData = data;
									},
									template : $("#resultTemplateSubj"),
									totalCnt : responseData.totalCnt,
									paging : null,
									excel : null
								});
			}
		});

		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AutoApplySubjMng/searchAutoApplyCancel",
			reqData : param,
			success : function(data, responseData) {
				if (responseData.totalCnt > 0) {
					$("#CancelTable").show();
					$("#resultTbody_Cancel").listView({
						dataSource : data,
						dataBound : function(e) {
							totalCnt = responseData.totalCnt;
							currentData = data;
						},
						template : $("#resultTemplateCancel"),
						totalCnt : responseData.totalCnt,
						paging : null,
						excel : null
					});
				} else {
					$("#CancelTable").hide();
				}
			}
		});
	}

	/***************************************************************************
	 * 자동신청교과목 삭제
	 **************************************************************************/

	function fn_autoSubjDelete(syear, termGcd, subjNo, classNo, subjNm) {

		if (Tsyear != syear || Tterm != termGcd) {
			alert('지난 내역은 조회만 가능합니다.');
			return;
		}
		confirm(
				subjNm + "을(를) 신청취소 하시겠습니까?",
				function(_flag) {
					if (_flag) {
						var param = gfn_com_inputdata($(".search-box"));
						param.SCH_STDT_NO = scwin.loginUser.userId;
						param.SYEAR = syear;
						param.TERM_GCD = termGcd;
						param.SUBJ_NO = subjNo;
						param.CLASS_NO = classNo;

						gfn_ajax_request({
							url : "/ost/cls/lecaplycheck/AutoApplySubjMng/saveAutoApplyCancel",
							reqData : param,
							success : function(data, responseData) {
								alert('삭제되었습니다.');
								fn_sch();
							}
						});
					}
				})
	}

	/***************************************************************************
	 * 재이수 상세정보 팝업 호출
	 **************************************************************************/
	function fn_openPopup(_option) {
		gfn_com_modalPopup({
			width : 1500,
			height : 400,
			index : 1,
			target : null,
			title : _option.headertitle,
			include : "/html/ost/cls/lecaplycheck/" + _option.filename
					+ ".html"
		});
	}

	/***************************************************************************
	 * 재이수 상세정보 팝업 호출
	 **************************************************************************/
	function fn_openDetailPopup(_option) {
		gfn_com_modalPopup({
			width : 1500,
			height : 400,
			index : 1,
			target : null,
			title : _option.headertitle,
			include : "/html/ost/cls/lecaplycheck/.html"
		});
	}
</script>