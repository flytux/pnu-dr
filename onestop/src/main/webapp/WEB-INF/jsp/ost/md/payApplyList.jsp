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
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-2" role="table" aria-label="조회">

						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>학년도</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="" style="width: 49%">
										<select id="SCH_SYEAR" class="form-control" title="학년도선택"></select>
									</div>
									
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" data-lang for="SCH_TERM_GCD">학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="" style="width: 49%; margin-left: 3px;">
										<select id="SCH_TERM_GCD" class="form-control" title="학기선택"></select>
									</div>
								</div>
							</div>
						</div>

						<!-- 1Row -->

					</div>

					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /END 검색 영역 -->
				<!-- 테이블 -->
				<div class="table-box" id=grid01>
					<span id="textDiv" style="color: blue;"></span>

					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true"> <!-- data-height="350"  -->
							<caption>급여신청내역</caption>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">학년도</th>
									<th scope="col">학기</th>
									<th scope="col">학번</th>
									<th scope="col">성명</th>
									<th scope="col">신청일자</th>
									<th scope="col">지원금</th>
									<th scope="col">지급일시</th>
									<th scope="col">출력</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>
				</div>
				<!-- /END 테이블 -->
				<div class="btn-box">
					<div class="form-row btn-box-right">
						<div class="col-auto">
							<button class="btn btn-new mb-2" data-lang onclick="fn_openPopup('C')">신청</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr>
		<td>#:RN#</td>
        <td><a href="" id="detail-btn">#:SYEAR#</a></td>
        <td><a href="" id="detail-btn">#:TERM_GCD_NM#</a></td>
	    <td><a href="" id="detail-btn">#:STDT_NO#</a></td> 
	    <td><a href="" id="detail-btn">#:STDT_NM#</a></td>
	    <td>
			<a href="" id="detail-btn">#:INS_DT#</a>
		</td> 
		<td>
			# if( :INSURE_AMT != "null") { #
				<a href="" id="detail-btn">#:INSURE_AMT#원</a>
			#}#
		</td>
		<td>
			# if( :INSURE_PROCESS_DT != "null") { #
				<a href="" id="detail-btn">#:INSURE_PROCESS_DT#</a>
			#}#
		</td>
		<td>
			<input type="hidden" id="SYEAR" value="#:SYEAR#">
			<input type="hidden" id="TERM_GCD" value="#:TERM_GCD#">
			<input type="hidden" id="APPLY_SERIAL_NO" value="#:APPLY_SERIAL_NO#">
			<button class="btn btn-primary"  id="report-btn" type="button" >출력</button>
		</td>
	</tr>
</script>
<script type="text/javascript">
var paramData ={};

	function fn_initScreen() {		
		fn_setCommonCd();
		
		fn_sch();
	}
	
	
	/***************************************************************************
	 * fn_setCommonCd
	 **************************************************************************/
	function fn_setCommonCd() {
		var date = new Date();
		var maxdate = date.getFullYear();
		
		/*학년도 바인드*/
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" :maxdate-9,
				"ENDYEAR" : maxdate
			},
			success : function(data, responseData) {

				$("#SCH_SYEAR").dropDownList({
					dataSource : data,
					commonCode : "",
					dataTextField : "LABEL",
					dataValueField : "CODE",
					optionLabel : "전체",
					optionValue : "all",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {
						termInfo = responseData.termInfo;
						$("#SCH_SYEAR").val("all"); //responseData.termInfo.SYEAR
						$("#SCH_SYEAR").on("change",function(){
							if($(this).val() == ""){
								$("#SCH_TERM_GCD").val("");
							}
						});
					}
				});
				
				/*학기 공통코드 바인드*/
				$("#SCH_TERM_GCD").dropDownList({
					dataSource : null,
					commonCode : "0001_TERM_GCD",
					dataTextField : "COMMON_DETAIL_CD_KOR_NM",
					dataValueField : "COMMON_DETAIL_CD",
					optionLabel : "전체",
					optionValue : "all",
					defaultValue : "",
					expnCondition : "AND CHAR_1_CONTENT LIKE 'A%' ",
					dataBound : function(e) {
						$("#SCH_TERM_GCD").val("all"); //termInfo.TERM_GCD
					}
				});
				
				

			}
		});
		
		
	}
	
	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		//data["SYEAR"] = paramData.SYEAR;
		//data.TERM_GCD = paramData.TERM_GCD;
		if(data.SCH_SYEAR == null){
			data.SCH_SYEAR="all"; //scwin.termInfo.SYEAR;
		}
		
		if(data.SCH_TERM_GCD == null){
			data.SCH_TERM_GCD="all";  //scwin.termInfo.TERM_GCD;
		}
		
		gfn_ajax_request({
			url : "/ost/md/payApplyList",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody").listView({
					dataSource : data,
					dataBound : function(e) {
						$('#resultTbody #detail-btn').attr("href","#popups");
						//totalCnt = responseData.pageInfo.totCnt;
						$('#resultTbody #detail-btn').bind("click", function(e){
							scwin.detailObj = $(this).closest("tr").data();  
							fn_openPopup('U');
		                });
						//onclick="fn_detail('#:APPLY_SERIAL_NO')"
						
						$('#resultTbody #report-btn').bind("click", function(e){
							scwin.detailObj = $(this).closest("tr").data();  
							fn_openReport();
		                });
						
					},
					template : $("#resultTemplate"),
					totalCnt : data.length,
					
				});
			}
		});
	}
	
	/***************************************************************************************************
	* 등록 팝업 
	***************************************************************************************************/
	function fn_openPopup(param) {
		if(param == "C") {
			scwin.rowStatus = 'C';
			scwin.detailObj = {};
			
		};
		if(param == "U") {scwin.rowStatus = 'U';};
		
		gfn_com_modalPopup({
			width : 1500,
			height : 730,
			index : 3,
			target : null,
			title : "학생의료공제회급여신청서",
			include : "/html/ost/md/payApplyPop.html"
		});
	}
	
	
	function fn_openReport(isPop) {
		var options ={};
                    
        options.rptName = "/ses/md/PayApplyPrint.crf";
        //파라메터 설정
        var objParam = {};
        objParam.USER_NM = scwin.loginUser.nm;
        objParam.bind = [{
                        db : "ENROLL",
                        proc : "DR_의료공제회급여신청_조회_담당자",
                        params : [scwin.detailObj.SYEAR,scwin.detailObj.TERM_GCD,scwin.detailObj.STDT_NO]
                }];
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
        fn_openReportPopup(options);
	}
	
	function fn_openReportPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "고지서",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
</script>