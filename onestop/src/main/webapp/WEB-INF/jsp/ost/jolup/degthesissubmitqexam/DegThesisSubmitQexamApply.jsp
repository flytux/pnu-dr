<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
					<h2 class="sec-title"></h2>
				</div>
				<div class="header-item"></div>
			</header>
			<!-- /END CONTENT HEADER -->

			<!-- CONTENT BODY -->
			<div class="sec-body">
				<section class="sec-2">
					<header>
						<h4 class="sec-title">학적정보</h4>
					</header>
					<div class="sec-body">
						<div class="b-table-box flex-col-3" id="STDT_TABLE" role="table" aria-label="학적정보 테이블">
							<div class="b-row-box" role="row">
								<div class="b-row-item merge-3">
									<div class="b-title-box" role="rowheader">소속(과정)</div>
									<div class="b-con-box" role="cell" id="UPPER_ASSIGN_NM"></div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">학번(성명)</div>
									<div class="b-con-box" role="cell" id="NM"></div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">학년(학기)</div>
									<div class="b-con-box" role="cell" id="STDT_YEAR_GCD"></div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">학적상태</div>
									<div class="b-con-box" role="cell" id="HJ_STA_GCD_KOR_NM"></div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item merge-prev">
									<div class="b-title-box" role="rowheader">
										<label data-lang>과정</label>
									</div>
									<div class="b-con-box" role="cell" id="DEG_COURSE_NM"></div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label data-lang>취득학점</label>
									</div>
									<div class="b-con-box" role="cell" id="ACQ_CRDT"></div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label data-lang>수료일</label>
									</div>
									<div class="b-con-box" role="cell" id="SURYO_DT"></div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- 테이블 -->
				<section class="sec-2">
					<header>
						<h4 class="sec-title">전공과목(응시과목선택)</h4>
					</header>
					<div class="sec-body">
						

						<div class="sec-2">
							<div class="sec-body row">
								<!-- 응시대상과목 -->
								<div class="table-box col-6" id="grid01">
									<label class="text-left dfn" data-lang>응시대상과목
										<span class="info-text text-primary ml-3" data-lang>최대 6과목까지 응시 가능</span>
									</label>
									<div class="table-body">
										<table class="table table-hover" data-toggle="table" data-show-column="true" id="grid01"  >
											<caption>응시대상과목내역</caption>
											<colgroup>
												<col style="min-width: 80px;">
												<col style="min-width: 80px;">
												<col style="min-width: 120px;">
												<col style="min-width: 80px;">
												<col style="min-width: 80px;">
												<col style="min-width: 40px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">교과구분</th>
													<th scope="col">교과번호</th>
													<th scope="col">교과목명</th>
													<th scope="col">시험유형</th>
													<th scope="col">첨부파일</th>
													<th scope="col"></th>
												</tr>
											</thead>
											<tbody id="resultTbody"></tbody>
										</table>
									</div>
								</div>
								
								<div class="table-box col-6" id="grid02">
									<label class="text-left dfn" data-lang>전공과목 응시 신청과목</label>
									<div class="table-body">
										<table class="table" data-toggle="table" data-show-column="true" >
											<caption>전공과목 응시 신청과목내역</caption>
											<colgroup>
												<col style="min-width: 80px;">
												<col style="min-width: 80px;">
												<col style="min-width: 200px;">
												<col style="min-width: 80px;">
												<col style="min-width: 40px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">교과구분</th>
													<th scope="col">교과번호</th>
													<th scope="col">교과목명</th>
													<th scope="col">시험유형</th>
													<th scope="col">삭제</th>
												</tr>
											</thead>
											<tbody id="resultTbody2"></tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- END TABLE -->
				<!-- 버튼 -->
				<div class="btn-box">
					<div class="form-row btn-box-right">
							<div id="btn_cancel" class="col-auto">
									<button class="btn btn-primary cancel-btn" type="button" id="btnExamApply" style="display: none;" onclick="fn_applyDetail();" data-lang>전공과목신청</button>
									<button class="btn btn-danger cancel-btn" type="button" id="btnExamDelete" style="display: none;" onclick="fn_cancelDetail();" data-lang>전공과목삭제</button>
							</div>
					</div>
				</div>
				<!-- /END 버튼 -->
				<section class="sec-2">
					<header>
						<h4 class="sec-title">외국어과목(응시과목선택)</h4>
					</header>
					<div class="sec-body">

						<div class="b-table-box flex-col-1" role="table" aria-label="입력">
							<div class="b-row-box" role="row" id = "language1_gcd">
								<div class="b-row-item">
									<div class="b-title-box " role="rowheader">
										<label data-lang>제1외국어</label>
									</div>
									<div class="b-con-box" role="cell">
										<div class="custom-control custom-checkbox custom-control-inline">
											<input type="checkbox" class="custom-control-input" id="customCheck1" title="영어"> <label class="custom-control-label" for="customCheck1">영어</label>
										</div>
										<div class="custom-control custom-checkbox custom-control-inline">
											<input type="checkbox" class="custom-control-input" id="customCheck2" title="한국어"> <label class="custom-control-label" for="customCheck2">한국어</label>
										</div>
										<span class="info-text text-primary" data-lang>외국인 학생인 경우는, 영어대신 '한국어'를 선택할 수 있습니다.</span>
										<div style="width: 100%;">
											<span id="ENG_EXAM_APPLY_FG_LABEL" class="text-success pt-1">제1외국어(영어)를 신청하였습니다.</span>
											<span id="KOR_EXAM_APPLY_FG_LABEL" class="text-success pt-1">제1외국어(한국어)를 신청하였습니다.</span>
										</div>
									</div>
								</div>
								
							</div>
							<div class="b-row-box" role="row" id = "language2_gcd">
								<div class="b-row-item">
									<div class="b-title-box " role="rowheader">
										<label data-lang>제2외국어</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="SECOND_FORELANG_EXAM_GCD"  ></div>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row" id = "language1_gcd">
								<div class="b-row-item">
									<div class="b-title-box " role="rowheader">
										<label for="FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD" data-lang>제1외국어 신청자격</label>
									</div>
									<div class="b-con-box" role="cell">
										<select id="FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD" class="form-control" data-bind="value: FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD" title="제1외국어 신청자격"></select> 
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label data-lang>기타 안내사항</label>
									</div>
									<div class="b-con-box" role="cell">
										<ul class="list list-style-1">
											<li>이미 합격한 외국어과목은 재응시 할 수 없음</li>
											<li>외국인 학생에 한해 영어 대신 한국어 선택 가능</li>
											<li>제 2외국어는 시행학과 박사과정만 응시가능</li>
											<li>일반대학원이 아닌 응시자(교육대학원, 행정대학원 등)는 해당 대학원 행정실로 질의</li>
										</ul>
										<span class="info-text info-text-style-1 text-danger mt-3" data-lang>
											제1외국어시험(영어/한국어) 신청자는 증빙서류 반드시 업로드하여야 함
										</span>
										<ul class="list list-style-1">
											<li>공인(영어/한국어)성적취득자 : 성적파일</li>
											<li>대체강좌이수자 : 언어교육원의 대체강좌이수자 입력프로그램 연동</li>
											<li>영어권국가의 국적자 또는 선수학위취득자 : 여권 또는 선수학위졸업 관련 서류</li>
										</ul>
										<span class="text-primary ml-3" data-lang>
											(증빙서류 미비시 보완 요청할 수 있으며, 보완하지 않을 경우 취소 처리됨)
										</span>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row" id='fileupload'>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label data-lang>첨부파일</label>
									</div>
									<div class="b-con-box" role="cell">
										<div class="sec-body" id="uploader_target1"></div>
									</div>
								</div>
							</div>
							<div class="btn-box mt-4">
								<div class="form-row " style="justify-content: center;">
									<div class="col-auto">
										<input type="hidden" id="SYEAR" data-bind="value: SYEAR" />
										<input type="hidden" id="TERM_GCD" data-bind="value: TERM_GCD" />
										<input type="hidden" id="MONTH" data-bind="value: MONTH" />
										<input type="hidden" id="SECOND_FORELANG_EXAM_FG" data-bind="value: SECOND_FORELANG_EXAM_FG" />
										<button class="btn btn-outline-primary detail-btn" type="button" style="display: none;" id="btnExamApply2" onclick="fn_QexamApply()">외국어과목신청</button>										
										<button class="btn btn-outline-danger detail-btn" type="button"  style="display: none;" id="btnExamDelete2" onclick="fn_QexamDelete()">외국어과목삭제</button>										
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- /END 본인정보 -->
				<section class="sec-2">
					<header>
						<h4 class="sec-title">기합격과목(전공과목, 외국어과목)</h4>
					</header>
					<div class="sec-body">
						<div class="sec-2">
							<div class="sec-body">
								<div class="table-box" id="grid03">
									<div class="table-body">
										<table class="table table-hover" data-toggle="table" data-show-column="true">
											<caption>기합격과목의전공과목과외국어과목내역</caption>
											<colgroup>
												<col style="min-width: 80px;">
												<col style="min-width: 80px;">
												<col style="min-width: 200px;">
												<col style="min-width: 40px;">
												<col style="min-width: 40px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">교과구분</th>
													<th scope="col">교과번호</th>
													<th scope="col">교과목명</th>
													<th scope="col">합격년도</th>
													<th scope="col">합격월</th>
												</tr>
											</thead>
											<tbody id="resultTbody3"></tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- /END CONTENT  BODY-->
			</div>
		</section>
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
	
        <td class="text-left">#:SUBJ_GCD_NM#</td>
		
        <td>#:SUBJ_NO#</td>
	    <td class="text-left">#:SUBJ_NM#</td>
	    <td class="text-left">#:COMP_EXAM_TYPE_GCD_NM#</td>

		<td class="text-left">
		# if( :PARAM_CODE !="" && :SUBJ_NO == "ZZ77777") { #
	               <button class="btn btn-primary cancel-btn" type="button" onclick="location.href='/file/download.do?#:PARAM_CODE#'" data-lang="">보기</button></td>
	    #}#

	    <td><input type="checkbox" id="#:ROWNUM#" title="#:COMP_EXAM_SUBJ_CD#"></td>	   
