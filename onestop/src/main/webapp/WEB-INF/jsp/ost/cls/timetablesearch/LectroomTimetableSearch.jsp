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
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>학년도/학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="" style="width: 120px;">
										<select id="SCH_SYEAR" class="form-control" title="학년도선택"></select>
									</div>
									<div class="" style="width: 140px; margin-left: 3px;">
										<select id="SCH_TERM_GCD" class="form-control" name="searchParam" title="학기선택"></select>
									</div>
									<div style="padding-left: 30px;">
										<input type="checkbox" name="LTTM_YN" id="SCH_LTTM_YN" value="Y" checked> <label for="SCH_LTTM_YN" data-lang>수업 있는 시간만 표시</label>
										<input type="hidden" id="SCH_LTTM_YN_HID" class="form-control" />
									</div>

								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item  merge-prev merge-2-prev">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_BLD_CD" data-lang>건물</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_BLD_CD" style="width: 200px;" name="searchParam" class="form-control"></select>
								</div>
							</div>
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_FACILITY_NO" data-lang>강의실</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_FACILITY_NO" style="width: 250px;" name="searchParam" class="form-control"></select>
								</div>
							</div>
						</div>
					</div>
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang="">조회</button>
								<button class="btn btn-new " onclick="fn_openReport()" data-lang="">출력</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 3단 테이블 END-->
				<!-- 테이블 -->
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table"  data-show-column="true" id="table01">
							<caption>강의실별요일시간표정보</caption>
							<colgroup>
								<col style="min-width: 80px;">
								<col style="min-width: 150px;">
								<col style="min-width: 150px;">
								<col style="min-width: 150px;">
								<col style="min-width: 150px;">
								<col style="min-width: 150px;">
								<col style="min-width: 150px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">시간</th>
									<th scope="col">월</th>
									<th scope="col">화</th>
									<th scope="col">수</th>
									<th scope="col">목</th>
									<th scope="col">금</th>
									<th scope="col">토</th>
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
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td class="text-center">#:START_TIME#</td>
	    <td class="text-center" >#:MON_INFO#</td>
	    <td class="text-center" >#:TUE_INFO#</td>
	    <td class="text-center" >#:WED_INFO#</td>
	    <td class="text-center" >#:THU_INFO#</td>
	    <td class="text-center" >#:FRI_INFO#</td>
	    <td class="text-center" >#:SAT_INFO#</td>
	</tr>
