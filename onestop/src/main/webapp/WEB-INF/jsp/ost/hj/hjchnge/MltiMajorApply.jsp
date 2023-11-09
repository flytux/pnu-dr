<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title">다중전공 신청</h2>
				</div>
				<div class="header-item"></div>
			</header>
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
											<strong>03. 최종승인/반려</strong>
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
						<!-- 테이블 -->
						<div class="table-box">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table"  data-show-column="true">
									<caption>다중전공신청내역 목록</caption>
									<colgroup>
										<col style="min-width: 20px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 160px;">
										<col style="min-width: 200px;">
										<col style="min-width: 200px;">
										<col style="min-width: 200px;">
										<col style="min-width: 80px;">
										<col style="min-width: 80px;">
										<col style="min-width: 200px;">
										<col style="min-width: 300px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">No</th>
											<th scope="col">학년도</th>
											<th scope="col">학기</th>
											<th scope="col">신청일자</th>
											<th scope="col">신청구분</th>
											<th scope="col">신청학과</th>
											<th scope="col">신청전공</th>
											<th scope="col">교직여부</th>
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
		</section>
	</main>
</div>
<!-- 다중전공신청내역목록 -->
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;" class=#:STA_GCD# onclick = "fn_setTemplate(this)">
		<td>#:RN#</td>
        <td>#:APPLY_SYEAR#</td>
        <td>#:APPLY_TERM_NM#</td>
        <td>#:APPLY_DT#</td>
	    <td>#:CHG_APPLY_REASON_NM#</td>
	    <td class="text-left">#:POST_CHG_DEPT_NM#</td>
	    <td class="text-left">#:POST_CHG_MAJOR_NM#</td>
	    <td># if( :TEACH_APPLY_GCD == "0001") { #Y# } else { #N#} #</td>
  		<td># if( :STA_GCD== "0001") {# <span class="badge badge-pil badge-warning" type="">접수</span>#} 
				  else if ( :STA_GCD == "0002") {# <span class="badge badge-pil badge-primary" type="">학과승인</span>#} 
				  else if ( :STA_GCD == "0003" || :STA_GCD == "0004") {# <span class="badge badge-pil badge-success" type="">최종승인</span> #} 
				  else if ( :STA_GCD == "0005" || :STA_GCD == "0006" || :STA_GCD == "0007" || :STA_GCD == "0008") {# <span class="badge badge-pil badge-danger" type="">반려</span> #}#
		</td>
  		<td>#:APPROVE_DT#</td>
  		<td class="text-left">#:APPROVE_NONPSBL_REASON_COMMENT#</td>
	</tr>
</script>
<script type="text/javascript">

	/* 진행단계 템플릿 */
	function fn_setTemplate(obj) {
		var trData = $(obj).data();
	
		// 템플릿 결제진행 단계(0001 : 2단계, 0002 : 3단계)
		if ($(obj).attr("class") == "0001") {

			$("#level1").find("span").show();
			$("#level2").find("div:not(:first)").hide();
			$("#level3").find("div:not(:first)").hide();
			
			$("#level1").removeClass("disabled");
			$("#level2").addClass("disabled");
			$("#level3").addClass("disabled");
		} else if ($(obj).attr("class") == "0002" || $(obj).attr("class") == "0003") {
			if ($(obj).attr("class") == "0002") { // 학과승인	
				$("#level3").find("div:not(:first)").hide();
				$("#level3").addClass("disabled");
			} else if ($(obj).attr("class") == "0003") { // 대학승인
				$("#level3").find(".badge-primary").closest("div").show();
				$("#level3").find(".badge-warning").closest("div").hide();
				$("#level3").removeClass("disabled");
			}
			$("#level2").find(".badge-primary").closest("div").show();
			$("#level2").find(".badge-warning").closest("div").hide();
			$("#level1").removeClass("disabled");
			$("#level2").removeClass("disabled");
		} else if ($(obj).attr("class") == "0007" || $(obj).attr("class") == "0008") {
			if ($(obj).attr("class") == "0007") { // 학과승인불가
				$("#level3").find("div:not(:first)").hide();
				$("#level3").addClass("disabled");
			} else if ($(obj).attr("class") == "0008") { // 대학승인불가
				$("#level3").find(".badge-primary").closest("div").hide();
				$("#level3").find(".badge-warning").closest("div").show();
				$("#level3").removeClass("disabled");
			}
			$("#level2").find(".badge-primary").closest("div").hide();
			$("#level2").find(".badge-warning").closest("div").show();
			$("#level2").removeClass("disabled");
		}
		$("#level1").find("span").html(trData.APPLY_DT2);
		$("#level2").find(".badge-primary").next("span").html(trData.APPROVE_DATE_DEPT);
		$("#level2").find(".badge-warning").next("span").html(trData.APPROVE_DATE_DEPT);
		$("#level3").find(".badge-primary").next("span").html(trData.APPROVE_DATE_COLL);
		$("#level3").find(".badge-warning").next("span").html(trData.APPROVE_DATE_COLL);
	}

	function fn_initScreen() {
		fn_sch();
	}
	
	/* 다중전공신청내역 목록 조회 */
	var searchParam = '';
	var chkApply = false; //true : 해당학년도 학기에 신청건이 있음
	var termInfo = []; //기준학년도/학기
	var tempData = [];
	function fn_sch(data) {
		searchParam = {};
		
		gfn_ajax_request({
			url : "/ost/hj/hjchnge/MltiMajorApply/selectListMltiMajorApply",
	        reqData : searchParam,
	        success : function(data, responseData) {
				if(!gfn_com_isEmptyObject(data[2])){
					scwin.schdList = data[2];
				}
				
				chkApply = false;
	        	$("#resultTbody").listView({
	                dataSource : data[0],
	                emptyComment : '신청기간에 등록된 내역이 없습니다.',
	                dataBound : function(e) {
	                	$("#resultTbody tr").bind("click", function(e) {
                        scwin.detailObj = $(this).closest("tr").data();
	                	if(scwin.detailObj.STA_GCD != '0001') return; //접수 상태일 때만 수정 가능
	                	fn_chkSchd('U');
	                    });
	                },
	                template : $("#resultTemplate"),
					totalCnt : data[0].length
	            });
	        	
				termInfo = responseData.termInfo;
				tempData.ACQ_CRDT = (data[1][0] != null) ?data[1][0].ACQ_CRDT:"";//총취득학점
				tempData.GPA = (data[1][0] != null) ?data[1][0].GPA:"";//전체평점평균
				
				for(var i = 0; i < data[0].length; i++){
					if(data[0][i].APPLY_SYEAR == termInfo.SYEAR && data[0][i].APPLY_TERM_GCD == termInfo.TERM_GCD){
						chkApply = true;
					}
				}
				if(!gfn_com_isEmptyObject(data[0][0])){
					// 결재 템플릿 디자인 세팅
					if (gfn_str_parseNull(data[0][0].AUTHORN_STEP_GCD) == "0001") {
						$("#level2").find("strong").html("03. 최종승인/반려");
						$("#level3").hide();
					}
				}

				// 첫번째 row 선택
	    		if (!gfn_com_isEmptyObject(data[0][0])) {
					fn_setTemplate($("#resultTbody tr:eq(0)"));
					$("#resultTbody tr:eq(0)").find("td").addClass("active");
				} else {
					$("#level1").addClass("disabled");
					$("#level2").addClass("disabled");
					$("#level3").addClass("disabled");
					$("#level1").find("span").hide();	
					$("#level2").find("span").hide();
					$("#level2").find("div:not(:first)").hide();
					$("#level3").find("div:not(:first)").hide();
				}
	        }
	    });
	}
	
	/* 신청가능기간여부 확인 */
	function fn_chkSchd(type) {
		gfn_ajax_request({
			url : "/ost/hj/hjchnge/MltiMajorApply/selectChkSchd",
	        reqData : searchParam,
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
       		if(chkApply){
       			alert('동일한 학년도/학기에 신청건이 있습니다.');
       			return;
       		}
       		
			if(scwin.loginUser.collGradGcd == '0002'){
				//대학원생일 경우 일반대학원만 신청가능
				if(scwin.loginUser.gradGcd != '0001'){
					alert('일반대학원만 신청가능 합니다.');
					return;
				}
			}
			scwin.rowState = 'C';
			scwin.detailObj = {};
			
			fn_getSessionInfo(param);
		};
		if(param == "U") {
			scwin.rowState = 'U';
			fn_getSessionInfo();
			
		};
		
		gfn_com_modalPopup({
			width : 1200,
			height : 630,
			index : 1,
			target : null,
			title : "다중전공 신청",
			include : "/html/ost/hj/hjchnge/MltiMajorApplyPop.html"
		});
	}
	
	/* 세션값 저장 */
	function fn_getSessionInfo(param) {
		scwin.detailObj.STDT_NO = scwin.loginUser.userId; //학번
	    scwin.detailObj.STDT_INFO = scwin.loginUser.userId + '(' + scwin.loginUser.nm + ')'; //학번(성명)
		scwin.detailObj.HJ_STA_NM = scwin.loginUser.hjStaGcdKorNm; //학적상태
		scwin.detailObj.ACQ_CRDT = tempData.ACQ_CRDT; //총취득학점
		scwin.detailObj.GPA = tempData.GPA; //전체평점평균
		if(scwin.loginUser.collGradGcd == '0001'){
			//대학
			scwin.detailObj.STDT_YEAR_NM = scwin.loginUser.stdtYearGcdKorNm;  //학년
		}else{
			//대학원
			scwin.detailObj.STDT_YEAR_NM = scwin.loginUser.atlectTermCnt; //학기
		}
		scwin.detailObj.CMPL_TERM_CNT = scwin.loginUser.cmplTermCnt; //이수학기수
		
		var majorNm = scwin.loginUser.majorCdKorNm == null ? '' : scwin.loginUser.majorCdKorNm;
	    scwin.detailObj.DEPT_NM = scwin.loginUser.gradGcdKorNm + ' ' + scwin.loginUser.collCdKorNm + ' ' + scwin.loginUser.deptCdKorNm + ' ' + majorNm + ' ' 
										      + '(' + scwin.loginUser.degCourseGcdKorNm + ')'; //소속(과정)
		if(param == "C") {
			var nowDay = new Date();
			var today = nowDay.toISOString().slice(0, 10);
			scwin.detailObj.APPLY_SYEAR = scwin.schdList[0].SYEAR;
			scwin.detailObj.APPLY_TERM_GCD = scwin.schdList[0].TERM_GCD;
			scwin.detailObj.APPLY_DT = today;  
			scwin.detailObj.APPLY_SYEAR_TERM = scwin.detailObj.APPLY_SYEAR + '학년도 / ' + scwin.schdList[0].TERM_GCD_NM; 
		}else{
			scwin.detailObj.APPLY_SYEAR_TERM = scwin.detailObj.APPLY_SYEAR + '학년도 / ' + scwin.detailObj.APPLY_TERM_NM; 
		}
	}
	
	
</script>