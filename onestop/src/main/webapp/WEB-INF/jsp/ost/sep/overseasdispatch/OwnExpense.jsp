<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title" id="titleHeader"></h2>
				</div>
				<div class="header-item"></div>
			</header>
			<div class="sec-body">
				<!-- 바디 영역 -->

				<!-- 지원서 -->
				<!-- 메시지 박스 -->
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn">지원기간 :
										<label class="text-primary" id="schdDate"></label>
								</span></li>
								<li><span class="dfn">지원서류제출기간 :
										<label class="text-primary" id="submitDate"></label>
								</span></li>
								<li><span class="dfn">지원서류 제출장소 : 소속 단과대학 행정실</span></li>
								<li><span class="dfn">문의 : outbound@pusan.ac.kr</span></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->

				<!-- 개인정보 영역 -->
				<div class="item-box">

					<div class="search-box">
						<input type="text" id="SYEAR" class="form-control" style="display: none;" /> 
						<input type="text" id="TERM_GCD" class="form-control" style="display: none;" /> 
						<input type="text" id="CHASU_NO" class="form-control" style="display: none;" /> 
						<input type="text" id="EXCHG_GCD" class="form-control" style="display: none;" /> 
						<input type="text" id="EXCHG_DETAIL_GCD" class="form-control" style="display: none;" /> 
						<input type="text" id="STDT_NO" class="form-control" style="display: none;" /> 
						<input type="text" id="DEG_COURSE_GCD" class="form-control" style="display: none;" /> 
						<input type="text" id="CMPL_TERM_CNT" class="form-control" style="display: none;" />
	
						<!-- 자비_입력 -->
						<input type="text" id="LANG_GCD" class="form-control" style="display: none;" /> 
						<input type="text" id="APPLY_1_EXUNIV_CD" class="form-control" style="display: none;" /> 
						<input type="text" id="APPLY_1_EXUNIV_ETC_NM" class="form-control" style="display: none;" /> 
						<input type="text" id="DISPATCH_SUPPOSE_PERIOD_GCD" class="form-control" style="display: none;" /> 
						<input type="text" id="HYUHAK_EXCHG_FG" class="form-control" style="display: none;" /> 
					</div>				
					
					<section class="sec-3" style="margin-bottom:60px;">
					<header>
						<h4 class="sec-title">개인정보(*필수항목)</h4>
					</header>

					<div class="b-table-box flex-col-2" role="table" aria-label="개인정보">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>이름</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="STDT_KOR_NM" data-lang></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학번</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="STDT_NUM" data-lang></div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>소속대학</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="COLL_CD" data-lang></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>소속학과</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="DEPT_CD" data-lang></div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>성별</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="GENDER_GCD" data-lang></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>생년월일</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="BIRTH_DATE" data-lang></div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="STDT_CELLULAR_NO" data-lang>휴대전화</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="STDT_CELLULAR_NO" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="STDT_EMAIL" data-lang>이메일</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="STDT_EMAIL" class="form-control" />
								</div>
							</div>
						</div>

						<div class="b-row-box " role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="EMGCY_TEL_NO" data-lang>비상연락처</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="EMGCY_TEL_NO" class="form-control" />
								</div>
							</div>

							<div class="b-row-item">
								<div class="b-con-box" role="cell">
									<div class="text-primary">* 중요한 공지사항을 누락하는 일이 없도록, 이메일, 휴대폰번호는 최신으로 업데이트해주시기 바랍니다.</div>
								</div>
							</div>

						</div>

						<div class="b-row-box " role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>이수학기</label>
								</div>
								<div class="b-con-box">
									<div id="CMPL_TERM_COUNT"></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>등수</label>
								</div>
								<div class="b-con-box">
									<div id="RANK"></div>
								</div>
							</div>
						</div>
						<div class="b-row-box " role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>석차기준인원</label>
								</div>
								<div class="b-con-box">
									<div id="CRITERIA_INWON"></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학적상태</label>
								</div>
								<div class="b-con-box">
									<div id="HJ_STA_GCD"></div>
								</div>
							</div>
						</div>
						<div class="b-row-box " role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>타대이수학점</label>
								</div>
								<div class="b-con-box">
									<div id="EXUNIV_CMPL_TERM_CNT"></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>타대이수<br>가능학점</label>
								</div>
								<div class="b-con-box">
									<div id="EXUNIV_CMPL_TERM_PO_CNT"></div>
								</div>
							</div>
						</div>
					</div>
					</section>
					<!-- /END 개인정보 영역 -->

					<!-- 정보입력 영역 -->
					<div class="item-box">
					<section class="sec-3" style="margin-bottom:60px;">
					<header>
						<h4 class="sec-title">정보입력(*필수항목)</h4>
					</header>

						<div class="b-table-box flex-col-1" role="table" aria-label="정보입력">
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="LANGUAGE_GCD" data-lang>지원희망<br>외국어</label>
									</div>
									<div class="b-con-box" role="cell">
										<select class="form-control" id="LANGUAGE_GCD" onchange="fn_SchUnivList()" auto-bind="APPLY_1_EXUNIV_CODE">
											<option>선택</option>
										</select>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item merge-2">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="APPLY_1_EXUNIV_CODE" data-lang>파견대학</label>
									</div>
									<div class="b-con-box" role="cell">
										<div class="input-group">
											<div class="input-group-append">
												<select class="form-control" id="APPLY_1_EXUNIV_CODE">
													<option>선택</option>
												</select>
											</div>
											<div class="input-group-append" style="margin-left: 10px;">
												<input class="form-control" type="text" id="APPLY_1_EXUNIV_ETC_NAME" title="파견대학">
											</div>
										</div>
										<div class="row">
											<p class="text-primary">
												프로그램 및 대학별 지원자격을 정확히 확인하세요. <br>(지원가능대학이 없을경우 선택박스아래 입력폼에 대학명을 입력하여 주십시오.)
											</p>
										</div>
									</div>
								</div>

							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="DISPATCH_SUPPOSE_PERIOD_GCD_1" data-lang>파견예정 기간</label>
									</div>
									<div class="b-con-box" role="cell">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="PGROUP" id="DISPATCH_SUPPOSE_PERIOD_GCD_1" value="0003" checked> <label class="form-check-label" for="DISPATCH_SUPPOSE_PERIOD_GCD_1">단기(약 3~8주)</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="PGROUP" id="DISPATCH_SUPPOSE_PERIOD_GCD_2" value="0001"> <label class="form-check-label" for="DISPATCH_SUPPOSE_PERIOD_GCD_2">한 학기(약3~4개월)</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="PGROUP" id="DISPATCH_SUPPOSE_PERIOD_GCD_3" value="0002"> <label class="form-check-label" for="DISPATCH_SUPPOSE_PERIOD_GCD_3">두 학기(약 1년)</label>
										</div>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label class="req" for="HYUHAK_EXCHG_FG_1" data-lang>파견중<br>휴학여부</label>
									</div>
									<div class="b-con-box" role="cell">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="EXGROUP" id="HYUHAK_EXCHG_FG_1" value="Y" checked> <label class="form-check-label" for="HYUHAK_EXCHG_FG_1">Y</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="EXGROUP" id="HYUHAK_EXCHG_FG_2" value="N"> <label class="form-check-label" for="HYUHAK_EXCHG_FG_2">N</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						</section>
						<!-- /END 정보입력 영역 -->

						<!-- 입력 버튼 -->
						<div class="text-center">
							<div class="form-group">
								<button class="btn btn-primary btn-lg" id="btnSave" type="button" onclick="fn_Write()" data-lang>입력</button>
								<button class="btn btn-primary btn-lg" id="btnCancel" type="button" onclick="fn_Cancel()" data-lang>신청취소</button>
							</div>
						</div>
						<!-- 입력 버튼 -->

					</div>
				</div>
			</div>
		</section>
		<!-- 지원서 -->
