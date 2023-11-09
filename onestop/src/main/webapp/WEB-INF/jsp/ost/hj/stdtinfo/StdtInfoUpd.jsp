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
			<!-- 바디영역 -->

			<!-- 기본정보 -->
			<div class="b-table-box flex-col-3" role="table" aria-label="개인정보">
				<div class="b-row-box" role="row">
					<div class="b-row-item merge-3">
						<div class="b-title-box" role="rowheader">
							<label data-lang>소속(과정)</label>
						</div>
						<div class="b-con-box" role="cell">
							<div id=DEPT data-lang></div>
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
			<!-- /END 기본정보 -->
				
			<div class="stdt-info">
				<div class="search-box">
					<input type="text" id="STDT_KOR_NM" class="form-control" style="display: none;" /> 
					<input type="text" id="STDT_ENG_NM" class="form-control" style="display: none;" /> 
					<input type="text" id="STDT_ZIP_NO" class="form-control" style="display: none;" /> 
					<input type="text" id="STDT_ADDR" class="form-control" style="display: none;" /> 
					<input type="text" id="STDT_DETAIL_ADDR" class="form-control" style="display: none;" /> 
					<input type="text" id="STDT_TEL_NO" class="form-control" style="display: none;" /> 
					<input type="text" id="MIL_SERVE_GCD" class="form-control" style="display: none;" />
					<input type="text" id="STDT_CELLULAR_NO" class="form-control" style="display: none;" /> 
					<input type="text" id="STDT_EMAIL" class="form-control" style="display: none;" /> 

					<input type="text" id="GUARDIAN_NM" class="form-control" style="display: none;" /> 
					<input type="text" id="GUARDIAN_REL_INFO" class="form-control" style="display: none;" /> 
					<input type="text" id="GUARDIAN_TEL_NO" class="form-control" style="display: none;" /> 
					<input type="text" id="GUARDIAN_ZIP_NO" class="form-control" style="display: none;" /> 
					<input type="text" id="GUARDIAN_ADDR" class="form-control" style="display: none;" /> 
					<input type="text" id="GUARDIAN_DETAIL_ADDR" class="form-control" style="display: none;" /> 
					<input type="text" id="GUARDIAN_OCPTN_NM" class="form-control" style="display: none;" /> 

					<input type="text" id="SMS_RCV_AGREE_FG" class="form-control" style="display: none;" /> 
					<input type="text" id="EMAIL_RCV_AGREE_FG" class="form-control" style="display: none;" /> 
					<input type="text" id="KAKAOTALK_RCV_AGREE_FG" class="form-control" style="display: none;" /> 
				</div>

				<p class="text-danger">*는 필수 입력사항입니다.</p>
				<section class="sec-2">
					<header>
						<h4 class="sec-title">1. 본인정보</h4>
					</header>					
					<div class="sec-body">
					
						<div class="b-table-box flex-col-1" role="table" aria-label="입력">
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box " role="rowheader">
										<label class="req" for="STDT_ENG_NM_VAL" data-lang>영문이름</label>
									</div>
									<div class="b-con-box" role="cell">
										<input id="STDT_ENG_NM_VAL" class="form-control"></input>
										<div class="text-danger" id="STDT_ENG_NM_INFO1">(본인의 영문 이름은 반드시 입력해주세요. 예: HONG GILDONG)</div>			
										<div class="text-primary" id="STDT_ENG_NM_INFO2">외국인 학생의 영문 이름은 외국인 등록증에 명시된 이름과 동일해야 하며, <br>[학적부기재사항정정 신청] 메뉴에서 변경 신청할 수 있습니다.
											<a class="link link-style-1" href="page?menuCD=000000000000143" target="_self" title="학적부기재사항정정 신청">바로가기</a>
										</div>									
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="STDT_ZIP_NO_VAL" data-lang>우편번호</label>
									</div>
									<div class="b-con-box" role="cell">
										<input type="text" id="STDT_ZIP_NO_VAL" class="form-control col-3" disabled="disabled"/>&nbsp;
										<button class="btn btn-primary" onclick="fn_jusoPop1()" type="button">찾기</button>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="STDT_ADDR_VAL" data-lang>주소</label>
									</div>
									<div class="b-con-box" role="cell">
										<input type="text" id="STDT_ADDR_VAL" class="form-control col-3" />&nbsp;
										<input type="text" id="STDT_DETAIL_ADDR_VAL" class="form-control col-xl" title="상세주소"/>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="STDT_TEL_NO_VAL" data-lang>전화번호</label>
									</div>
									<div class="b-con-box" role="cell">
										<input id="STDT_TEL_NO_VAL" class="form-control col-3"></input>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="MIL_SERVE_GCD_VAL" data-lang>병역사항</label>
									</div>
									<div class="b-con-box" role="cell">
										<select class="form-control col-3" id="MIL_SERVE_GCD_VAL">
											<option>선택</option>
										</select>
										&nbsp;
										<div class="text-danger">(남자만 필수 입력해주세요.)</div>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="STDT_CELLULAR_NO_VAL" data-lang>휴대전화번호</label>
									</div>
									<div class="b-con-box" role="cell">
										<div class="input-group-append">
											<input id="STDT_CELLULAR_NO_VAL" class="form-control" auto-bind="STDT_TEL_NO_VAL"></input>
										</div>
										<div class="col">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="SMSGROUP" id="SMS_RCV_AGREE_FG_1" value="Y"> <label class="form-check-label" for="SMS_RCV_AGREE_FG_1">SMS수신동의</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="SMSGROUP" id="SMS_RCV_AGREE_FG_2" value="N" checked> <label class="form-check-label" for="SMS_RCV_AGREE_FG_2">SMS수신거부</label>
											</div>
										</div>
										<div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="KAKAOTALKGROUP" id="KAKAOTALK_RCV_AGREE_FG_1" value="Y"> <label class="form-check-label" for="KAKAOTALK_RCV_AGREE_FG_1">카카오톡 수신동의</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="KAKAOTALKGROUP" id="KAKAOTALK_RCV_AGREE_FG_2" value="N" checked> <label class="form-check-label" for="KAKAOTALK_RCV_AGREE_FG_2">카카오톡 수신거부</label>
											</div>
										</div>
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="STDT_EMAIL_VAL" data-lang>E-mail</label>
									</div>
									<div class="b-con-box" role="cell">
							            <div class="input-group-append">
											<input id="STDT_EMAIL_VAL" class="form-control" auto-bind="STDT_TEL_NO_VAL"></input>
										</div>
										<div class="col">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="EMAILGROUP" id="EMAIL_RCV_AGREE_FG_1" value="Y"> <label class="form-check-label" for="EMAIL_RCV_AGREE_FG_1">E-mail수신동의</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="EMAILGROUP" id="EMAIL_RCV_AGREE_FG_2" value="N" checked> <label class="form-check-label" for="EMAIL_RCV_AGREE_FG_2">E-mail수신거부</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- /END 본인정보 -->
				</div>
			</section>

			<section class="sec-2">
				<header>
					<h4 class="sec-title">2. 보호자정보</h4>
				</header>					
				<div class="sec-body">
				<!-- 보호자정보 -->
					<div class="b-table-box flex-col-1" role="table" aria-label="입력">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box " role="rowheader">
									<label class="req" for="GUARDIAN_NM_VAL" data-lang>보호자 이름</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="GUARDIAN_NM_VAL" class="form-control"></input>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="GUARDIAN_REL_INFO_VAL" data-lang>본인과의 관계</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="GUARDIAN_REL_INFO_VAL" class="form-control col-3"></input>
								</div>
							</div>
						</div>						
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="GUARDIAN_TEL_NO_VAL" data-lang>보호자 연락처</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="GUARDIAN_TEL_NO_VAL" class="form-control col-3"></input>
								</div>
							</div>
						</div>						
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="GUARDIAN_ZIP_NO_VAL" data-lang>우편번호</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="GUARDIAN_ZIP_NO_VAL" class="form-control col-3" disabled="disabled"/>&nbsp;
									<button class="btn btn-primary" onclick="fn_jusoPop2()" type="button">찾기</button>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="GUARDIAN_ADDR_VAL" data-lang>주소</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="GUARDIAN_ADDR_VAL" class="form-control col-3" />&nbsp;
									<input type="text" id="GUARDIAN_DETAIL_ADDR_VAL" class="form-control col-xl" title="상세주소"/>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="GUARDIAN_OCPTN_NM_VAL" data-lang>보호자 직업</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="GUARDIAN_OCPTN_NM_VAL" class="form-control"></input>
								</div>
							</div>
						</div>
					</div>
					<div>※ 보호자 주소를 수정할 경우, 학교에서 보내는 각종 우편물이 수정된 주소로 보내집니다. 수정시 보호자의 주민등록상의 현주소를 입력하셔야 합니다.</div>
				<!-- /END 보호자정보 -->
					</div>
				</section>
			</div>

				<!-- 입력 버튼 -->				
				<div class="text-right">
					<div class="form-group">
						<button class="btn btn-primary btn-lg" id="" type="button" onclick="fn_save()" data-lang>저장</button>
					</div>                              
				</div>
				<!-- 입력 버튼 -->	

			<!-- 바디영역 -->
			</div>
		</section>
	</main>
