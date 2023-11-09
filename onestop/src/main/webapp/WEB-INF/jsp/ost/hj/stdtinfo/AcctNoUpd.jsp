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
			<!-- 바디 영역 -->
			
				<!-- 계좌번호 수정 -->
				<div class="stdt-info">
					<div class="search-box"> 
						<input type="hidden" id="BANK_CD" class="form-control" /> 
						<input type="hidden" id="ACCT_NO" class="form-control" /> 
						<input type="hidden" id="ACCT_NM_NM" class="form-control" /> 
					</div>

					<div class="b-table-box flex-col-3" role="table" aria-label="개인정보">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label data-lang>소속(과정)</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="DEPT" data-lang></div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학번(성명)</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="STDT_NO_VAL" data-lang></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label id="YEAR_TERM" data-lang></label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="TERM_GCD" data-lang></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학적상태</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="HJ_STA_GCD" data-lang></div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 작성 -->
					<p class="text-primary" id="TEXT"></p>
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="BANK_CD_VAL" data-lang>은행</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control" id="BANK_CD_VAL" data-lang>
										<option>선택</option>
									</select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="ACCT_NO_VAL" data-lang>계좌번호</label>
								</div>
								<div class="b-con-box" role="cell">
									<input class="form-control" type="text" id="ACCT_NO_VAL">
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="ACCT_NM_NM_VAL" data-lang>예금주명</label>
								</div>
								<div class="b-con-box" role="cell">
									<input class="form-control" type="text" id="ACCT_NM_NM_VAL">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /END 계좌번호 수정 -->		
			
				<!-- 입력 버튼 -->				
				<div class="text-right">
					<div class="form-group">
						<button class="btn btn-primary btn-lg" id="" type="button" onclick="fn_save()" data-lang>저장</button>
					</div>                              
				</div>
				<!-- 입력 버튼 -->			
			
			
			<!-- /END 바디 영역 -->
			</div>
		</section>
	</main>
