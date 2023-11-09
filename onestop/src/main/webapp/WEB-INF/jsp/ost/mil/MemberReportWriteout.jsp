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
				<!-- 메시지 박스 -->
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn">대원신고가 누락 또는 지연되거나 입력자료가 부정확할 경우 훈련시간 단축혜택을 못 받을 수 있습니다.</span></li>
								<li><span class="dfn">특히, 군번, 핸드폰 번호, 실제 받을 수 있는 E-mail을 정확히 입력해 주시기 바랍니다.</span> <br>
									<tr></tr> <span class="dfn">(예비군 교육훈련 관련사항은 우편, 이메일, 휴대폰 문자로 3~4회 본인에게 통보됩니다.)</span></li>
								<li><span class="dfn">예비군 연대에서 발송하는 우편물은 '국방등원정보체계'에 등록된 주민등록상 주소지로 배송됩니다.</span></li>
								<li><span class="dfn">원룸, 하숙집 등 실거주지에서 우편물을 받고 싶은 경우는 주민등록상 주소지를 이전하기 바랍니다.</span></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="card-header" id="heading1">
						<label class="text-left dfn">기본정보</label>
					</div>
					<div class="b-table-box flex-col-2" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" data-lang>학번</label>
								</div>
								<div class="b-con-box" role="cell">
									<label id="STDT_NO"></label>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" data-lang>성명</label>
								</div>
								<div class="b-con-box" role="cell">
									<label id="STDT_KOR_NM"></label>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box " role="rowheader">
									<label class="req" data-lang>주민번호</label>
								</div>
								<div class="b-con-box" role="cell">
									<label id="SSN"></label>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>소속</label>
								</div>
								<div class="b-con-box" role="cell">
									<label id="ASSIGN_NM"></label>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학년</label>
								</div>
								<div class="b-con-box" role="cell">
									<label id="STDT_YEAR"></label>
								</div>
							</div>
						</div>
						<div class="b-row-box " role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label for="ZIP_CD" data-lang>우편번호</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="ZIP_CD"  readonly = 'true'  class="form-control col-2" />&nbsp;
									<button class="btn btn-primary" onclick="fn_jusoPop()" type="button">검색</button>
								</div>
							</div>
						</div>
						<div class="b-row-box " role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="ADDR1" data-lang>주소</label>
								</div>
								<div class="b-con-box">
									<input type="text" id="ADDR1" class="form-control" />
								</div>
							</div>
						</div>
						<div class="b-row-box " role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="ADDR2" data-lang>상세주소</label>
								</div>
								<div class="b-con-box">
									<input type="text" id="ADDR2" class="form-control" />
								</div>
							</div>
						</div>
						<div class="b-row-box " role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="TELL_NO" data-lang>전화번호</label>
								</div>
								<div class="b-con-box">
									<input type="text" id="TELL_NO" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="PHONE_NO" data-lang>핸드폰</label>
								</div>
								<div class="b-con-box">
									<input type="text" id="PHONE_NO" class="form-control" />
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box " role="rowheader">
									<label for="EMAIL" data-lang>E-MAIL</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="EMAIL" class="form-control"></input>
								</div>
							</div>
						</div>
					</div>
					<!-- /END 검색 영역 -->
					<!-- E-Mail 수령 동의서-->
					<section class="sec-2 mb-5">
						<header>
							<h3 class="sec-title">E-Mail 수령 동의서</h3>
						</header>
						<div class="sec-body">
							<div class="message-box mb-3">
								<div class="message-box-inner">
									<div class="message-body">
										<p class="mb-1">◇ 병무청에서는 병역법시행령 제3조의2 "병역의무부과통지서의 송달 등"에 의거하여 병력동원소집통지서를 E-mail로 송부하고 있습니다.</p>
										<p class="mb-1">◇ 귀하가 제공하신 정보는 공공기관의 개인정보보호에 관한 법률 제4조 "개인정보의 수집"에 의하여 철저히 보호되며, 예비군 관련 정보제공에만 사용됩니다.</p>
										<p class="mb-0">◇ 본인의 E-mail을 병력동원 소집통지서(예비군교육훈련관련)등의 수령(사용)에 동의 합니다.</p>
									</div>
								</div>
							</div>
						</div>
						<div class="text-left">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="RGROUP" id="AGREE_Y" value="Y" checked> <label class="form-check-label" for="AGREE_Y">동의합니다.</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="RGROUP" id="AGREE_N" value="N"> <label class="form-check-label" for="AGREE_N">동의하지 않습니다.</label>
							</div>
						</div>
					</section>
					<!-- /END E-Mail 수령 동의서 -->

					<!-- 병역정보  -->
					<div class="card-header" id="heading1">
						<label class="text-left dfn">병역정보</label> <label class="text-left dfn" style="color: red;">(※군번은 '-'없이 숫자로 입력하여 주시기 바랍니다.)</label>
					</div>
					<div class="b-table-box flex-col-2" role="table" aria-label="입력">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="CAMPUS_GCD" data-lang>캠퍼스 구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control" id="CAMPUS_GCD">
										<option>선택</option>
									</select>
								</div>
							</div>
							<div class="b-row-item"></div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box " role="rowheader">
									<label class="req" for="MIL_NO" data-lang>군번</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="MIL_NO" class="form-control"></input>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box " role="rowheader">
									<label class="" for="MIL_SERVE_SHAPE_GCD" data-lang>역종</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control" id="MIL_SERVE_SHAPE_GCD">
										<option>선택</option>
									</select>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="MIL_CLASS_GCD" data-lang>군별</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="MIL_CLASS_GCD" class="form-control"></select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="MIL_END_RANK_GCD" data-lang>계급</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control" id="MIL_END_RANK_GCD">
										<option>선택</option>
									</select>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="MAIN_SPECIAL_ABILITY_CD" data-lang>병과</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="MAIN_SPECIAL_ABILITY_CD" class="form-control">
										<option>선택</option>
									</select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="MIL_END_GCD" data-lang>전역구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control" id="MIL_END_GCD">
										<option>선택</option>
									</select>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="MIL_START_DATE" data-lang>입대일자</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="MIL_START_DATE" name="MIL_START_DATE" class="form-control datepicker" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="MIL_END_DATE" data-lang>전역일자</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="MIL_END_DATE" name="MIL_END_DATE" class="form-control datepicker" />
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="STNDING_GCD" data-lang>신분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control" id="STNDING_GCD">
										<option>선택</option>
									</select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="MOVEIN_GCD" data-lang>신고사유</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control" id="MOVEIN_GCD">
										<option>선택</option>
									</select>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="APPLY_DT" data-lang>신고일</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="APPLY_DT" name="APPLY_DT" class="form-control datepicker" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="END_DT" data-lang>전입일</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="END_DT" name="END_DT" class="form-control datepicker" />
								</div>
							</div>
						</div>
					</div>
					<div class="btn-box">
						<div class="form-row btn-box-right">
							<div class="col-auto">
								<button class="btn btn-primary" type="button" onclick="javascript:return fn_Write();" data-lang>입력</button>
							</div>
							<div class="col-auto">
								<button class="btn btn-primary" type="button" onclick="fn_Cancel()" data-lang>취소</button>
							</div>
						</div>
					</div>

				</div>
				<!-- /END 병역정보 -->
			</div>
		</section>
	</main>
