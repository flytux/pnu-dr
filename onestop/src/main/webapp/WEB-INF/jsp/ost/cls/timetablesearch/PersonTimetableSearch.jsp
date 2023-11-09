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
										<input type="checkbox" name="LTTM_YN" id="SCH_LTTM_YN" value="Y" checked> <label for="SCH_LTTM_YN" data-lang>수업 있는 시간만 표시</label> <input type="text" id="SCH_LTTM_YN_HID" class="form-control" style="display: none;" />
									</div>

								</div>
							</div>
						</div>
						<input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" style="display: none;" name="" />

					</div>
					<div class="message-box">
						<div class="message-box-inner">
							<div class="message-body">
								<ul class="list list-style-1">
									<li class="none">
										<button class="btn btn-danger btn-sm ml-1" type="button" onclick="javascript:$('#doc').toggle('slow');$(this).text((($(this).text() == '참고내용 펼치기')?'참고내용 접기':'참고내용 펼치기'));">참고내용 접기</button>
									</li>
									<div id="doc" style="">
										<li><span class="dfn">※ </span> 시간표가 정상적으로 보이지 않을 때에는 수업시간이 중복되어서 그런 현상이 나타날 수 있으니, 정확한 수강신청내역은 <a href="/page?menuCD=000000000000355" target="_blank" class="link link-style-1" title="새창 이동">[수강확인] </a>메뉴에서 확인 바랍니다.</span></li>

									</div>
								</ul>
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
				<a href="https://www.pusan.ac.kr/kor/CMS/Contents/Contents.do?mCode=MN212" target="_blank" class="link link-style-1" title="새창 이동"><i class="bi bi-geo-alt" aria-hidden="true"></i>캠퍼스 맵 바로가기</a>
				<div class="table-box">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table"  data-show-column="true" id="table01">
							<caption>요일별개인시간표정보</caption>
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
	    <td class="text-center" ># if( :MON_SUBJ_NO != "" && :MON_SUBJ_NO != "null") { #<a class="mon_subj" style="color:blue" href="#popup">#:MON_SUBJ_NM#</a><br/>(<span>#:MON_SUBJ_NO#</span>)-<span>#:MON_CLASS_NO#</span>,<br/><a class="bld" style="color:blue" href="#popup">#:MON_BLD_NM#</a><span class="bld" style="color:blue">(</span><span class="bld" style="color:blue">#:MON_BLD_CD#</span><span class="bld" style="color:blue">)-</span><span class="bld" style="color:blue">#:MON_FACILITY_NO#</span><br/><span>#:MON_PROF_NM#</span>#}#</td>
	    <td class="text-center" ># if( :TUE_SUBJ_NO != "" && :TUE_SUBJ_NO != "null") { #<a class="tue_subj" style="color:blue" href="#popup">#:TUE_SUBJ_NM#</a><br/>(<span>#:TUE_SUBJ_NO#</span>)-<span>#:TUE_CLASS_NO#</span>,<br/><a class="bld" style="color:blue" href="#popup">#:TUE_BLD_NM#<a><span class="bld" style="color:blue">(</span><span class="bld" style="color:blue">#:TUE_BLD_CD#</span><span class="bld" style="color:blue">)-</span><span class="bld" style="color:blue">#:TUE_FACILITY_NO#</span><br/><span>#:TUE_PROF_NM#</span>#}#</td>
		<td class="text-center" ># if( :WED_SUBJ_NO != "" && :WED_SUBJ_NO != "null") { #<a class="wed_subj" style="color:blue" href="#popup">#:WED_SUBJ_NM#</a><br/>(<span>#:WED_SUBJ_NO#</span>)-<span>#:WED_CLASS_NO#</span>,<br/><a class="bld" style="color:blue" href="#popup">#:WED_BLD_NM#</a><span class="bld" style="color:blue">(</span><span class="bld" style="color:blue">#:WED_BLD_CD#</span><span class="bld" style="color:blue">)-</span><span class="bld" style="color:blue">#:WED_FACILITY_NO#</span><br/><span>#:WED_PROF_NM#</span>#}#</td>
		<td class="text-center" ># if( :THU_SUBJ_NO != "" && :THU_SUBJ_NO != "null") { #<a class="thu_subj" style="color:blue" href="#popup">#:THU_SUBJ_NM#</a><br/>(<span>#:THU_SUBJ_NO#</span>)-<span>#:THU_CLASS_NO#</span>,<br/><a class="bld" style="color:blue" href="#popup">#:THU_BLD_NM#</a><span class="bld" style="color:blue">(</span><span class="bld" style="color:blue">#:THU_BLD_CD#</span><span class="bld" style="color:blue">)-</span><span class="bld" style="color:blue">#:THU_FACILITY_NO#</span><br/><span>#:THU_PROF_NM#</span>#}#</td>
		<td class="text-center" ># if( :FRI_SUBJ_NO != "" && :FRI_SUBJ_NO != "null") { #<a class="fri_subj" style="color:blue" href="#popup">#:FRI_SUBJ_NM#</a><br/>(<span>#:FRI_SUBJ_NO#</span>)-<span>#:FRI_CLASS_NO#</span>,<br/><a class="bld" style="color:blue" href="#popup">#:FRI_BLD_NM#</a><span class="bld" style="color:blue">(</span><span class="bld" style="color:blue">#:FRI_BLD_CD#</span><span class="bld" style="color:blue">)-</span><span class="bld" style="color:blue">#:FRI_FACILITY_NO#</span><br/><span>#:FRI_PROF_NM#</span>#}#</td>
		<td class="text-center" ># if( :SAT_SUBJ_NO != "" && :SAT_SUBJ_NO != "null") { #<a class="sat_subj" style="color:blue"href="#popup">#:SAT_SUBJ_NM#</a><br/>(<span>#:SAT_SUBJ_NO#</span>)-<span>#:SAT_CLASS_NO#</span>,<br/><a class="bld" style="color:blue" href="#popup">#:SAT_BLD_NM#</a><span class="bld" style="color:blue">(</span><span class="bld" style="color:blue">#:SAT_BLD_CD#</span><span class="bld" style="color:blue">)-</span><span class="bld" style="color:blue">#:SAT_FACILITY_NO#</span><br/><span>#:SAT_PROF_NM#</span>#}#</td>
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

	});

	/***************************************************************************************************
	Init Screen 화면 로드시 
	 ***************************************************************************************************/
	function fn_initScreen() {
		$("#SCH_LTTM_YN_HID").val('Y');
		SearchSelectNode();
		$("#SCH_COLL_GRAD_GCD").val(scwin.loginUser.collGradGcd);
	}

	function fn_openReport(param) {
		var options = {};

		options.rptName = "/ses/cls/openlectsituation/lectroomOpenLectSituation/LectTimetableLectroom.crf";
		param = gfn_com_searchData($(".search-box"));
		//파라메터 설정
		//var objParam = dma_SearchParam.getJSON();
		var objParam = {};
		objParam.LTTM_YN = checkYn; //기준년도
		objParam.SCH_SYEAR = paramData.SCH_SYEAR; //기준년도
		objParam.SCH_TERM_GCD = paramData.SCH_TERM_GCD; //기준월
		objParam.SCH_BLD_CD = paramData.SCH_BLD_CD;
		objParam.SCH_FACILITY_NO = paramData.SCH_FACILITY_NO;
		objParam.USER_NM = scwin.loginUser.nm;

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
				"STARTYEAR" : '2020',
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
			url : "/ost/cls/timetablesearch/persontimetablesearch/selectPersonTimetableValid",
			reqData : data,
			success : function(data, responseData) {


				if (data.R_CHK == 'N') {
					alert(data.R_MSG);
				} else {
					fn_sch2(data);
				}

			}
		});
	}

	function fn_sch2(data) {
		gfn_ajax_request({
			url : "/ost/cls/timetablesearch/examtimetablesearch/selectexamTimetableValid",
			reqData : paramData,
			success : function(data, responseData) {


				if (data.R_CHK == 'N') {
					alert(data.R_MSG);
				} else {
					fn_mainSearch(paramData);
				}

			}
		});

	}

	function fn_mainSearch(data) {
		gfn_ajax_request({
			url : "/ost/cls/timetablesearch/persontimetablesearch/selectPersonTimetable",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody").listView({
					dataSource : data,
					dataBound : function(e) {
						$('#resultTbody .bld').bind("click", function(e) {
							window.open('https://www.pusan.ac.kr/kor/CMS/Contents/Contents.do?mCode=MN212');
						});
						$('#resultTbody .mon_subj').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();
										 fn_openReport2('MON',param,'KOR',e.target.nextElementSibling.nextElementSibling.innerText,e.target.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
								});
						$('#resultTbody .tue_subj').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();
										 fn_openReport2('TUE',param,'KOR',e.target.nextElementSibling.nextElementSibling.innerText,e.target.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
								});
						$('#resultTbody .wed_subj').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();
										 fn_openReport2('WED',param,'KOR',e.target.nextElementSibling.nextElementSibling.innerText,e.target.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
								});
						$('#resultTbody .thu_subj').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();
										 fn_openReport2('THU',param,'KOR',e.target.nextElementSibling.nextElementSibling.innerText,e.target.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
								});
						$('#resultTbody .fri_subj').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();
										 fn_openReport2('FRI',param,'KOR',e.target.nextElementSibling.nextElementSibling.innerText,e.target.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
								});
						$('#resultTbody .sat_subj').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();
										 fn_openReport2('SAT',param,'KOR',e.target.nextElementSibling.nextElementSibling.innerText,e.target.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
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

			}
		});
	}
	function fn_openReport2(day,param,gbn,subjNo,classNo) {
		
		var EDUCERT_GCD = null;
		var PROF_NO = null;
		if(day == "MON"){
			EDUCERT_GCD = param.MON_EDUCERT_GCD;
			PROF_NO = param.MON_PROF_NO;
			PRT_YN = param.MON_PRT_YN;
		}else if(day == "TUE"){
			EDUCERT_GCD = param.TUE_EDUCERT_GCD;
			PROF_NO = param.TUE_PROF_NO;
			PRT_YN = param.TUE_PRT_YN;
		}else if(day == "WED"){
			EDUCERT_GCD = param.WED_EDUCERT_GCD;
			PROF_NO = param.WED_PROF_NO;
			PRT_YN = param.WED_PRT_YN;
		}else if(day == "THU"){
			EDUCERT_GCD = param.THU_EDUCERT_GCD;
			PROF_NO = param.THU_PROF_NO;
			PRT_YN = param.THU_PRT_YN;
		}else if(day == "FRI"){
			EDUCERT_GCD = param.FRI_EDUCERT_GCD;
			PROF_NO = param.FRI_PROF_NO;
			PRT_YN = param.FRI_PRT_YN;
		}else if(day == "SAT"){
			EDUCERT_GCD = param.SAT_EDUCERT_GCD;
			PROF_NO = param.SAT_PROF_NO;
			PRT_YN = param.SAT_PRT_YN;
		}
		var options ={};
        var objParam = {};	
        
    	var SCH_LANG_GCD = "";
	 	if(PRT_YN == "KOR_Y"){
	 		SCH_LANG_GCD      = '0001';
        }else if(PRT_YN == "ENG_Y"){
        	SCH_LANG_GCD		= '0002';
        }
	 	

        
        if(param.EDUCERT_GCD == null){ //교육인증 구분코드 없을때./////////////////////////////////////////////////////////////////////////////
        	if(gbn == "KOR") { //국문
                options.rptName = "/ses/cls/sylmng/sylprint/SylPrint_001.crf";
            } else {//영문
                options.rptName = "/ses/cls/sylmng/sylprint/SylPrint_002.crf";
            }	
        	objParam.SCH_CURC_APPLY_SYEAR = paramData.SCH_SYEAR;
        	objParam.SCH_TERM_GCD = paramData.SCH_TERM_GCD;
		    		objParam.bind = [{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["MST"
		                ,paramData.SCH_SYEAR
		                ,paramData.SCH_TERM_GCD
		                ,PROF_NO
		                ,subjNo
		                ,classNo
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
		                ,PROF_NO
		                ,subjNo
		                ,classNo
		                ,SCH_LANG_GCD
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,EDUCERT_GCD
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
		                ,PROF_NO
		                ,subjNo
		                ,classNo
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
		                ,PROF_NO
		                ,subjNo
		                ,classNo
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
        		options.rptName = "/ses/ae/sylmng/sylprint/SylPrint"+EDUCERT_GCD+"_001.crf";
        		objParam.bind = [{
	                db : "EDUCERT",
	                proc : "AE_교수계획표관리_통합_교수계획표_출력",
	                params : [
	                paramData.SCH_SYEAR
	                ,paramData.SCH_TERM_GCD
	                ,subjNo
	                ,classNo
	                ,PROF_NO
	                ,SCH_LANG_GCD
	                ,EDUCERT_GCD
	                ]
	       		 }];
        	}else if(gbn == "ENG"){
        		options.rptName = "/ses/ae/sylmng/sylprint/SylPrint"+EDUCERT_GCD+"_002.crf";
        		objParam.bind = [{
	                db : "EDUCERT",
	                proc : "AE_교수계획표관리_통합_교수계획표_출력",
	                params : [
	                paramData.SCH_SYEAR
	                ,paramData.SCH_TERM_GCD
	                ,subjNo
	                ,classNo
	                ,PROF_NO
	                ,SCH_LANG_GCD
	                ,EDUCERT_GCD
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
	
	function fn_openReport(param) {
		var options ={};
                    
       options.rptName = "/ses/cls/openlectsituation/lectroomOpenLectSituation/LectTimetableLectroom2.crf";
       param = gfn_com_searchData($(".search-box"));
        //파라메터 설정
        //var objParam = dma_SearchParam.getJSON();
        var objParam = {};
    	objParam.LTTM_YN								= checkYn;  
    	objParam.SCH_SYEAR		= param.SCH_SYEAR;  
        objParam.SCH_TERM_GCD                    = param.SCH_TERM_GCD;  
        objParam.USER_NO				= scwin.loginUser.userId;
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

        fn_openPopup(options);

	}

	function fn_openPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "개인별 시간표",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
</script>