</div>	
<script type="text/javascript">
	
	// 학번 STDT_NO
	var stdtNo = scwin.loginUser.userId;
	// 성명 STDT_KOR_NM
	var stdtNm = scwin.loginUser.nm;
	
	// 대학원구분 GRAD_GCD
	var CollGradGcdNm = scwin.loginUser.collGradGcdKorNm;
	var CollGradGcd = scwin.loginUser.collGradGcd;
	// 단과대학 COLL_CD
	var CollCdKorNm = scwin.loginUser.collCdKorNm;
	// 학과 DEPT_CD
	var deptCdNm = scwin.loginUser.deptCdKorNm;
	// 전공 MAJOR_CD
	var majorCdNm = (scwin.loginUser.majorCdKorNm == null) ? '' : scwin.loginUser.majorCdKorNm;
	// 학위과정 DEG_COURSE_GCD
	var courseGcdNm = scwin.loginUser.degCourseGcdKorNm;
	// 학년(대학일 때 표시) STDT_YEAR_GCD or 학기(대학원일 때 표시) ATLECT_TERM_CNT
	var yearGcd = (CollGradGcd == "0001") ? scwin.loginUser.stdtYearGcdKorNm : scwin.loginUser.cmplTermCnt + '학기' ;
	
	// 학적상태 HJ_STA_GCD
	var hjSta = scwin.loginUser.hjStaGcdKorNm;

	function fn_initScreen() {
		
		(CollGradGcd == "0001") ? $("#YEAR_TERM").text("학년") : $("#YEAR_TERM").text("학기");
		
		// 소속(과정)
		$("#DEPT").text(CollGradGcdNm + " " + CollCdKorNm + " " + deptCdNm + " " + majorCdNm + "(" + courseGcdNm + "과정)");
		// 학번(성명)
		$("#STDT_NO_VAL").text(stdtNo + "(" + stdtNm + ")");
		// 학년(학기)
		$("#TERM_GCD").text(yearGcd);
		// 학적상태
		$("#HJ_STA_GCD").text(hjSta);
		
		fn_schBankList();
		
	}

	/***************************************************************************
	 * 조회
	 **************************************************************************/
	function fn_schInfo(data) {
		
		// TEXT 초기화
		$("#TEXT").empty();
		
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}
		
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/acctnoupd/selectAcctNoUpd",
			reqData : data,
			success : function(data, responseData) {
				
				if (!gfn_com_isEmptyObject(data)) {
					$("#TEXT").append("* 현재 계좌번호가 등록되어 있습니다. 자료를 수정할 수 있습니다.");
					
					$("#BANK_CD_VAL").val(data[0].BANK_CD);
					$("#ACCT_NO_VAL").val(data[0].ACCT_NO);
					$("#ACCT_NM_NM_VAL").val(data[0].ACCT_NM_NM);
				}
			
			}
		});
	}		
	
	/***************************************************************************
	 * 은행 리스트
	 **************************************************************************/			
	function fn_schBankList() {
	
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/acctnoupd/selectBankList"
	          ,success: function(data, responseData){  
	       	  $("#BANK_CD_VAL").dropDownList({          
	      				dataSource : data,
	                  dataTextField : "BANK_NM",
	                  dataValueField : "BANK_CD",
	                  optionLabel : "선택",
	                  optionValue : "",
	                  defaultValue : "", 
	                  expnCondition : "",
	                  dataBound : function(e) {
	                  }
	              });
	       		fn_schInfo();
	       	  
	           }
	       });
		
	}	

	/***************************************************************************
	 *필수 입력 조건 확인
	 **************************************************************************/
	function fn_validate(param) {
		var rtnValue = true;
		
		rtnValue = gfn_val_validateDataMap(param, [ {
			"id" : "BANK_CD_VAL",
			"name" : "은행",
			"notNull" : true,
		}, {
			"id" : "ACCT_NO_VAL",
			"name" : "계좌번호",
			"notNull" : true
		}, 
		{
			"id" : "ACCT_NM_NM_VAL",
			"name" : "예금주명",
			"notNull" : true
		}, 
		]);
		
		if (!rtnValue){
			return rtnValue;
		}
		
		return rtnValue;	
		
	}
	
	
	/***************************************************************************
	 * [저장]
	 **************************************************************************/
	function fn_save(data) {
	
		$("#BANK_CD").val($("#BANK_CD_VAL").val());
		$("#ACCT_NO").val($("#ACCT_NO_VAL").val());
		$("#ACCT_NM_NM").val($("#ACCT_NM_NM_VAL").val());
		
		/* class="search-box"인 곳의 데이터 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".stdt-info"));
		}
		
		// 필수입력 조건 확인
		if (!fn_validate(data)){
			return false;
		}
		
		// 세션정보의 이름이랑 입력된 이름과 같은지 확인
// 		if(stdtNm != $("#ACCT_NM_NM").val()){
// 			alert("본인 명의의 계좌만 등록 가능합니다.")
// 			return;
// 		}		
		
		// 계좌번호 정합성 체크
		common.accountChk($("#BANK_CD").val(), $("#ACCT_NO").val(), function(result){
			//RSLT_CD = '0000' 정상
			if(result.RSLT_CD == "0000"){
				// 본인계좌체크
				gfn_ajax_request({
					url : "/ost/hj/stdtinfo/acctnoupd/chkAcctNoUpd",
					reqData : data,
					success : function(data, responseData) {
						
						if (!gfn_com_isEmptyObject(data)) {
	   						if(data[0].ERR_FLAG == "Y") {
	        					alert(data[0].RSLT_MSG);
	        					return;
	   						}else{
	   							// 개인정보 동의 팝업
	   							fn_clause(data[0]);
	   						}
						}
					
					}
				});
				
			}else{
				alert(result.RSLT_MSG);
			}
		});
		
	}		
	
	/***************************************************************************
	 * 개인정보 동의 팝업
	 **************************************************************************/	
	 function fn_clause(param) {
		/* 팝업 & ajax처리 */
		gfn_com_clausePop({
			title : '정보동의팝업',
			systemGcd : '0002',
			clauseSeqNo : 2,
			callbackFunc : function(data) {
				param = gfn_com_inputdata($(".stdt-info"));
				/* 필수동의 사항에 동의한 경우 콜백 실행 */
				param["agreeDltInfo"] = data;
				
				confirm(
						gva_SAVE_CONFIRM_MSG,
						function(_flag) {
							if (_flag) {
								gfn_ajax_request({
									url : "/ost/hj/stdtinfo/acctnoupd/saveAcctNoUpd",
									reqData : param,
									success : function(data, responseData) {
										alert("저장되었습니다.");
										fn_schInfo();
									}
								});
							}
						});				
			}
		});	
	}
	
// TODO : 계좌정합성 체크 | 2022.03.25 UPDATE

</script>

