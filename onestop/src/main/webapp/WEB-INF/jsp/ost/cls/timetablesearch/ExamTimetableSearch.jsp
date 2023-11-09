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
					<div class="b-table-box flex-col-4" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>학년도/학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="" style="width: 120px;">
										<select id="SCH_SYEAR" class="form-control" title="학년도선택"></select>
									</div>
									<div class="" style="width: 140px; margin-left: 3px;">
										<select id="SCH_TERM_GCD" class="form-control" name="searchParam" title="학기선택""></select>
									</div>
								</div>
							</div>
							
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_EXAM_GCD" data-lang>시험</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_EXAM_GCD" style="width: 130px;" name="searchParam" class="form-control"></select>
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
				<a href="https://www.pusan.ac.kr/kor/CMS/Contents/Contents.do?mCode=MN212" target="_blank" class="link link-style-1" title="새창 이동"><i class="bi bi-geo-alt" aria-hidden="true"></i>캠퍼스 맵 바로가기</a>
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table"  data-show-column="true" id="table01">
							<caption>시험시간표정보</caption>
							<colgroup>
								<col style="min-width: 50px;">
								<col style="min-width: 100px;">
								<col style="min-width: 80px;">
								<col style="min-width: 50px;">
								<col style="min-width: 150px;">
								<col style="min-width: 50px;">
								<col style="min-width: 140px;">
								<col style="min-width: 70px;">
								<col style="min-width: 100px;">
								<col style="min-width: 20px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">분반</th>
									<th scope="col">시험일자</th>
									<th scope="col">시험분반</th>
									<th scope="col">건물명</th>
									<th scope="col">강의실</th>
									<th scope="col">수강대상</th>
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
        <td class="text-center">#:RN#</td>
	    <td class="text-center" ><a class="kor" style="color:blue" href ="#popup">#:SUBJ_NM#</a></td>
	    <td class="text-center" >#:SUBJ_NO#</td>
	    <td class="text-center" >#:CLASS_NO#</td>
	    <td class="text-center" >#:SIGAN#</td>
	    <td class="text-center" >#:EXAM_CLASS_NO#</td>
	    <td class="text-center" >#:BLD_NM#</td>
	    <td class="text-center" >#:FACILITY#</td>
	    <td class="text-center" >#:ATLECT_TARGET_INFO#</td>
	    <td class="text-center" ></td>
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
		"id" : "SCH_EXAM_GCD",
		"name" : "시험",
		"notNull" : true
	} ];
	/***************************************************************************************************
	Event
	 ***************************************************************************************************/

	/***************************************************************************************************
	Init Screen 화면 로드시 
	 ***************************************************************************************************/
	function fn_initScreen() {
		SearchSelectNode();
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
			url : "/ost/cls/timetablesearch/examtimetablesearch/selectexamTimetableValid",
			reqData : data,
			success : function(data, responseData) {

				
				if(data.R_CHK == 'N'){
					alert(data.R_MSG);
				}else{
					fn_mainSearch(paramData);
				}

				

			}
		});
	}
	var paramData;
	function fn_mainSearch(data){
		paramData = data;
		gfn_ajax_request({
			url : "/ost/cls/timetablesearch/examtimetablesearch/selectexamTimetable",
			reqData : data,
			success : function(data, responseData) {


				$("#resultTbody").listView({
					dataSource : data,
					dataBound : function(e) {
						$('#resultTbody .kor').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();

										 fn_openReport(param,'KOR');
								});
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
				$("#table01").rowspan(7);
				$("#table01").rowspan(8);

			}
		});
	}
	
	function fn_openReport(param,gbn) {
		var options ={};
        var objParam = {};	
    	var SCH_LANG_GCD = "";
	 	if(gbn == "KOR"){
	 		SCH_LANG_GCD      = '0001';
        }else if(gbn == "ENG"){
        	SCH_LANG_GCD		= '0002';
        }
	 	

        
        if(param.EDUCERT_GCD == null){ //교육인증 구분코드 없을때./////////////////////////////////////////////////////////////////////////////
        	if(gbn == "KOR") { //국문
                options.rptName = "/ses/cls/sylmng/sylprint/SylPrint_001.crf";
            } else {//영문
                options.rptName = "/ses/cls/sylmng/sylprint/SylPrint_002.crf";
            }	
		    		objParam.bind = [{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["MST"
		                ,paramData.SCH_SYEAR
		                ,paramData.SCH_TERM_GCD
		                ,""
		                ,param.SUBJ_NO
		                ,""
		                ,SCH_LANG_GCD
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
						]
		        },{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["DTL"
		                ,paramData.SCH_SYEAR
		                ,paramData.SCH_TERM_GCD
		                ,""
		                ,param.SUBJ_NO
		                ,""
		                ,SCH_LANG_GCD
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,param.EDUCERT_GCD
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
						]
		        },{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["DTL2"
		                ,paramData.SCH_SYEAR
		                ,paramData.SCH_TERM_GCD
		                ,""
		                ,param.SUBJ_NO
		                ,""
		                ,SCH_LANG_GCD
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
						]
		        },{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["DTL1"
		                ,paramData.SCH_SYEAR
		                ,paramData.SCH_TERM_GCD
		                ,""
		                ,param.SUBJ_NO
		                ,""
		                ,SCH_LANG_GCD
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
						]
		        }];
        
        }else{////////교육인증 구분코드 존재할때./////////////////////////////////////////////////
        	if(gbn == "KOR"){
        		options.rptName = "/ses/ae/sylmng/sylprint/SylPrint"+param.EDUCERT_GCD+"_001.crf";
        		objParam.bind = [{
	                db : "EDUCERT",
	                proc : "AE_교수계획표관리_통합_교수계획표_출력",
	                params : [
	                paramData.SCH_SYEAR
	                ,paramData.SCH_TERM_GCD
	                ,param.SUBJ_NO
	                ,""
	                ,""
	                ,SCH_LANG_GCD
	                ,param.EDUCERT_GCD
	                ]
	       		 }];
        	}else if(gbn == "ENG"){
        		options.rptName = "/ses/ae/sylmng/sylprint/SylPrint"+param.EDUCERT_GCD+"_002.crf";
        		objParam.bind = [{
	                db : "EDUCERT",
	                proc : "AE_교수계획표관리_통합_교수계획표_출력",
	                params : [
	                paramData.SCH_SYEAR
	                ,paramData.SCH_TERM_GCD
	                ,param.SUBJ_NO
	                ,""
	                ,""
	                ,SCH_LANG_GCD
	                ,param.EDUCERT_GCD
	                ]
	       		 }];
        	}
        	
        }

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
            title : "교수계획표",
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
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",

			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : year,
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
															}
														});

										$("#SCH_EXAM_GCD")
												.dropDownList(
														{
															dataSource : null,
															commonCode : "0001_EXAM_GCD",
															dataTextField : "COMMON_DETAIL_CD_KOR_NM",
															dataValueField : "COMMON_DETAIL_CD",
															optionLabel : "",
															optionValue : "",
															defaultValue : "",
															expnCondition : "",
															dataBound : function(e) {
															}
														});

									}
								});

			}
		});

	}
</script>