</div>	
<script type="text/javascript">

var stdtNo = scwin.loginUser.userId;
var stdtNm = scwin.loginUser.nm;

var CollGradGcdNm = scwin.loginUser.collGradGcdKorNm;
var CollGradGcd = scwin.loginUser.collGradGcd;
var CollCdKorNm = scwin.loginUser.collCdKorNm;
var deptCdNm = scwin.loginUser.deptCdKorNm;
var majorCdNm = (scwin.loginUser.majorCdKorNm == null) ? '' : scwin.loginUser.majorCdKorNm;
var courseGcdNm = scwin.loginUser.degCourseGcdKorNm;
var yearGcd = (CollGradGcd == "0001") ? scwin.loginUser.stdtYearGcdKorNm : scwin.loginUser.cmplTermCnt + '학기' ;
var nationCd = scwin.loginUser.nationCd;

var hjSta = scwin.loginUser.hjStaGcdKorNm;

	function fn_initScreen() {

		(CollGradGcd == "0001") ? $("#YEAR_TERM").text("학년") : $("#YEAR_TERM").text("학기");
		
		// 소속(과정)
		if(scwin.loginUser.userGcd == "0003") {
			$("#DEPT").text(CollGradGcdNm + " " + CollCdKorNm + " " + deptCdNm + " " + majorCdNm + "(" + courseGcdNm + "과정)");
		}else {
			$("#DEPT").text(scwin.loginUser.assignNm);
		}
		// 학번(성명)
		$("#STDT_NO_VAL").text(stdtNo + "(" + stdtNm + ")");
		// 학년(학기)
		if(scwin.loginUser.userGcd == "0003") {
			$("#TERM_GCD").text(yearGcd);
		}else {
			$("#TERM_GCD").text("");
		}
		// 학적상태
		$("#HJ_STA_GCD").text(hjSta);
		
		gfn_com_DropDownLists([{          
			 elements : $("#MIL_SERVE_GCD_VAL"), 
			             commonCode : "0001_MIL_SERVE_GCD",
			             dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			             dataValueField : "COMMON_DETAIL_CD",
			             optionLabel : "선택",
			             optionValue : "",
			             defaultValue : "", 
			             expnCondition : "" ,
			             hakbuGradFg : false,
			             dataBound : function(e) {
			             }	           
		}]);		

		// 휴대폰번호
	    $("#STDT_TEL_NO_VAL").telEditor({
	    	txtVal : "",
	    	originVal : "0000|1234567890",
	    	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
	    	telnoNm : "휴대폰번호",
	        callbackFunc : function(e){
	
	        },
			dataBound : function(e) {
	
	        }
	    });

	    $("#STDT_CELLULAR_NO_VAL").telEditor({
	    	txtVal : "",
	    	originVal : "0000|1234567890",
	    	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
	    	telnoNm : "휴대폰번호",
	        callbackFunc : function(e){
	
	        },
			dataBound : function(e) {
	
	        }
	    });
	    
	    $("#GUARDIAN_TEL_NO_VAL").telEditor({
	    	txtVal : "",
	    	originVal : "0000|1234567890",
	    	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
	    	telnoNm : "휴대폰번호",
	        callbackFunc : function(e){
	
	        },
			dataBound : function(e) {
	
	        }
	    });
	    
	    // 이메일
	    $("#STDT_EMAIL_VAL").emailEditor({
	    	val : "",
	        callbackFunc : function(e){
	
	        },
			dataBound : function(e) {
	
	        }
	    });
	    
	    /* 외국인일 때 영먼 성명 정정 불가(학적부기재사항정정 신청을 통해 변경 가능) */
	    if (gfn_str_parseNull(scwin.loginUser.nationCd) != "0410" && gfn_str_parseNull(scwin.loginUser.nationCd) != "") {
	    	$("#STDT_ENG_NM_VAL").attr("disabled", true);
	    	$("#STDT_ENG_NM_INFO1").hide();
	    	$("#STDT_ENG_NM_INFO2").show();
		}else {
	    	$("#STDT_ENG_NM_INFO1").show();
	    	$("#STDT_ENG_NM_INFO2").hide();			
		}
	    
	    fn_schInfo();
	    
	}
	/***************************************************************************
	 * 주소 입력 팝업
	 **************************************************************************/	
	function fn_jusoPop1() {
		gfn_com_openJusoPop({
			callbackFunc : function(e){
  
            	$("#STDT_ZIP_NO_VAL").val(e.zipCd);
            	$("#STDT_ADDR_VAL").val(e.addr);
            	$("#STDT_DETAIL_ADDR_VAL").val("").focus();
            }
		});
	}	
	function fn_jusoPop2() {
		gfn_com_openJusoPop({
			callbackFunc : function(e){

            	$("#GUARDIAN_ZIP_NO_VAL").val(e.zipCd);
            	$("#GUARDIAN_ADDR_VAL").val(e.addr);
            	$("#GUARDIAN_DETAIL_ADDR_VAL").val("").focus();
            }
		});
	}		
	
	/***************************************************************************
	 * 조회
	 **************************************************************************/
	function fn_schInfo(data) {
		
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/stdtinfoupd/selectStdtInfoUpd",
			reqData : data,
			success : function(data, responseData) {
				
				if (!gfn_com_isEmptyObject(data)) {

			       	   $("#STDT_ENG_NM_VAL").val(data[0].STDT_ENG_NM);
			       	   $("#STDT_ZIP_NO_VAL").val(data[0].STDT_ZIP_NO);
			       	   $("#STDT_ADDR_VAL").val(data[0].STDT_ADDR);
			       	   $("#STDT_DETAIL_ADDR_VAL").val(data[0].STDT_DETAIL_ADDR);
			       	   $("#STDT_TEL_NO_VAL").val(data[0].STDT_TEL_NO);
			       	   $("#MIL_SERVE_GCD_VAL").val(data[0].MIL_SERVE_GCD);
			       	   $("#STDT_CELLULAR_NO_VAL").val(data[0].STDT_CELLULAR_NO);
			       	   $("#STDT_EMAIL_VAL").val(data[0].STDT_EMAIL);
			       	   
			       	   $("#GUARDIAN_NM_VAL").val(data[0].GUARDIAN_NM);
			       	   $("#GUARDIAN_REL_INFO_VAL").val(data[0].GUARDIAN_REL_INFO);
			       	   $("#GUARDIAN_TEL_NO_VAL").val(data[0].GUARDIAN_TEL_NO);
			       	   $("#GUARDIAN_ZIP_NO_VAL").val(data[0].GUARDIAN_ZIP_NO);
			       	   $("#GUARDIAN_ADDR_VAL").val(data[0].GUARDIAN_ADDR);
			       	   $("#GUARDIAN_DETAIL_ADDR_VAL").val(data[0].GUARDIAN_DETAIL_ADDR);
			       	   $("#GUARDIAN_OCPTN_NM_VAL").val(data[0].GUARDIAN_OCPTN_NM);
			       	   
			       	   // EMAIL/SMS 수신여부 추가
						if (data[0].SMS_RCV_AGREE_FG != null) {
							var chk1 = data[0].SMS_RCV_AGREE_FG;
							$('input:radio[name=SMSGROUP]:input[value='+ chk1 + ']').attr("checked", true);
						}			       	   
						if (data[0].EMAIL_RCV_AGREE_FG != null) {
							var chk1 = data[0].EMAIL_RCV_AGREE_FG;
							$('input:radio[name=EMAILGROUP]:input[value='+ chk1 + ']').attr("checked", true);
						}			       	   
						if (data[0].KAKAOTALK_RCV_AGREE_FG != null) {
							var chk1 = data[0].KAKAOTALK_RCV_AGREE_FG;
							$('input:radio[name=KAKAOTALKGROUP]:input[value='+ chk1 + ']').attr("checked", true);
						}			       	   
					
				}
			
			}
		});
	}		
	
	/***************************************************************************
	 * 입력 필수 조건 확인
	 **************************************************************************/
	function fn_validate(param) {
		var rtnValue = true;
		
		rtnValue = gfn_val_validateDataMap(param, [ {
			"id" : "STDT_ENG_NM_VAL",
			"name" : "영문이름",
			"notNull" : true
		}, {
			"id" : "STDT_ZIP_NO_VAL",
			"name" : "우편번호",
			"notNull" : true
		}, {
			"id" : "STDT_ADDR_VAL",
			"name" : "주소",
			"notNull" : true
		}, {
			"id" : "STDT_DETAIL_ADDR_VAL",
			"name" : "상세주소",
			"notNull" : true
		}, {
			"id" : "STDT_TEL_NO_VAL",
			"name" : "전화번호",
			"notNull" : true
		}, {
			"id" : "STDT_CELLULAR_NO_VAL",
			"name" : "휴대전화번호",
			"notNull" : true
		}, {
			"id" : "STDT_EMAIL_VAL",
			"name" : "이메일",
			"notNull" : true
		},	{
			"id" : "GUARDIAN_NM_VAL",
			"name" : "보호자이름",
			"notNull" : true
		},	{
			"id" : "GUARDIAN_REL_INFO_VAL",
			"name" : "본인과의관계",
			"notNull" : true
		},	{
			"id" : "GUARDIAN_TEL_NO_VAL",
			"name" : "보호자연락처",
			"notNull" : true
		},	{
			"id" : "GUARDIAN_ZIP_NO_VAL",
			"name" : "보호자우편번호",
			"notNull" : true
		},	{
			"id" : "GUARDIAN_ADDR_VAL",
			"name" : "보호자주소",
			"notNull" : true
		},	{
			"id" : "GUARDIAN_DETAIL_ADDR_VAL",
			"name" : "보호자상세주소",
			"notNull" : true
		},	]);
		
		if (!rtnValue){
			return rtnValue;
		}
		
		return rtnValue;	
	}	

	/***************************************************************************
	 * [저장]
	 **************************************************************************/
		function fn_save(data) {
		
			$("#STDT_KOR_NM").val(stdtNm);
			$("#STDT_ENG_NM").val($("#STDT_ENG_NM_VAL").val());
			$("#STDT_ZIP_NO").val($("#STDT_ZIP_NO_VAL").val());
			$("#STDT_ADDR").val($("#STDT_ADDR_VAL").val());
			$("#STDT_DETAIL_ADDR").val($("#STDT_DETAIL_ADDR_VAL").val());
			$("#STDT_TEL_NO").val($("#STDT_TEL_NO_VAL").val());
			$("#MIL_SERVE_GCD").val($("#MIL_SERVE_GCD_VAL").val());
			$("#STDT_CELLULAR_NO").val($("#STDT_CELLULAR_NO_VAL").val());
			$("#STDT_EMAIL").val($("#STDT_EMAIL_VAL").val());

			// EMAIIL/SMS 수신동의 여부 추가
			$("#SMS_RCV_AGREE_FG").val($("input:radio[name=SMSGROUP]:checked").val());
			$("#EMAIL_RCV_AGREE_FG").val($("input:radio[name=EMAILGROUP]:checked").val());
			
			// 카카오톡 수신동의 여부 추가
			$("#KAKAOTALK_RCV_AGREE_FG").val($("input:radio[name=KAKAOTALKGROUP]:checked").val());
			
			$("#GUARDIAN_NM").val($("#GUARDIAN_NM_VAL").val());
			$("#GUARDIAN_REL_INFO").val($("#GUARDIAN_REL_INFO_VAL").val());
			$("#GUARDIAN_TEL_NO").val($("#GUARDIAN_TEL_NO_VAL").val());
			$("#GUARDIAN_ZIP_NO").val($("#GUARDIAN_ZIP_NO_VAL").val());
			$("#GUARDIAN_ADDR").val($("#GUARDIAN_ADDR_VAL").val());
			$("#GUARDIAN_DETAIL_ADDR").val($("#GUARDIAN_DETAIL_ADDR_VAL").val());
			$("#GUARDIAN_OCPTN_NM").val($("#GUARDIAN_OCPTN_NM_VAL").val());
			
			
			/* class="search-box"인 곳의 데이터 */
			if (gfn_com_isEmptyObject(data)) {
				data = gfn_com_inputdata($(".stdt-info"));
			}
			
			// 카카오톡 수신동의 체크사항
			if ($("#KAKAOTALK_RCV_AGREE_FG").val() == 'Y' && $("#SMS_RCV_AGREE_FG").val() != 'Y'){
				alert("카카오톡 수신동의시 SMS 수신여부도 동의해야 합니다.(카카오톡 알림 불가시 SMS로 전환처리됨)");
				return false;
			}
			
			// 필수입력 조건 확인
			if (!fn_validate(data)){
				return false;
			}
			
			/* ajax처리 */
			confirm(
					gva_SAVE_CONFIRM_MSG,
					function(_flag) {
						if (_flag) {
							gfn_ajax_request({
								url : "/ost/hj/stdtinfo/stdtinfoupd/saveStdtInfoUpd",
								reqData : data,
								success : function(data, responseData) {
									fn_saveAgree();
								}
							});
						}
					});
			
		}			

	/***************************************************************************
	 * SMS, EMAIL 수신동의 [저장]
	 **************************************************************************/
	function fn_saveAgree() {

		data = gfn_com_inputdata($(".stdt-info"));
	
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/stdtinfoupd/saveAgree",
			reqData : data,
			success : function(data, responseData) {
				alert("저장되었습니다.");
				fn_schInfo();
			}
		});

	}
	
</script>



