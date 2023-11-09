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
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>학년도/학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="" style="width: 49%">
										<input id="SCH_SYEAR" class="form-control" type="number" data-bind="value: SYEAR" title="학년도입력"></input>
									</div>
									<div class="" style="width: 49%; margin-left: 3px;">
										<select id="SCH_TERM_GCD" class="form-control" title="학기선택"></select>
									</div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SEARCH_GBN1" data-lang>검색구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="form-check form-check-inline">
										<input type="radio" id="SEARCH_GBN1" name="SEARCH_GBN" class="" style="" value="1" checked="checked"/><label for="SEARCH_GBN1" class="form-check-label" data-lang>교원검색</label>
									</div>
									<div class="form-check form-check-inline">
										<input type="radio" id="SEARCH_GBN2" name="SEARCH_GBN" class="" style="" value="2"/><label for="SEARCH_GBN2" class="form-check-label" data-lang>교과목명 검색</label>
									</div>
								</div>
							</div>
							<div class="b-row-item" id="row_prof">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="profSearch" data-lang>교원검색</label>
								</div>
								<div class="b-con-box" role="cell">
									<!-- 교원검색 : class에 profseacher추가 -->
									<input type="text" id="profSearch" name="profSearch" class="form-control profsearcher" placeholder="교원 이름" callbackFunc="profsearcherCallback" title="교원이름"/> <input type="text" id="profDept" name="profDept" class="form-control" readOnly="true" title="교원소속" />
								</div>
							</div>
							<div class="b-row-item" id="row_subj">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SUBJ_NM" data-lang>교과목명</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_SUBJ_NM" class="form-control" />
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
				<!-- /END 검색 영역 -->
				<!-- 테이블 -->
				<div class="table-box" id=grid01>
					<span id="textDiv" style="color: blue;"></span>

					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>교수교과목정보</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 60px;">
								<col style="min-width: 150px;">
								<col style="min-width: 120px;">
								<col style="min-width: 50px;">
								<col style="min-width: 80px;">
								<col style="min-width: 150px;">
								<col style="min-width: 40px;">
								<col style="min-width: 40px;">
								<col style="min-width: 40px;">
								<col style="min-width: 40px;">
								<col style="min-width: 30px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">대학/대학원</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">분반</th>
									<th scope="col">교수명</th>
									<th scope="col">수강학과</th>
									<th scope="col">원어</th>
									<th scope="col">파일</th>
									<th scope="col">출력</th>
									<th scope="col">출력</th>
									<th scope="col">팀티칭</th>
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
		<td>#:COLL_GRAD_GCD#</td>
        <td class="text-left">#:SUBJ_NM#</td>
        <td>#:SUBJ_NO#</td>
	    <td>#:CLASS_NO#</td> 
	    <td>#:PROF_NM#</td>
	    <td class="text-left">#:ATLECT_DEPT_NM#</td> 
		<td>#:NATIVE_LANG_NM#</td> 
		<td>
			# if( :DOWNLOAD_FG == "Y") { # 
					<button class="btn btn-outline-primary file-down" type="button">다운로드 <i class="bi bi-download" aria-hidden="true"></i></button>
	        #} else if ( :DOWNLOAD_FG == "N") { #

	        #}#
		</td> 

		<td>	 
			# if( :PRT_KOR == "국문") { #
	               <button class="btn btn-outline-primary kor" type="button" id="kor">국문</button>
	        #} else if ( :PRT_KOR == "") { #
	               
	        #}#
		</td> 
		<td>
			# if( :PRT_ENG == "영문") { #
	               <button class="btn btn-outline-primary eng" type="button" id="eng">영문</button>
	        #} else if ( :PRT_KOR == "") { #
	               
	        #}#
		<td>#:TEAM_TEACHING_FG#</td> 
		<span style="display:none;">#:ATTACH_FILE_GRP_CD#</span>
	</tr>
</script>


