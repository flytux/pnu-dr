<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
	                <h2 class="sec-title">학사학위취득유예 신청</h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<!-- /END CONTENT HEADER -->		
			
			<!-- CONTENT BODY -->		
			<div class="sec-body">
				<section class="sec-2">
					<div class="sec-body">
						<!-- 단계 -->
						<section class="sec-2">
							<header>
								<h2 class="sec-title">단계</h2>
							</header>
							<div class="sec-body">
								<ol class="flow-list">
									<li id="level1">
										<div class="txt-box">
											<strong>01. 접수</strong><span></span>
										</div>
									</li>
									<li id="level2">
										<div class="txt-box">
											<strong>02. 학과승인/반려</strong>
											<div>
												<span class="badge badge-primary mr-2">승인</span> <span></span>
											</div>
											<div>
												<span class="badge badge-warning mr-2">반려</span> <span></span>
											</div>
										</div>
									</li>
									<li id="level3">
										<div class="txt-box">
											<strong>03. 대학승인/반려</strong>
											<div>
												<span class="badge badge-primary mr-2">승인</span><span></span>
											</div>
											<div>
												<span class="badge badge-warning mr-2">반려</span><span></span>
											</div>
										</div>
									</li>
									<li id="level4">
										<div class="txt-box">
											<strong>04. 최종승인/반려</strong>
											<div>
												<span class="badge badge-primary mr-2">승인</span><span></span>
											</div>
											<div>
												<span class="badge badge-warning mr-2">반려</span><span></span>
											</div>
										</div>
									</li>
								</ol>
							</div>
						</section>
						<!-- /END 단계 -->
						<div class="b-table-box flex-col-4" role="table" aria-label="4단 테이블" id="STDT_INFO">
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader" id="YEAR_TERM" data-lang>학년</div>
									<div class="b-con-box" role="cell" id="STDT_YEAR_GCD"></div>												
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader" data-lang>이수학기수</div>
									<div class="b-con-box" role="cell" id="CMPL_TERM_CNT">
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader" data-lang>총취득학점</div>
									<div class="b-con-box" role="cell" id="ACQ_CRDT" data-bind="text: ACQ_CRDT"></div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader" data-lang>전체평점평균</div>
									<div class="b-con-box" role="cell" id="GPA" data-bind="text: GPA"></div>
								</div>
							</div>
						</div>
					
						<!-- 테이블 -->
						<div class="table-box">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table"  data-show-column="true">
									<caption>학사학위취득유예신청목록</caption>
									<colgroup>
										<col style="min-width: 50px;">
										<col style="min-width: 70px;">
										<col style="min-width: 110px;">
										<col style="min-width: 30px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 80px;">
										<col style="min-width: 50px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">유예학년도</th>
											<th scope="col">유예학기</th>
											<th scope="col">신청일자</th>
											<th scope="col">신청횟수</th>
											<th scope="col">신청사유</th>
											<th scope="col">승인여부</th>
											<th scope="col">승인일시</th>
											<th scope="col">반려사유</th>
										</tr>
									</thead>
									<tbody id="resultTbody"></tbody>
								</table>
							</div>
						</div>
						<!-- /END 테이블 -->
						<div class="btn-box mt-4">
							<div class="form-row btn-box-right">
								<div class="col-auto">
									<button class="btn btn-new mb-2" data-lang onclick="fn_chkSchd('C')">신청</button>
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

