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

				<div class="search-box">
					<!-- 3단 테이블 -->
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_COLL_GRAD_GCD" data-lang>대학/대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" style="" name="searchParam" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_GRAD_GCD" data-lang>대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_GRAD_GCD" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_COLL_CD" data-lang>단과대학</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_CD" class="form-control" />
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_DEPT_CD" data-lang>학과(부)/전공</label>
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
								<button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang="">조회</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 3단 테이블 END-->
				<!-- 테이블 -->
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table"  data-show-column="true" id="table01">
							<caption>교수정보</caption>
							<colgroup>
								<col style="min-width: 80px;">
								<col style="min-width: 80px;">
								<col style="min-width: 60px;">
								<col style="min-width: 200px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">학과명</th>
									<th scope="col">교수명</th>
									<th scope="col">직급명</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>
				</div>
				<!-- /END 테이블 -->
				<!-- /END 아코디언 -->
			</div>
		</section>
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td class="text-center">#:DEPT_KOR_NM#</td>
	    <td class="text-center" ><a style="color:blue" class="detail-prof"	 href ="#popup">#:PROF_NM#</a></td>
	    <td class="text-center">#:JK_NM#</td>
	    <td class="text-center"></td>
	    <td style="display:none;">#:PROF_NO#</td>
	</tr>
</script>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	/***************************************************************************************************
	Event
	 ***************************************************************************************************/
	$(document).ready(function() {

	});
	/***************************************************************************************************
	Init Screen 화면 로드시 
	 ***************************************************************************************************/
	function fn_initScreen() {
		SearchSelectNode();

	}

	/***************************************************************************************************
	select 조회
	 ***************************************************************************************************/
	function SearchSelectNode() {
		gfn_com_assignCombo({
			collGradGcd : $("#SCH_COLL_GRAD_GCD"),
			gradGcd : $("#SCH_GRAD_GCD"),
			collCd : $("#SCH_COLL_CD"),
			deptCd : $("#SCH_DEPT_CD"),
			comboLvl : 4,
			gradGcdExtUrl : "/ost/cls/profintro/profintro/selectProfIntroGrad",
			collCdExtUrl : "/ost/cls/profintro/profintro/selectProfIntroColl",
			deptCdExtUrl : "/ost/cls/profintro/profintro/selectProfIntroDept",
			initChk : false,
			dataBound : function(e) {
			}
		});

	}

	function fn_sch(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		/* 필수체크 */
		if (!gfn_val_validateDataMap(data, [ {
			"id" : "SCH_COLL_GRAD_GCD",
			"name" : "대학/대학원",
			"notNull" : true
		}, {
			"id" : "SCH_GRAD_GCD",
			"name" : "대학원",
			"notNull" : true
		}, {
			"id" : "SCH_COLL_CD",
			"name" : "단과대학",
			"notNull" : true
		}, {
			"id" : "SCH_DEPT_CD",
			"name" : "학과(부)/전공",
			"notNull" : true
		} ]))
			return false;

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/profintro/profintro/selectProfIntro",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody")
						.listView(
								{
									dataSource : data,
									dataBound : function(e) {

										$('#resultTbody .detail-prof')
												.bind(
														"click",
														function(e) {
															scwin.detailObj = $(
																	this)
																	.closest(
																			"td")
																	.closest(
																			"tr")
																	.data();
															fn_openPopup({
																filename : 'ProfDetailSearchPop',
																headertitle : '교수상세정보보기'
															});
														});

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
									excel : "fn_excelDownload"
								});
				$("#table01").rowspan(0);
			}
		});
	}

	function fn_openPopup(_option) {
		gfn_com_modalPopup({
			width : 700,
			height : 270,
			index : 1,
			target : null,
			title :  _option.headertitle,
			//scrolling : "on",
			//scroll : "off",
			//move : "on",
			include : "/html/ost/cls/profintro/" + _option.filename + ".html"
		});
	}

	function fn_excelDownload() {

		data = gfn_com_searchData($(".search-box"));
		data.pageSize = totalCnt; //전체데이터를 가지고 오기 위해서 pageSize를 전체건수로 세팅
		gfn_ajax_request({
			url : "/ost/cls/profintro/profintro/selectProfIntro",
			reqData : data,
			success : function(data, responseData) {
				if (data.length > 0) {
					/* [엑셀다운로드 공통] */
					gfn_com_excelDownloadFile([ {
						key : "DEPT_KOR_NM",
						name : "학과명"
					}, {
						key : "PROF_NM",
						name : "교수명"
					}, {
						key : "JK_NM",
						name : "직급명"
					}, {
						key : "",
						name : "비고"
					} ], /* 엑셀에 표시할 컬럼 및 명칭 */
					data, /* 엑셀로 다운로드 할 데이터 */
					"수업_교수소개" /* 엑셀로 다운로드 할 파일명 (확장자제외) */
					);
				} else {
					alert("엑셀로 다운로드할 데이터가 없습니다.");
					return false;
				}
			}
		});
	}
</script>