<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	var termInfo = [];
	var _multi;
	/***************************************************************************************************
	Event
	 ***************************************************************************************************/
	$(document).ready(function() {
		$("[name=searchParam],[name=SEARCH_GBN]").change(
				function() {
					fn_VisibleSet();
					
					$("#resultTbody").listView({
						dataSource : [],
						dataBound : function(e) {
						},
						template : $("#resultTemplate"),
						totalCnt : 0
				});
				});
		$("[id=SCH_SYEAR],[id=SCH_TERM_GCD]").change(
				function() {
					$("#resultTbody").listView({
						dataSource : [],
						dataBound : function(e) {
						},
						template : $("#resultTemplate"),
						totalCnt : 0
				});

		});
	});
	/***************************************************************************
	 * fn_setCommonCd
	 **************************************************************************/
	function fn_initScreen() {
		//code select
		fn_setCommonCd();
	}
	function profsearcherCallback(info) {
		$("#profDept").val(info.ASSIGN_NM);
	}
	/***************************************************************************
	 * fn_setCommonCd
	 **************************************************************************/
	function fn_setCommonCd() {
		var date = new Date();
		var maxdate = date.getFullYear();
		/*학년도 바인드*/
		/* gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : "2017",
				"ENDYEAR" : maxdate
			},
			success : function(data, responseData) {
			}
		}); */
		
		/* $("#SCH_SYEAR").dropDownList({
			dataSource : null,
			commonCode : "",
			dataTextField : "LABEL",
			dataValueField : "CODE",
			optionLabel : "",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			dataBound : function(e) {
			}
		}); */
		
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

		/*학과소속 바인드*/
		/* gfn_com_assignCombo({
			collGradGcd : $("#SCH_COLL_GRAD_GCD"),
			comboLvl : 4,
			dataBound : function(e) {

			}
		}); */
		
		$("#row_subj").hide(); //교과목검색
	}
	/***************************************************************************
	 * 조회 Event
	 **************************************************************************/
	var paramData ;
	
	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		paramData = data;
		/* 필수체크 */
		if ($("input[type=radio][name=SEARCH_GBN]:checked").val() == "1"){
			if (!gfn_val_validateDataMap(data, [ {
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
			} ]))
				return false;
			
			if($("#profSearch_hidden").val() == "" && $("#profSearch").val() != ""){
				alert("교원 검색후 조회바랍니다.");
				return false;
			}
		} else{
			if (!gfn_val_validateDataMap(data, [ {
				"id" : "SCH_SYEAR",
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
			url : "/ost/cls/syl/sylsearch/selectSylSearch",
			reqData : data,
			success : function(data, responseData) {
				if(termInfo.SYEAR == $("#SCH_SYEAR").val() && termInfo.TERM_GCD == $("#SCH_TERM_GCD").val() && responseData.possDate != null && responseData.possDate.START_DT != undefined ){
					$("#textDiv").text("※ 강의평가 결과는 [성적 > 강의평가 결과 공개] 메뉴에서 조회할 수 있습니다. [ 조회가능기간: "+responseData.possDate.START_DT + " ~ " + responseData.possDate.END_DT + " ]");
				}else{
					$("#textDiv").text("");
				}
				$("#resultTbody").listView({
					dataSource : data,
					dataBound : function(e) {
					
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;
						$('#resultTbody .file-down').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();
										 fn_sylFileDownload(param);
								});
						$('#resultTbody .kor').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();
										 fn_openReport(param,'KOR');
								});
						$('#resultTbody .eng').bind(
								"click",
								function(e) {
										 param = $(this).closest("tr").data();
										 fn_openReport(param,'ENG');
								});
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
	
	function fn_excelDownload() {

		data = gfn_com_searchData($(".search-box"));
		data.pageSize = totalCnt; //전체데이터를 가지고 오기 위해서 pageSize를 전체건수로 세팅
		gfn_ajax_request({
			url : "/ost/cls/syl/sylsearch/selectSylSearch",
			reqData : data,
			success : function(data, responseData) {
				if (data.length > 0) {
					/* [엑셀다운로드 공통] */
					gfn_com_excelDownloadFile([ {
						key : "SUBJ_NM",
						name : "교과목명"
					}, {
						key : "SUBJ_NO",
						name : "교과목번호"
					}, {
						key : "CLASS_NO",
						name : "분반"
					}, {
						key : "PROF_NM",
						name : "교수명"
					}, {
						key : "ATLECT_DEPT_NM",
						name : "수강학과"
					}, {
						key : "NATIVE_LANG_NM",
						name : "원어"
					}, {
						key : "TEAM_TEACHING_FG",
						name : "팀티칭"
					} ], /* 엑셀에 표시할 컬럼 및 명칭 */
					data, /* 엑셀로 다운로드 할 데이터 */
					"수업_교수계획표" /* 엑셀로 다운로드 할 파일명 (확장자제외) */
					);
				} else {
					alert("엑셀로 다운로드할 데이터가 없습니다.");
					return false;
				}
			}
		});
	}
	
	function fn_sylFileDownload(param) {
		var options = {};
		options.url = '/file/selectList';
		options.reqData = {
			SYSTEM_GCD:  "0001",
			ATTACH_FILE_GCD: "0001",
			ATTACH_FILE_GRP_CD: param.ATTACH_FILE_GRP_CD
		};
		options.success = function(data, responseData) {
			$.each(data,function(idx,file){
				window.open('https://onestop.pusan.ac.kr/file/download.do?'+file.PARAM_CODE, '_blank');
			});
		};
		gfn_ajax_request(options);
	}
	
	function fn_VisibleSet(info) {
		if ($("input[type=radio][name=SEARCH_GBN]:checked").val() == "1"){
			$("#row_prof").show(); //교원검색
			$("#row_subj").hide(); //교과목검색
		}else{
			$("#row_prof").hide(); //교원검색
			$("#row_subj").show(); //교과목검색
		}
	}
	

</script>