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
										<input id="SCH_SYEAR" class="form-control" type="number" data-bind="value: SYEAR" title="학년도입력"></input>
									</div>
									<div class="" style="width: 140px; margin-left: 3px;">
										<select id="SCH_TERM_GCD" class="form-control" name="searchParam" title="학기선택"></select>
									</div>
									<div style="padding-left: 30px;">
										<input type="checkbox" name="LTTM_YN" id="SCH_LTTM_YN" value="Y" checked> <label for="SCH_LTTM_YN" data-lang>수업 있는 시간만 표시</label>
									</div>

								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SEARCH_GBN" data-lang>검색조건</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_SEARCH_GBN" style="width: 130px;" name="searchParam" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row" id="prof">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label data-lang>교원검색</label>
								</div>
								<div class="b-con-box" role="cell">
									<!-- 교원검색 : class에 profseacher추가 -->
									<div style="width: 200px;">
										<input type="text" id="profSearch" name="profSearch" stlye="" class="form-control profsearcher" callbackFunc="profsearcherCallback" title="교원번호이름"/>
									</div>
									<div style="padding-left: 30px; width: 200px;">
										<input type="text" id="profDept" name="profDept" class="form-control" readOnly="true" title="교원소속"/>
									</div>

								</div>
							</div>
						</div>
						<div class="b-row-box" role="row" name="hak">
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
						<div class="b-row-box" role="row" name="hak">
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
						<table class="table table-hover" data-toggle="table" data-show-column="true" id="table01">
							<caption>교수별 시간표 정보</caption>
							<colgroup>
								<col style="min-width: 80px;">
								<col style="min-width: 80px;">
								<col style="min-width: 200px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">학과명</th>
									<th scope="col">교수명</th>
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
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td class="text-center">#:ASSIGN_NM#</td>
	    <td class="text-center" ><a style="color:blue" class="detail-prof" href ="#popup">#:PROF_NM#</a></td>
	    <td style=""></td>
	</tr>
</script>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	var notNullJson = [{
		"id" : "SCH_SYEAR",
		"name" : "학년도",
		"notNull" : true
	}, {
		"id" : "SCH_TERM_GCD",
		"name" : "학기",
		"notNull" : true
	}, {
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
	}];
	/***************************************************************************************************
	Event
	 ***************************************************************************************************/
	 var checkYn = 'Y';
	$(document).ready(function() {
		$("#SCH_LTTM_YN").change(function(){
			if($("[name=LTTM_YN]").prop('checked')){
				checkYn = 'Y';
			}else{
				checkYn = 'N';
			}
		});
		$("#SCH_SEARCH_GBN").change(function() {
			if (this.value == 1) {
				$("[name=hak]").show();
				$("#prof").hide();
				notNullJson = [{
					"id" : "SCH_SYEAR",
					"name" : "학년도",
					"notNull" : true
				}, {
					"id" : "SCH_TERM_GCD",
					"name" : "학기",
					"notNull" : true
				}, {
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
				}]
			} else if (this.value == 2) {
				$("#prof").show();
				$("[name=hak]").hide();
				notNullJson = [{
					"id" : "SCH_SYEAR",
					"name" : "학년도",
					"notNull" : true
				}, {
					"id" : "SCH_TERM_GCD",
					"name" : "학기",
					"notNull" : true
				}, {
					"id" : "profSearch",
					"name" : "교원번호/이름",
					"notNull" : true
				}]
			}

		});
	});
	function profsearcherCallback(info) {
		$("#profDept").val(info.ASSIGN_NM);
		
	}
	/***************************************************************************************************
	Init Screen 화면 로드시 
	 ***************************************************************************************************/
	function fn_initScreen() {
		SearchSelectNode();
		$("#prof").hide();
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
			initChk : false,
			dataBound : function(e) {
				$("#SCH_COLL_GRAD_GCD").setValue(scwin.loginUser.collGradGcd);
				$("#SCH_GRAD_GCD").setValue(scwin.loginUser.gradGcd);
				$("#SCH_COLL_CD").setValue(scwin.loginUser.collCd);
				$("#SCH_DEPT_CD").setValue(scwin.loginUser.deptCd);
			}
		});
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
		
		/*학기 공통코드 바인드*/
		$("#SCH_TERM_GCD").dropDownList({
			dataSource : null,
			commonCode : "0001_TERM_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "",
			optionValue : "",
			defaultValue : "",
			expnCondition : "AND CHAR_1_CONTENT LIKE 'A%' ",
			dataBound : function(e) {
				
			}
		});
		
		var param = gfn_com_inputdata($(".search-box"));
		param.SYSTEM_GCD = scwin.menuInfo.SYSTEM_GCD;
		param.MENU_CD = scwin.menuInfo.MENU_CD;
		
		/* 기준학년도학기 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AtlectSearch/selectOneShafYyShtm",
			reqData : param,
			success : function(data, responseData) {
				$("#SCH_SYEAR").val(data.SYEAR);
				$("#SCH_TERM_GCD").val(data.TERM_GCD);
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
			url : "/ost/cls/timetablesearch/proftimetablesearch/selectProfTimetable",
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
															 param = $(this).closest("tr").data();

															 fn_openReport(param);
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
	function fn_openReport(param) {
		var options ={};
                    
       options.rptName = "/ses/cls/openlectsituation/lectTimetable/LectTimetableProf_001.crf";
        //파라메터 설정
        //var objParam = dma_SearchParam.getJSON();
        var objParam = {};
    	objParam.LTTM_YN								= checkYn;  //기준년도
    	objParam.SCH_CURC_APPLY_SYEAR		= paramData.SCH_SYEAR;  //기준년도
        objParam.SCH_TERM_GCD                    = paramData.SCH_TERM_GCD;  //기준월
        objParam.SCH_EMP_NO                        = param.PROF_NO;
        objParam.bind = [{
            db : "LECTURE",
            proc : "CLS_강의시간표_교수별강의시간표_출력",
            params : [
                checkYn
                ,paramData.SCH_SYEAR
                ,paramData.SCH_TERM_GCD
                ,""
                ,""
                ,""
                ,""
                ,param.PROF_NO
                ,""
                ,""
                ,""
                ,""
        ]}]
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
            title : "교수별 시간표",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
	function fn_excelDownload() {

		data = gfn_com_searchData($(".search-box"));
		data.pageSize = totalCnt; //전체데이터를 가지고 오기 위해서 pageSize를 전체건수로 세팅
		gfn_ajax_request({
			url : "/ost/cls/timetablesearch/proftimetablesearch/selectProfTimetable",
			reqData : data,
			success : function(data, responseData) {
				if (data.length > 0) {
					/* [엑셀다운로드 공통] */
					gfn_com_excelDownloadFile([ {
						key : "ASSIGN_NM",
						name : "학과명"
					}, {
						key : "PROF_NM",
						name : "교수명"
					}, {
						key : "",
						name : "비고"
					} ], /* 엑셀에 표시할 컬럼 및 명칭 */
					data, /* 엑셀로 다운로드 할 데이터 */
					"수업_교수별_시간표" /* 엑셀로 다운로드 할 파일명 (확장자제외) */
					);
				} else {
					alert("엑셀로 다운로드할 데이터가 없습니다.");
					return false;
				}
			}
		});
	}
</script>