<!-- 학사학위취득유예신청내역 -->
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;" class=#:STA_GCD# onclick = "fn_setTemplate(this)">
        <td>#:SUPPOSE_SYEAR#</td>
        <td>#:SUPPOSE_TERM_NM#</td>
        <td>#:APPLY_DT#</td>
        <td>#:APPLY_COUNT#</td>
        <td>#:APPLY_CONTENT#</td>
  		<td># if( :STA_GCD== "0001") {# <span class="badge badge-pil badge-warning" type="">접수</span>#} 
				  else if ( :STA_GCD == "0002") {# <span class="badge badge-pil badge-primary" type="">학과승인</span>#} 
				  else if ( :STA_GCD == "0003") {# <span class="badge badge-pil badge-primary" type="">대학승인</span>#} 
				  else if ( :CONF_FG == "Y" && :STA_GCD == "0004") {# <span class="badge badge-pil badge-success" type="">최종승인</span> #} 
				  else if ( :STA_GCD == "0005" || :STA_GCD == "0006" || :STA_GCD == "0007" || :STA_GCD == "0008") {# <span class="badge badge-pil badge-danger" type="">반려</span> #}#
		</td>
  		<td>#:APPROVE_DT#</td>
  		<td>#:APPROVE_NONPSBL_REASON_COMMENT#</td>
	</tr>
</script>
<script type="text/javascript">

	/* 진행단계 템플릿 */
	function fn_setTemplate(obj) {
		var trData = $(obj).data();
	
		// 템플릿 결제진행 단계(0003 : 3단계, 0004 : 4단계)
		if ($(obj).attr("class") == "0001") {
			$("#level1").find("span").show();
			$("#level2").find("div:not(:first)").hide();
			$("#level3").find("div:not(:first)").hide();
			$("#level4").find("div:not(:first)").hide();

			$("#level1").removeClass("disabled");
			$("#level2").addClass("disabled");
			$("#level3").addClass("disabled");
			$("#level4").addClass("disabled");
		} else if ($(obj).attr("class") == "0002" || $(obj).attr("class") == "0003" ||  $(obj).attr("class") == "0004") {
			if ($(obj).attr("class") == "0002") { // 학과승인	 
				$("#level3").find("div:not(:first)").hide();
				$("#level3").addClass("disabled");
				$("#level4").find("div:not(:first)").hide();
				$("#level4").addClass("disabled");
			} else if ($(obj).attr("class") == "0003") { // 대학승인
				$("#level3").find(".badge-primary").closest("div").show();
				$("#level3").find(".badge-warning").closest("div").hide();
				$("#level3").removeClass("disabled");
				$("#level4").find("div:not(:first)").hide();
				$("#level4").addClass("disabled");
			} else if ($(obj).attr("class") == "0004") { // 대학승인
				$("#level3").find(".badge-primary").closest("div").show();
				$("#level3").find(".badge-warning").closest("div").hide();
				$("#level3").removeClass("disabled");
				$("#level4").find(".badge-primary").closest("div").show();
				$("#level4").find(".badge-warning").closest("div").hide();
				$("#level4").removeClass("disabled");
			}
			
			$("#level2").find(".badge-primary").closest("div").show();
			$("#level2").find(".badge-warning").closest("div").hide();
			$("#level1").removeClass("disabled");
			$("#level2").removeClass("disabled");
		} else if ($(obj).attr("class") == "0007" || $(obj).attr("class") == "0008") {
			if ($(obj).attr("class") == "0007") { // 학과승인불가
				$("#level3").find("div:not(:first)").hide();
				$("#level3").addClass("disabled");
				$("#level4").find("div:not(:first)").hide();
				$("#level4").addClass("disabled");
			} else if ($(obj).attr("class") == "0008") { // 대학승인불가
				$("#level3").find(".badge-primary").closest("div").hide();
				$("#level3").find(".badge-warning").closest("div").show();
				$("#level3").removeClass("disabled");
				$("#level4").find("div:not(:first)").hide();
				$("#level4").addClass("disabled");
			}
			$("#level2").find(".badge-primary").closest("div").hide();
			$("#level2").find(".badge-warning").closest("div").show();
			$("#level1").removeClass("disabled");
			$("#level2").removeClass("disabled");
		}
		$("#level1").find("span").html(trData.APPLY_DT2);
		$("#level2").find(".badge-primary").next("span").html(trData.APPROVE_DATE_DEPT);
		$("#level2").find(".badge-warning").next("span").html(trData.APPROVE_DATE_DEPT);
		$("#level3").find(".badge-primary").next("span").html(trData.APPROVE_DATE_COLL);
		$("#level3").find(".badge-warning").next("span").html(trData.APPROVE_DATE_COLL);
		$("#level4").find(".badge-primary").next("span").html(trData.APPROVE_DATE_CONF);
		$("#level4").find(".badge-warning").next("span").html(trData.APPROVE_DATE_CONF);
	}

	function fn_initScreen() {		
		setInit();
		fn_sch();
		
	}

	/* 초기설정 함수 */
	function setInit() {
		$("#STDT_YEAR_GCD").text(scwin.loginUser.stdtYearGcdKorNm);
		$("#CMPL_TERM_CNT").text(scwin.loginUser.cmplTermCnt);
		if(scwin.loginUser.collGradGcd == '0002'){
			$("#YEAR_TERM").text("학기");
			$("#STDT_YEAR_GCD").text(scwin.loginUser.atlectTermCnt);
		}
		
	}

	var termInfo = []; //기준학년도/학기
	var schdInfo = []; //학사력 학사학위취득유예신청기간
	var count = ''; //;
	/* 학사학위취득유예 신청 내역 조회 */
	function fn_sch() {
		var searchParam = {};
		gfn_ajax_request({
			url : "/ost/hj/degacq/JolupDelayApply/selectListJolupDelayApply",
	        reqData : searchParam,
	        success : function(data, responseData) {
	        	$("#resultTbody").listView({
	                dataSource : data[1],
	                emptyComment : '학사학위취득유예 신청 내역이 없습니다.',
	                dataBound : function(e) {
	                	$("#resultTbody tr").bind("click", function(e) {
	                        scwin.detailObj = $(this).closest("tr").data();
		                	if(scwin.detailObj.STA_GCD != '0001') return; //접수 상태일 때만 수정 가능
		                	fn_chkSchd('U');
	                    });
	                },
	                template : $("#resultTemplate"),
					totalCnt : data[1].length
	            });

				gfn_com_dataBind($("#STDT_INFO"), data[0][0]);
				if(gfn_str_parseNull(data[0][0]) !=""){
				    count = parseInt(data[0][0].COUNT)+1;    
				}
	        	
	        	
				termInfo = responseData.termInfo; 
				schdInfo = data[2][0];
				
				if(!gfn_com_isEmptyObject(data[1][0])){
					// 결재 템플릿 디자인 세팅
					if (gfn_str_parseNull(data[1][0].AUTHORN_STEP_GCD) == "0003") {
						$("#level2").find("strong").html("03. 대학승인/반려");
						$("#level3").find("strong").html("04. 최종승인/반려");
						$("#level4").hide();
					}
				}
				// 첫번째 row 선택
	    		if (!gfn_com_isEmptyObject(data[1][0])) {
					fn_setTemplate($("#resultTbody tr:eq(0)"));
					$("#resultTbody tr:eq(0)").find("td").addClass("active");
				} else {
					$("#level1").addClass("disabled");
					$("#level2").addClass("disabled");
					$("#level3").addClass("disabled");
					$("#level4").addClass("disabled");
					$("#level1").find("span").hide();
					$("#level2").find("span").hide();
					$("#level2").find("div:not(:first)").hide();
					$("#level3").find("div:not(:first)").hide();
					$("#level4").find("div:not(:first)").hide();
				}
				
	        }
	    });
	}

	/* 신청가능기간여부 확인 */
	function fn_chkSchd(type) {
		var param = {};
		if(type=='C'){
			param.APPLY_SYEAR = termInfo.SYEAR; 
			param.APPLY_TERM_GCD = termInfo.TERM_GCD;
		}else{
			param.APPLY_SYEAR = scwin.detailObj.APPLY_SYEAR;
			param.APPLY_TERM_GCD = scwin.detailObj.APPLY_TERM_GCD;
		}
		gfn_ajax_request({
			url : "/ost/hj/degacq/JolupDelayApply/selectChkSchd",
	        reqData : param,
	        success : function(data, responseData) {
	        	if(data.O_RSLT == "N"){
	        		alert(data.O_MSG);
	        		return;
	        	}
	    		if(type=='C'){
		        	fn_chkApply(type);
	    		}else{
	    			fn_openPopup(type);
	    		}
	        }
	    });
	}
	
	/* 신청가능여부 확인 */
	function fn_chkApply(type) {
		var param = {};
		
		if(type=='C'){
			if(count > 2){
				alert('신청가능횟수는 2회입니다.');
				return;
			}
			param.TIMESNO = count;
			param.APPLY_SYEAR = termInfo.SYEAR; 
			param.APPLY_TERM_GCD = termInfo.TERM_GCD;
			param.APPLY_TERM_NM = termInfo.TERM_GCD_KOR_NM;
		}else{
			param.TIMESNO = scwin.detailObj.APPLY_COUNT;
			param.APPLY_SYEAR = scwin.detailObj.APPLY_SYEAR;
			param.APPLY_TERM_GCD = scwin.detailObj.APPLY_TERM_GCD;
			param.APPLY_TERM_NM = scwin.detailObj.APPLY_TERM_NM;
		}
		gfn_ajax_request({
			url : "/ost/hj/degacq/JolupDelayApply/selectChkApply",
	        reqData : param,
	        success : function(data, responseData) {
	        	if(data.O_RSLT == "N"){
	        		alert(data.O_MSG);
	        		return;
	        	}
	        	fn_openPopup(type);
	        }
	    });
	}

	/* 신청 팝업 */
	function fn_openPopup(param) {
		if(param == "C") {
			scwin.rowState = 'C';
			scwin.detailObj = {};
			
			fn_getSessionInfo(param);
		};
		if(param == "U") {
			scwin.rowState = 'U';
			fn_getSessionInfo(param);
			
		};
		
		gfn_com_modalPopup({
			width : 1200,
			height : 1030,
			index : 1,
			target : null,
			title : "학사학위취득유예 신청",
			include : "/html/ost/hj/degacq/JolupDelayApplyPop.html"
		});
	}

	/* 세션값 저장 */
	function fn_getSessionInfo(param) {
		scwin.detailObj.STDT_NO = scwin.loginUser.userId; //학번
	    scwin.detailObj.STDT_INFO = scwin.loginUser.userId + '(' + scwin.loginUser.nm + ')'; //학번(성명)
		scwin.detailObj.HJ_STA_NM = scwin.loginUser.hjStaGcdKorNm; //학적상태
		scwin.detailObj.DEPT_NM = scwin.loginUser.collGradGcdKorNm;

		// 대학일 때는 학년, 대학원일 때는 학기
		if (scwin.loginUser.collGradGcd == "0001") {
			scwin.detailObj.DEPT_NM += scwin.loginUser.collCdKorNm + " " + scwin.loginUser.deptCdKorNm + " "
					+ gfn_str_parseNull(scwin.loginUser.majorCdKorNm) + " " + "(" + scwin.loginUser.degCourseGcdKorNm + ")";
			scwin.detailObj.STDT_YEAR_NM = scwin.loginUser.stdtYearGcdKorNm;
		} else {
			scwin.detailObj.DEPT_NM += scwin.loginUser.gradGcdKorNm + " " + scwin.loginUser.collCdKorNm + " " + scwin.loginUser.deptCdKorNm + " "
					+ gfn_str_parseNull(scwin.loginUser.majorCdKorNm) + " " + "(" + scwin.loginUser.degCourseGcdKorNm + ")";
			scwin.detailObj.STDT_YEAR_NM = gfn_com_parseNull(scwin.loginUser.atlectTermCnt) + "학기";
		}

		scwin.detailObj.SCHD_DT = schdInfo.SYEAR + '학년도 ' + schdInfo.TERM_NM; //학사학위취득유예 기간(표시용도)
		scwin.detailObj.SUPPOSE_SYEAR = schdInfo.SYEAR;
		scwin.detailObj.SUPPOSE_TERM_GCD = schdInfo.TERM_GCD;
		
		if(param == "C") {
			scwin.detailObj.APPLY_SYEAR = termInfo.SYEAR;
			scwin.detailObj.APPLY_TERM_GCD = termInfo.TERM_GCD;
			scwin.detailObj.APPLY_COUNT = count;
			scwin.detailObj.APPLY_CONTENT = '';
		}else{
			
		}
	}
	

</script>