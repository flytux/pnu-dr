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
				<!-- 검색 영역 -->
				<div class="search-box">
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
								</div>
							</div>
						</div>
						<!-- 1Row -->
					</div>

					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
							</div>
						</div>
					</div>
				</div>
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn">참고내용</span>
									<button class="btn btn-danger btn-sm ml-1" type="button" onclick="javascript:$('#doc').toggle('slow');$(this).text((($(this).text() == '펼치기')?'접기':'펼치기'));">접기</button>
								</li>
								<div id="doc" style="">
									<li><span class="dfn">※ </span> 미확정 : 개설은 되었으나 교육혁신과에서 확정하지 않은 교과목(수강신청이 불가하오니 개설학과로 문의하세요.)</li>
									<li><span class="dfn">※ </span> 미지정 : 확정은 되었으나 시간표가 입력되어 있지 않은 교과목(제한사항이 걸려 있는 경우를 제외하고는 수강신청 가능.)</li>
								</div>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 검색 영역 -->
				<!-- 테이블 -->
				<div class="table-box" id=grid01>

					<div class="table-body">
						<table class="table table-hover" data-show-column="true" id="table01">
							<caption>타대생수강편람 교과목정보</caption>
							<colgroup>
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 50px;">
								<col style="min-width: 80px;">
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 90px;">
								<col style="min-width: 20px;">
								<col style="min-width: 150px;">
								<col style="min-width: 70px;">
								<col style="min-width: 20px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col"><span style="font-size:12px"><label data-lang>개설<br/>학과</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>원격<br/>수업</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>원어<br/>강의</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>학<br/>년</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>교과목<br/>구분</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>교과목명<br/>(미확정구분)</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>교과목번호</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>분반</label><br/><label data-lang>학점/시간</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>제한인원</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>교수명</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>시간/강의실</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>교수<br/>계획표</label></span></th>
									<th scope="col"><span style="font-size:12px"><label data-lang>비고</label></span></th>
								</tr>
							</thead> 
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>
				</div>

				<!-- /END 테이블 -->

			</div>
		</section>
	</main>
</div>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
		<td class="text-left" style="font-size:12px">#:MNG_DEPT_NM#</td> 
        <td style="font-size:12px">#:ALL_CYBER#</td>
        <td style="font-size:12px">#:NATIVE_LANG_NM#</td>
	    <td style="font-size:12px">#:STDT_YEAR_NM#</td> 
	    <td style="font-size:12px">#:SUBJ_GCD_NM#</td>
	    <td class="text-left"><a class="subj-detail" style="color:blue; font-size:12px;" href ="#popup">#:SUBJ_NM#</a></td> 
		<td style="font-size:12px">#:SUBJ_NO#</td> 
		<td style="font-size:12px">#:CLASS_NO#<br/>#:CRDT#/#:SIGAN#</td> 
		<td style="font-size:12px">#:ALLOC_RCNT#
			<button class="btn btn-outline-secondary rcnt-detail" type="button"><i class="bi bi-display" aria-hidden="true"></i><a style="font-size:13px;">상세</a>
			</button>
		</td> 
		<td class="text-left"><a class="prof-detail" style="color:blue; font-size:12px;" href ="#popup">#:PROF_NM#</a></td> 
		<td class="text-left" style="font-size:12px">#:TIMETABLE_SUMMARY_INFO#</td> 
		<td>	
			# if( :PRT_KOR == "국문") { #
	               <button class="btn btn-outline-primary kor" type="button"><a style="font-size:5px;">국문</a></button>
	        #} else if ( :PRT_KOR == "") { #
	               
	        #}#
			# if( :PRT_ENG == "영문") { #
	               <button class="btn btn-outline-secondary eng" type="button"><a style="font-size:5px;">영문</a></button>
	        #} else if ( :PRT_ENG == "") { #
	               
	        #}#
		</td> 
		<td class="text-left" style="font-size:12px">
			# if( :REMARK.indexOf("혼합") !== -1) { #
					<a style="color:blue" class="remark-detail">#:REMARK#</a>	               
	        #} else if( :REMARK.indexOf("혼합") == -1){ #
					
	        #}#
		</td> 
	</tr>
</script>


