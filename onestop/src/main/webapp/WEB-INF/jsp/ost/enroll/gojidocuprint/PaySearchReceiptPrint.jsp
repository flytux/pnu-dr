<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">

		<!-- CONTENT BODY -->
		<!-- 메세지 박스 -->
		<div class="message-box">
			<div class="message-box-inner">
				<div class="message-body">
					<ul class="list list-style-1 ml-2 mt-2 mb-2">
						<li id="">농협, 부산은행, 하나은행 : 납부 후 바로 확인(실시간)</li>
						<li id="">국민은행, 우리은행, 신한은행 : 다음날 9시 이후 확인</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- END 메세지 박스 -->
		
		<input id="hdYear" value="" type="hidden" name="hdYear">
		<input id="hdTerm" value="" type="hidden" name="hdTerm">
		<input id="hdYechi" value="" type="hidden" name="hdYechi">
		<input id="smallGcd" value="" type="hidden" name="smallGcd">
		<input id="buhalChasu" value="" type="hidden" name="buhalChasu">
		<input id="regDate" value="" type="hidden" name="regDate">


		<div class="accordion">
			<div class="card">
				<div class="card-header" id="heading1">
					<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse" data-expanded="true" data-controls="collapse">납부 확인(영수증출력)</button>
				</div>
				<div id="collapse" class="collapse show" aria-labelledby="heading1">
					<!-- 검색영역 start -->
					<section class="sec-2">
						<div class="search-box" id="admin">
							<div class="b-table-box flex-col-1" role="table" aria-label="검색">
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label for="AD_STDT_NO">학번</label>
										</div>
										<div class="b-con-box" role="cell">
											<input type="text" id="AD_STDT_NO" class="form-control" />
										</div>
										<div class="b-con-box" role="cell">
											<section class="">
												<div class="sec-body">
													<div class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="stdtType1" name="stdtType" class="custom-control-input" value="0001"> <label class="custom-control-label" for="stdtType1">학부</label>
													</div>
													<div class="custom-control custom-radio custom-control-inline">
														<input type="radio" id="stdtType2" name="stdtType" class="custom-control-input" value="0002"> <label class="custom-control-label" for="stdtType2">대학원</label>
													</div>
												</div>
											</section>
										</div>
										<div class="btn-box">
											<div class="form-row">
												<div class="col-auto">
													<button class="btn btn-sm btn-primary mr-2 mt-2" type="button" onclick="fn_sch()" data-lang>조회</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- /END 검색영역 -->

					<section class="sec-1">
						<div class="sec-body">
							<div class="b-table-box flex-col-3" role="table" aria-label="조회">
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label class="" data-lang>대학(원)</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: COLL_CD_NM"></div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label class="" data-lang>학위</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: DEG_COURSE_GCD"></div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>학과(부)</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: DEPT_CD_NM"></div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>학번</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: STDT_NO"></div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>학년</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: STDT_YEAR_GCD"></div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>성명</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: STDT_KOR_NM"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- /END 기본정보 영역 -->

						<!-- 테이블 -->
						<span id="report_txt"></span>
						<div class="table-box table-list">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table"  data-show-column="true">
									<caption>납부확인영수증정보</caption>
									<colgroup>
										<col style="min-width: 120px;">
										<col style="min-width: 120px;">
										<col style="min-width: 120px;">
										<col style="min-width: 120px;">
										<col style="min-width: 120px;">
										<col style="min-width: 120px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">학년도</th>
											<th scope="col">학기</th>
											<th scope="col">구분</th>
											<th scope="col">납부일자</th>
											<th scope="col">납부처</th>
											<th scope="col">영수증</th>
										</tr>
									</thead>
									<tbody id="resultTbody">
								</table>
							</div>
						</div>
					</section>
					<!-- /END 테이블 -->

				</div>
			</div>
			<!-- 아코디언 END -->
		</div>
		<!-- /END CONTENT  BODY-->
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td>#:SYEAR#</td>
	    <td>#:TERM_NM#</td>
	    <td class="text-left">#:GBN#</td>
	    <td class="">#:REG_DATE2#</td>
	    <td class="">#:NABBU_LOCATION#</td>
		<td>
			<button class="btn btn-outline-primary detail-btn" type="button">출력</button>
		</td>
	</tr>