</main>

		<!-- 바디 영역 -->
</div>

<script type="text/javascript">
	/***************************************************************************
	 * 변수
	 **************************************************************************/
	/* 유저 정보 */
	var exchgGcd = "0001";
	var exchgDetailGcd = "0003";
	// 이전 정보 불러올때 사용할 변수
	var defValLang = "";
	var defValUniv = "";


	function fn_initScreen() {
		fn_schdSyearTerm();
		
		$("#STDT_EMAIL").emailEditor({
        	val : "",
            callbackFunc : function(e){

            },
			dataBound : function(e) {

            }
        });
		agreeDltInfo = [];
	}

	/***************************************************************************
	 * 학생교류 신청가능 학년도,학기 조회
	 **************************************************************************/
	function fn_schdSyearTerm(data) {

		$("#EXCHG_GCD").val(exchgGcd);
		$("#EXCHG_DETAIL_GCD").val(exchgDetailGcd);

		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/exchgfee/searchSchdYearTerm",
			reqData : data,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data)) {
					if (data[0].FG == "N") {
						alert2("신청서 작성기간이 아닙니다.<br/> " + data[0].SCHD,function (e){selectMenu("000000000000204");});
						return;
					} else {
						$("#titleHeader").text(
								data[0].SYEAR + "학년도 " + data[0].TERM_GCD_NM
										+ " 해외교환 자비 유학생 지원서");
						$("#schdDate").text(data[0].SCHD);
						$("#SYEAR").val(data[0].SYEAR);
						$("#TERM_GCD").val(data[0].TERM_GCD);
						$("#CHASU_NO").val(data[0].CHASU_NO);
						//$("#STDT_NO").val(scwin.loginUser.userId);
	
						// 신청기간 체크
						fn_schdChk();
					}
				}else{
					alert2("신청서 작성기간이 아닙니다.",function (e){selectMenu("000000000000204");});
				}
			}
		});
	}

	/***************************************************************************
	 * 학생교류 신청기간 조회
	 **************************************************************************/
	function fn_schdChk(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/exchgfee/searchSchdChk",
			reqData : data,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data)) {
					$("#submitDate").text(data.SUBMIT_DATE);
					fn_SchStdtInfo();
				}
			}
		});
	}

	/***************************************************************************
	 * 해외파견 자비 신청자정보 조회
	 **************************************************************************/
	function fn_SchStdtInfo(data) {

		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/ownexpense/selectStdtInfo",
			reqData : data,
			success : function(data, responseData) {

				/* 데이터가 없으면 */
				if (gfn_com_isEmptyObject(data)) {
					alert2("신청지원대상이 아닙니다. ",function (e){selectMenu("000000000000204");});
					return;
				} else {
					if (data[0].APPLY_CANCEL_FG == "Y") { // 신청취소여부가 있으면
						alert("신청 취소한 기록이 있습니다. 이전 자료를 불러오겠습니다.");
					} else if (data[0].APPLY_CANCEL_FG == "N") {
					} else {
						$("#btnCancel").hide();
					}
					
					if (data[0].LANG_GCD != null) {
						$("#LANGUAGE_GCD").val(data[0].LANG_GCD);
						$("#LANG_GCD").val(data[0].LANG_GCD);
					}
					if (data[0].APPLY_1_EXUNIV_CD != null) {
						$("#APPLY_1_EXUNIV_CODE").val(
								data[0].APPLY_1_EXUNIV_CD);
						$("#APPLY_1_EXUNIV_CD").val(
								data[0].APPLY_1_EXUNIV_CD);
					}
					if (data[0].APPLY_1_EXUNIV_ETC_NM != null) {
						$("#APPLY_1_EXUNIV_ETC_NAME").val(
								data[0].APPLY_1_EXUNIV_ETC_NM);
					}

					//$("input:radio[name=EXGROUP]:checked").val(data[0].HYUHAK_EXCHG_FG);
					if (data[0].DISPATCH_SUPPOSE_PERIOD_GCD != null) {
						var chk1 = data[0].DISPATCH_SUPPOSE_PERIOD_GCD;
						$(
								'input:radio[name=PGROUP]:input[value='
										+ chk1 + ']').attr("checked", true);

					}
					if (data[0].HYUHAK_EXCHG_FG != null) {
						var chk2 = data[0].HYUHAK_EXCHG_FG;
						$(
								'input:radio[name=EXGROUP]:input[value='
										+ chk2 + ']').attr("checked", true);
					}
					
					// 신청자 정보 프로시저에서 받아온 값들을 저장(지원가능대학 list 조회)
					$("#DEG_COURSE_GCD").val(data[0].DEG_COURSE_GCD);
					$("#CMPL_TERM_CNT").val(data[0].CMPL_TERM_CNT);
					// /END 신청자 정보 프로시저에서 받아온 값들을 저장(지원가능대학 list 조회)

					$("#STDT_NUM").text(data[0].STDT_NO);
					$("#STDT_KOR_NM").text(data[0].STDT_KOR_NM);
					$("#COLL_CD").text(data[0].COLL_CD);
					$("#DEPT_CD").text(data[0].DEPT_CD);

					$("#GENDER_GCD").text(data[0].GENDER_GCD);
					
					$("#BIRTH_DATE").text(data[0].BIRTH_DATE);

					$("#STDT_EMAIL").val(data[0].STDT_EMAIL);

					$("#CMPL_TERM_COUNT").text(data[0].CMPL_TERM_CNT);
					$("#RANK").text(data[0].RANK);
					$("#CRITERIA_INWON").text(data[0].CRITERIA_INWON);
					$("#HJ_STA_GCD").text(data[0].HJ_STA_GCD);
					$("#EXUNIV_CMPL_TERM_CNT").text(
							data[0].EXUNIV_CMPL_TERM_CNT);
					$("#EXUNIV_CMPL_TERM_PO_CNT").text(
							data[0].EXUNIV_CMPL_TERM_PO_CNT);
					
					// 휴대전화
					$("#STDT_CELLULAR_NO").telEditor({
			        	txtVal : data[0].STDT_CELLULAR_NO,
			        	originVal : "0000|",
			        	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
			        	telnoNm : "휴대폰번호",
			            callbackFunc : function(e){
			            },
						dataBound : function(e) {
			            }
			        });
					
					// 비상연락처
					$("#EMGCY_TEL_NO").telEditor({
			        	txtVal : data[0].EMGCY_TEL_NO,
			        	originVal : "0000|",
			        	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
			        	telnoNm : "휴대폰번호",
			            callbackFunc : function(e){
			            },
						dataBound : function(e) {
			            }
			        });

					// 지원희망외국어 list
					fn_foreign();
					// 지원가능대학 list
					fn_SchUnivList();
				}

			}
		});

	}
	/***************************************************************************
	 * 지원희망외국어
	 **************************************************************************/
	function fn_foreign() {

		if ($("#LANG_GCD").val() != null) {
			defValLang = $("#LANG_GCD").val();
		}

		gfn_com_DropDownLists([ {
			elements : $("#LANGUAGE_GCD"), // 지원언어
			commonCode : "0001_FOREIGN_LANGUAGE_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : defValLang,
			expnCondition : "",
			hakbuGradFg : false,
			dataBound : function(e) {
			}
		} ]);

	}

	/***************************************************************************
	 * 해외파견 지원가능대학목록 조회
	 **************************************************************************/
	function fn_SchUnivList(data) {

		$("#LANG_GCD").val($("#LANGUAGE_GCD").val());

		if ($("#APPLY_1_EXUNIV_CD").val() != null) {
			defValUniv = $("#APPLY_1_EXUNIV_CD").val();
		}

		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/ownexpense/selectUnivList",
			reqData : data,
			success : function(data, responseData) {
				$("#APPLY_1_EXUNIV_CODE").dropDownList({
					dataSource : data,
					dataTextField : "EXUNIV_NM",
					dataValueField : "EXUNIV_CD",
					optionLabel : "",
					optionValue : "",
					defaultValue : defValUniv,
					expnCondition : "",
					dataBound : function(e) {

					}
				});

			}
		});

	}

	/***************************************************************************
	 * [입력] 전 필수입력 확인
	 **************************************************************************/
	function fn_validate(param) {
		var rtnValue = true;

		rtnValue = gfn_val_validateDataMap(param, [ {
			"id" : "STDT_CELLULAR_NO",
			"name" : "휴대전화",
			"notNull" : true,
		}, {
			"id" : "EMGCY_TEL_NO",
			"name" : "비상연락처",
			"notNull" : true
		}, {
			"id" : "STDT_EMAIL",
			"name" : "이메일",
			"notNull" : true
		}, {
			"id" : "LANGUAGE_GCD",
			"name" : "지원희망외국어",
			"notNull" : true
		}, {
			"id" : "DISPATCH_SUPPOSE_PERIOD_GCD",
			"name" : "파견예정 기간",
			"notNull" : true
		}, {
			"id" : "HYUHAK_EXCHG_FG",
			"name" : "파견중 휴학여부",
			"notNull" : true
		}, {
			"id" : "APPLY_1_EXUNIV_CODE",
			"name" : "파견대학",
			"notNull" : true
		}, ]);

		if (!rtnValue) {
			return rtnValue;
		}

		return rtnValue;
	}

	function fn_validateUniv() {

		var UnivCd = $("#APPLY_1_EXUNIV_CODE").val();
		var UnivNm = $("#APPLY_1_EXUNIV_ETC_NAME").val();

		// 대학코드
		if (UnivCd == "999") {
			if (UnivNm == "") {
				alert("대학명을 입력하지 않았습니다. 확인후 다시 입력해 주세요.");
				return false;
			}
		} else if (UnivCd != "999" && UnivNm != "") {
			alert("대학명을 입력할 경우 대학을 '항목에 없음'으로 선택하고 입력이 가능합니다. 확인후 다시 입력해주세요.");
			return false;
		}

		return true;
	}

	/***************************************************************************
	 * [입력]
	 **************************************************************************/
	function fn_Write(data) {

		$("#STDT_CELLULAR_NO").val($("#STDT_CELLULAR_NO").val());
		$("#EMGCY_TEL_NO").val($("#EMGCY_TEL_NO").val());
		$("#STDT_EMAIL").val($("#STDT_EMAIL").val());
		$("#LANG_GCD").val($("#LANGUAGE_GCD").val());
		$("#APPLY_1_EXUNIV_CD").val($("#APPLY_1_EXUNIV_CODE").val());
		$("#APPLY_1_EXUNIV_ETC_NM").val($("#APPLY_1_EXUNIV_ETC_NAME").val());
		$("#DISPATCH_SUPPOSE_PERIOD_GCD").val(
				$("input:radio[name=PGROUP]:checked").val());
		$("#HYUHAK_EXCHG_FG").val($("input:radio[name=EXGROUP]:checked").val());

		/* class="search-box"인 곳의 데이터 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".item-box"));
		}

		// 필수입력 조건 확인
		if (!fn_validate(data)) {
			return false;
		}
		if (!fn_validateUniv()) {
			return false;
		}
		
		if($("#EXUNIV_CMPL_TERM_CNT").text() >= 12){
			confirm("타대이수학점이 12점이 이상입니다. 신청하시겠습니까?", function(_flag) {
				if (_flag) {
					// 개인정보동의팝업
					fn_clause();
				}
			});
		}else{
			// 개인정보동의팝업
			confirm(gva_SAVE_CONFIRM_MSG, function(_flag) {
				if (_flag) {
					fn_clause();
				}
			});
		}

	}
	
	var agreeDltInfo = [];
	/***************************************************************************
	 * 개인정보동의 팝업
	 **************************************************************************/
	function fn_clause() {
		param = gfn_com_inputdata($(".item-box"));
		
		gfn_com_clausePop({
			title : '정보동의팝업',
			systemGcd : '0002',
			clauseSeqNo : 31,
			params : {
				agree_title : "자비"
			},
			callbackFunc : function(data){
				/* 필수동의 사항에 동의한 경우 콜백 실행 */
				agreeDltInfo = data;
				fn_applySaveCallback();
			}
		});
	}
	
	/***************************************************************************
	 * 교환/교비 신청 Callback
	 **************************************************************************/
	function fn_applySaveCallback() {
   			/* class="search-box"인 곳의 데이터 */
  			data = gfn_com_inputdata($(".item-box"));
   			
   			data["agreeDltInfo"] = agreeDltInfo;
   			
			gfn_ajax_request({
				url : "/ost/sep/overseasdispatch/ownexpense/saveOwnExpense",
				reqData : data,
				success : function(data, responseData) {
					alert("신청되었습니다. ",function (e){location.reload();});
				}
			});
	}

	/***************************************************************************
	 * [신청취소]
	 **************************************************************************/
	function fn_Cancel(data) {

		/* class="search-box"인 곳의 데이터 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		/* ajax처리 */
		confirm(
				"신청취소하시겠습니까?",
				function(_flag) {
					if (_flag) {
						gfn_ajax_request({
							url : "/ost/sep/overseasdispatch/ownexpense/saveCancelOwnExpense",
							reqData : data,
							success : function(data, responseData) {
								alert2("신청취소되었습니다. ",function (e){selectMenu("000000000000204");});
								return;
							}
						});
					}
				});

	}
</script>