<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	var termInfo = [];

	/***************************************************************************************************
	Event
	 ***************************************************************************************************/
	$(document).ready(function() {
		$(".search-box").change(
				function(info) {
					chk = 'N';						
				});
	});
	/***************************************************************************
	 * fn_setCommonCd
	 **************************************************************************/
	function fn_initScreen() {
		//code select
		fn_setCommonCd();
		if (scwin.loginUser.userId != null
				&& scwin.loginUser.userId != undefined
				&& scwin.loginUser.userId != "") {
			$("#SCH_ALLOC_CHK").val('Y');
		} else {
			$("#SCH_ALLOC_CHK").val('N');
		}
	}


	/***************************************************************************
	 * fn_setCommonCd
	 **************************************************************************/
	function fn_setCommonCd() {
		/*학년도 바인드*/
		var sch_year = get_year();
        var sch_term = get_semester_hakgi();
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : "2000",
				"ENDYEAR" : sch_year
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
						termInfo = responseData.termInfo;
						$("#SCH_SYEAR").val(sch_year);
						/*학기 공통코드 바인드*/
						$("#SCH_TERM_GCD").dropDownList({
							dataSource : null,
							commonCode : "0001_TERM_GCD",
							dataTextField : "COMMON_DETAIL_CD_KOR_NM",
							dataValueField : "COMMON_DETAIL_CD",
							optionLabel : "",
							optionValue : "",
							defaultValue : "",
							expnCondition : "AND CHAR_1_CONTENT LIKE '%B%' ",
							dataBound : function(e) {
								$("#SCH_TERM_GCD").val(sch_term);
							}
						});
					}
				});
			}
		});
	}
	/***************************************************************************************************
	배정인원 조회 가능여부  조회
	 ***************************************************************************************************/
	 var SearchYn = 'N';
	 function fn_SearchPersonnellSearchFg(){
		 gfn_ajax_request({
				url : "/ost/cls/atlectmanual/atlectmanual/selectPeronnellSearchPossFg",
				reqData : {
					"SCH_SYEAR" : $("#SCH_SYEAR").val(),
					"SCH_TERM_GCD" : $("#SCH_TERM_GCD").val()
				},
				success : function(data, responseData) {
					SearchYn = data.ALLOW_YN
				}
			});
	}
	var paramData
	var chk = 'N';
	/***************************************************************************
	 * 조회 Event
	 **************************************************************************/
	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
			paramData = data;
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
		fn_SearchPersonnellSearchFg();
		if(chk =="N"){
		    data.pageSize = 50;
		}
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/atlectmanual/exunivstdtatlectmanual/selectExunivStdtAtlectManual",
			reqData : data,
			success : function(data, responseData) {
			    chk = "Y";
				$("#resultTbody")
						.listView(
								{
									dataSource : data,
									dataBound : function(e) {
										$('#resultTbody .subj-detail')
												.bind(
														"click",
														function(e) {


															scwin.detailObj01 = $(
																	this)
																	.closest(
																			"td")
																	.closest(
																			"tr")
																	.data();
															fn_openPopup({
																width : 800,
																height : 200,
																filename : 'AtlectManualPrecautionSearchPop',
																headertitle : '제한사항'
															});
														});
										$('#resultTbody .rcnt-detail')
												.bind(
														"click",
														function(e) {
															if (SearchYn == 'Y') {

																scwin.detailObj01 = $(
																		this)
																		.closest(
																				"td")
																		.closest(
																				"tr")
																		.data();
																fn_openPopup({
																	width : 400,
																	height : 350,
																	filename : 'AtlectManualPersonnelSearchPop',
																	headertitle : '배정인원상세보기'
																});
															} else if (SearchYn == 'N') {
																alert('수강신청기간에는 일시적으로 서비스를 제한합니다.');
															}

														});
										$('#resultTbody .remark-detail')
												.bind(
														"click",
														function(e) {
															scwin.detailObj01 = $(
																	this)
																	.closest(
																			"td")
																	.closest(
																			"tr")
																	.data();
															fn_openPopup({
																width : 800,
																height : 550,
																filename : 'AtlectManualMixSearchPop',
																headertitle : '혼합 개설교과목 일자별 수업유형'
															});
														});
										$('#resultTbody .prof-detail')
												.bind(
														"click",
														function(e) {
															scwin.detailObj01 = $(
																	this)
																	.closest(
																			"td")
																	.closest(
																			"tr")
																	.data();
															fn_openPopup({
																width : 1000,
																height : 300,
																filename : 'AtlectManualDetailProfSearchPop',
																headertitle : '교수상세정보보기'
															});
														});
										$('#resultTbody .kor')
												.bind(
														"click",
														function(e) {
															param = $(this)
																	.closest(
																			"tr")
																	.data();
									
															fn_openReport(
																	param,
																	'KOR');
														});
										$('#resultTbody .eng')
												.bind(
														"click",
														function(e) {
															param = $(this)
																	.closest(
																			"tr")
																	.data();
											
													
															fn_openReport(
																	param,
																	'ENG');
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
				$('#table01').rowspan(1);
			}

		});
	}
	function fn_openReport(param, gbn) {
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
        	objParam.SCH_CURC_APPLY_SYEAR = paramData.SCH_SYEAR;
        	objParam.SCH_TERM_GCD = paramData.SCH_TERM_GCD;
		    		objParam.bind = [{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["MST"
		                ,paramData.SCH_SYEAR
		                ,paramData.SCH_TERM_GCD
		                ,param.PROF_NO
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
		                ,param.PROF_NO
		                ,param.SUBJ_NO
		                ,param.CLASS_NO
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
		                ,param.PROF_NO
		                ,param.SUBJ_NO
		                ,param.CLASS_NO
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
		                ,param.PROF_NO
		                ,param.SUBJ_NO
		                ,param.CLASS_NO
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
	                ,param.CLASS_NO
	                ,param.PROF_NO
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
	                ,param.CLASS_NO
	                ,param.PROF_NO
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

	function fn_openPopup(_option) {
		gfn_com_modalPopup({
			width : _option.width,
			height : _option.height,
			index : 1,
			/* position : {
				top : 300,
				left : 300
			}, */
			target : null,
			title :  _option.headertitle,
			//scrolling : "on",
			//scroll : "off",
			//move : "on",
			include : "/html/ost/cls/atlectmanual/" + _option.filename
					+ ".html"
		});
	}
	function fn_excelDownload() {

		data = gfn_com_searchData($(".search-box"));
		data.pageSize = totalCnt; //전체데이터를 가지고 오기 위해서 pageSize를 전체건수로 세팅
		gfn_ajax_request({
			url : "/ost/cls/atlectmanual/exunivstdtatlectmanual/selectExunivStdtAtlectManual",
			reqData : data,
			success : function(data, responseData) {
				if (data.length > 0) {
					/* [엑셀다운로드 공통] */
					gfn_com_excelDownloadFile([ {
						key : "MNG_DEPT_NM",
						name : "개설학과"
					}, {
						key : "NATIVE_LANG_NM",
						name : "원어강의"
					}, {
						key : "SUBJ_GCD_NM",
						name : "교과목구분"
					}, {
						key : "SUBJ_NM",
						name : "교과목명(미확정구분)"
					}, {
						key : "SUBJ_NO",
						name : "교과목번호"
					}, {
						key : "CLASS_NO",
						name : "분반"
					}, {
						key : "CRDT",
						name : "학점"
					}, {
						key : "SIGAN",
						name : "시간"
					}, {
						key : "STDT_YEAR_NM",
						name : "학년"
					}, {
						key : "ALLOC_RCNT",
						name : "제한인원"
					}, {
						key : "PROF_NM",
						name : "교수명"
					}, {
						key : "TIMETABLE_SUMMARY_INFO",
						name : "시간/강의실"
					},{
						key : "PRT_KOR",
						name : "교수계획표(국문)"
					}, {
						key : "PRT_ENG",
						name : "교수계획표(영문)"
					}, {
						key : "REMARK",
						name : "비고"
					} ], /* 엑셀에 표시할 컬럼 및 명칭 */
					data, /* 엑셀로 다운로드 할 데이터 */
					"수업_타대생수강편람" /* 엑셀로 다운로드 할 파일명 (확장자제외) */
					);
				} else {
					alert("엑셀로 다운로드할 데이터가 없습니다.");
					return false;
				}
			}
		});
	}
</script>