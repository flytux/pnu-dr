<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
	                <h2 class="sec-title"></h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<!-- /END CONTENT HEADER -->		
			
			<!-- CONTENT BODY -->		
			<div class="sec-body">
			 	<div id="download_target"></div> 
				<section class="sec-2">
					<div class="sec-body">
						<section class="sec-2">
							<header>
								<h4 class="sec-title" data-lang>학적정보</h4>
							</header>
							<div class="sec-body">
								<div class="b-table-box flex-col-3" id="STDT_TABLE" role="table" aria-label="학적정보 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label data-lang>소속(과정)</label>
											</div>
					                        <div class="b-con-box" role="cell" data-bind="text: SOSOK_NM">
					                        </div>											
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>학번(성명)</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_INFO"></div>											
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="STDT_YEAR_TERM" data-lang>학년</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_YEAR_NM"></div>											
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>학적상태</label>
											</div>
											<div class="b-con-box" role="cell" id="HJ_STA_NM"></div>											
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item merge-prev">
											<div class="b-title-box" role="rowheader">
												<label data-lang>이수학기수</label>
											</div>
											<div class="b-con-box" role="cell" id="CMPL_TERM_CNT"></div>											
										</div>
										<div class="b-row-item merge-2">
											<div class="b-title-box" role="rowheader">
												<label data-lang>교직복수(연계)<br>전공</label>
											</div>
					                        <div class="b-con-box" role="cell" data-bind="text: DEPT_NM">
					                        </div>																					
										</div>
									</div>
									<div class="b-row-box " role="row">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label data-lang class="text-danger">교육봉사활동<br>이수현황</label>
											</div>
											<div class="b-con-box" role="cell" id="SYEAR_TERM"></div>	
										</div>
									</div>
								</div>
							</div>
						</section>
						<div class="message-box">
							<div class="message-box-inner">
								<div class="message-body">
									<p class="info-text mb-0">교육봉사활동 학점 이수 순서</p>
									<ul class="list list-style-1">
										<li>교육봉사활동 계획서 신규 입력 <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 계획서 입력 내역에서 선택하여[승인요청] <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 계획서 승인(교직부)</li>
										<li>교육봉사활동 실시 및 교육봉사활동 일지 작성(계획서 입력 내역에서 일지 작성 클릭)</li>
										<li>
											수강신청기간 중 교육봉사활동(XA4000347) 수강신청 필수
											<br>※수강신청 학기의 기말고사 시작 7일전까지, 교육봉사활동 60시간 미충족시 학점 취득 불가
										</li>
										<li>교육봉사활동 확인서 출력(계획서 입력 내역에서 선택)하여 기관장 직인 날인</li>
										<li>교육봉사활동 학점 신청에서 계획서 선택하여 [교육봉사활동 학점신청] 클릭</li>
										<li>[교육봉사활동 학점신청서 출력]하여 기말고사 실시 7일 전까지 소속학과에 제출</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- 계획서 입력 내역 -->
						<!-- 테이블 -->
						<section class="sec-2">
							<header>
								<h4 class="sec-title" data-lang>계획서 입력 내역</h4>
								<div class="btn-box">
									<div class="form-row">
										<div class="col-auto">
											<button class="btn  btn-new" type="button" onclick="javascript:return fn_newplan('C');" id="btnshowPlan" data-lang>교육봉사활동 계획서 신규 입력</button>
										</div>
									</div>
								</div>
							</header>
							<div class="sec-body">
								<div class="table-box">
									<div class="table-body">
										<table class="table table-hover" data-toggle="table" data-show-column="true">
											<caption>계획서 입력 내역</caption>
											<colgroup>
												<col style="min-width: 40px;">
												<col style="min-width: 130px;">
												<col style="min-width: 170px;">
												<col style="min-width: 80px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">선택</th>
													<th scope="col">기관</th>
													<th scope="col">기간</th>
													<th scope="col">시간</th>
													<th scope="col">상태</th>
													<th scope="col">일지작성시간</th>
													<th scope="col">일지작성</th>
												</tr>
											</thead>
											<tbody id="resultTbody"></tbody>
										</table>
									</div>
								</div>
							</div>
						</section>
						<!-- /END 테이블 -->
						<section class="sec-2 d-none"  id="showDaylog">
							<header>
								<h4 class="sec-title" data-lang>교육봉사활동 일지작성</h4>
								<div class="btn-box">
									<div class="form-row">
										<div class="col-auto">
											<button class="btn  btn-new" type="button" onclick="javascript:return fn_planDaylogAdd();" id="btnDaylogAdd" data-lang>일지추가</button>
											<button class="btn  btn-save" type="button" onclick="javascript:return fn_planDaylogSave();" id="btnDaylogSave" data-lang>일지저장</button>
										</div>
									</div>
								</div>
							</header>
							<div class="sec-body ">
								<div class="table-box">
									<div class="table-body">
										<table class="table table-hover" data-toggle="table" data-show-column="true">
											<caption>교육봉사활동 일지작성</caption>
											<colgroup>
												<col style="min-width: 600px;">
									
											</colgroup>
											<thead>
												<tr>
													<th scope="col">일시</th>
													<th scope="col">시간</th>
													<th scope="col">교육봉사활동 세부내용</th>
													<th scope="col">일지삭제</th>
												</tr>
											</thead>
											<tbody id="resultTbody3"></tbody>
										</table>
									</div>
								</div>
							</div>
						</section>
						<p class="info-text">
							교육봉사활동 확인서는 교육봉사활동기관의 자체서식 인정<br> (단, 교육봉사활동기관의 자체서식에 일지가 없을 경우 교육봉사활동 학점신청 시 우리대학 교육봉사활동 일지를 첨부하여야 함)
						</p>
						<!-- 테이블 -->
						<section class="sec-2">
							<header>
								<h4 class="sec-title" data-lang>교육봉사활동 학점 신청</h4>
							</header>
							<div class="sec-body">								
								<ul class="list list-style-1">
									<li>[학점신청 취소] 버튼 클릭 시, <span class="text-danger">[학점 신청] 상태인 계획서에 대해서만 학점신청이 취소</span>됩니다.</li>
									<li>[학점신청서 출력] 버튼 클릭 시, <span class="text-danger">[학점 신청] 상태인 계획서에 대해서만 출력</span>됩니다.</li>
									<li><span class="text-primary">학과승인</span> 이후에는 학점신청서출력, 학점신청취소가 되지 않습니다.</li>
									<li>대상인원수를 입력하지 않고 [학점신청] 버튼 클릭 시, <span class="text-danger">학점신청이 되지 않습니다.</span></li>
									<li>대상인원수를 잘못 입력했을 경우 [학점취소] 버튼 클릭 시, <span class="text-danger">대상인원수는 0명으로 초기화됩니다.</span></li>									
								</ul>
							</div>
							<div class="sec-body mt-2">
								<div class="table-box">
									<div class="table-body">
										<table class="table table-hover" data-toggle="table" data-show-column="true">
											<caption>교육봉사활동 학점 신청</caption>
											<colgroup>
												<col style="min-width: 50px;">
												<col style="min-width: 200px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 200px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">선택</th>
													<th scope="col">계획서</th>
													<th scope="col">봉사시간</th>
													<th scope="col">대상인원수</th>
													<th scope="col">신청상태</th>
													<th scope="col">승인상태</th>
												</tr>
											</thead>
											<tbody id="resultTbody2"></tbody>
										</table>
									</div>
								</div>
								<div class="btn-box ">
									<div class="form-row align-items-center btn-box-right">
										<div class="col-auto">
											<div class="mr-1" for="ACTIV_TIME" data-lang>교육봉사활동 시간합계</div>
										</div>
										<div class="col-auto">
											<input class="form-control form-w-sm " id="ACTIV_TIME" class="" readonly/>
										</div>
										<div class="col-auto">
											<button class="btn btn-save d-none" id="btnCrdtApply" data-lang onclick="javascript:return fn_planCrdtApply('P');">학점신청</button>
											<button class="btn btn-modify d-none" id="btnCrdtCancel" data-lang onclick="javascript:return fn_planCrdtApplyCancel('C');">학점신청 취소</button>
											<button class="btn btn-print d-none" id="btnCrdtPrint" data-lang onclick="javascript:return fn_openCrdtReport(true);">학점신청서 출력</button>
										</div>
									</div>
								</div>
							</div>
						</section>
						<!-- /END 테이블 -->
						<div class="message-box">
							<div class="message-box-inner">
								<div class="message-body">
									<p class="info-text mb-0">교육봉사활동 학점신청 방법</p>
									<ul class="list list-style-1">
										<li>제출기한 : 매학기 기말고사 시작 7일 전까지</li>
										<li>제출장소 : 소속학과</li>
										<li>제출서류</li>
									</ul>
									<ul>
										<li>
											<ul class="list list-style-1">
												<li>교육봉사활동 학점 신청서 1부</li>
												<li>교육봉사활동 확인서(교육봉사활동기관 자체확인서 인정) 각 1부</li>
												<li>교육봉사활동 일지(교육봉사활동기관 자체확인서에 일지가 없을 경우) 각 1부</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>
