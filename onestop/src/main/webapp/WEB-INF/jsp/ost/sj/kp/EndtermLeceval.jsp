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
				<section class="sec-2">
					<div class="sec-body">
						<section class="sec-3">
							<div class="sec-body">
								<div class="search-box">
									<input type="hidden" id="SYEAR" class="form-control" title="학년도"/> 
									<input type="hidden" id="TERM_GCD" class="form-control" title="학기"/> 
									<input type="hidden" id="STDT_NO" class="form-control"  title="학번"/>
								</div>
								<div class="table-box">
									<div class="table-body">
										<table class="table table-hover" data-show-column="true">
											<caption>부산대학교 8대 핵심역량정보</caption>
											<colgroup>
												<col style="min-width: 50px;">
												<col style="min-width: 50px;">
												<col style="min-width: 50px;">
												<col style="min-width: 50px;">
												<col style="min-width: 50px;">
												<col style="min-width: 50px;">
												<col style="min-width: 50px;">
												<col style="min-width: 50px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" colspan="8">부산대학교 8대 핵심역량</th>
												</tr>
											</thead>
											<tbody>
												<tr>
											        <td>글로벌문화역량</td>
												    <td>소통역량</td>
												    <td>융복합역량</td>
												    <td>응용역량</td>
												    <td>봉사역량</td>
												    <td>인성역량</td>
												    <td>기초지식역량</td>
												    <td>고등사고역량</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								
								<!-- 테이블 -->
								<div class="table-box">
									<div class="table-body">
										<div class="table-responsive">
											<table class="table table-hover" data-toggle="table"  data-show-column="true">
												<caption>기말강의평가과목정보</caption>
												<colgroup>
													<col style="min-width: 50px;">
													<col style="min-width: 200px;">
													<col style="min-width: 50px;">
													<col style="min-width: 80px;">
													<col style="min-width: 100px;">
													<col style="min-width: 100px;">
													<col style="min-width: 100px;">
													<col style="min-width: 100px;">
												</colgroup>
												<thead>
													<tr>
														<th scope="col">과목번호</th>
														<th scope="col">교과목명</th>
														<th scope="col">분반</th>
														<th scope="col">담당교수</th>
														<th scope="col">영어강의</th>
														<th scope="col">교육인증</th>
														<th scope="col">교수계획표</th>
														<th scope="col">응답여부</th>
													</tr>
												</thead>
												<tbody id="resultTbody">
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- /END 테이블 -->
							</div>
						</section>
						<div class="message-box">
							<div class="message-box-inner">
								<div class="message-body">
									<ul class="list list-style-1">
										<li data-lang>강의평가는 1회만 할 수 있으며 입력완료(제출) 후에는 점수를 수정 할 수 없습니다.</li>
										<li data-lang>각 문항의 최저점(1)을 부여했을 경우 구체적인 이유를 기재하여 주시기 바랍니다.(필수작성)</li>
										<li data-lang>강의담당교수님의 강의평가 자료이므로 신중을 기하여 주시기 바랍니다.</li>
										<li data-lang>타대생은 강의평가에서 제외입니다.</li>
										<li data-lang>설문내용은 강의평가 자료로만 활용되고 통계처리된 내용만이 교수님에게 전달되므로</br> 본인의 신분노출에 대해서는 전혀 걱정할 필요가 없음을 알려드립니다.</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</section>
	</main>
</div>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td>#:SUBJ_NO#</td>
	    <td class="text-left" scope="row">#:SUBJ_NM#</td>
	    <td>#:CLASS_NO#</td>
	    <td class="text-left">#:NM#</td>
	    <td>#:NATIVE_LANG_LECT_GCD#</td>
		<td>
			#:EDUCERT_GCD_NM#
		</td>
	    <td>
			# if( :PRT_KOR == "국문") { #
	               <button class="btn btn-outline-primary kor" type="button">국문</button>
	        #}#
			# if( :PRT_ENG == "영문") { #
	               <button class="btn btn-outline-secondary eng" type="button">영문</button>
	        #}#
	    </td>
		<td>
			#if( :CNT > 0 && (:EDUCERT_CNT > 0 || :EDUCERT_GCD == "null") ) { #
				O
	        #} else { #
	               <button class="btn btn-outline-primary write-btn" type="button">작성</button>
	        #}#
		</td>
		<td style="display:none;">#:CHARGE_PROF_NO#</td>
	</tr>
