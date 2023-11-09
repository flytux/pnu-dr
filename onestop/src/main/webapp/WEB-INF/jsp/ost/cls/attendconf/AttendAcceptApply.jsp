<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
	                <h2 class="sec-title"></h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<!-- /END CONTENT HEADER -->		
			
			<!-- CONTENT BODY -->		
			<div class="sec-body">
			
			<!-- 기본정보 -->
			<section class="sec-2">
				<header>
					<h4 class="sec-title">기본정보</h4>
				</header>				
				<div class="b-table-box flex-col-3" role="table" aria-label="기본정보">
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
			</section>
			<!-- /END 기본정보 -->						
			
			<!-- 검색영역 -->
			<div class="search-box">
				<div class="b-table-box flex-col-3" role="table" aria-label="조회">
					<div class="b-row-box" role="row">
						<div class="b-row-item merge-2">
							<div class="b-title-box" role="rowheader">
							    <label class="req" for="SCH_SYEAR" data-lang>학년도/학기</label>
							</div>
							<div class="b-con-box" role="cell">
								<select id="SCH_SYEAR" class="form-control" style="width:30%;" onchange="fn_sch();" title="학년도선택"></select>&nbsp;
								<select id="SCH_TERM_GCD" class="form-control" style="width:30%;" onchange="fn_sch();" title="학기선택"></select>
								<input id="SCH_STDT_NO" class="form-control" style="display:none;"></input>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 메시지 박스 -->
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn">※ 출석인정신청 절차 : (학생)출석인정신청 → (학과)승인 → (단과대학)최종승인 → (학생)출석인정허가서 출력 후 교과목 담당교원에게 제출 → (담당교원)출석처리</span></li>
  								<li><span class="dfn">※ 기타 자세한 사항은 매뉴얼을 참고하여 주시기 바랍니다.</span></li>
								<li><span class="dfn">※ <span id="SYEAR_DATA"></span>학년도 <span  id="TERM_GCD_NM_DATA"></span> 신청기간입니다. <span  id="START_DATE_DATA"></span> ~ <span  id="CLOSE_DATE_DATA"></span></span></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->
				
				<div class="btn-box">
					<div class="form-row">
						<div class="col-auto">
                               <button class="btn search-btn" type="button" onclick="fn_openPopup();" data-lang id="apply_btn">신청</button>
						</div>
					</div>
				</div>				
			</div>	
			<!-- /END 검색영역 -->
			
			<!-- 테이블 리스트 - 헤더 고정 -->
			<section class="sec-2">
				<header>
					<h4 class="sec-title">신청내역</h4>
				</header>
				<div class="sec-body">
					<div class="table-box" >
						<div class="table-body">
							<table class="table table-hover" data-toggle="table" data-show-columns="false">
								<caption>출석인정신청 내역</caption>
								<colgroup>
									<col style="min-width: 30px;">
									<col style="min-width: 30px;">
									<col style="min-width: 30px;">
									<col style="min-width: 100px;">
									<col style="min-width: 100px;">
									<col style="min-width: 30px;">
									<col style="min-width: 100px;">
									<col style="min-width: 70px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">NO</th>
										<th scope="col">학년도</th>
										<th scope="col">학기</th>
										<th scope="col">교과목명</th>
										<th scope="col">교과목번호</th>
										<th scope="col">분반</th>
										<th scope="col">기간</th>
										<th scope="col">사유</th>
										<th scope="col">승인여부</th>
										<th scope="col"></th>
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
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:SYEAR#</td>
	    <td>#:TERM_GCD_NM#</td>
	    <td>#:SUBJ_NM #</td>
	    <td>#:SUBJ_NO#</td>
	    <td>#:CLASS_NO#</td>
	    <td>#:ATTEND_START_DATE #~#:ATTEND_CLOSE_DATE #</td>
	    <td>#:APPLY_REASON_GCD_NM #</td>
	    <td>#:ATTEND_REQ_STA_GCD_NM #</td>
  		# if( :ATTEND_REQ_STA_GCD == "0006") {# <td><button class="btn btn-new " onclick="fn_openReport('#:SYEAR#', '#:TERM_GCD#', '#:SUBJ_NO#', '#:CLASS_NO#','#:SEQ_NO#','#:STDT_NO#')" data-lang>출력</button></td>#} 
				else if ( :ATTEND_REQ_STA_GCD == "0001") {# <td><button class="btn btn-delete " onclick="fn_delete('#:ATTEND_REQ_STA_GCD#', '#:SYEAR#', '#:TERM_GCD#', '#:SUBJ_NO#', '#:CLASS_NO#','#:SEQ_NO#')" data-lang>삭제</button></td>#} 
				else{# <td><button class="btn btn-delete " onclick="fn_alertMsg();" data-lang>삭제</button></td> #}#
	</tr>
</script>

<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/javascript">

var date = new Date();
var maxdate = date.getFullYear();

//var stdtNo = scwin.loginUser.userId;
var stdtNm = scwin.loginUser.nm;

var CollGradGcdNm = scwin.loginUser.collGradGcdKorNm;
var CollGradGcd = scwin.loginUser.collGradGcd;
var CollCdKorNm = scwin.loginUser.collCdKorNm;
var deptCdNm = scwin.loginUser.deptCdKorNm;
var majorCdNm = (scwin.loginUser.majorCdKorNm == null) ? '' : scwin.loginUser.majorCdKorNm;
var courseGcdNm = scwin.loginUser.degCourseGcdKorNm;
var yearGcd = (CollGradGcd == "0001") ? scwin.loginUser.stdtYearGcdKorNm : scwin.loginUser.cmplTermCnt + '학기' ;
var hjSta = scwin.loginUser.hjStaGcdKorNm;


	function fn_initScreen() {	
		
		// 출력물
		//fn_openReport(false);
		

		(CollGradGcd == "0001") ? $("#YEAR_TERM").text("학년") : $("#YEAR_TERM").text("학기");
		
		// 소속(과정)
		$("#DEPT").text(CollGradGcdNm + " " + CollCdKorNm + " " + deptCdNm + " " + majorCdNm + "(" + courseGcdNm + ")");
		// 학번(성명)
		$("#STDT_NO_VAL").text(scwin.loginUser.userId + " (" + stdtNm + ")");
		// 학년(학기)
		$("#TERM_GCD").text(yearGcd);
		// 학적상태
		$("#HJ_STA_GCD").text(hjSta);		
		
		/*학년도 바인드*/
		let termInfo;
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : "2021",
				"ENDYEAR" : maxdate
			},
			success : function(data, responseData) {
				$("#SCH_SYEAR").dropDownList({
					dataSource : data,
					commonCode : "",
					dataTextField : "LABEL",
					dataValueField : "CODE",
					optionLabel : "",
					optionValue : "",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {
						termInfo = responseData.termInfo;
						
						$("#SCH_SYEAR").val(responseData.termInfo.SYEAR);
						$("#SYEAR_DATA").text(responseData.termInfo.SYEAR);
						
						//fn_schLecDate(termInfo);
					}
				});
				$("#SCH_TERM_GCD").dropDownList({
					dataSource : null,
					commonCode : "0001_TERM_GCD",
					dataTextField : "COMMON_DETAIL_CD_KOR_NM",
					dataValueField : "COMMON_DETAIL_CD",
					optionLabel : "",
					optionValue : "",
					defaultValue : "",
					expnCondition : "AND COMMON_DETAIL_CD IN ('0010', '0020', '0011', '0021') AND CHAR_1_CONTENT LIKE '%B%' " ,
					dataBound : function(e) {
						$("#SCH_TERM_GCD").val(termInfo.TERM_GCD);
						$("#TERM_GCD_NM_DATA").text(responseData.termInfo.TERM_GCD_KOR_NM);
						fn_sch();
					}
				});
			}
		});
		
		
	}

	/***************************************************************************
	 * 입력 필수 조건 확인
	 **************************************************************************/
	function fn_validate(param) {
		var rtnValue = true;
		
		rtnValue = gfn_val_validateDataMap(param, [ {
			"id" : "SCH_SYEAR",
			"name" : "학년도",
			"notNull" : true
		}, {
			"id" : "SCH_TERM_GCD",
			"name" : "학기",
			"notNull" : true
		},	]);
		
		if (!rtnValue){
			return rtnValue;
		}
		
		return rtnValue;	
	}	
	
	/***************************************************************************
	 * 신청내역조회
	 **************************************************************************/
	function fn_sch(data) {	
		fn_schLecDate();
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".search-box"));
            
            // 팝업으로 넘겨줄 값
            scwin.detailObj = data; 
            scwin.detailObj.YEAR = maxdate;
            scwin.detailObj.MONTH = date.getMonth()+1;
            scwin.detailObj.DATE = date.getDate();
            scwin.detailObj.COLLNAME = CollCdKorNm;
            scwin.detailObj.SCH_TERM_GCD_NM = $("#SCH_TERM_GCD option:checked").text();
            
        }

		/* 필수체크 */
		if (!fn_validate(data)){
			return false;
		}
		
		/* ajax처리 */
		gfn_ajax_request({
            url : "/ost/cls/attendconf/attendacceptapply/selectAttendAcceptApply",
            	reqData : data,
                success : function(data, responseData) {        
                	$("#resultTbody").listView({
                        dataSource : data,
                        emptyComment : "출석인정 신청내역이 없습니다.",
                        dataBound : function(e) {	
                            totalCnt = responseData.pageInfo.totCnt;
                            currentData = data;
                        },
                        template : $("#resultTemplate"),
                        totalCnt : responseData.totalCnt,
                        paging : {
                            pageInfo : responseData.pageInfo,
                            reqData : responseData.reqData,
                            func : "fn_sch"
                        }
                    });
                }
          });			
			
			
		}
	
	/***************************************************************************
	 * 학사일정 조회
	 **************************************************************************/
	function fn_schLecDate(data) {
		var param = gfn_com_inputdata($(".search-box"));
		param.SYEAR = param.SCH_SYEAR;
		param.TERM_GCD = param.SCH_TERM_GCD;
		gfn_ajax_request({
			url : "/ost/cls/attendconf/attendacceptapply/selectLecDate",
			reqData : param,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data)) {
					$("#START_DATE_DATA").text(data[0].START_DT)
					$("#CLOSE_DATE_DATA").text(data[0].CLOSE_DT)
					$("#SYEAR_DATA").text($("#SCH_SYEAR option:checked").text());
					$("#TERM_GCD_NM_DATA").text($("#SCH_TERM_GCD option:checked").text());
					
					if(data[0].APPLY_FG == 'N'){
						alert("출석인정 허가서를 작성할 수 없습니다. \n 조회만 가능합니다.");
						$("#apply_btn").hide();
					}else{
						$("#apply_btn").show('');
					}
				}
			}
		});
	}
	
	/***************************************************************************
	 * 신청내역 삭제
	 **************************************************************************/
	function fn_delete(attendReqStaGcd,syear,termGcd,subjNo,classNo,seqNo) {
		
		
		// 버튼 비활성화 여부로 체크했는데 또 필요??
  		if(attendReqStaGcd == '0006'){
			alert("승인된 자료는 삭제 할 수 없습니다.");
			return;
		}else if(attendReqStaGcd == '0009'){
			alert("반려된 자료는 삭제 할 수 없습니다.");
			return;
			
		}else if(attendReqStaGcd != '0001'){
			alert("처리 중인 자료는 삭제 할 수 없습니다.");
			return;
			
		}else if(attendReqStaGcd == '0001'){
		}
 		
		confirm("신청내역을 삭제하시겠습니까?",function(_flag){
    		if(_flag) {
    			var param = gfn_com_inputdata($(".search-box"));
    			
    			param.SYEAR = syear;
    			param.TERM = termGcd;
    			param.SUBJ_NO = subjNo;
    			param.CLASS_NO = classNo;
    			param.SEQ_NO = seqNo;
    			
    			 gfn_ajax_request({
   					url : "/ost/cls/attendconf/attendacceptapply/saveAttendAcceptApply",
   					reqData : param,
   					success : function(data, responseData) {
   						alert("정상적으로 삭제 되었습니다.");
    					fn_sch();
   						
   					}
   				});
    		}
		}
	)}	
	
	/***************************************************************************
	 * 출력
	 **************************************************************************/	
	function fn_openReport(syear,termGcd,subjNo,classNo,seqNo,stdtNo) {
		var options ={};
                    
        options.rptName = "/ses/cls/attendconf/AttendAcceptApply_001.crf";
   
        //파라메터 설정
        //var objParam = dma_SearchParam.getJSON();
        var objParam = {};
        objParam.SYEAR				=syear;  //기준년도
        objParam.TERM_GCD		=termGcd;  //기준월
        objParam.SUBJ_NO			=subjNo; 
        objParam.CLASS_NO 		=classNo; 
        objParam.SEQ_NO			=seqNo; 
        objParam.STDT_NO			=stdtNo; 
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

        fn_openPrintPopup(options);

	}
	
	function fn_openPrintPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "출석인정허가서",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}	

	/***************************************************************************
	 * 신청하기 팝업
	 **************************************************************************/		
	function fn_openPopup(param) {
		gfn_com_modalPopup({
			width : 1200,
			height : 800,
			index : 1,
			target : null,
			title : "출석인정 신청",
			include : "/html/ost/cls/attendconf/AttendAcceptApplyPop.html"
		});
	}	
	
	/***************************************************************************
	 * 신청하기 팝업
	 **************************************************************************/		
	function fn_alertMsg(){
		alert("승인된 자료는 삭제 할 수 없습니다.");
		return;
	}
	
</script>