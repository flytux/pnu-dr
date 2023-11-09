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
		<!-- 메세지 박스 -->
		<div class="message-box">
			<div class="message-box-inner">
				<div class="message-body">
					<ul class="list list-style-1">
						<li><span class="text-primary">보험료 문의: (국제처) 051-510-3882</span></li>
<!-- 						<li><span class="">학생지원시스템 사용 문의: (정보화본부)051-510-7469</span></li> -->
						<li><span class="" style="color: orange">등록금 고지서 출력 오류 발생시 조치방법 안내</span><a class="ml-2 link link-style-1 btn-sm" href="#none" onclick="selectMenu('000000000000274');" onkeypress="this.onclick" title="등록금 고지서 출력 오류 발생시 조치방법 안내 바로가기"> 바로가기</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- END 메세지 박스 -->

		<input id="hdYear" value="" type="hidden" name="hdYear"> <input id="hdTerm" value="" type="hidden" name="hdTerm"> <input id="hdDepositYn" value="N" type="hidden" name="hdDepositYn"> <input type="hidden" id="enrollUserID"> <input type="hidden" id="enrollGubun"> <input type="hidden" id="enrollSGubun"> <input type="hidden" id="contractFlag"> <input type="hidden" id="hdBunHal"> <input id="hdHakBuGuBun" type="hidden"> <input id="hdContractDepartmentYn" type="hidden" name="hdContractDepartmentYn">

		<div class="accordion">
			<div class="card">
				<div class="card-header" id="heading1">
					<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse" data-expanded="true" data-controls="collapse">외국인 유학생 보험료 고지서 출력 및 납부 확인</button>
				</div>
				<div id="collapse" class="collapse show" aria-labelledby="heading1">
					<div class="" id="">
						<label class="text-left dfn ml-2 mt-2 text-Schd"></label>
					</div>

					<section class="sec-2">
						<div class="sec-body">
							<div class="b-table-box flex-col-3" role="table" aria-label="조회">
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label class="" data-lang>대학(원)</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: collGradGcdKorNm"></div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label class="" data-lang>학위</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: degCourseGcdKorNm"></div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>학과(부)</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: deptCdKorNm"></div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>학번</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: userId"></div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>학년</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: stdtYearGcdKorNm"></div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label data-lang>성명</label>
										</div>
										<div class="b-con-box" role="cell" data-bind="text: nm"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- /END 기본정보 영역 -->
						
						<!-- 테이블 -->
						<span id="report_txt"></span>
						<div class="table-box table-list">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table" data-show-column="true">
									<caption>외국인 유학생 보험료 고지서정보</caption>
									<colgroup>
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
											<th scope="col">납부구분</th>
											<th scope="col">납부일자</th>
											<th scope="col">승인금액(보험료)</th>
										</tr>
									</thead>
									<tbody id="resultTbody">
								</table>
							</div>
						</div>
					</section>
					<!-- /END 테이블 -->

					<div class="btn-box">
						<div class="form-row justify-content-center">
							<div class="col-auto">
								<button class="btn btn-primary" type="button" onclick="fn_clause()" data-lang>고지서출력</button>
							</div>
						</div>
					</div>

					<!-- 게시글 -->
					<div class="card-body">
						<ul class="list list-style-1">
							<li class="">외국인 유학생 보험 안내(Notes for International Students Insurance)</br> ※ 외국인 유학생 보험 : 보험료 납부 전 반드시 보험 안내문을 통해 보장내역과 서비스를 확인하시기 바랍니다. (미확인으로 인한 불이익은 본인에게 있습니다)<br> 공지사항 링크 <span class=""> <a href="https://international.pusan.ac.kr/international/14764/subview.do?enc=Zm5jdDF8QEB8JTJGYmJzJTJGaW50ZXJuYXRpb25hbCUyRjI2MzAlMkZhcnRjbExpc3QuZG8lM0Y%3D" class="ml-2 link link-style-1 btn-sm"  title="외국인 유학생 보험 공지 새창 바로가기"> 바로가기</a>
							</span> <br /> ※ International students insurance : Before insurance fee payment, students must confirm insurance coverage and services from guideline.(Any disadvantage caused by not confirming the guideline will be in the student’s responsibility)</br> Link to the notice board <span class=""> <a href="https://international.pusan.ac.kr/international/14764/subview.do?enc=Zm5jdDF8QEB8JTJGYmJzJTJGaW50ZXJuYXRpb25hbCUyRjI2MzAlMkZhcnRjbExpc3QuZG8lM0Y%3D" class="ml-2 link link-style-1 btn-sm"  title="외국인 유학생 보험 공지 새창 바로가기">Link</a>
							</span>
							</li>
						</ul>
					</div>
					<!--게시글 END -->
				</div>
			</div>
			<!-- 아코디언 END -->
		</div>
		<!-- /END CONTENT  BODY-->
		</section>
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td>#:SYEAR#</td>
	    <td>#:TERM_GCD#</td>
	    <td>#:FOREIGN_STDT_INSURE_PAY_GCD#</td>
	    <td class="">#:PAY_DATE#</td>
	    <td class="text-right">#:INSURE_AMT#</td>
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
		agreeDltInfo = [];
	}
	/***************************************************************************
	 * fn_setInit  화면 초기값 세팅
	 **************************************************************************/
	function fn_setInit() {
		gfn_com_dataBind($("#main"), scwin.loginUser);
		fn_Chkschd();
	}

	/***************************************************************************
	 * fn_Chkschd  등록 학년도 학기 조회
	 **************************************************************************/
	function fn_Chkschd() {
		gfn_ajax_request({
			url : "/ost/enroll/gojidocuprint/gojidocu/selectSchd",
			success : function(data, responseData) {
				$("#hdYear").val(data.SYEAR);
				$("#hdTerm").val(data.TERM_GCD);
				
				_year = data.SYEAR;  	
	    		_hakgi = data.TERM_GCD;
				// 보험료
				yearFo = data.SYEAR;
				termFo = data.TERM_GCD;

				$(".text-Schd").text(data.SYEAR + "학년도 " + data.TERM_GCD_NM);
				
				var report_txt=_year;
	    		if(_hakgi=="0010"){
	    			report_txt += "학년도 1학기 고지서"
	    		}else if(_hakgi=="0020"){
	    			report_txt += "학년도 2학기 고지서"
	    		}
	    		$("#report_txt").text(report_txt);
	    		
	    		fn_sch();  //보험료 납부내역
				
			}
		});
		
		

	}
	/***************************************************************************
	 * fn_sch  외국인보험료 납부내역 조회
	 **************************************************************************/
	function fn_sch() {
		paramMap = {
			"SYEAR" : $("#hdYear").val(),
			"TERM_GCD" : $("#hdTerm").val()
		};

		gfn_ajax_request({
			url : "/ost/enroll/gojidocuprint/fnestdtInsuregojidocu/selectFneStdtInsure",
			reqData : paramMap,
			success : function(data, responseData) {

				if (data.length == 0){
						alert2("대상자가 아닙니다. ",function (e){history.back();});
						return;


				}
				var len = JSON.stringify(data.length);
				for (var i = 0; i < len; i++) {
					data[i].INSURE_AMT = gfn_str_numberWithCommas(data[i].INSURE_AMT);
					
				};
				$("#resultTbody").listView({ 
					dataSource : data,
					emptyComment : '출력할 데이터가 없습니다.',
					dataBound : function(e) {
						currentData = data;
					},
					template : $("#resultTemplate"),
					totalCnt : data.length,
					totalViewYn : "N" 
				});

			}
		});
	}
	
	var printChk = false;
	var agreeDltInfo = [];
	function fn_clause() {
		/* 정보동의팝업 호출 */
		gfn_com_clausePop({
			title : '정보동의팝업',
			systemGcd : '0002', /* 공통.약관관리(SYS_CLAUSE_MNG) 테이블의 시스템구분코드(SYSTEM_GCD) */
			clauseSeqNo : 33, /* 공통.약관관리(SYS_CLAUSE_MNG) 테이블의 약관순번(CLAUSE_SEQ_NO) */
			callbackFunc : function(data){
				/* 필수동의 사항에 동의한 경우 콜백 실행 */
				agreeDltInfo = data;
				printChk = true;
				fn_preReport(printChk);
			}
		});
		
		return printChk;
	}
	/***************************************************************************
	 * fn_preReport  출력 전 체크함수
	 **************************************************************************/
	function fn_preReport(chk) {
		if(!chk) return;
		
		paramMap = {
				"SYEAR" : $("#hdYear").val(),
				"TERM_GCD" : $("#hdTerm").val()
			};
		
		paramMap["agreeDltInfo"] = agreeDltInfo;

			gfn_ajax_request({
				url : "/ost/enroll/gojidocuprint/fnestdtInsuregojidocu/printChkFneStdtInsure",
				reqData : paramMap,
				success : function(data, responseData) {
					if(data.ERRMSG=="N"){
						alert(data.MSG);
					}else{
						fn_openReport();
					}
				}
			});
	}
	
	/***************************************************************************
	 * fn_openReport  출력
	 **************************************************************************/
	function fn_openReport() {
		
		var options ={};
                    
        //options.rptName = "/ses/enroll/gojidocuprint/fnestdtInsuregojidocu/FneStdtInsureGojiDocu_001.crf";
        options.rptName = "/ses/enroll/fsmmng/FsmGojiDocuPrint_001.crf";
        
        
   
        //파라메터 설정
        var objParam = {};
        objParam.SYEAR = $("#hdYear").val();
        objParam.TERM_GCD = $("#hdTerm").val();
        objParam.STDT_NO = scwin.loginUser.userId;
        objParam.CASU = "1";
        //레포트를 생성시킬 group component 또는 id를 넣는다.
        options.div = 'grp_report';
        
		objParam.bind = [{
			 db : "ENROLL",
             proc : "DR_외국인보험료_고지서_출력_조회",
             params : [$("#hdYear").val(),$("#hdTerm").val(),"", scwin.loginUser.userId]
    	}];

    	

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
        options.personInfoIncludeFg = "Y";
        fn_openPopup(options);
	}
	
	function fn_openPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "외국인보험료고지서",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
	
</script>