</script>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;

	function fn_initScreen() {
		//$("#STDT_NO").val(scwin.loginUser.userId);
		//alert("[긴급]기말강의평가 서비스 중지 알림\n 12/30 금일 기말강의평가 서비스 장애로 인해 긴급히 서비스를 중지하였습니다.프로그램 점검 및 조치 완료하여 다시 오픈하도록 하곘습니다.\n \n 성적 열람기간에 장애로 인해 불편을 드려 대단히 죄송합니다.\n 최대한 빠른 시간 내에 조치 완료하여 서비스 개시하도록 하겠습니다.\n 감사합니다.")
		fn_schdChk();
	}

	/***************************************************************************
	 * 학사일정 조회
	 **************************************************************************/
	function fn_schdChk(data) {
		
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		
		data.SYSTEM_GCD = scwin.menuInfo.SYSTEM_GCD;
		data.MENU_CD = scwin.menuInfo.MENU_CD;
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sj/kp/endtermleceval/searchEndSchdChk",
			reqData : data,
			success : function(data, responseData) {
				$("#SYEAR").val(data.SYEAR); 
				$("#TERM_GCD").val(data.TERM_GCD); 

				if(data.CHK == 'F') {
					if(data.SCHD_START_DT!=null && data.SCHD_CLOSE_DT!=null){
						alert(data.SCHD_START_DT+'부터 ' + data.SCHD_CLOSE_DT+'까지 강의평가 기간입니다.');
					}else{
						alert("강의평가 준비가 되지 않았습니다.");
					}
					return;
					/*if(scwin.loginUser.userChgAuthYn == "Y"
						|| !gfn_com_isEmptyObject(scwin.loginUser.originId)){
						fn_sch();
					} else {
						return;
					}*/
				} else {
					fn_sch();
				}
			}
		});
	}
	var paramData
	/***************************************************************************
	 * 강의평가 목록 조회
	 **************************************************************************/
	function fn_sch(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
			paramData = data;
		}

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sj/kp/endtermleceval/selectEndtermLeceval",
			reqData : data,
			success : function(data, responseData) {
				var questionFg = "N"
				var len = JSON.stringify(data.length);
				for (var i = 0; i < len; i++) {
					if (data[i].CNT > 0) {
						questionFg = "Y"
						break;
					} else {
						questionFg = "N"
					}
				}
				
				// 입력된 강의평가가 없을 시 주의사항 팝업 호출
				// [2023-10-20 정문주] 중간/기말 안내팝업 분리
				if(questionFg == "N") {
					fn_PrecautionsPopup({
						filename : 'EndtermPrecautionsPop',
						headertitle : '강의평가 목적 및 방법, 주의사항 안내'
					});
				} else {
					fn_schCallBack();
				}
			}
		});
	}
	
	/***************************************************************************
	 * 강의평가 목록 조회
	 **************************************************************************/
	function fn_schCallBack(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sj/kp/endtermleceval/selectEndtermLeceval",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody").listView(
						{
							dataSource : data,
							dataBound : function(e) {
								$('#resultTbody .kor').bind(
										"click",
										function(e) {
												 param = $(this).closest("tr").data();

												 fn_openProPlanReport(param,'KOR');
										});
								$('#resultTbody .eng').bind(
										"click",
										function(e) {
											param = $(this).closest("tr").data();

											fn_openProPlanReport(param,'ENG');
										});
								
				
								$('#resultTbody .write-btn').unbind();
								$('#resultTbody .write-btn').bind(
										"click",
										function(e) {
											scwin.detailObj = $(this).closest(
													"tr").data();
											
											if(scwin.detailObj.CNT == 0 ){
												fn_openPopup({
													filename : 'EndtermLecevalPop',
													headertitle : '작성'
												});	
											}else{
												if(scwin.detailObj.EDUCERT_CNT == 0 ){
													fn_openPopup({
														filename : 'EducertLecevalPop_'+scwin.detailObj.EDUCERT_GCD,
														headertitle : scwin.detailObj.EDUCERT_GCD_NM+' 작성'
													});
												}
											}
								});
								totalCnt = responseData.pageInfo.totCnt;
								currentData = data;
							},
							template : $("#resultTemplate"),
							totalCnt : responseData.totalCnt,
							paging : {
								pageInfo : responseData.pageInfo,
								reqData : responseData.reqData,
								func : "fn_schCallBack"
							},
							excel : null
						});
			}
		});
	}

	/***************************************************************************
	 * 강의평가 작성, 교수계획표 팝업 호출
	 **************************************************************************/
	function fn_openPopup(_option) {
		//console.log(_option);
		gfn_com_modalPopup({
			width : 1500,
			height : 900,
			index : 1,
			target : null,
			title : "기말강의평가 " + _option.headertitle,
			dataBound : _option.dataBound,
			include : "/html/ost/sj/kp/" + _option.filename + ".html"
		}); 
	}
	
	/***************************************************************************
	 * 주의사항 팝업 호출
	 **************************************************************************/
	function fn_PrecautionsPopup(_option) {
		gfn_com_modalPopup({
			width : 1500,
			height : 800,
			index : 1,
			target : null,
			title :  _option.headertitle,
			scrolling : "on",
			scroll : "off",
			move : "on",
			include : "/html/ost/sj/kp/" + _option.filename + ".html"
		}); 
	}
	
	
	
	function fn_openProPlanReport(param,gbn) {
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
        		options.rptName = "/ses/kp/sylmng/sylprint/SylPrint_001.crf";
            } else {
                options.rptName = "/ses/kp/sylmng/sylprint/SylPrint_002.crf";
            }
        	objParam.SCH_CURC_APPLY_SYEAR = paramData.SYEAR;
        	objParam.SCH_TERM_GCD = paramData.TERM_GCD;
		    		objParam.bind = [{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["MST"
			                ,paramData.SYEAR
			                ,paramData.TERM_GCD
			                ,param.CHARGE_PROF_NO
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
		                params : ["DTL"
		                ,paramData.SYEAR
		                ,paramData.TERM_GCD
		                ,param.CHARGE_PROF_NO
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
		                ,paramData.SYEAR
		                ,paramData.TERM_GCD
		                ,param.CHARGE_PROF_NO
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
		                ,paramData.SYEAR
		                ,paramData.TERM_GCD
		                ,param.CHARGE_PROF_NO
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
	                paramData.SYEAR
	                ,paramData.TERM_GCD
	                ,param.SUBJ_NO
	                ,param.CLASS_NO
	                ,param.CHARGE_PROF_NO
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
	                paramData.SYEAR
	                ,paramData.TERM_GCD
	                ,param.SUBJ_NO
	                ,param.CLASS_NO
	                ,param.CHARGE_PROF_NO
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
</script>