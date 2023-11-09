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
			<div class="apply-info">
				<div class="search-box">
					<input type="text" id="SYEAR" class="form-control" style="display: none;" /> <input type="text" id="TERM_GCD" class="form-control" style="display: none;" /> <input type="text" id="CHASU_NO" class="form-control" style="display: none;" /> <input type="text" id="EXCHG_GCD" class="form-control" style="display: none;" /> <input type="text" id="EXCHG_DETAIL_GCD" class="form-control" style="display: none;" /> <input type="text" id="STDT_NO" class="form-control" style="display: none;" /> <input type="text" id="DEG_COURSE_GCD" class="form-control" style="display: none;" /> <input type="text" id="CMPL_TERM_CNT" class="form-control" style="display: none;" /> 
				</div>
				<!-- 지원서 -->
				<div class="sec-body ">
					<!-- 메시지 박스 -->
					<div class="message-box">
						<div class="message-box-inner">
							<div class="message-body">
								<ul class="list list-style-1">
									<li><span class="dfn" data-lang>지원기간 : <label class="text-primary" id="schdDate"></label>
									</span></li>
									<li><span class="dfn" data-lang>지원서류제출기간 : <label class="text-primary" id="submitDate"></label>
									</span></li>
									<li><span class="dfn" data-lang>지원서류 제출장소 : 소속 단과대학 행정실</span></li>
									<li><span class="dfn" data-lang>문의 : outbound@pusan.ac.kr</span></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /END 메시지 박스 -->

					<!-- 개인정보 영역 -->
					<section class="sec-2">
						<header id="title">
							<h4 class="sec-title" id="title">개인정보(*필수항목)</h4>
						</header>
						<div class="sec-body">
							<div class="b-table-box flex-col-2" role="table" aria-label="개인정보">
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>이름</label>
										</div>
										<div class="b-con-box" role="cell">
											<div id="STDT_KOR_NM"></div>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>학번</label>
										</div>
										<div class="b-con-box" role="cell">
											<div id="STDT_NUM"></div>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>소속대학</label>
										</div>
										<div class="b-con-box" role="cell">
											<div id="COLL_CD"></div>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>소속학과</label>
										</div>
										<div class="b-con-box" role="cell">
											<div id="DEPT_CD"></div>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>성별</label>
										</div>
										<div class="b-con-box" role="cell">
											<div id="GENDER_GCD"></div>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>생년월일</label>
										</div>
										<div class="b-con-box" role="cell">
											<div id="BIRTH_DATE"></div>
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
											<div class="text-primary" data-lang>* 중요한 공지사항을 누락하는 일이 없도록, 이메일, 휴대폰번호는 최신으로 업데이트해주시기 바랍니다.</div>
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
											<label data-lang>타대이수<br>가능학점
											</label>
										</div>
										<div class="b-con-box">
											<div id="EXUNIV_CMPL_TERM_PO_CNT"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- /END 개인정보 영역 -->
					<!-- 해외파견 프로그램 참가경험 테이블 START  -->
					<section class="sec-2">
						<header id="title">
							<h4 class="sec-title" id="title">해외파견 프로그램 참가경험</h4>
						</header>
						<div class="sec-body">
					<div class="b-table-box flex-col-1" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-con-box " role="cell">
									<ul class="list list-style-1">
										<li><span class="dfn" data-lang> 우리 대학(국제협력실) 주관 학점인정 프로그램에 한함. (예) 어학연수, 계절학기, 교환학생, 학과단위사업 </span><br>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="RGROUP" id="R1" value="Y" disabled=true checked> <label class="form-check-label" for="R1">Y</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="RGROUP" id="R2" value="N" disabled=true> <label class="form-check-label" for="R2">N</label>
											</div></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					</div>
					</section>
					<!-- 해외파견 프로그램 참가경험 테이블 END  -->
					<!-- 해외파견 프로그램 참가내역 테이블 START  -->
					<section class="sec-2">
						<header id="title">
							<h4 class="sec-title" id="title">해외파견 프로그램 참가내역</h4>
						</header>
						<div class="sec-body">
					<div class="table-box" id=grid01>
						<div class="table-body">
							<table class="table" data-toggle="table">
								<caption>해외파견 프로그램 참가내역</caption>
								<colgroup>
									<col style="min-width: 150px;">
									<col style="min-width: 100px;">
									<col style="min-width: 250px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">파견대학명</th>
										<th scope="col">교류기간</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id="resultTbody">
								</tbody>
							</table>
						</div>
					</div>
					</div>
					</section>
					<!-- /END 테이블 -->
					<!-- 해외파견 프로그램 참가경험 테이블 END  -->
					<!--정보 입력 테이블 START  -->
					<section class="sec-2">
						<header id="title">
							<h4 class="sec-title" id="title">정보입력(*필수항목)</h4>
						</header>
						<div class="sec-body">
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="LANG_GCD" data-lang>지원언어</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="LANG_GCD" class="form-control" auto-bind="OFFICIAL_FOREIGN_LANGUAGE_GCD" onchange ="fn_onchange()"></select>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="OFFICIAL_FOREIGN_LANGUAGE_GCD" data-lang>공인외국어점수</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="OFFICIAL_FOREIGN_LANGUAGE_GCD" class="form-control"></select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="ACQ_OFFICIAL_FOREIGN_LANGUAGE_SCORE" data-lang>점수</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="number" id="ACQ_OFFICIAL_FOREIGN_LANGUAGE_SCORE" class="form-control" value="0" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="ACQ_OFFICIAL_FOREIGN_LANGUAGE_GRADE_GCD" data-lang>등급</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="ACQ_OFFICIAL_FOREIGN_LANGUAGE_GRADE_GCD" class="form-control"></select>
								</div>
							</div>
						</div>
						<ul class="list list-style-1">
							<li><span class="dfn" data-lang> 점수는 숫자만 입력하세요 (예 : 900, 6.5) </span></li>
							<li><span class="dfn" data-lang> 영어는 점수만 기재하고, 나머지는 급수와 점수 모두 입력하세요. </span></li>
						</ul>
					</div>
					</div>
					</section>
					<!-- 정보입력 END-->

					<!--희망지원대학 테이블 START  -->
					<section class="sec-2">
						<header id="title">
							<h4 class="sec-title" id="title">희망지원대학</h4>
						</header>
						<div class="sec-body">
					<div class="b-table-box flex-col-2" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="APPLY_1_EXUNIV_CD" data-lang>1지망</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="APPLY_1_EXUNIV_CD" class="form-control" auto-bind="OFFICIAL_FOREIGN_LANGUAGE_GCD"></select>
								</div>
							</div>
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="DISPATCH_APPLY_GCD" data-lang>지원구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="DISPATCH_APPLY_GCD" class="form-control" auto-bind="OFFICIAL_FOREIGN_LANGUAGE_GCD"></select>
								</div>
							</div>
						</div>
					</div>
					</div>
					</section>
					<!-- 희망지원대학 END-->
					<!-- 여권정보 START  -->
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">
						<div class="b-row-box " role="row">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label for="P1" data-lang>여권소지여부</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="PASSGROUP" id="P1" value="Y" checked> <label class="form-check-label" for="P1">Y</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="PASSGROUP" id="P2" value="N"> <label class="form-check-label" for="P2">N</label>
									</div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="PASSPORT_ENG_NM" data-lang>영문이름(여권)</label>
								</div>
								<div class="b-con-box" role="cell">
									<input class="form-control" type="text" id="PASSPORT_ENG_NM">
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="PASSPORT_NO" data-lang>여권번호</label>
								</div>
								<div class="b-con-box" role="cell">
									<input class="form-control" type="text" id="PASSPORT_NO">
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="PASSPORT_EXPIRE_DATE" data-lang>여권만료일</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="PASSPORT_EXPIRE_DATE" name="PASSPORT_EXPIRE_DATE" class="form-control datepicker" />
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label for="PASSPORT_ISSUE_SUPPOSE_DATE" data-lang>여권발급예정일</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="PASSPORT_ISSUE_SUPPOSE_DATE" name="PASSPORT_ISSUE_SUPPOSE_DATE" class="form-control datepicker" />
								</div>
							</div>
						</div>
						<ul class="list list-style-1">
							<li data-lang><span class="text-primary"> 영문이름은 아래의 안내사항에 따라 기재하여 주세요. </span><br/>
                                <span class="text-primary"> - 여권에 나와있는 순서대로, 띄어쓰기 동일하게 작성 </span><br/>
                                <span class="text-primary"> - 전체 대문자로, 성과 이름 사이 '/ (빗금)' 을 사용하여 구분  ex) KIM/YUNA, LEE/JUN SU </span>
                            </li>
                            <li data-lang><span class="text-primary"> 여권이 만료되거나 미소지한 경우 발급예정일을 작성해주세요. </span></li>
						</ul>
					</div>
					<!-- 여권정보 END  -->

					<!-- 입력 버튼 -->
					<div class="text-center">
						<div class="form-group">
							<button id = "ins_btn" class="btn btn-primary btn-lg" type="button" onclick="javascript:return fn_Write();" data-lang>입력</button>
							<button id = "del_btn" class="btn btn-primary btn-lg" type="button" onclick="javascript:return fn_Cancel();" data-lang>신청취소</button>
						</div>
					</div>
					<!-- 입력 버튼 -->
				</div>
			</div>
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td class="text-left">#:EXUNIV_KOR_NM#</td> //파견대학명
		<td>#:EXCHG_SYEAR_TERM_GCD#</td> //교류기간
		<td>#:REMARK#</td> //비고
	</tr>