</script>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/javascript">
	/***************************************************************************
	 * 변수
	 **************************************************************************/
	var paramMap = {};
	//보험료
	var yearFo = "";
	var termFo;
	/***************************************************************************
	 * fn_initScreen  화면로딩
	 **************************************************************************/
	function fn_initScreen() {

		fn_setInit();

	}
	/***************************************************************************
	 * fn_setInit  화면 초기값 세팅
	 **************************************************************************/
	function fn_setInit() {
		if (scwin.loginUser.userGcd == "0002") { //관리자일때
			$('#admin').show();
		} else {
			$('#admin').hide();
			$('#AD_STDT_NO').val(scwin.loginUser.userId);
			$('input[name=stdtType][value=' + scwin.loginUser.collGradGcd + ']').prop("checked", true);
			
			
			fn_ChkBasicInfo(); //관리자가 아닐때
		}
		
	}

	/***************************************************************************
	 * fn_ChkBasicInfo  개인 기본정보 조회
	 **************************************************************************/
	function fn_ChkBasicInfo() {
		paramMap = {
				"COLL_GRAD_GCD" : $("input:radio[name='stdtType']:checked").val()
			};
		
		gfn_ajax_request({
			url : "/ost/enroll/paysearchreceiptprint/selectChkBasicInfo",
			reqData : paramMap,
			success : function(data, responseData) {

				if (gfn_com_isEmptyObject(data)) {
	        		alert('해당 학생의 학생정보가 없습니다. 학번이나 학부, 대학원 구분이 정확한지 확인하세요.');
	        		return;
	        	}
	        	gfn_com_dataBind($("#main"), data); 
	        	
				fn_sch();

			}
		});

	}
	/***************************************************************************
	 * fn_sch  관리자일때 조회버튼 클릭 or 관리자가 아닐때 데이터가 있으면 자동 조회
	 **************************************************************************/
	function fn_sch() {
		paramMap = {
		};

		var reportParam = {};
		
		gfn_ajax_request({
			url : "/ost/enroll/paysearchreceiptprint/selectPaySchReceiptPrt",
			reqData : paramMap,
			success : function(data, responseData) {

				$.each(data,function(i,e){
					var reg_date = moment(e.REG_DATE,"YYYYMMDD");
					e.REG_DATE2 = reg_date.format("YYYY-MM-DD");
				})
        		$("#resultTbody").listView({
					dataSource : data,
					emptyComment : '등록된 개인별 등록내역이 없습니다.',
					dataBound : function(e) {
						currentData = data;
						
						$('#resultTbody .detail-btn').bind("click",function(e) {
							scwin.detailObj = $(this).closest("tr").data();
							
							
							reportParam = {
								"SYEAR" : scwin.detailObj.SYEAR,
								"TERM_GCD": scwin.detailObj.TERM_GCD,
								"STDT_NO": scwin.loginUser.userId,
								"LARGE_GCD": scwin.detailObj.YECHI_GBN , //학기예치금구분 
								"SMALL_GCD": scwin.detailObj.CLAIM_SMALL_GCD, //청구소구분
								"DEVIDE_CHASU": scwin.detailObj.DEVIDE_CHASU, //분할차수
								"RECEIVING_DATE": scwin.detailObj.REG_DATE //등록일
							}
							
							fn_openReport(reportParam);
						});
						
					},
					template : $("#resultTemplate"),
					totalCnt : data.length,
					totalViewYn : "N"
				});
        		
			}
		});
	}

	/***************************************************************************
	 * fn_openReport  출력
	 **************************************************************************/
	function fn_openReport(params) {

		var options = {};
		var printStr = "";
		//파라메터 설정
		var objParam = {};
		
		if (params.LARGE_GCD == "0004") {
			//fn_rd_report('등록_영수증(예치금).mrd', '');
			printStr = "등록_영수증(예치금)";
			options.rptName = "/ses/enroll/paysearchreceiptprint/PaySearchReceiptPrint_001.crf";
			objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금영수증출력_조회",
                params : [scwin.detailObj.SYEAR,
                			  scwin.detailObj.TERM_GCD,
                			  scwin.loginUser.userId,
                			  scwin.detailObj.YECHI_GBN,
                			  scwin.detailObj.CLAIM_SMALL_GCD,
                			  scwin.detailObj.DEVIDE_CHASU,
                			  scwin.detailObj.REG_DATE
                			 ]
        	}];
		} else if (params.LARGE_GCD == "0003") {
			//잡부금
			//fn_rd_report('등록_개인별영수증(잡부금).mrd', '');
			printStr = "등록_개인별영수증(잡부금)";
			options.rptName = "/ses/enroll/paysearchreceiptprint/PaySearchReceiptPrint_002.crf";
			objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금영수증출력_조회",
                params : [scwin.detailObj.SYEAR,
                			  scwin.detailObj.TERM_GCD,
                			  scwin.loginUser.userId,
                			  scwin.detailObj.YECHI_GBN,
                			  scwin.detailObj.CLAIM_SMALL_GCD,
                			  scwin.detailObj.DEVIDE_CHASU,
                			  scwin.detailObj.REG_DATE
                			 ]
        	}];
			
		} else if (params.LARGE_GCD == "ZZ") {
			printStr = "등록_외국인보험료영수증.mrd";
			//fn_rd_report('등록_외국인보험료영수증.mrd', '');
			//options.rptName = "/ses/enroll/paysearchreceiptprint/PaySearchReceiptPrint_003.crf";
			options.rptName = "/ses/enroll/fsmmng/FsmReceiptPrint_001.crf";
			objParam.bind = [{
	                db : "OST",
	                proc : "OST_등록_등록금영수증출력_조회",
	                params : [scwin.detailObj.SYEAR,
	                			  scwin.detailObj.TERM_GCD,
	                			  scwin.loginUser.userId,
	                			  scwin.detailObj.YECHI_GBN,
	                			  scwin.detailObj.CLAIM_SMALL_GCD,
	                			  scwin.detailObj.DEVIDE_CHASU,
	                			  scwin.detailObj.REG_DATE
	                			 ]
	        	}];
		} else if (params.LARGE_GCD == "CO") {
			//fn_rd_report('등록_개인별영수증(계약학과).mrd', '');
			printStr = "등록_개인별영수증(계약학과)";
			options.rptName = "/ses/enroll/paysearchreceiptprint/PaySearchReceiptPrint_004.crf";
			objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금영수증출력_조회",
                params : [scwin.detailObj.SYEAR,
                			  scwin.detailObj.TERM_GCD,
                			  scwin.loginUser.userId,
                			  scwin.detailObj.YECHI_GBN,
                			  scwin.detailObj.CLAIM_SMALL_GCD,
                			  scwin.detailObj.DEVIDE_CHASU,
                			  scwin.detailObj.REG_DATE
                			 ]
        	}];
		} 
		else {
			if (params.SMALL_GCD == "0011") {
				//수료후연구생
				//fn_rd_report('등록_개인별영수증(수료후연구생).mrd', '');
				printStr = "등록_개인별영수증(수료후연구생)";
				options.rptName = "/ses/enroll/paysearchreceiptprint/PaySearchReceiptPrint_005.crf";
				objParam.bind = [{
	                db : "OST",
	                proc : "OST_등록_등록금영수증출력_조회",
	                params : [scwin.detailObj.SYEAR,
	                			  scwin.detailObj.TERM_GCD,
	                			  scwin.loginUser.userId,
	                			  scwin.detailObj.YECHI_GBN,
	                			  scwin.detailObj.CLAIM_SMALL_GCD,
	                			  scwin.detailObj.DEVIDE_CHASU,
	                			  scwin.detailObj.REG_DATE
	                			 ]
	        	}];
			} else if (params.SMALL_GCD == "0008") {
				//복수전공추가수납
				//fn_rd_report('등록_개인별영수증(복수전공).mrd', '');
				printStr = "등록_개인별영수증(복수전공)";
				options.rptName = "/ses/enroll/paysearchreceiptprint/PaySearchReceiptPrint_006.crf";
				objParam.bind = [{
	                db : "OST",
	                proc : "OST_등록_등록금영수증출력_조회",
	                params : [scwin.detailObj.SYEAR,
	                			  scwin.detailObj.TERM_GCD,
	                			  scwin.loginUser.userId,
	                			  scwin.detailObj.YECHI_GBN,
	                			  scwin.detailObj.CLAIM_SMALL_GCD,
	                			  scwin.detailObj.DEVIDE_CHASU,
	                			  scwin.detailObj.REG_DATE
	                			 ]
	        	}];
				
			} else {
				//fn_rd_report('등록_개인별영수증.mrd', '');
				printStr = "등록_개인별영수증";
				options.rptName = "/ses/enroll/paysearchreceiptprint/PaySearchReceiptPrint_007.crf";
				objParam.bind = [{
	                db : "OST",
	                proc : "OST_등록_등록금영수증출력_조회",
	                params : [scwin.detailObj.SYEAR,
	                			  scwin.detailObj.TERM_GCD,
	                			  scwin.loginUser.userId,
	                			  scwin.detailObj.YECHI_GBN,
	                			  scwin.detailObj.CLAIM_SMALL_GCD,
	                			  scwin.detailObj.DEVIDE_CHASU,
	                			  scwin.detailObj.REG_DATE
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
		fn_openPopup(options, printStr);
	}

	function fn_openPopup(rptOptions, str) {
		gfn_com_modalPopup({
			width : 1200,
			height : 900,
			target : null,
			title : str,
			include : "/html/ost/core/popup/CommPopReport.html",
			dataBound : function(e) {
				rptOptions.div = "pop_grp_report";
				openReport(rptOptions);
			}
		});
	}
</script>