</div>
<script type="text/javascript">

	var stdtNo = scwin.loginUser.userId;
	var nm = scwin.loginUser.nm;
	var assignNm = scwin.loginUser.assignNm;
	var stdtYear = scwin.loginUser.stdtYearGcd;
	var stdtYearGcdKorNm = scwin.loginUser.stdtYearGcdKorNm;

	var collGradGcd = scwin.loginUser.collGradGcd;
	var collCd = scwin.loginUser.collCd;

	var _goUrl = "/page?menuCD=000000000000239" //예비군 안내페이지로 이동

	function fn_initScreen() {


		$("#CAMPUS_GCD").dropDownList({ //캠퍼스구분    
			dataSource : null,
			commonCode : "0001_CAMPUS_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "0001",
			expnCondition : "",
			dataBound : function(e) {

			}
		});

		$("#MIL_SERVE_SHAPE_GCD").dropDownList({ //역종      
			dataSource : null,
			commonCode : "0001_MIL_SERVE_SHAPE_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			dataBound : function(e) {

			}
		});

		var milKindCdGcd = "";
		var mainSpecialAbiltyCdList = {
			"MIL_CLASS_GCD" : "",
			"MIL_KIND_CD_GCD" : ""
		};

		$("#MIL_END_RANK_GCD").dropDownList({ //계급
			dataSource : null,
			commonCode : "0001_MIL_RANK_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			expnCondition : "",
			dataBound : function(e) {
				$('#MIL_END_RANK_GCD').bind("click", function(e){
					var milEndRankGcd = $("#MIL_END_RANK_GCD").val().substring(0, 3); //계급

					if (milEndRankGcd == "001" || milEndRankGcd == "002"|| milEndRankGcd == "003") { //대장~소위
						milKindCdGcd = "0003";
					} else { //준위~이병
						milKindCdGcd = "0004";
					}
					
					mainSpecialAbiltyCdList = {
						"MIL_CLASS_GCD" : $("#MIL_CLASS_GCD").val(),
						"MIL_KIND_CD_GCD" : milKindCdGcd
					};

					 fn_SpecialAbilityCd(mainSpecialAbiltyCdList); 
				 });
				 
				
			}
		});

		$("#MIL_CLASS_GCD").dropDownList({ //군별
			dataSource : null,
			commonCode : "0001_MIL_CLASS_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			expnCondition : "",
			dataBound : function(e) {
				$('#MIL_CLASS_GCD').bind("click", function(e){
					mainSpecialAbiltyCdList = {
							"MIL_CLASS_GCD" : $("#MIL_CLASS_GCD").val(),
							"MIL_KIND_CD_GCD" : milKindCdGcd
						};

					 fn_SpecialAbilityCd(mainSpecialAbiltyCdList); 
				 });
			}
		});
		

		$("#MIL_END_GCD").dropDownList({ //전역구분
			dataSource : null,
			commonCode : "0001_MIL_END_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			dataBound : function(e) {

			}
		});

		$("#STNDING_GCD").dropDownList({ //신분
			dataSource : null,
			commonCode : "0001_STNDING_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			dataBound : function(e) {

			}
		});

		$("#MOVEIN_GCD").dropDownList({ //신고사유
			dataSource : null,
			commonCode : "0001_MOVEIN_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			dataBound : function(e) {

			}
		});

		$("#TELL_NO").telEditor({
			txtVal : "",
			originVal : "",
			telnoGbn : "A", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
			telnoNm : "휴대폰번호"
		});

		$("#PHONE_NO").telEditor({
			txtVal : "",
			originVal : "",
			telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
			telnoNm : "휴대폰번호"
		});

		$("#EMAIL").emailEditor({
			val : ""
		});

		fn_applyDtChk(); //신청기간 조회

	}

	//병과특기조회
	function fn_SpecialAbilityCd(mainSpecialAbiltyCdList) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/mil/memberreportwriteout/selectMainSpecialAbilityCd",
			reqData : mainSpecialAbiltyCdList,
			success : function(data, responseData) {
				$("#MAIN_SPECIAL_ABILITY_CD").dropDownList({
					dataSource : data,
					dataTextField : "DETAIL_CD_NM",
					dataValueField : "DETAIL_CD",
					optionLabel : "선택",
					optionValue : "",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {

					}
				});
			}
		});

	}

	/* 신청기간조회 */
	function fn_applyDtChk(data) {
		var paramMap = {};
		var validMsg = "";

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/mil/memberreportwriteout/selectApplyDate",
			reqData : data,
			success : function(data, responseData) {

				if (gfn_com_isEmptyObject(data)) {
					alert("신청기간이 아닙니다.");
					location.href = _goUrl;
					return;
				} else {
					var startDay = data[1].COMMON_DETAIL_CD_KOR_NM;
					var endDay = data[2].COMMON_DETAIL_CD_KOR_NM;

					var nowDay = new Date();
					var today = nowDay.toISOString().slice(0, 10).replace(/-/g,
							'');

				}

				if (startDay <= today && today <= endDay) { //현재일자가 신청기간 내에 있을때 
					fn_schInfo();
					fn_ssnSch(); //주민등록번호 조회 
				} else { //현재일자가 신청기간 내에 없으면 ip조회
					if (fn_ipSch()) { //ip가 있으면 
						fn_schInfo();
						fn_ssnSch(); //주민등록번호 조회 
					} else { // ip가 없으면
						alert("대원신고 가능기간이 아닙니다.");
						return;
					}
				}

			}
		});
	}

	/* 주민등록번호 조회 */
	function fn_ssnSch(data) {
		/* 검색조건데이터 가져오기 */
		var searchParam = {};

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/mil/memberreportwriteout/selectStdtSsn",
			reqData : searchParam,
			success : function(data, responseData) {

				if (gfn_com_isEmptyObject(data)) {
					alert("주민등록번호를 조회하는 도중 에러가 발생했습니다.");
					location.href = _goUrl;
					return;
				} else {
					$("#STDT_NO").text(stdtNo);
					$("#STDT_KOR_NM").text(nm);
					$("#ASSIGN_NM").text(assignNm);
					$("#STDT_YEAR").text(stdtYearGcdKorNm);
					$("#SSN").text(data[0].SSN);

					if (collCd == "470000") { //캠퍼스구분
						$("#CAMPUS_GCD").prop("disabled", true);
						$("#CAMPUS_GCD").val('0003');
					} else {
						$("#CAMPUS_GCD").val('0001');
					}

					if (collGradGcd == "0001") { //신분
						$("#STNDING_GCD").prop("disabled", true);
						$("#STNDING_GCD").val('0001');
					} else {
						$("#STNDING_GCD").prop("disabled", true);
						$("#STNDING_GCD").val('0002');
					}

				}
			}
		});
	}
	
	function fn_schInfo(data) {
		/* 검색조건데이터 가져오기 */
		var searchParam = {};
		
		
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/stdtinfoupd/selectStdtInfoUpd",
			reqData : searchParam,
			success : function(data, responseData) {
				
				if (!gfn_com_isEmptyObject(data)) {
					
						$("#ZIP_CD").val(data[0].STDT_ZIP_NO);
						$("#ADDR1").val(data[0].STDT_ADDR);
						$("#ADDR2").val(data[0].STDT_DETAIL_ADDR);
						$("#TELL_NO").val(data[0].STDT_TEL_NO);
						$("#PHONE_NO").val(data[0].STDT_CELLULAR_NO);
						$("#EMAIL").val(data[0].STDT_EMAIL);
						
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

	/* 허용IP조회 */
	function fn_ipSch() {
		/* 검색조건데이터 가져오기 */
		var searchParam = {};

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/mil/memberreportwriteout/selectIpCheck",
			reqData : searchParam,
			success : function(data, responseData) {
				if (gfn_com_isEmptyObject(data)) {
					return false;
				} else {
					return true;
				}
			}
		});
	}

	function fn_validate(param) {
		var rtnValue = true;

		rtnValue = gfn_val_validateDataMap(param, [ {
			"id" : "ADDR1",
			"name" : "주소",
			"notNull" : true,
		}, {
			"id" : "ADDR2",
			"name" : "상세주소",
			"notNull" : true
		}, {
			"id" : "TELL_NO",
			"name" : "전화번호",
			"notNull" : true
		}, {
			"id" : "PHONE_NO",
			"name" : "핸드폰",
			"notNull" : true
		}, {
			"id" : "CAMPUS_GCD",
			"name" : "캠퍼스구분",
			"notNull" : true
		}, {
			"id" : "MIL_NO",
			"name" : "군번",
			"notNull" : true
		}, {
			"id" : "MIL_START_DATE",
			"name" : "입대일자",
			"notNull" : true
		}, {
			"id" : "MIL_END_DATE",
			"name" : "전역일자",
			"notNull" : true
		}, ]);

		if (!rtnValue)
			return rtnValue;

		return rtnValue;
	}

	function fn_validateEmail() {
		var radioAgree = $("input:radio[name=RGROUP]:checked").val();

		if (radioAgree == null) // 둘중 하나는 선택해야 함
		{
			alert("E-Mail 수령동의를 선택해 주세요.");
			return false;
		} else {
			if (radioAgree == "Y") //동의한 경우 이메일 입력 체크
			{
				if ($("#EMAIL").val() == "") {
					alert("E-Mail 수령에 동의하셨습니다. E-Mail 주소를 입력하세요.");
					$("#EMAIL").focus();
					return false;
				}
			} else {
				$("#EMAIL").val("") // 동의안하면 입력 안하는 것으로..								
			}
			return true;
		}
	}

	// 입력
	function fn_Write() {
		var param = gfn_com_searchData($(".search-box"));

		//param["STDT_NO"] = stdtNo;
		param["STDT_KOR_NM"] = nm;
		param["STDT_YEAR"] = stdtYear;
		param["SSN"] = $("#SSN").text();

		if (!fn_validate(param))
			return false;

		if (!fn_validateEmail())
			return false;

		confirm(
			gva_SAVE_CONFIRM_MSG,
			function(_flag) {
				if (_flag) {
					gfn_ajax_request({
						url : "/ost/mil/memberreportwriteout/saveMemberReportWriteout",
						reqData : param,
						success : function(data, responseData) {
							alert(data[0].O_MSG);
							var _goUrl = "/page?menuCD=000000000000131" //예비군 편성상태조회 페이지로 이동
							location.href = _goUrl;
						}
					});
				}
			});
	}

	// 신청 취소
	function fn_Cancel() {
		//location.href = "CheckFormation.aspx";
		location.href = _goUrl;
	}

	function fn_jusoPop() {
		gfn_com_openJusoPop({
			callbackFunc : function(e) {
				$("#ZIP_CD").val(e.zipCd);
				$("#ADDR1").val(e.addr);
				$("#ADDR2").val("").focus();
			}
		});
	}
</script>