<td class="text-left" style="display:none;">#:COMP_EXAM_SUBJ_CD</td> 
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
        <td class="text-left">#:SUBJ_GCD_NM#</td>
        <td>#:SUBJ_NO#</td>
	    <td class="text-left">#:SUBJ_NM#</td>
		<td class="text-left">#:COMP_EXAM_TYPE_GCD_NM#</td>
	    <td><input type="checkbox" title="#:SUBJ_GCD_NM#"></td>	   
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate3">
	<tr style="cursor:pointer;">
		<td>#:SUBJ_GCD_NM#</td>
        <td>#:SUBJ_NO#</td>
        <td class="text-left">#:SUBJ_NM#</td>
        <td>#:SYEAR#</td>
        <td>#:MONTH#</td>
     </tr>
</script>

<script type="text/javascript">
	const ajaxPath = '/ost/jolup/degthesissubmitqexam/degthesissubmitqexamapply';
	
	/***************************************************************************************************
	 * 최초 실행 함수
	 ***************************************************************************************************/
	function fn_initScreen() {
		$("#NM").text(scwin.loginUser.userId+'('+scwin.loginUser.nm+')');
		if(scwin.loginUser.degCourseGcd=="0001"){
			if(scwin.loginUser.userGcd == "0003") {
				$("#STDT_YEAR_GCD").text(scwin.loginUser.stdtYearGcdKorNm);
				$("#UPPER_ASSIGN_NM").text(scwin.loginUser.collCdKorNm+ ' ' +scwin.loginUser.assignNm);
			}else {
				$("#STDT_YEAR_GCD").text("");
				$("#UPPER_ASSIGN_NM").text(scwin.loginUser.assignNm);
			}
		}else{
			if(scwin.loginUser.userGcd == "0003") {
				$("#STDT_YEAR_GCD").text(scwin.loginUser.atlectTermCnt+"학기");
				if(scwin.loginUser.gradGcd == "0004"){
					$("#UPPER_ASSIGN_NM").text(scwin.loginUser.collCdKorNm+ ' ' +scwin.loginUser.assignNm+ ' '+scwin.loginUser.majorCdKorNm+' ('+scwin.loginUser.degCourseGcdKorNm+')' );
				}else{
					$("#UPPER_ASSIGN_NM").text(scwin.loginUser.collCdKorNm+ ' ' +scwin.loginUser.assignNm+' ('+scwin.loginUser.degCourseGcdKorNm+')');
				}
			}else {
				$("#STDT_YEAR_GCD").text("");
				$("#UPPER_ASSIGN_NM").text(scwin.loginUser.assignNm);
			}
		}
		$("#HJ_STA_GCD_KOR_NM").text(scwin.loginUser.hjStaGcdKorNm);		
		$("#DEG_COURSE_NM").text(scwin.loginUser.degCourseGcdKorNm);		
		
		$("#ENG_EXAM_APPLY_FG_LABEL").hide();
		$("#KOR_EXAM_APPLY_FG_LABEL").hide();
		$("#fileupload").hide('');
		if (scwin.loginUser.collGradGcd == '0001') {
			alert("학부생은 사용할 수 없습니다.");	//대학
		} else {
			$("#SECOND_FORELANG_EXAM_GCD").RadioList({      
				SYSTEM_GCD : "0001",
				CODE : "SECOND_FORELANG_EXAM_GCD",
				QPARAM : "AND ISNULL(CHAR_1_CONTENT, 'N') = 'N' ",  // 옵션 생략가능
				ALL_STR : "해당없음",												 // 옵션 생략가능
				dataTextField : "COMMON_DETAIL_CD_KOR_NM",
				dataValueField : "COMMON_DETAIL_CD",
				dataBound : function(e) {
				}
			});
			 
			// 제2외국어 라디오 버튼 비활성화 → 학생정보 조회에서 재확인
			$('#language2_gcd').hide();
			
			// 한국인일 때 제1외국어 한국어 비활성화
			if((scwin.loginUser.nationCd && scwin.loginUser.nationCd == "0410") || scwin.loginUser.nationCd ==""){
				$('#customCheck2').attr("disabled", true);
			}
		 	var year = moment().format("YYYY");
			var month = Number(moment().format("MM"))+2
			if(month<7){
				month = "03";
			}else{
				month = "09";
			}
			//확인 필요?
			if(scwin.loginUser.userId.slice(0,4) == new Number(moment().format("YYYY")) && new Date().getMonth()+1 < month){
			 $('#customCheck2').attr("disabled", false);
			}
			if(scwin.loginUser.gradGcd=="0002"){
			 $('#customCheck2').attr("disabled", true);
			}
			gfn_com_DropDownLists([ {
					elements : $("#FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD"),
					commonCode : "0001_FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD",
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
		}	
		var uploader_target1 = $("#uploader_target1").formuploader({
			SYSTEM_GCD : "0002",  //시스템코드
			ATTACH_FILE_GCD : "9999", // 첨부파일 종류 코드 
			ATTACH_FILE_GRP_CD : year+month+scwin.loginUser.userId,  // 첨부파일 그룹 코드 
			ACCEPT_EXT : "",  // 허용확장자 ( 메뉴설정에서 들고 오거나 지정한 확장자가 없으면 기본 확장자로 사용. )
			UPLOAD_SIZE : "", // 최대 파일용량 (mb) (메뉴설정에서 들고 오거나 지정한 용량 없으면 기본 20mb )
			FILE_ADD_YN : "Y",  //신규추가가능여부
			FILE_DEL_YN : "Y",   //삭제가능여부
	        FILE_DWN_YN : "Y",  //다운로드가능여부
	       	FILE_INFO_YN : "Y", /* 확장자와 제한용량 정보표시 여부*/
	       	FILE_AREA_WIDTH_PER : 100, /* 첨부파일영역의 %값 */
	       	FILE_COMMENT : "",
	       	FILE_VIEWER_YN : "Y", /* 첨부파일뷰어 표시 여부 */
	       	FILE_TAG_CONTENT_YN : "N", /* 첨부파일 대체텍스트 표시 여부 */
	       	UPLOAD_CNT : 1,
	       	dataBound : function(e,_target) { /* 업로드 완료후 처리 함수*/
	       		fn_save(e);
				alert("업로드 완료",_target);
	        }
		});	
		
		fn_examPossibleChk();
	}
	/***************************************************************************************************
	 * 학위논문제출자격시험 일정 조회
	 ***************************************************************************************************/
	function fn_examPossibleChk() {
		var data = {GRAD_GCD : scwin.loginUser.gradGcd};		
			
		/* ajax처리 */
		gfn_ajax_request({
			url : ajaxPath + "/selectExamPosibleYn",
			reqData : data,
			success : function(data, responseData) {
				if (data.O_RSLT == "N") {
					alert(data.O_MSG);
					return;
				}
				$('#SYEAR').val(data.SYEAR);
				$('#TERM_GCD').val(data.TERM_GCD);
				$('#MONTH').val(data.MONTH);
				//fn_btnSetting(true, true);	//학생정보 조회하여 자격요건 검사 후 버튼 활성화로 변경함
				fn_sch();
			}
		});
	}
	/***************************************************************************************************
	 * 버튼 제어
	 ***************************************************************************************************/
	function fn_btnSetting(mstat, estat) {
		if (mstat) {	//전공과목신청
			$('#btnExamDelete').show('');
			$('#btnExamApply').show('');
		} else {
			$('#btnExamDelete').hide('');
			$('#btnExamApply').hide('');
		}
		if (estat) {	//외국어과목신청
			$('#btnExamApply2').show('');
			$('#btnExamDelete2').show('');
		} else {
			$('#btnExamApply2').hide('');
			$('#btnExamDelete2').hide('');
		}
	}
	/***************************************************************************************************
	 * 외국어과목 : 응시과목 제한 체크 , 기합격과목 체크
	 ***************************************************************************************************/
	function chk_result(){
		var language1_length = $('#language1_gcd input:checkbox:checked').length;
		var language2_length = $('#language2_gcd input:radio:checked').length;
		var language2 = $('#language2_gcd input:radio[name="SECOND_FORELANG_EXAM_GCD"]:checked').val()
		if(language1_length == 0 && language2 == ""){
			alert("학위청구자격시험에 응시할 외국어과목을 선택하지 않으셨습니다.<br>외국어과목을 선택하신 후, 신청하여 주시기 바랍니다.");
			return false;
		}
		
		
		/* 제2외국어만 신청할 수 있으므로 필수체크 해제
		if($('#FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD').val() == undefined || $('#FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD').val() == "" ){
			alert("제1외국어 신청자격을 선택하지 않으셨습니다.<br>신청자격 선택 및 첨부파일을 업로드한 후(대체강좌이수자 제외) 신청하여 주시기 바랍니다.");
			return false;
		}*/
		/* 필수여부를 알 수 없어 주석처리함
		if($('#SECOND_FORELANG_EXAM_FG').val() == "Y" && ($('#SECOND_FORELANG_EXAM_GCD').val() == undefined || $('#SECOND_FORELANG_EXAM_GCD').val() == "")){
			alert("제2외국어과목를 선택하지 않으셨습니다.<br>제2외국어과목을 선택하신 후, 신청하여 주시기 바랍니다.");
			return false;
		}*/
		return true;
	}
	
	/***************************************************************************************************
	 * 외국어과목 : 자료존재유무
	 ***************************************************************************************************/
	function chk_result_delete(){
		var language1_length = $('#language1_gcd input:checkbox:checked').length;
		var language2_length = $('#language2_gcd input:radio:checked').length;
		var language2 = $('#language2_gcd input:radio[name="SECOND_FORELANG_EXAM_GCD"]:checked').val()

		if(language1_length == 0 && language2 == ""){
			alert("외국어과목 신청내역이 없습니다.");
			return false;
		}
		return true;
	}

	/***************************************************************************************************
	 * 전공과목 : 응시과목 제한 체크 함수
	 * 경영/행정대학원 및 그외 대학원 과목수 체크 다름
	 ***************************************************************************************************/
	function chk_result2(){
		var resultTbody_length = $('#resultTbody tr input:checkbox:checked').length;
		var resultTbody2_length = $('#resultTbody2 tr input:checkbox').length;
		var resultTbody3_length = 0;
		
		$('#resultTbody3 tr').each(function(){
		    if(Number($(this).find("td").eq(0).html())>0){
		    	resultTbody3_length++;
		    }
		});
		
		if(scwin.loginUser.gradGcd=="0002"&&resultTbody_length+resultTbody2_length+resultTbody3_length>3){
			alert("종합시험에 응시할 최대 교과목수 (3개)를 초과하여 선택하셨습니다.<br>확인하신 후, 다시 전공과목을 선택하여 응시하여주시기 바랍니다.");
			return false;
		}else if(scwin.loginUser.gradGcd=="0003"&&resultTbody_length+resultTbody2_length+resultTbody3_length>4){	//행정대학원 예외사항 - 노정화 팀장 요청(2023.4)
			alert("종합시험에 응시할 최대 교과목수 (4개)를 초과하여 선택하셨습니다.<br>확인하신 후, 다시 전공과목을 선택하여 응시하여주시기 바랍니다.");
			return false;
		}else if(resultTbody_length+resultTbody2_length+resultTbody3_length>6){
			alert("종합시험에 응시할 최대 교과목수 (6개)를 초과하여 선택하셨습니다.<br>확인하신 후, 다시 전공과목을 선택하여 응시하여주시기 바랍니다.");
			return false;
		}
		return true;
	}
	/***************************************************************************************************
	 * 전공과목 : 기힙격과목여부 조회 함수
	 ***************************************************************************************************/
	function chk_passSubject(){
		if(scwin.loginUser.userId.slice(0,4)>=2006){
            var paramList = [];

			for (var i = 0; i < $('#resultTbody tr input:checkbox:checked').closest('tr').length ; i++) {
				var paramObj = $('#resultTbody tr input:checkbox:checked').closest('tr').eq(i).data();
				paramObj["rowState"] = scwin.rowState;
				paramObj["SYEAR"] = $("#SYEAR").val();
				paramObj["TERM_GCD"] = $("#TERM_GCD").val();
				paramObj["MONTH"] = $("#MONTH").val();
				
				paramList.push(paramObj);
			}

			gfn_ajax_request({
				url : ajaxPath + "/checkPassSubject",
				reqData : paramList,
				success : function(data, responseData) {
					var paramList = [];
					
					for (var i = 0; i < $('#resultTbody tr input:checkbox:checked').closest('tr').length ; i++) {
						var paramObj = $('#resultTbody tr input:checkbox:checked').closest('tr').eq(i).data();
						paramObj.STATUS = "C";
						paramObj.DEG_COURSE_GCD = scwin.loginUser.degCourseGcd;
						paramObj.MONTH = $("#MONTH").val();
						paramList.push(paramObj);
					}
				
					if(paramList.length!=0){
						gfn_ajax_request({
							url : ajaxPath + "/excuteSubject",
							reqData : paramList,
							success : function(data, responseData) {
								alert("전공과목신청 처리되었습니다.");
								fn_sch();
							}
						});
					 }else{
						alert("전공과목신청대상 과목을 선택하세요.");
					 }
				}
			});
		}else{
			var paramList = [];
			
			for (var i = 0; i < $('#resultTbody tr input:checkbox:checked').closest('tr').length ; i++) {
				var paramObj = $('#resultTbody tr input:checkbox:checked').closest('tr').eq(i).data();
				paramObj.STATUS = "C";
				paramObj.DEG_COURSE_GCD = scwin.loginUser.degCourseGcd;
				paramObj.SYEAR = $("#SYEAR").val();
				paramObj.TERM_GCD = $("#TERM_GCD").val();
				paramObj.MONTH = $("#MONTH").val();
				paramList.push(paramObj);
			}
		
			if(paramList.length!=0){
				gfn_ajax_request({
					url : ajaxPath + "/excuteSubject",
					reqData : paramList,
					success : function(data, responseData) {
						alert("전공과목신청 처리되었습니다.");
						fn_sch();
					}
				});
			 }else{
				alert("전공과목신청대상 과목을 선택하세요.");
			 }
		}
	}
	/***************************************************************************************************
	 * 외국어시험 삭제
	 ***************************************************************************************************/
	function fn_QexamDelete(){
		if(chk_result_delete()){
		   var paramObj = {}; 
			paramObj.STATUS = "D";
           paramObj.SYEAR =  $("#SYEAR").val();
           paramObj.MONTH =  $("#MONTH").val();
           paramObj.TERM_GCD =  $("#TERM_GCD").val();
           paramObj.GRAD_GCD = scwin.loginUser.gradGcd;
			paramObj.DEG_COURSE_GCD = scwin.loginUser.degCourseGcd;
			
			gfn_ajax_request({
				url : ajaxPath + "/excuteSubject2",
				reqData : paramObj,
				async : false,
				success : function(data, responseData) {
					alert("외국어과목 신청삭제처리 되었습니다.");
					$("#ENG_EXAM_APPLY_FG_LABEL").hide();
					$("#KOR_EXAM_APPLY_FG_LABEL").hide();
					fn_sch();
				}
			});
		}
	}
	/***************************************************************************************************
	 * 외국어시험신청
	 ***************************************************************************************************/
	function fn_QexamApply(){
		 if(chk_result()){
			if($(".attach-list li").length==0&&$('#FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD').val()=="0003"){
				alert("영어권국가국적자 또는 선수학위취득자의 경우 관련 서류를 제출하여야 합니다.");
				return false;
			}else if($(".attach-list li").length==0&&$('#FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD').val()=="0001"){
				alert("공인(영어/한국어) 성적취득자의 경우 관련 서류를 제출하여야 합니다.");
				return false;
			}
			
			var paramObj = {}; 
			paramObj.STATUS = "C";
            paramObj.SYEAR =  $("#SYEAR").val();
            paramObj.MONTH =  $("#MONTH").val();
            paramObj.TERM_GCD =  $("#TERM_GCD").val();
            paramObj.GRAD_GCD = scwin.loginUser.gradGcd;
			paramObj.DEG_COURSE_GCD = scwin.loginUser.degCourseGcd;
			
			if($('#customCheck1:checkbox:checked').val()!=undefined || $('#customCheck2:checkbox:checked').val()!=undefined || $('#language2_gcd input:radio[name="SECOND_FORELANG_EXAM_GCD"]:checked').val()!=undefined){
				var ENG_EXAM_APPLY_FG = $('#customCheck1:checkbox:checked').val();
				var KOREAN_EXAM_APPLY_FG = $('#customCheck2:checkbox:checked').val();
				var SECOND_FORELANG_EXAM_APPLY_FG = $('#language2_gcd input:radio[name="SECOND_FORELANG_EXAM_GCD"]:checked').val();
				var FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD = $('#FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD').val();
			
				
				if(ENG_EXAM_APPLY_FG!=undefined){
					paramObj.ENG_EXAM_APPLY_FG = ENG_EXAM_APPLY_FG;
				}else{
					paramObj.ENG_EXAM_APPLY_FG ="";
				}
				if(KOREAN_EXAM_APPLY_FG!=undefined){
					paramObj.KOREAN_EXAM_APPLY_FG = KOREAN_EXAM_APPLY_FG;
				}else{
					paramObj.KOREAN_EXAM_APPLY_FG ="";
				}
				if(FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD!=undefined){
					paramObj.FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD = FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD;
				}else{
					paramObj.FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD ="";
				}
				
				paramObj.SECOND_FORELANG_EXAM_GCD = SECOND_FORELANG_EXAM_APPLY_FG;
			}
			
			
			gfn_ajax_request({
				url : ajaxPath + "/checkPassSubject2",
				reqData : paramObj,
				success : function(data, responseData) {
					if(data.length!=0){
						if(data[0].O_RSLT == 'Y'){
							gfn_ajax_request({
								url : ajaxPath + "/excuteSubject2",
								reqData : paramObj,
								success : function(data, responseData) {
									alert("외국어과목 신청처리 되었습니다.");
									fn_sch();
								}
							});
						}
					}
				}
			});
			

		 } 	
		 
	}
	/***************************************************************************************************
	 * 전공과목신청
	 ***************************************************************************************************/	
	function fn_applyDetail(){
		if(!chk_result2())return;
		if(!chk_passSubject())return;
	}
	/***************************************************************************************************
	 * 응시과목시험삭제함수
	 ***************************************************************************************************/
	function fn_cancelDetail(){
        var paramList = [];
        if($('#resultTbody2 tr input:checkbox:checked').closest('tr').length == 0){
        	alert("신청과목 중 삭제대상이 없습니다.");
        	return;
        }
		for (var i = 0; i < $('#resultTbody2 tr input:checkbox:checked').closest('tr').length ; i++) {
			var paramObj = $('#resultTbody2 tr input:checkbox:checked').closest('tr').eq(i).data();
			paramObj.STATUS = "D";
			paramObj.DEG_COURSE_GCD = scwin.loginUser.degCourseGcd;
			paramObj.SYEAR = $("#SYEAR").val();
			paramObj.MONTH = $("#MONTH").val();
			paramObj.TERM_GCD = $("#TERM_GCD").val();
			paramList.push(paramObj);
		}
	
		if(paramList.length!=0){
			gfn_ajax_request({
				url : ajaxPath + "/excuteSubject",
				reqData : paramList,
				success : function(data, responseData) {
					alert("전공과목 삭제처리 되었습니다.");
					fn_sch();
				}
			});
		 }
	 }
	/***************************************************************************************************
	 * 대상자 조회
	 ***************************************************************************************************/
	function fn_sch() {
		fn_stdtinfo_search();
		fn_passsubject_search();
		fn_subject_search();
		fn_applysubject_search();
	}
	/***************************************************************************************************
	 * 학적정보 조회
	 ***************************************************************************************************/
	function fn_stdtinfo_search() {
		var searchParam = {SYEAR : $('#SYEAR').val(),TERM_GCD : $('#TERM_GCD').val(),MONTH : $('#MONTH').val()};
						
		/* ajax처리 */
		gfn_ajax_request({
			url : ajaxPath + "/selectStdtInfo",
			reqData : searchParam,
			success : function(data, responseData) {
				if(data.length!=0){
					//학생 추가정보 
					$("#ACQ_CRDT").text(data[0].ACQ_CRDT);
					$("#SURYO_DT").text(data[0].SURYO_DT);	
					$("#SECOND_FORELANG_EXAM_FG").val(data[0].SECOND_FORELANG_EXAM_FG);
					
					/* 자격시험지원자격 조회 */
					var msg = "";
					var majorAqualifyFg = true;
					if(data[0].MAJOR_AQUALIFY_FG == "N"){majorAqualifyFg = false; msg = "[전공과목]";}
					var engAqualifyFg = true;
					if(data[0].ENT_AQUALIFY_FG == "N"){engAqualifyFg = false; msg = msg +  ",[외국어과목]";}
					if(majorAqualifyFg == false || engAqualifyFg == false){
						alert('자격시험 지원자격을 충족하지 못해<br/>' + msg + '을 신청할 수 없습니다.');
					}
					
					// 제2외국어 라디오 버튼 비활성화
					/*var ASSIGN_CD = scwin.loginUser.assignCd;
					if(scwin.loginUser.degCourseGcd!="0003" && scwin.loginUser.degCourseGcd!="0008"){
						console.log('1');
						$('#language2_gcd').hide();
					}
					else if(((ASSIGN_CD.slice(0,2) == "31" && ASSIGN_CD != "31111A" && ASSIGN_CD != "31151A" && ASSIGN_CD != "31511A" && ASSIGN_CD != "31211A" && ASSIGN_CD != "31271" && ASSIGN_CD != "31391A") 
							|| (ASSIGN_CD.slice(0,2) == "35" && $ASSIGN_CD != "35711A") 
							|| ASSIGN_CD == "42331A" || ASSIGN_CD == "32114A" || ASSIGN_CD == "32124A" || ASSIGN_CD == "32844A" || ASSIGN_CD == "32854A" || ASSIGN_CD == "29511A")){
							console.log('2');
						$('#language2_gcd').hide();
					}*/
					//시행학과 체크로 변경
					if(data[0].SECOND_FORELANG_EXAM_FG == "Y"){
						$('#language2_gcd').show();
					}
					
					fn_btnSetting(majorAqualifyFg, engAqualifyFg);
					
					//외국어과목 신청내역 조회
					if(data[0].SECOND_FORELANG_EXAM_GCD){
						$('#language2_gcd input:radio[name="SECOND_FORELANG_EXAM_GCD"]:input[value="'+data[0].SECOND_FORELANG_EXAM_GCD+'"]').attr("checked", true);
					}else{
						$('#language2_gcd input:radio[name="SECOND_FORELANG_EXAM_GCD"]:input[value=""]').attr("checked", true);
					}
					
					if(data[0].FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD){
						$('#FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD').val(data[0].FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD);
						if(data[0].FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD=="0003" || data[0].FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD=="0001" ){
							$("#fileupload").show('');
						}
					}
					
					if(data[0].ENG_EXAM_APPLY_FG=="Y"){
						$('#customCheck1').attr("checked", true);
						$("#ENG_EXAM_APPLY_FG_LABEL").show('');
					}
					if(data[0].KOREAN_EXAM_APPLY_FG=="Y"){
						$('#customCheck2').attr("checked", true);
						$("#KOR_EXAM_APPLY_FG_LABEL").show('');
					}
				} 
			}
		});
	}

	/***************************************************************************************************
	 * 응시대상과목 조회
	 ***************************************************************************************************/
	function fn_subject_search() {
		//교육대학원 예외처리 
		var mjrcd = scwin.loginUser.deptCd;
		if (scwin.loginUser.gradGcd == "0004") { mjrcd = scwin.loginUser.majorCd }
		var param = {
						SYEAR : $('#SYEAR').val(),
						TERM_GCD : $('#TERM_GCD').val(),
						GRAD_GCD : scwin.loginUser.gradGcd,
						DEG_COURSE_GCD : scwin.loginUser.degCourseGcd,
						MAJOR_CD : mjrcd
						};		
		var SECOND_FORELANG_EXAM_GCD = $('#language2_gcd input:radio[name="SECOND_FORELANG_EXAM_GCD"]:checked').val();
		
		/* ajax처리 */
		gfn_ajax_request({
			url : ajaxPath + "/selectSubject",
			reqData : param,
			success : function(data, responseData) {
				$("#resultTbody").listView({
                	dataSource : data,
                	emptyComment : "조회내역이 없습니다.",
                    dataBound : function(e) {	  
                    	totalCnt = responseData.pageInfo.totCnt;
 	                    currentData = data;	 
	            	},
					template : $("#resultTemplate"),
					totalCnt : responseData.totalCnt,
 					totalViewYn : "N" ,
				});						
			}
		});
	}

	/***************************************************************************************************
	 * 전공과목 응시 신청과목 조회
	 ***************************************************************************************************/
	function fn_applysubject_search() {
		var param = {SYEAR : $('#SYEAR').val(),TERM_GCD : $('#TERM_GCD').val(),MONTH : $('#MONTH').val()};	
		
		/* ajax처리 */
		gfn_ajax_request({
			url : ajaxPath + "/selectApplySubject",
			reqData : param,
			success : function(data, responseData) {
				$("#resultTbody2").listView({
                	dataSource : data,
                	emptyComment : "신청하신 과목이 없습니다.",
                	dataBound : function(e) {	  
                    	totalCnt = responseData.pageInfo.totCnt;
 	                    currentData = data;	                   
	            	},
					template : $("#resultTemplate2"),
					totalCnt : responseData.totalCnt,
 					totalViewYn : "N" ,
				});										
			}
		});
	}
	
	/***************************************************************************************************
	 * 기합격과목 : 전공과목, 외국어과목 조회
	 ***************************************************************************************************/
	function fn_passsubject_search(data) {
		var param = gfn_com_searchData($(".search-box"));
		
		/* ajax처리 */
		gfn_ajax_request({
			url : ajaxPath + "/selectPassSubject",
			reqData : param,
			success : function(data, responseData) {
				$("#resultTbody3").listView({
                	dataSource : data,
                	emptyComment : "신청하신 과목이 없습니다.",
                	dataBound : function(e) {	  
                    	totalCnt = responseData.pageInfo.totCnt;
 	                    currentData = data;	                   
	            	},
					template : $("#resultTemplate3"),
					totalCnt : responseData.totalCnt,
 					totalViewYn : "N" ,
				});
			}
		});
	}
	/* 첨부파일 업로드 후 저장함수 */
	function fn_save(e){
		var year = Number(moment().format("YYYY"))
		var month = Number(moment().format("MM"))+2
		 if(month<7){
			month = "03";
		}else{
			month = "09";
		}
		//첨부파일 완료 처리후(fn_fileComplete) -> 데이터 저장 처리 필요
		var attach_file_grp_cd = year+month+scwin.loginUser.userId;
		var file_list = [];
		$.each($("#uploader_target1").find(".attach-list li"),function(e){
			file_list.push($(this).attr("attach_file_seq_no") +"^"+$(this).find("#FILE_TAG_CONTENT").val());
		});

		var reqData ={};
		reqData.ATTACH_FILE_GRP_CD = attach_file_grp_cd;
		reqData.file_list = file_list;
		
		fn_fileComplete2(reqData);
	}
	$(function(){
		$("#FOREIGN_LANGUAGE_EXAM_APPLY_QUALIFY_GCD").change(function(){
			if(this.value=="0003" || this.value=="0001"){
				$("#fileupload").show('');
			}else{
				$("#fileupload").hide('');
			}
		});
	})
</script>