<!-- 계획서입력내역 -->
<script type="text/x-tbody-template" id="resultTemplate">
	#if( :EDU_SERVE_ACTIV_PLAN_SEQ_NO != "9999"){#<tr style="cursor:pointer;">#}
				else {#<tr>#}#
		<td>#if( :EDU_SERVE_ACTIV_PLAN_SEQ_NO != "9999"){#
					<input class="" type="radio" name="PLANSELECT" id="" title="행선택">
				#}
				else {##}#
		</td>
		<td class="text-left">#:PLAN_APPLY_CONTENT#</td>
		<td>#:EDU_SERVE_ACTIV_DATE#</td>
		<td class="text-right">#:EDU_SERVE_ACTIV_PLAN_TIME_CNT#</td>
		<td class="text-left">#:EDU_SERVE_ACTIV_PLAN_STA_NM#</td>
		<td class="text-right">#:DAYLOG_ACTIV_TIME_MINUTE_CNT#</td>
		<td>#if( :DAYLOG_FG == "enabled"){#<button class="btn btn-new detail-btn" type="button">일지작성</button>#}
				else {##}#
		</td>
	</tr>
</script>

<!-- 학점 신청 -->
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
		<td>
			<input #if(:APPLY_FG == "Y"){# class="" #}else{# class="d-none" #}#  type="checkbox" name="DAYLOG_ACTIV_TIME_MINUTE_CNT" id="chkCrdtApply" value="#:EDU_SERVE_ACTIV_PLAN_SEQ_NO#"  title="#:EDU_SERVE_ACTIV_PLAN#">
		</td>
		<td class="text-left">#:EDU_SERVE_ACTIV_PLAN#</td>
		<td class="text-right">#:DAYLOG_ACTIV_TIME_MINUTE_CNT#</td>
		#if(:EDU_SERVE_ACTIV_PLAN_STA_NM == "학점신청") {# 
           <td class="text-right"><input type="hidden" name="EDU_SERVE_ACTIV_TARGET_INWON_CNT" value="#:EDU_SERVE_ACTIV_TARGET_INWON_CNT#">#:EDU_SERVE_ACTIV_TARGET_INWON_CNT#</td> 
        #}else{#
		   <td><input type="text" name="EDU_SERVE_ACTIV_TARGET_INWON_CNT" id="EDU_SERVE_ACTIV_TARGET_INWON_CNT#:EDU_SERVE_ACTIV_PLAN_SEQ_NO#" class="form-control text-right ml-3" maxlength="5" value="#:EDU_SERVE_ACTIV_TARGET_INWON_CNT#" title="대상인원수" onkeyup="fn_chk_num(this);" style="width:70px;"></td>
        #}#
		#if(:EDU_SERVE_ACTIV_PLAN_STA_NM == "학점신청"){# <td class="text-danger">#}else{#<td>#}#
		#:EDU_SERVE_ACTIV_PLAN_STA_NM#</td>
		<td>#:CONF_FG#</td>
	</tr>
</script>

<!-- 일지 -->
<script type="text/x-tbody-template" id="resultTemplate3">
	<tr style="cursor:pointer;">
		<td>
			<span>#:DAYLOG_START_DT# #:START_HOUR#<span>:</span>#:START_MIN# ~ #:CLOSE_HOUR#<span>:</span>#:CLOSE_MIN#
			</span>
		</td>
		<td>
			<span>#:DAYLOG_HOUR# 시간 #:DAYLOG_MINUTE# 분
			</span>
		</td>
		<td>
			<span>#:DAYLOG_ACTIV_CONTENT#
			</span>
		</td>
		<td>#if( :BTN_FG == "enabled"){#<button class="btn btn-delete detail-btn" type="button">삭제</button>#}
				else {##}#
		</td>
	</tr>
</script>

<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/javascript">
	function fn_initScreen() {		
		var majorNm = scwin.loginUser.majorCdKorNm == null ? '' : scwin.loginUser.majorCdKorNm;
		$("#STDT_INFO").text(scwin.loginUser.userId + '(' + scwin.loginUser.nm + ')');
		$("#HJ_STA_NM").text(scwin.loginUser.hjStaGcdKorNm);
		$("#CMPL_TERM_CNT").text(scwin.loginUser.cmplTermCnt);
		if(scwin.loginUser.collGradGcd == '0001'){
			//대학
			$("#STDT_YEAR_NM").text(scwin.loginUser.stdtYearGcdKorNm);
		}else{
			//대학원
			$("#STDT_YEAR_NM").text(scwin.loginUser.atlectTermCnt);
			$("label[for='STDT_YEAR_TERM']").text('학기');
		}
		//대상자조회
		fn_sch();
    	$("#showDaylog").addClass('d-none');
    	$("#ACTIV_TIME").val('');
    	activTime = 0;
		esaitem_search();
		planSearch();
		planCrdt();
		
	}
	
	/*************************************************************************************************
	* 입력 데이터 체크
	***************************************************************************************************/
	function fn_chk_num(obj) {
    	if(isNaN(obj.value) || obj.value == null ){
    		$("#"+$(obj).attr("id")).focus();
    		obj.value = "";
    		alert('숫자만 입력 가능합니다.');
    	}
    }	

	var termInfo = []; //기준학년도/학기
	/***************************************************************************************************
	* 대상자 조회
	***************************************************************************************************/
	function fn_sch() {
		var searchParam = {};
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/EduServeActiv/selectListEduServeActiv",
			reqData : searchParam,
			success : function(data, responseData) {
				termInfo = responseData.termInfo;
	        	if (gfn_com_isEmptyObject(data)) {
					alert('대상자가 아닙니다.',function(){ location.href="/" });
	        	}else{
					gfn_com_dataBind($("#STDT_TABLE"), data[0]);
					
					//data[0].SYEAR_TERM //수강신청학년도학기
					//data[0].CMPT_SYEAR_TERM //이수학년도학기

					if(gfn_str_parseNull(data[0].CMPT_SYEAR_TERM) == ""){
						$("#btnshowPlan").prop("disabled", false);
					}else{
						$("#btnshowPlan").prop("disabled", true);
					}
					if(gfn_str_parseNull(data[0].SYEAR_TERM) == ""){
						$("#SYEAR_TERM").text(data[0].CMPT_SYEAR_TERM);
					}else{
						$("#SYEAR_TERM").text(data[0].SYEAR_TERM);
					}
	        	}

			}
		});
	}

	/***************************************************************************************************
	* 계획서 팝업
	***************************************************************************************************/
	function fn_newplan(gbn) {
		//gbn C:신규  U
		if(gbn == "C") {
			scwin.detailObj={};
			scwin.detailObj.EDU_SERVE_ACTIV_PLAN_STA_GCD = '0001'; 
			scwin.detailObj.EDU_SERVE_ACTIV_PLAN_SEQ_NO = '0'; 
		}
	
		scwin.detailObj.SYEAR = termInfo.SYEAR; 
		scwin.detailObj.TERM_GCD = termInfo.TERM_GCD; 
        scwin.rowState = gbn;
		scwin.detailObj.minC = minC;
		scwin.detailObj.maxC = maxC;
		gfn_com_modalPopup({
			width : 900,
			height : 750,
			index : 1,
			target : null,
			title : "교육봉사활동 계획서 작성",
			include : "/html/ost/kj/teachcourseguide/EduServeActivPop.html"
		});
	}
	
	var minC = 0;
	var maxC = 0;
	/***************************************************************************************************
	* 교육봉사활동계획신청구분코드(공통코드: PLAN_APPLY_GCD) 조회
	***************************************************************************************************/
	function esaitem_search(){
		//교육봉사활동계획신청구분코드(공통코드: PLAN_APPLY_GCD) 조회 (계획서 저장시 사용하기 위하여 조회값 숨겨 보관) 
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/EduServeActiv/selectListEsaItem",
			reqData : {},
			success : function(data, responseData) {
				minC = Number(data[0].COMMON_DETAIL_CD);
				maxC = Number(data[data.length-1].COMMON_DETAIL_CD);
			}
		});
	}

	var activPlanSeqNo ;//교육봉사활동계획순번
	/***************************************************************************************************
	* 계획서 입력 내역 조회
	***************************************************************************************************/
	function planSearch(){
		var searchParam = {};
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/EduServeActiv/selectListEduServePlan",
			reqData : searchParam,
			success : function(data, responseData) {
				$("#resultTbody").listView({
	                dataSource : data,
	                emptyComment : '입력된 교육봉사활동 계획서가 없습니다.',
	                dataBound : function(e) {
						$("input[name='PLANSELECT']").each(function(i){
							$(this).attr('id','PLANSELECT_'+data[i].EDU_SERVE_ACTIV_PLAN_SEQ_NO);
						});

                    	$("#resultTbody tr:not(:last)").find("td:not(:last)").bind("click", function(e) {
	                        scwin.detailObj = $(this).closest("tr").data();
		                	fn_newplan('U');
		                	var seqNo = $(this).closest("tr").data().EDU_SERVE_ACTIV_PLAN_SEQ_NO;
		                	$("#PLANSELECT_"+seqNo).prop('checked',true);
                    	});
                        $('#resultTbody .detail-btn').bind("click", function(e){
	                        scwin.detailObj = $(this).closest("tr").data();
	                    	rowNum = 0;
	                    	rowList = new Array();
	                    	idVal = 0;
	                    	$("#showDaylog").removeClass('d-none');
	                    	activPlanSeqNo = scwin.detailObj.EDU_SERVE_ACTIV_PLAN_SEQ_NO;
		                	fn_planDaylogSearch(); 
                        });
	                },
	                template : $("#resultTemplate"),
					totalCnt : responseData.totalCnt
	            });


			}
		});

	
	}
	
	var activTime = 0;
	/***************************************************************************************************
	* 교육봉사활동 학점 신청
	***************************************************************************************************/
	function planCrdt(){
		var searchParam = {};
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/EduServeActiv/selectListEduServePlanCrdt",
			reqData : searchParam,
			success : function(data, responseData) {
				
		    	$("#btnCrdtApply").addClass('d-none');
		    	$("#btnCrdtCancel").addClass('d-none');
		    	$("#btnCrdtPrint").addClass('d-none');				    	
		    	
				for(var i in data){
					if(data[i].APPLY_FG == 'Y'){//학점신청 가능여부
				    	$("#btnCrdtApply").removeClass('d-none');
					}
					if(data[i].CANCEL_FG == 'Y'){//학점신청취소 가능여부
				    	$("#btnCrdtCancel").removeClass('d-none');
					} 
					if(data[i].PRINT_FG=='Y'){//학점신청서출력가능여부 가능여부
				    	$("#btnCrdtPrint").removeClass('d-none');
					} 
				}
				
				
	        	$("#resultTbody2").listView({
	                dataSource : data,
	                emptyComment : '학점 신청할수 있는 교육봉사활동 계획서가 없습니다.',
	                dataBound : function(e) {
						$("input[name='DAYLOG_ACTIV_TIME_MINUTE_CNT']").each(function(i){
							$(this).attr('id','DAYLOG_CNT'+data[i].EDU_SERVE_ACTIV_PLAN_SEQ_NO);
						});
	                	$("#resultTbody2 tr").find("td:eq(0)").find("input").bind("click", function(e) {
	                        scwin.detailObj = $(this).closest("tr").data();
		                	var seqNo = $(this).closest("tr").data().EDU_SERVE_ACTIV_PLAN_SEQ_NO;
		                	if($("#DAYLOG_CNT"+seqNo).is(":checked")){
	                			activTime += $(this).closest("tr").data().DAYLOG_ACTIV_TIME_MINUTE_CNT;
			                	$("#ACTIV_TIME").val(activTime);
	                		}else{
	                			activTime -= $(this).closest("tr").data().DAYLOG_ACTIV_TIME_MINUTE_CNT;
			                	$("#ACTIV_TIME").val(activTime);
	                		}
	                    });
	                },
	                template : $("#resultTemplate2"),
					totalCnt : responseData.totalCnt
	            });
			}
		});
	}
	var daylogCnt = 0;
	/***************************************************************************************************
	* 일지 조회
	***************************************************************************************************/
	function fn_planDaylogSearch(){
		var searchParam = {"EDU_SERVE_ACTIV_PLAN_SEQ_NO" : scwin.detailObj.EDU_SERVE_ACTIV_PLAN_SEQ_NO 
    								};
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/EduServeActiv/selectListPlanDaylog",
			reqData : searchParam,
			success : function(data, responseData) {
	        	$("#resultTbody3").listView({
	                dataSource : data,
	                emptyComment : '학점 신청할수 있는 교육봉사활동 계획서가 없습니다.',
	                dataBound : function(e) {
                        $('#resultTbody3 .detail-btn').bind("click", function(e){
	                        scwin.detailObj = $(this).closest("tr").data();
		                	fn_planDaylogDelete();
                        });
                    	fn_planDaylogAdd(responseData.totalCnt);
                    	daylogCnt = responseData.totalCnt;
	                },
	                template : $("#resultTemplate3"),
					totalCnt : responseData.totalCnt
	            });
				
			}
		});
	}

	var rowNum = 0;
	var rowList = new Array();

	var idVal = 0;
	/***************************************************************************************************
	* 일지추가 
	***************************************************************************************************/
	function fn_planDaylogAdd(gbn){
		rowNum = rowNum+1;
		rowList.push(rowNum);
		var html = '';
		html += '	<tr style="cursor:pointer;" class=Apply_Row'+rowNum+' Apply_Row><td style="min-width: 530px;">';
		html += '<div class="form-row align-items-center"><div class="col-auto"><input type="text" class="form-control datepicker" name="datepicker" id="txtesaDt'+rowNum+'" title="날짜입력" style="width:110px"/></div>';
		html += '<div class="col-auto"><select class="form-control form-w-md" id="startHour'+rowNum+'" value="00" onChange="fn_calcTime(' + rowNum + ');" title="시작시간" style="width:68px">' + fn_hour() + '</select></div>';
		html += '<div class="col-auto"><span>:</span></div>';
		html += '<div class="col-auto"><select class="form-control form-w-md" id="startMin' + rowNum + '"  value="00" onChange="fn_calcTime(' + rowNum + ');" title="시작분" style="width:68px">' + fn_min() + '</select></div>';
		html += '<div class="col-auto"><span>~</span></div>';
		html += '<div class="col-auto"><select class="form-control form-w-md" id="endHour' + rowNum + '" value="00" onChange="fn_calcTime(' + rowNum + ');" title="종료시간" style="width:68px">' + fn_hour() + '</select></div>';
		html += '<div class="col-auto"><span>:</span></div>';
		html += '<div class="col-auto"><select class="form-control form-w-md" id="endMin' + rowNum + '"  value="00" onChange="fn_calcTime(' + rowNum + ');" title="종료분" style="width:68px">' + fn_min() + '</select></div>';
		html += '</div>'
		html += '</td><td style="min-width: 180px;">'
		html += '<div class="form-row align-items-center"><div class="col-auto"><input id="txtesaHour' + rowNum + '"  type="text"  class="form-control form-w-sm" readonly value="00" readonly style="width:45px"></div><div class="col-auto"><span>시간</span></div>'
		html += '<input id="txtesaMin' + rowNum + '"  type="text"  class="form-control form-w-sm" value="00" readonly style="width:45px">분</td>';
		html += '</td><td  >'
		html += '<input id="txtesaContent' + rowNum + '"  type="text"  class="form-control" value="" title="내용"></td>';
		html += '</td><td >'
		html += '<button class="btn btn-delete detail-btn" type="button"  onclick="fn_rowDelete('+ rowNum +')">삭제</button>'
		html += '</td></tr>'


		if(gbn != 0){
			$("#resultTbody3").append(html);
			$("#resultTbody3").parent().bootstrapTable('resetView');
		}else{
			$("#resultTbody3").html(html); 
			$("#resultTbody3").parent().bootstrapTable('resetView');
		}
       	gfn_com_createDatetimeComp('txtesaDt'+rowNum,"YYYY-MM-DD",false,function (e){
       		$(".bootstrap-datetimepicker-widget").css("position","fixed");
       		$(".bootstrap-datetimepicker-widget").css("inset","");
       		$(".bootstrap-datetimepicker-widget").css("top",e.clientY+"px");
       		$(".bootstrap-datetimepicker-widget").css("left",e.clientX+"px");
       	});

	}

	function fn_hour() {
		var html = "";
		for (var i = 0; i < 24; i++) {
			if (i < 10) {
				html += '<option value="0'+i+'">0' + i + '</option>';
			} else {
				html += '<option value="'+i+'">' + i + '</option>';
			}
		}
		return html;
	}

	function fn_min() {
		var html = "";
		for (var i = 0; i <= 59; i = i + 10) {
			if (i < 10) {
				html += '<option value="0'+i+'">0' + i + '</option>';
			} else {
				html += '<option value="'+i+'">' + i + '</option>';
			}
		}
		return html;
	}
	
	function fn_calcTime(key) {
		var planHour = 0;
		var planMin = 0;
		planHour = Number($('#endHour' + key).val()) - Number($('#startHour' + key).val());
		planMin = Number($('#endMin' + key).val()) - Number($('#startMin' + key).val());
		if (planMin < 0) {
			planMin = 60 + planMin;
			planHour = planHour - 1;
		}

		$('#txtesaHour' + key).val(planHour);
		$('#txtesaMin' + key).val(planMin);
	}

	
	/***************************************************************************************************
	* 일지저장
	***************************************************************************************************/
	function fn_planDaylogSave(){
		 confirm(gva_SAVE_CONFIRM_MSG,function(_flag){
			if(_flag) {
				var data = new Array();
				var len = parseInt(daylogCnt)+rowList.length;
				for (var i = 0; i < rowList.length; i++) {
					var map = gfn_com_inputdata($(".Apply_Row" + rowList[i]));
					var txtesaDt = 'txtesaDt'+rowList[i];
					var startHour = 'startHour'+rowList[i];
					var startMin = 'startMin'+rowList[i];
					var endHour = 'endHour'+rowList[i];
					var endMin = 'endMin'+rowList[i];
					var txtesaContent = 'txtesaContent'+rowList[i];
					map.DAYLOG_DT = map[txtesaDt];
					map.DAYLOG_START_DT = map[txtesaDt]  + " " + map[startHour]  + ":" +  map[startMin]  + ":00.000";
					map.DAYLOG_CLOSE_DT = map[txtesaDt] + " " + map[endHour] + ":" + map[endMin]  + ":00.000";
					map.EDU_SERVE_ACTIV_PLAN_SEQ_NO = scwin.detailObj.EDU_SERVE_ACTIV_PLAN_SEQ_NO;
					map.DAYLOG_ACTIV_CONTENT = map[ txtesaContent];

					if (Number($('#startHour' + rowList[i]).val() + $('#startMin' + rowList[i]).val()) >= Number($('#endHour' + rowList[i]).val() + $('#endMin' + rowList[i]).val())) {
						alert("시간이 올바르지 않습니다.");
						return false;
					}
					
					data.push(map);
			    	if(!fn_daylogValidate(map)) return;
				}
				/* ajax처리 */
				gfn_ajax_request({
					url : "/ost/kj/teachcourseguide/EduServeActiv/executePlanDaylog",
					reqData : data,
					success : function(data, responseData) {
						alert(data.O_MSG);
						if(data.O_RSLT == "Y"){
	    					fn_initScreen();
						}
					}
				});
				
			}
		});
	}

	/***************************************************************************************************
	 * Table Row 삭제
		***************************************************************************************************/
	function fn_rowDelete(num) {

		var paramNum = num;
		var relNum = parseInt(num);
		var del = document.getElementById('resultTbody3');
		var arrNum = rowList.indexOf(relNum);
		arrNum = arrNum + parseInt(daylogCnt);
		del.deleteRow(arrNum);

		rowList = rowList.filter(function(data) {
			return data != paramNum
		});
		
	}

	/***************************************************************************************************
	* 일지 필수 체크
	***************************************************************************************************/
	function fn_daylogValidate(param) {
			var rtnValue = true;
			var valInfo =  [{
									"id" : "DAYLOG_DT",
									"name" : "봉사일자",
									"notNull" : true,
								},{
									"id" : "DAYLOG_ACTIV_CONTENT",
									"name" : "교육봉사내용",
									"notNull" : true,
								}];
			
			rtnValue = gfn_val_validateDataMap(param, valInfo);

			return rtnValue;
	}

	
	/***************************************************************************************************
	* 일지삭제
	***************************************************************************************************/
	function fn_planDaylogDelete(){

		 confirm(gva_DELETE_CONFIRM_MSG,function(_flag){
			if(_flag) {
				var searchParam = { "EDU_SERVE_ACTIV_PLAN_SEQ_NO" : activPlanSeqNo  
		    								, "DAYLOG_DIFF_SEQ_NO" : scwin.detailObj.DAYLOG_DIFF_SEQ_NO
		    								};
				/* ajax처리 */
				gfn_ajax_request({
					url : "/ost/kj/teachcourseguide/EduServeActiv/deletePlanDaylog",
					reqData : searchParam,
					success : function(data, responseData) {
						alert(data.O_MSG);
						if(data.O_RSLT == "Y"){
							fn_initScreen();
						}
					}
				});
			}
		});
		
	}
	
	/***************************************************************************************************
	* 학점신청
	***************************************************************************************************/
	function fn_planCrdtApply(gbn){

		if(!fn_crdtApplyValidate()) return;				
				
		confirm("학점신청 하시겠습니까?" ,function(_flag){
			if(_flag) {

				var data = new Array();
				
				$("input[name='DAYLOG_ACTIV_TIME_MINUTE_CNT']").each(function(i){
					var isChecked = $(this).is(":checked");
					if(!isChecked) return;
					
					var map = {};
					map.SYEAR = termInfo.SYEAR; 
					map.TERM_GCD = termInfo.TERM_GCD; 			
					map.REQ_STA_GCD= '0004'; //학점신청
					map.EDU_SERVE_ACTIV_PLAN_SEQ_NO = $(this).val();
					map.EDU_SERVE_ACTIV_TARGET_INWON_CNT = $('#EDU_SERVE_ACTIV_TARGET_INWON_CNT' + $(this).val()).val();
					map.GBN = gbn;
					
					data.push(map);
				});
				
				/* ajax처리 */
				gfn_ajax_request({
					url : "/ost/kj/teachcourseguide/EduServeActiv/executeEduServeActiv",
					reqData : data,
					success : function(data, responseData) {
						alert(data.O_MSG);
						if(data.O_RSLT == "Y"){
							fn_initScreen();
						}
					}
				});
			}
		});
	}
	
	/***************************************************************************************************
	* 학점신청취소
	***************************************************************************************************/
	function fn_planCrdtApplyCancel(gbn){

		confirm("학점신청취소 하시겠습니까?",function(_flag){
			if(_flag) {

				var data = new Array();

				$("input[name='DAYLOG_ACTIV_TIME_MINUTE_CNT']").each(function(i){
					
					if($("#resultTbody2 tr:eq(" + i + ")").data().EDU_SERVE_ACTIV_PLAN_STA_NM != "학점신청") return;
					
					var map = {};
					map.SYEAR = ""; // 취소시 학점신청학년도 초기화
					map.TERM_GCD = "";  // 취소시 학점신청학기구분 초기화			
					map.REQ_STA_GCD = '0003'; //계획서승인, 학점신청 취소시에는  학점신청 -> 계획서승인 으로 변경한다..
					map.EDU_SERVE_ACTIV_PLAN_SEQ_NO = $(this).val();
					map.EDU_SERVE_ACTIV_TARGET_INWON_CNT = 0; // 취소시 대상인원 초기화		
					map.GBN = gbn;
					
					data.push(map);
				});
				
				/* ajax처리 */
				gfn_ajax_request({
					url : "/ost/kj/teachcourseguide/EduServeActiv/executeEduServeActiv",
					reqData : data,
					success : function(data, responseData) {
						alert(data.O_MSG);
						if(data.O_RSLT == "Y"){
							fn_initScreen();
						}
					}
				});
			}
		});
	}	

	/***************************************************************************************************
	* 학점신청 체크
	***************************************************************************************************/
	function fn_crdtApplyValidate() {

		if ($("input[name=DAYLOG_ACTIV_TIME_MINUTE_CNT]:checked").length < 1) {
			alert("교육봉사활동 계획서를 선택하세요.");
			return false;
		}

		var chkVal = 0;
		$("input[name='DAYLOG_ACTIV_TIME_MINUTE_CNT']").each(function(i){
			var isChecked = $(this).is(":checked");
			if(!isChecked) return;
			
			if ( Number($('#EDU_SERVE_ACTIV_TARGET_INWON_CNT' + $(this).val()).val()) <= 0 ) {
				chkVal++;	
			}	
		});

		if ( chkVal > 0 ) {
			alert("학점신청한 계획서의 교육봉사활동 대상인원수는 필수로 입력하셔야 합니다.");
			return false;
		}

		if (Number($("#ACTIV_TIME").val()) < 60) {
			alert("봉사시간이 60시간 이상되어야 학점신청할 수 있습니다.");
			return false;
		}
		
		return true;
	}
	
	/***************************************************************************************************
	 * 출력
	***************************************************************************************************/
	function fn_openCrdtReport(isPop) {

		var options = {};

		options.rptName = "/ses/kj/teachcourseguide/EduServeActiv_003.crf";
		
	    var planSeqNo ='';
		$("input[name='DAYLOG_ACTIV_TIME_MINUTE_CNT']").each(function(i){
			//var isChecked = $(this).is(":checked");
			//if(!isChecked) return;
			if($("#resultTbody2 tr:eq(" + i + ")").data().EDU_SERVE_ACTIV_PLAN_STA_NM == "학점신청"){//학점신청 단계 인것만
				planSeqNo += ','+$(this).val();
			}
			
		});
	    
        //파라메터 설정
        var objParam = {};
        //objParam.EDU_SERVE_ACTIV_PLAN_SEQ_NO = planSeqNo;
        //objParam.STDT_NO = scwin.loginUser.userId; 
        //objParam.SYEAR = termInfo.SYEAR; 
        //objParam.TERM_GCD =  termInfo.TERM_GCD; 
        objParam.bind = [{
	            db : "OST",
	            proc : "OST_교직_교육봉사활동_학점신청서_출력",
	            params : [scwin.loginUser.userId, planSeqNo, termInfo.SYEAR, termInfo.TERM_GCD]
	    }];
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
        if (isPop) {
        	fn_openCrdtReportPopup(options);
        } 
	}
	
	/***************************************************************************
	 * 출력 팝업 호출
	 **************************************************************************/
	function fn_openCrdtReportPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 900,
            height : 1000,
            target : null,            
            title : "교육봉사활동학점신청서",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
	
</script>