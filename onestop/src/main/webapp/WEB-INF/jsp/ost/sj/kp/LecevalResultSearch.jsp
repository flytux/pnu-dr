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
					<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
						<div class="b-row-box" role="row" id ="COLL_GRAD">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_COLL_GRAD_GCD" data-lang>대학/대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" style="" name="searchParam" title="대학/대학원"/>
								</div>
							</div>														
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_GRAD_GCD" data-lang>대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_GRAD_GCD" class="form-control" title="대학원"/>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="SYEAR" class="req">학년도</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="number" id="SYEAR" class="form-control" style="text-align: center" title="학년도"/>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="SCH_TERM_GCD" class="req">학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_TERM_GCD" class="form-control" title="학기"></select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label>검색방법</label>
								</div>
								<div class="b-con-box" role="cell">
									<div>
										<input type="radio" id="SEARCH_GBN1" name="SEARCH_GBN" class="" style="" value="001" checked="checked" title="개설학과 및 교과구분"/><label for="SEARCH_GBN1" data-lang>개설학과 및 교과구분</label>
									</div>
									<div>
										<input type="radio" id="SEARCH_GBN2" name="SEARCH_GBN" class="" style="" value="002" title="교과목명 직접 입력"/><label for="SEARCH_GBN2" data-lang>교과목명 직접 입력</label>
									</div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row" id="ASSIGN">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label id="TLT_COLL_CD"  for="SCH_COLL_CD" data-lang class="req">개설대학</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_CD" class="form-control" title="개설대학"/>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label id="TLT_DEPT_CD" for="SCH_DEPT_CD" data-lang class="req">개설학과</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_DEPT_CD" class="form-control" title="개설학과"/>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label id="TLT_SUBJ_GCD" for="SCH_SUBJ_GCD" class="req">교과구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_SUBJ_GCD" class="form-control" title="교과구분"></select>
								</div>
							</div>
						</div> 
						<div class="b-row-box" role="row" id="SUBJ">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="SCH_SUBJ_NM" id="TLT_SUBJ_NM">교과목명</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_SUBJ_NM" class="form-control" style="" title="교과목명"/>
								</div>
							</div>
							<div class="b-row-item merge-2">
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
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li>검색방법을 <span class="dfn">'교과목명 직접 입력'</span>을 선택하신 후, 교과목명으로 검색할 수 있습니다.
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>강의평가결과내역</caption>
							<colgroup>
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 40px;">
								<col style="min-width: 40px;">
								<col style="min-width: 230px;">
								<col style="min-width: 30px;">
								<col style="min-width: 40px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">교수명</th>
									<th scope="col">개설학과</th>
									<th scope="col">개설학년</th>
									<th scope="col">교과구분</th>
									<th scope="col">교과목명</th>
									<th scope="col">분반</th>
									<th scope="col">결과표</th>
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
        <td class="text-center">#:NM#</td>
	    <td class="text-left">#:DEPT_KOR_NM#</td>
	    <td class="text-center">#:OPEN_STDT_YEAR_GCD_NM#</td>
	    <td class="text-center">#:SUBJ_GCD_NM#</td>
	    <td class="text-left">#:SUBJ_NM#</td>
	    <td class="text-center">#:CLASS_NO#</td>
	    <td>
            <button class="btn btn-outline-primary detail-btn" type="button">조회</button>
	    </td>
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
		$('input[type=radio][name=SEARCH_GBN]').change(function() {
			if (this.value == '001') {
				$('#ASSIGN').show('');
				$('#SUBJ').hide();
			} else if (this.value == '002') {
				$('#ASSIGN').hide();
				$('#SUBJ').show('');
			}
		});

		$('input[id=SYEAR],select[id=SCH_TERM_GCD]').change(function() {
			SearchSelectNode();
		});
		
		$("#COLL_GRAD").hide();
		$('#SUBJ').hide();
		/*학과소속 바인드*/
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
			
			}
		});
		
		

	});
	/***************************************************************************************************
	Init Screen 화면 로드시 
	 ***************************************************************************************************/
	function fn_initScreen() {
		$("#SYEAR").val(scwin.termInfo.SYEAR);

		/*학기 공통코드 바인드*/
		$("#SCH_TERM_GCD").dropDownList({
			dataSource : null,
			commonCode : "0001_TERM_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			dataBound : function(e) {
				$("#SCH_TERM_GCD").val(scwin.termInfo.TERM_GCD);
				SearchSelectNode();
			}
		});
		//fn_sch();
	}

	/***************************************************************************************************
	select 조회
	 ***************************************************************************************************/
	function SearchSelectNode() {
		/*개설학과 List 조회후 Select Box 바인드*/
		gfn_ajax_request({
			url : "/ost/sj/kp/lecevalresultsearch/selectLecevalOpenDept",
			reqData : {
				"BOUNDARY" : "H",
				"SYEAR" : $("#SYEAR").val(),
				"SCH_TERM_GCD" : $("#SCH_TERM_GCD").val()
			},
			success : function(data, responseData) {
			}
		});
		/*교과구분 공통코드  바인드*/
		gfn_ajax_request({
			url : "/ost/sj/kp/lecevalresultsearch/selectLecevalOpenDept",
			reqData : {
				"BOUNDARY" : "I",
				"SYEAR" : $("#SYEAR").val(),
				"SCH_TERM_GCD" : $("#SCH_TERM_GCD").val()
			},
			success : function(data, responseData) {

				$("#SCH_SUBJ_GCD").dropDownList({
					dataSource : data,
					commonCode : "",
					dataTextField : "SUBJ_GCD_NM",
					dataValueField : "SUBJ_GCD",
					optionLabel : "선택",
					optionValue : "",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {
					}
				});

			}
		});

	}

	function fn_sch(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		
		var valInfo = [{
			"id" : "SYEAR",
			"name" : "학년도",
			"notNull" : true,
		}, {
			"id" : "SCH_TERM_GCD",
			"name" : "학기",
			"notNull" : true,
		}, {
			"id" : "SCH_COLL_CD",
			"name" : "개설대학",
			"notNull" : true,
		}, {
			"id" : "SCH_DEPT_CD",
			"name" : "개설학과",
			"notNull" : true,
		}, {
			"id" : "SCH_SUBJ_GCD",
			"name" : "교과구분",
			"notNull" : true,
		}];
		if (data.SEARCH_GBN == '002') {
			valInfo = [{
				"id" : "SYEAR",
				"name" : "학년도",
				"notNull" : true,
			}, {
				"id" : "SCH_TERM_GCD",
				"name" : "학기",
				"notNull" : true,
			}, {
				"id" : "SCH_SUBJ_NM",
				"name" : "교과목명",
				"notNull" : true
			}];
		}
		rtnValue = gfn_val_validateDataMap(data, valInfo);
		
		if (!rtnValue){
			return;
		}

		if (data.SEARCH_GBN == '001') {
			/* 필수체크 */
			if (!gfn_val_validateDataMap(data, [ {
				"id" : "SYEAR",
				"name" : "학년도",
				"notNull" : true
			}, {
				"id" : "SCH_TERM_GCD",
				"name" : "학기",
				"notNull" : true
			}, {
				"id" : "SCH_COLL_CD",
				"name" : "개설대학",
				"notNull" : true
			}, {
				"id" : "SCH_DEPT_CD",
				"name" : "개설학과",
				"notNull" : true
			}, {
				"id" : "SCH_SUBJ_GCD",
				"name" : "교과구분",
				"notNull" : true
			} ]))
				return false;

		} else if (data.SEARCH_GBN == '002') {
			/* 필수체크 */
			if (!gfn_val_validateDataMap(data, [ {
				"id" : "SYEAR",
				"name" : "학년도",
				"notNull" : true
			}, {
				"id" : "SCH_TERM_GCD",
				"name" : "학기",
				"notNull" : true
			}, {
				"id" : "SCH_SUBJ_NM",
				"name" : "교과목명",
				"notNull" : true
			} ]))
				return false;

		}
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sj/kp/lecevalresultsearch/selectLecevalResultSubj",
			reqData : data,
			success : function(data, responseData) {
				if (data.length == 0)
					return;
				if (data[0].R_CD == 'FALSE') {
					alert(data[0].R_MSG);
					return;
				}
				$("#resultTbody").listView({
									dataSource : data,
									dataBound : function(e) {

										$('#resultTbody .detail-btn')
												.bind(
														"click",
														function(e) {
															scwin.detailObj = $(
																	this)
																	.closest(
																			"tr")
																	.data();
															fn_openPopup({
																filename : 'LecevalResultSearchPop',
																headertitle : '보기'
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
			}
		});
	}

	function fn_openPopup(_option) {
		gfn_com_modalPopup({
			width : 1500,
			height : 1200,
			index : 1,
			position : {
				top : 20,
				left : 20
			},
			target : null,
			title : "강의평가 결과표",
			scrolling : "on",
			scroll : "off",
			move : "on",
			include : "/html/ost/sj/kp/" + _option.filename + ".html"
		});
	}

	function fn_excelDownload() {

		data = gfn_com_searchData($(".search-box"));
		data.pageSize = totalCnt; //전체데이터를 가지고 오기 위해서 pageSize를 전체건수로 세팅
		gfn_ajax_request({
			url : "/ost/sj/kp/lecevalresultsearch/selectLecevalResultSubj",
			reqData : data,
			success : function(data, responseData) {
				if (data.length > 0) {
					/* [엑셀다운로드 공통] */
					gfn_com_excelDownloadFile([ {
						key : "NM",
						name : "교수명"
					}, {
						key : "DEPT_KOR_NM",
						name : "개설학과"
					}, {
						key : "OPEN_STDT_YEAR_GCD_NM",
						name : "개설학년"
					}, {
						key : "SUBJ_GCD_NM",
						name : "교과구분"
					}, {
						key : "SUBJ_NM",
						name : "교과목명"
					}, {
						key : "CLASS_NO",
						name : "분반"
					} ], /* 엑셀에 표시할 컬럼 및 명칭 */
					data, /* 엑셀로 다운로드 할 데이터 */
					"강의평가_교과목" /* 엑셀로 다운로드 할 파일명 (확장자제외) */
					);
				} else {
					alert("엑셀로 다운로드할 데이터가 없습니다.");
					return false;
				}
			}
		});
	}
</script>