</script>
<script type="text/javascript">
	/***************************************************************************
	 * 변수
	 **************************************************************************/
	/* 유저 정보 */

	var totalCnt = 0;

	// 학번(유저아이디)
	var stdtNo = scwin.loginUser.userId;

	// 유저 아이피
	var userIp = scwin.loginUser.userIp
	var termGcdNm;
	var stdtYear = scwin.loginUser.stdtYearGcd;
	var nm = scwin.loginUser.nm;

	var langGcd = scwin.loginUser.langGcd;
	var degCourseGcd = scwin.loginUser.degCourseGcd;
	var cmplTermCnt = scwin.loginUser.cmplTermCnt;
	var exchgGcd = "0001";
	var exchgDetailGcd = "0004";
	/*/END 유저 정보 */
	
    var _goUrl = "/page?menuCD=000000000000204" //해외파견 안내페이지로 이동


	/***************************************************************************
	 *onpageload
	 **************************************************************************/
	function fn_initScreen() {

		fn_schdSyearTerm();

		gfn_com_DropDownLists([ {
			elements : $("#LANG_GCD"), // 지원언어
			commonCode : "0001_FOREIGN_LANGUAGE_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			hakbuGradFg : false,
			dataBound : function(e) {
			}
		} ]);

		gfn_com_DropDownLists([ {
			elements : $("#OFFICIAL_FOREIGN_LANGUAGE_GCD"), //외국어
			commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "0001",
			expnCondition : "",
			hakbuGradFg : false,
			dataBound : function(e) {
			}
		} ]);

		gfn_com_DropDownLists([ {
			elements : $("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_GRADE_GCD"), //외국어 등급
			commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GRADE_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			hakbuGradFg : false,
			dataBound : function(e) {
			}
		} ]);

		gfn_com_DropDownLists([ {
			elements : $("#DISPATCH_APPLY_GCD"), // 지원구분
			commonCode : "0001_DISPATCH_APPLY_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "",
			hakbuGradFg : false,
			dataBound : function(e) {
			}
		} ]);

		$("#PASSPORT_ISSUE_SUPPOSE_DATE").attr("disabled", true);

		$("#STDT_CELLULAR_NO").telEditor({
        	txtVal : "",
        	//originVal : "0000|1234567890",
        	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
        	telnoNm : "휴대폰번호",
            callbackFunc : function(e){

            },
			dataBound : function(e) {

            }
        });
		
		$("#STDT_EMAIL").emailEditor({
        	
            callbackFunc : function(e){

            },
			dataBound : function(e) {

            }
        });
		
		$("#EMGCY_TEL_NO").telEditor({
        	txtVal : "",
        	//originVal : "0000|1234567890",
        	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
        	telnoNm : "휴대폰번호",
            callbackFunc : function(e){

            },
			dataBound : function(e) {

            }
        });
		agreeDltInfo = [];
	}
	/***************************************************************************
	 * 여권정보 라디오버튼 onchange
	 **************************************************************************/
	$('input[type=radio][name=PASSGROUP]').change(function() {

		if (this.value == 'Y') {
			$("#PASSPORT_ENG_NM").attr("disabled", false);
			$("#PASSPORT_NO").attr("disabled", false);
			$("#PASSPORT_EXPIRE_DATE").attr("disabled", false);
			$("#PASSPORT_ISSUE_SUPPOSE_DATE").attr("disabled", true);
		} else {
			$("#PASSPORT_ENG_NM").attr("disabled", true);
			$("#PASSPORT_NO").attr("disabled", true);
			$("#PASSPORT_EXPIRE_DATE").attr("disabled", true);
			$("#PASSPORT_ISSUE_SUPPOSE_DATE").attr("disabled", false);
		}

	});
	/***************************************************************************
	 * 여권정보 라디오버튼 onchange
	 **************************************************************************/
	$("#LANG_GCD").change(function() {
		fn_SchUnivList();
	});

	/***************************************************************************
	 * 해외파견 지원가능대학목록 조회
	 **************************************************************************/
	function fn_SchUnivList(nm) {

		var data = gfn_com_inputdata($(".apply-info"));
		data.DEG_COURSE_GCD = degCourseGcd;
		data.CMPL_TERM_CNT = cmplTermCnt;
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/shorttermdispatch/selectUnivList",
			reqData : data,
			success : function(data, responseData) {
				$("#APPLY_1_EXUNIV_CD").dropDownList({
					dataSource : data,
					dataTextField : "EXUNIV_NM",
					dataValueField : "EXUNIV_CD",
					optionLabel : "선택",
					optionValue : "",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {

					}
				});
				$("#APPLY_1_EXUNIV_CD").val(nm); // 1지망 대학
			}
		});
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
					// 계절학기
					var termData = "";
					for(var i=0; i<data.length; i++){
						if(data[i].TERM_GCD == "0011" || data[i].TERM_GCD == "0021"){
							termData = data[i];
							break;
						}
					}
					if(termData == ""){
						alert2("신청서 작성기간이 아닙니다.",function (e){selectMenu("000000000000204");});
					}else{
						if (termData.FG == "N") {
							alert2("신청서 작성기간이 아닙니다.<br/> " + termData.SCHD,function (e){selectMenu("000000000000204");});
							return;
						} else {
							$("#titleHeader").text(
									termData.SYEAR + "학년도 " + termData.TERM_GCD_NM
											+ " 해외교환 단기파견 지원서");
							$("#schdDate").text(termData.SCHD);
							$("#SYEAR").val(termData.SYEAR);
							$("#TERM_GCD").val(termData.TERM_GCD);
							$("#CHASU_NO").val(termData.CHASU_NO);
							termGcdNm = termData.TERM_GCD_NM;
							// 신청기간 체크
							fn_schdChk();
						}
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
				$("#submitDate").text(data.SUBMIT_DATE);
				fn_SchStdtInfo();
			}
		});
	}

	/***************************************************************************
	 * 해외파견 프로그램 참가내역 조회
	 **************************************************************************/
	function fn_program(data) {

		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/shorttermdispatch/selectProgram",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody").listView({
					dataSource : data,
					emptyCommment : '파견프로그램 내역이 존재하지 않습니다',
					dataBound : function(e) {
						currentData = data[0];

					},
					template : $("#resultTemplate"),
					totalCnt : data.length

				});
				if (data.length == 0)
					$('input[type=radio][id=R2]').attr('checked', true);
				else
					$('input[type=radio][id=R1]').attr('checked', true);
			}
		});
	}

	/***************************************************************************
	 * 해외파견 단기파견 신청자정보 조회
	 **************************************************************************/
	function fn_SchStdtInfo(data) {

		//$("#STDT_NO").val(stdtNo);

		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/shorttermdispatch/selectStdtInfo",
			reqData : data,
			success : function(data, responseData) {

				/* 데이터가 없으면 */
				if (gfn_com_isEmptyObject(data)) {
					alert2("신청지원대상이 아닙니다. ",function (e){selectMenu("000000000000204");});
					$('#ins_btn').show();
					$('#del_btn').hide();
					return false;

				} else {
					if (data[0].APPLY_CANCEL_FG == "Y"){ // 신청취소여부가 있으면
						alert("신청 취소한 기록이 있습니다. 이전 자료를 불러오겠습니다.");
						$('#ins_btn').show();
						$('#del_btn').hide();
					}
					else if(data[0].APPLY_CANCEL_FG == "N"){
						$('#ins_btn').hide();
						$('#del_btn').show();
					}
				}

				//신청 정보 세팅
				// 신청자 정보 프로시저에서 받아온 값들을 저장(지원가능대학 list 조회)	       	   		       	   
				$("#STDT_NUM").text(stdtNo);
				$("#STDT_KOR_NM").text(data[0].STDT_KOR_NM);
				$("#COLL_CD").text(data[0].COLL_CD);
				$("#DEPT_CD").text(data[0].DEPT_CD);
				$("#GENDER_GCD").text(data[0].GENDER_GCD);
				$("#BIRTH_DATE").text(data[0].BIRTH_DATE);
				$("#DEG_COURSE_GCD").val(data[0].DEG_COURSE_GCD);
				$("#CMPL_TERM_CNT").val(data[0].CMPL_TERM_CNT);

				if (data[0].STDT_CELLULAR_NO != null) {

					$("#STDT_CELLULAR_NO").val(data[0].STDT_CELLULAR_NO);

				}

				if (data[0].EMGCY_TEL_NO != null) {
					$("#EMGCY_TEL_NO").val(data[0].EMGCY_TEL_NO);
				}

				$("#STDT_EMAIL").val(data[0].STDT_EMAIL);
				$("#CMPL_TERM_COUNT").text(data[0].CMPL_TERM_CNT);
				$("#RANK").text(data[0].RANK);
				$("#CRITERIA_INWON").text(data[0].CRITERIA_INWON);
				$("#HJ_STA_GCD").text(data[0].HJ_STA_GCD);
				$("#EXUNIV_CMPL_TERM_CNT").text(data[0].EXUNIV_CMPL_TERM_CNT);
				$("#EXUNIV_CMPL_TERM_PO_CNT").text(
						data[0].EXUNIV_CMPL_TERM_PO_CNT);

				//$("#APPLY_1_EXUNIV_CD").val(data[0].APPLY_1_EXUNIV_CD);
				$("#DISPATCH_APPLY_GCD").val(data[0].DISPATCH_APPLY_GCD);
				
				let value = "";
				if(data[0].OFFICIAL_FOREIGN_LANGUAGE_GCD != null){
					value = data[0].OFFICIAL_FOREIGN_LANGUAGE_GCD;
				}
				
				gfn_com_DropDownLists([ {
					elements : $("#OFFICIAL_FOREIGN_LANGUAGE_GCD"), 
					commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
					dataTextField : "COMMON_DETAIL_CD_KOR_NM",
					dataValueField : "COMMON_DETAIL_CD",
					optionLabel : "선택",
					optionValue : "",
					defaultValue : ""+value+"",
					expnCondition : "AND (CHAR_1_CONTENT = '"+data[0].LANG_GCD+"' OR CHAR_1_CONTENT LIKE'%ALL%')",
					hakbuGradFg : false,
					dataBound : function(e) {
					}
				} ]);
				
							
				$("#LANG_GCD").val(data[0].LANG_GCD);
				$("#OFFICIAL_FOREIGN_LANGUAGE_GCD").val(
						data[0].OFFICIAL_FOREIGN_LANGUAGE_GCD);
				$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_SCORE").val(
						data[0].ACQ_OFFICIAL_FOREIGN_LANGUAGE_SCORE);
				$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_GRADE_GCD").val(
						data[0].ACQ_OFFICIAL_FOREIGN_LANGUAGE_GRADE_GCD);

				if (data[0].PASSPORT_YN == "Y") {
					$('input[type=radio][id=P1]').attr('checked', true);
					$("#PASSPORT_ENG_NM").val(data[0].PASSPORT_ENG_NM);
					$("#PASSPORT_NO").val(data[0].PASSPORT_NO);
					$("#PASSPORT_EXPIRE_DATE")
							.val(data[0].PASSPORT_EXPIRE_DATE);
				} else {
					$('input[type=radio][id=P2]').attr('checked', true);
					$("#PASSPORT_ISSUE_SUPPOSE_DATE").val(
							data[0].PASSPORT_ISSUE_SUPPOSE_DATE);
					$("#PASSPORT_ENG_NM").attr("disabled", true);
					$("#PASSPORT_NO").attr("disabled", true);
					$("#PASSPORT_EXPIRE_DATE").attr("disabled", true);
					$("#PASSPORT_ISSUE_SUPPOSE_DATE").attr("disabled", false);
				}

				// 지원가능대학 list
				fn_SchUnivList(data[0].APPLY_1_EXUNIV_CD);
				//해외파견프로그램참가내역 List
				fn_program();
			}
		});

	}

	/***************************************************************************
	 * [입력] 전 필수입력 확인
	 **************************************************************************/
	function fn_validate(param) {
		var radio = $(':radio[name="PASSGROUP"]:checked').val();
		var rtnValue = true;
		var valInfo1 = [ { //여권 Y
			"id" : "STDT_CELLULAR_NO",
			"name" : "휴대전화",
			"notNull" : true,
		}, {
			"id" : "STDT_EMAIL",
			"name" : "이메일",
			"notNull" : true
		}, {
			"id" : "EMGCY_TEL_NO",
			"name" : "비상연락처",
			"notNull" : true
		}, {
			"id" : "LANG_GCD",
			"name" : "지원희망외국어",
			"notNull" : true
		}, {
			"id" : "APPLY_1_EXUNIV_CD",
			"name" : "희망지원대학",
			"notNull" : true
		}, {
			"id" : "OFFICIAL_FOREIGN_LANGUAGE_GCD",
			"name" : "공인외국어 성적",
			"notNull" : true
		}, {
			"id" : "ACQ_OFFICIAL_FOREIGN_LANGUAGE_SCORE",
			"name" : "공인외국어 성적 점수",
			"notNull" : true
		}, {
			"id" : "DISPATCH_APPLY_GCD",
			"name" : "지원구분",
			"notNull" : true
		}, {
			"id" : "PASSPORT_ENG_NM",
			"name" : "영문이름(여권)",
			"notNull" : true
		}, {
			"id" : "PASSPORT_NO",
			"name" : "여권번호",
			"notNull" : true
		}, {
			"id" : "PASSPORT_EXPIRE_DATE",
			"name" : "여권만료일",
			"notNull" : true
		} ];

		var valInfo2 = [ { //여권 N
			"id" : "STDT_CELLULAR_NO",
			"name" : "휴대전화",
			"notNull" : true,
		}, {
			"id" : "STDT_EMAIL",
			"name" : "이메일",
			"notNull" : true
		}, {
			"id" : "EMGCY_TEL_NO",
			"name" : "비상연락처",
			"notNull" : true
		}, {
			"id" : "LANG_GCD",
			"name" : "지원희망외국어",
			"notNull" : true
		}, {
			"id" : "OFFICIAL_FOREIGN_LANGUAGE_GCD",
			"name" : "공인외국어 성적",
			"notNull" : true
		}, {
			"id" : "ACQ_OFFICIAL_FOREIGN_LANGUAGE_SCORE",
			"name" : "공인외국어 성적 점수",
			"notNull" : true
		}, {
			"id" : "APPLY_1_EXUNIV_CD",
			"name" : "희망지원대학",
			"notNull" : true
		}, {
			"id" : "DISPATCH_APPLY_GCD",
			"name" : "지원구분",
			"notNull" : true
		}, {
			"id" : "PASSPORT_ISSUE_SUPPOSE_DATE",
			"name" : "여권발급예정일",
			"notNull" : true
		} ]

		if (radio == "Y") {
			rtnValue = gfn_val_validateDataMap(param, valInfo1);
		} else {
			rtnValue = gfn_val_validateDataMap(param, valInfo2);
		}

		if (!rtnValue) {
			return rtnValue;
		}
		return rtnValue;
	}

	/***************************************************************************
	 * [입력]
	 **************************************************************************/
	function fn_Write() {

		/* class="apply-info"인 곳의 데이터 */
		var param = gfn_com_inputdata($(".apply-info"));
		param.STDT_CELLULAR_NO = $("#STDT_CELLULAR_NO").val();
		param.EMGCY_TEL_NO = $("#EMGCY_TEL_NO").val();

		// 필수입력 조건 확인
		if (!fn_validate(param)) {
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
		param = gfn_com_inputdata($(".search-box"));
		
		gfn_com_clausePop({
			title : '정보동의팝업',
			systemGcd : '0002',
			clauseSeqNo : 31,
			params : {
				agree_title : "단기파견"
			},
			callbackFunc : function(data){
				/* 필수동의 사항에 동의한 경우 콜백 실행 */
				agreeDltInfo = data;
				fn_applySaveCallback();// 저장함수 넣기
			}
		});
	}
	
	/***************************************************************************
	 * 단기파견 신청 Callback
	 **************************************************************************/
	function fn_applySaveCallback() {
   			/* class="apply-info"인 곳의 데이터 */
   			var param = gfn_com_inputdata($(".apply-info"));
   			param.STDT_CELLULAR_NO = $("#STDT_CELLULAR_NO").val();
   			param.EMGCY_TEL_NO = $("#EMGCY_TEL_NO").val();
   			
   			param["agreeDltInfo"] = agreeDltInfo;
    			
  				gfn_ajax_request({
  					url : "/ost/sep/overseasdispatch/shorttermdispatch/saveShortTermDispatch",
  					reqData : param,
  					success : function(data, responseData) {
  						alert('신청되었습니다.', function() {
  							location.reload()
  						});

  					}
  				});
	}
	
	/***************************************************************************
	 * [신청취소] fn_Cancel()
	 **************************************************************************/
	function fn_Cancel() {
		var param = gfn_com_searchData($(".search-box"));

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/shorttermdispatch/saveCancelShortTermDispatch",
			reqData : param,
			success : function(data, responseData) {
				alert('신청취소되었습니다.', function() {
					location.reload()
				});
				//alert(param.SYEAR+"학년도 "+termGcdNm+ " 단기파견 지원이 신청 취소되었습니다.");

			}
		});
	}
	
	/***************************************************************************
	 * 필터
	 **************************************************************************/
	function fn_onchange(){
		if($("#LANG_GCD").val() == ""){
			gfn_com_DropDownLists([{          
					elements : $("#OFFICIAL_FOREIGN_LANGUAGE_GCD"),
		            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
		            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
		            dataValueField : "COMMON_DETAIL_CD",
		            optionLabel : "선택",
		            optionValue : "",
		            defaultValue : "", 
		            expnCondition : "AND CHAR_1_CONTENT = '"+$("#LANG_GCD").val()+"'",
		            hakbuGradFg : false,
		            dataBound : function(e) {}
		        }]);	
		}else{
		gfn_com_DropDownLists([{          
				elements : $("#OFFICIAL_FOREIGN_LANGUAGE_GCD"),
	            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
	            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
	            dataValueField : "COMMON_DETAIL_CD",
	            optionLabel : "선택",
	            optionValue : "",
	            defaultValue : "", 
	            expnCondition : "AND (CHAR_1_CONTENT = '"+$("#LANG_GCD").val()+"' OR CHAR_1_CONTENT LIKE'%ALL%')",
	            hakbuGradFg : false,
	            dataBound : function(e) {}
	        }]);		
		}
	}
</script>