</script>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	var notNullJson = [ {
		"id" : "SCH_SYEAR",
		"name" : "학년도",
		"notNull" : true
	}, {
		"id" : "SCH_TERM_GCD",
		"name" : "학기",
		"notNull" : true
	}, {
		"id" : "SCH_BLD_CD",
		"name" : "건물",
		"notNull" : true
	}, {
		"id" : "SCH_FACILITY_NO",
		"name" : "강의실",
		"notNull" : true
	} ];
	/***************************************************************************************************
	Event
	 ***************************************************************************************************/
	var checkYn = 'Y';
	$(document).ready(function() {
		$("#SCH_LTTM_YN").change(function() {
			if ($("[name=LTTM_YN]").prop('checked')) {
				checkYn = 'Y';
				$("#SCH_LTTM_YN_HID").val('Y');
			} else {
				checkYn = 'N';
				$("#SCH_LTTM_YN_HID").val('N');
			}
		});

		$("#SCH_SYEAR,#SCH_TERM_GCD").change(function() {
			fn_selectbldfacility('bld');
		});
		$("#SCH_BLD_CD").change(function() {
			fn_selectbldfacility('facility');
		});
	});

	/***************************************************************************************************
	Init Screen 화면 로드시 
	 ***************************************************************************************************/
	function fn_initScreen() {
		$("#SCH_LTTM_YN_HID").val('Y');
		SearchSelectNode();
	}
	/***************************************************************************************************
	건물,강의실 조회
	 ***************************************************************************************************/
	function fn_selectbldfacility(gbn) {
		if (gbn == 'bld') {
			gfn_ajax_request({
				url : "/ost/cls/timetablesearch/lectroomtimetablesearch/selectbldCd",

				reqData : gfn_com_searchData($(".search-box")),
				success : function(data, responseData) {

					$("#SCH_BLD_CD").dropDownList({
						dataSource : data,
						commonCode : "",
						dataTextField : "BLD_NM",
						dataValueField : "BLD_CD",
						optionLabel : "선택",
						optionValue : "",
						defaultValue : "",
						expnCondition : "",
						dataBound : function(e) {
							fn_selectbldfacility('facility');
						}
					});

				}
			});
		} else if (gbn == 'facility') {
			gfn_ajax_request({
				url : "/ost/cls/timetablesearch/lectroomtimetablesearch/selectFacilityNo",

				reqData : gfn_com_searchData($(".search-box")),
				success : function(data, responseData) {

					$("#SCH_FACILITY_NO").dropDownList({
						dataSource : data,
						commonCode : "",
						dataTextField : "FACILITY_NM",
						dataValueField : "FACILITY_NO",
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

	}
	function fn_openReport(param) {
		var options ={};
                    
       options.rptName = "/ses/cls/openlectsituation/lectroomOpenLectSituation/LectTimetableLectroom.crf";
       param = gfn_com_searchData($(".search-box"));
        //파라메터 설정
        //var objParam = dma_SearchParam.getJSON();
        var objParam = {};
    	objParam.LTTM_YN								= checkYn;  //기준년도
    	objParam.SCH_CURC_APPLY_SYEAR		= paramData.SCH_SYEAR;  //기준년도
        objParam.SCH_TERM_GCD                    = paramData.SCH_TERM_GCD;  //기준월
        objParam.SCH_BLD_CD                        = paramData.SCH_BLD_CD;
        objParam.SCH_FACILITY_NO                	= paramData.SCH_FACILITY_NO;
        objParam.USER_NM				= scwin.loginUser.nm;
        

        //레포트를 생성시킬 group component 또는 id를 넣는다.
        options.div = 'grp_report';

        //레포트에서 사용할 옵션
        //현재 다운로드 버튼 관련 기능만 제공...
        options.reportOption = {};
        options.reportOption.useHwp = false; //한글다운로드 기능 사용안할 경우
        options.reportOption.useDoc = false; //word다운로드 기능 사용안할 경우
        options.reportOption.useEtc = false; //기타다운로드 기능(ppt, rtf, html 등) 사용안할 경우
        options.reportOption.usePrint = false; //프린트 기능 사용안할 경우

        //실행실킬 레포트 파일에서 사용할 파라미터 object 형식
        //프로그램 정보(PROG_INFO)와 사용자 정보(USER_INFO)는 기본값으로 전송됨.
        options.data = objParam;

        fn_openPopup2(options);

	}

	function fn_openPopup2(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "강의실별 시간표",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
	/***************************************************************************************************
	select 조회
	 ***************************************************************************************************/
	function SearchSelectNode() {

		/*검색조건 코드 바인드*/
		$("#SCH_SEARCH_GBN").dropDownList({
			dataSource : [ {
				CODE : 1,
				LABEL : '학과'
			}, {
				CODE : 2,
				LABEL : '성명'
			} ],
			commonCode : "",
			dataTextField : "LABEL",
			dataValueField : "CODE",
			optionLabel : "",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			dataBound : function(e) {

			}
		});
		/*학년도 바인드*/
		var now = new Date();
		var year = now.getFullYear();
		var oneYearAgo = now.getFullYear() -1;
		
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : oneYearAgo,
				"ENDYEAR" : year
			},
			success : function(data, responseData) {

				$("#SCH_SYEAR")
						.dropDownList(
								{
									dataSource : data,
									commonCode : "",
									dataTextField : "LABEL",
									dataValueField : "CODE",
									optionLabel : "",
									optionValue : "",
									defaultValue : "",
									expnCondition : "",
									dataBound : function(e) {
										//$("#SCH_SYEAR").val(responseData.termInfo.SYEAR);
										/*학기 공통코드 바인드*/
										$("#SCH_TERM_GCD")
												.dropDownList(
														{
															dataSource : null,
															commonCode : "0001_TERM_GCD",
															dataTextField : "COMMON_DETAIL_CD_KOR_NM",
															dataValueField : "COMMON_DETAIL_CD",
															optionLabel : "",
															optionValue : "",
															defaultValue : "",
															expnCondition : "AND CHAR_1_CONTENT LIKE '%B%' ",
															dataBound : function(
																	e) {
																$(
																		"#SCH_TERM_GCD")
																		.val(
																				responseData.termInfo.TERM_GCD);
																fn_selectbldfacility('bld');
															}
														});
									}
								});

			}
		});

	}
	var paramData;
	function fn_sch(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		paramData = data;
		if (!gfn_val_validateDataMap(data, notNullJson))
			return false;

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/timetablesearch/lectroomtimetablesearch/selectLectroomTimetable",
			reqData : data,
			success : function(data, responseData) {

				$("#resultTbody").listView({
					dataSource : data,
					dataBound : function(e) {

						currentData = data;
					},
					template : $("#resultTemplate"),
					totalViewYn : "N"

				});
				$("#table01").rowspan(1);
				$("#table01").rowspan(2);
				$("#table01").rowspan(3);
				$("#table01").rowspan(4);
				$("#table01").rowspan(5);
				$("#table01").rowspan(6);
			}
		});
	}

</script>