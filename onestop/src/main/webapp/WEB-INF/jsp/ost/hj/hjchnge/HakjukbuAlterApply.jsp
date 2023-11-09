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
				<section class="sec-2">
					<div class="sec-body">
						<ol class="flow-list">
							<li id="level1">
								<div class="txt-box">
									<strong>01. 접수</strong><span id="level1Date"></span>
								</div>
							</li>
							<li id="level2">
								<div class="txt-box">
									<strong>02. 최종승인/반려</strong><span id="level2Date"></span>
								</div>
							</li>
						</ol>
						<!-- 테이블 -->
						<div class="table-box">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table" data-show-column="true">
									<caption>학적부기재사항정정 신청정보</caption>
									<colgroup>
										<col style="min-width: 20px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 160px;">
										<col style="min-width: 140px;">
										<col style="min-width: 100px;">
										<col style="min-width: 120px;">
										<col style="min-width: 80px;">
										<col style="min-width: 140px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">No</th>
											<th scope="col">신청학년도</th>
											<th scope="col">신청학기</th>
											<th scope="col">사유구분</th>
											<th scope="col">신청내용</th>
											<th scope="col">첨부파일</th>
											<th scope="col">신청일자</th>
											<th scope="col">승인여부</th>
											<th scope="col">승인일시</th>
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
									<button class="btn btn-primary mb-2" data-lang onclick="fn_openPopup('C')" id="btnApply">신청</button>
								</div>
							</div>
						</div>
					</div>
				</section>
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;" class=#:STA_GCD # onclick = "fn_setTemplate(this)">
		<td>#:RN#</td>
        <td>#:APPLY_SYEAR#</td>
	    <td >#:APPLY_TERM_NM#</td>
	    <td class="text-left">
			# if( :STA_GCD== "0001"){#<a href ="#popup">#:CHG_APPLY_REASON_NM#</a>#} #
			# if( :STA_GCD!= "0001") {# #:CHG_APPLY_REASON_NM# #}#
		</td>
	    <td class="text-left">#:APPLY_CONTENT#</td>
	    <td><a class="text-primary"  href ="#popup" onclick="fn_fileDownload(this);">#:FILE_NM#</a></td>
	    <td class="applyDate">#:APPLY_DATE#</td>
  		<td># if( :STA_GCD== "0001") {# <span class="badge badge-pil badge-warning">접수</span>#} 
				  else if ( :STA_GCD == "0002") {# <span class="badge badge-pil badge-primary">학과승인</span>#} 
				  else if ( :STA_GCD == "0003" || :STA_GCD == "0004") {# <span class="badge badge-pil badge-success">최종승인</span> #} 
				  else if ( :STA_GCD == "0005" || :STA_GCD == "0006" || :STA_GCD == "0007" || :STA_GCD == "0008") {# <span class="badge badge-pil badge-danger">반려</span> #}#
		</td>
  		<td class="approveDate">#:APPROVE_DT#</td>
	</tr>
</script>
<script type="text/javascript">
	var paramData = {};
	var termInfo = {};
	var applyList = [];
	
	function fn_initScreen() {
		fn_sch();
	}
	
	function fn_setTemplate(obj) {
		var trObj = $(obj);
		if(trObj.attr("class") == "0001" || trObj.attr("class") == "0002" || trObj.attr("class") == "0003") {			
			$("#level1Date").html(applyList[trObj.index()].APPLY_DT);
			$("#level2Date").html("");
			$("#level1").removeClass("disabled");
			$("#level2").addClass("disabled");
		}else if(trObj.attr("class") == "0004" || trObj.attr("class") == "0005") {
			$("#level1Date").html(applyList[trObj.index()].APPLY_DT);
			$("#level2Date").html(applyList[trObj.index()].APPROVE_DT);
			$("#level1").removeClass("disabled");
			$("#level2").removeClass("disabled");
		}
	}

	function fn_getSessionInfo(param) {
		scwin.detailObj.STDT_NO = scwin.loginUser.userId;
		scwin.detailObj.STDT_KOR_NM = scwin.loginUser.nm;
		scwin.detailObj.STDT_INFO = scwin.loginUser.userId + '(' + scwin.loginUser.nm + ')';
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
		scwin.detailObj.HJ_STA_NM = scwin.loginUser.hjStaGcdKorNm;
		if (param == "C") {
			scwin.detailObj.APPLY_SYEAR_TERM = termInfo.SYEAR + "학년도 /" + termInfo.TERM_GCD_KOR_NM;
			scwin.detailObj.APPLY_SYEAR = termInfo.SYEAR;
			scwin.detailObj.APPLY_TERM_GCD = termInfo.TERM_GCD;			
			scwin.detailObj.CELLULAR_NO = scwin.loginUser.cellularNo;
			if (scwin.loginUser.cellularNo) {
				scwin.detailObj.CELLULAR_NO_TXT = scwin.loginUser.cellularNo.substr(scwin.loginUser.cellularNo.indexOf("|")+1, scwin.loginUser.cellularNo.length);
			}
		} else {
			fn_openPopup(param);
		}
	}

	function fn_openPopup(param) {
		if (param == "C") {
			// 처리미완료 신청건이 있으면 신청불가
			if ($("#resultTbody tr").find("td span.badge-warning").length > 0) {
				alert("처리완료되지 않은 정정신청이 이미 존재합니다.<br/> 변경하려면 신청취소 후 새로 입력하세요.");
				return;
			}
			scwin.rowState = 'C';
			scwin.detailObj = {};

			// 세션데이터 담기
			fn_getSessionInfo(param);

		}

		if (param == "U") {
			scwin.rowState = 'U';
		}
	    
		var perMsg = ""; 
		perMsg = "<stron>※ 학적부 기재사항 정정신청 안내 ※</strong><br/>";
		perMsg += "학적부 기재사항을 변경할 경우 반드시 아래 서류를 PDF파일로 제출하여 주시기 바랍니다.<br/>";
		perMsg += "If you change your personal information, please submit the following documents as a PDF file.<br/>";
		perMsg += "<strong><제출서류></strong><br/>";
		perMsg += "내국인: 학적부기재사항정정원, 주민등록초본, 신분증 사본<br/>";
		perMsg += "외국인(Foreigner): 학적부기재사항정정원, 외국인 등록증 사본( Application for Change of Personal Information, Copy of the ARC Card)";
		
		confirm(perMsg, function(_flag) {
            if (_flag) {
            	gfn_com_modalPopup({
                    width : 1200,
                    height : 800,
                    index : 1,
                    target : null,
                    title : "학적부기재사항정정 신청",
                    include : "/html/ost/hj/hjchnge/HakjukbuAlterApplyPop.html"
                });
            }
        });
	}

	function fn_sch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/hj/hjchnge/hakjukbuAlterApply/selectListHakjukbuAlterApply",
			reqData : paramData,
			success : function(data, responseData) {
				// 기준년도, 학기
				termInfo = responseData.termInfo;
				applyList = data;

				$("#resultTbody").listView({
					dataSource : data,
					dataBound : function(e) {
						// 접수 상태일 때만 상세보기 가능
						$("#resultTbody tr[class='0001']").find("td:eq(3)").bind("click", function(e) {
							scwin.detailObj = {};
							scwin.detailObj = $(this).closest("tr").data();

							fn_getSessionInfo("U");
						});
					},
					template : $("#resultTemplate"),
					totalCnt : responseData.totalCnt
				});
				
				if (!gfn_com_isEmptyObject(data)) {
					fn_setTemplate($("#resultTbody tr:eq(0)"));
					$("#resultTbody tr:eq(0)").find("td").addClass("active");
				}else {
					$("#level1").addClass("disabled");
					$("#level2").addClass("disabled");
					$("#level1Date").html("");
					$("#level2Date").html("");
				}
			}
		});
	}

	/* 첨부파일 다운로드 함수*/
	function fn_fileDownload(obj) {
		scwin.detailObj = $(obj).closest("tr").data();

		gfn_com_modalPopup({
			width : 800,
			height : 300,
			index : 1,
			target : null,
			title : "첨부파일 다운로드",
			include : "/html/ost/hj/hjchnge/HakjukbuAlterApplyDownloadPop.html"
		});
	}
</script>