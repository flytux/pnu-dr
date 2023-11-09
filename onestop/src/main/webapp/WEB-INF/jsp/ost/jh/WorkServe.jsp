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
				
			<div class="sec-body">
			<!-- CONTENT BODY -->		
			<div class="stdt-info">
			<div class="search-box">
			
				<input type="hidden" id="SYEAR" class="form-control" /> 
				<input type="hidden" id="TERM_GCD" class="form-control" /> 
				<input type="hidden" id="TERM_NM" class="form-control" /> 
				<input type="hidden" id="STDT_NO" class="form-control" /> 
				
				<input type="hidden" id="JH_CHARGE_VIA_GCD" class="form-control" />
				<input type="hidden" id="JH_GCD" class="form-control" />
				<input type="hidden" id="JH_CD" class="form-control" />
				
				<input type="hidden" id="WORK_DATE" class="form-control" />
				<input type="hidden" id="WORK_ST_TIME" class="form-control" />
				<input type="hidden" id="WORK_ST_MINUTE" class="form-control" />
				<input type="hidden" id="WORK_END_TIME" class="form-control" />
				<input type="hidden" id="WORK_END_MINUTE" class="form-control" />
				<input type="hidden" id="TASK_CONTENT" class="form-control" />
				
				<input type="hidden" id="MONTH" class="form-control" /> 
				
				
			</div>
			<!-- 기본정보 -->
			<section class="sec-1">
				<header>
					<h4 class="sec-title">기본정보</h4>
				</header>			
				<div class="b-table-box flex-col-3" role="table" aria-label="기본정보">
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>대학(원)</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="STDT_UNIV" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>학위</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="STDT_COURSE" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>학과(부)</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="STDT_DEPT" data-lang></div>
							</div>
						</div>
					</div>
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>학번</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="SCH_STDT_NO" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label id="YEAR_TERM" data-lang>학년</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="STDT_YEAR" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>성명</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="STDT_NM" data-lang></div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /END 기본정보 -->		
			
			<div class="text-secondary">① 학년도, 학기, 월을 선택 후 검색하세요.<br>Select Academic Year, Semester and Month of Work, and then press 'Search' button</div>
			
			<!-- 검색 -->
			<section class="sec-2">
				<div class="b-table-box flex-col-3" role="table" aria-label="기본정보">
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label for="SCH_SYEAR" data-lang>학년도<br>Academic Year</label>
							</div>
							<div class="b-con-box" role="cell">
								<select id="SCH_SYEAR" class="form-control"></select>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label for="SCH_TERM_GCD" data-lang>학기<br>Semester</label>
							</div>
							<div class="b-con-box" role="cell">
								<select id="SCH_TERM_GCD" class="form-control"></select>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label for="SCH_MONTH" data-lang>근무 월<br>Month of Work</label>
							</div>
							<div class="b-con-box" role="cell">
								<select id="SCH_MONTH" class="form-control">
								</select>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /END 검색 -->
			<div class="btn-box">
				<div class="form-row btn-box-right">
					<div id="btn_cancel" class="col-auto">
						<button class="btn btn-primary search-btn" type="button" onclick="javascript:return fn_schWorkInfo();" data-lang>조회</button>
					</div>
				</div>
			</div>
			<div class="text-secondary">② 근무정보를 확인하세요.<br>Check your work information.</div>
			
			
			<!-- 테이블 리스트 - 헤더 고정 -->
			<section class="sec-3">
				<div class="table-box table-list">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>근무정보</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">장학금구분</th>
									<th scope="col">근무기관1</th>
									<th scope="col">근무기관2</th>
									<th scope="col">근무부서</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
						</table>
					</div>
				</div>
			</section>
			<!-- /END 테이블 -->
			<p>
			<div class="text-secondary">③ 일지 정보를 입력/수정하세요. (확정된 자료는 수정, 삭제 할 수 없습니다.)</div><div class="text-danger">* 수업시간과 중복될 경우 근로시간은 인정되지 않습니다.</div>
			<div class="text-secondary">Write/Revise your daily work record. (Confirmed data is impossible to edit and erase.)</div><div class="text-danger">* If the work time conflicts with your class. working hours will not be counted.</div>
			</p>
			
			<div class="text-primary" id="APPLY_DATE"></div>
			<!-- 수정/삭제 -->
			<section class="sec-4">
				<div class="b-table-box flex-col-3" role="table" aria-label="기본정보">
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label for="WORK_DATE_DATA" data-lang>업무일자<br>Date of Work</label>
							</div>
<!-- 							<div class="b-con-box" role="cell"> -->
<!-- 								<input class="form-control" type="text" id="WORK_DATE_DATA"> -->
<!-- 							</div> -->
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="WORK_DATE_DATA" name="siteCheckEnymd" class="form-control calendar" /><!-- 캘린더 : class에 datepicker추가 -->
                                </div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label for="WORK_ST_TIME_DATA" data-lang>업무시작시간<br>Start Time of Work</label>
							</div>
							<div class="b-con-box" role="cell">
								<select id="WORK_ST_TIME_DATA" class="form-control col-4" title="업무시작시선택"></select>&nbsp;:&nbsp; 
								<select id="WORK_ST_MINUTE_DATA" class="form-control col-4" title="업무시작분선택">
								</select>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label for="WORK_END_TIME_DATA" data-lang>업무종료시간<br>Closing Time of Work</label>
							</div>
							<div class="b-con-box" role="cell">
								<select id="WORK_END_TIME_DATA" class="form-control col-4" title="업무종료시선택"></select>&nbsp;:&nbsp; 
								<select id="WORK_END_MINUTE_DATA" class="form-control col-4" title="업무종료분선택">
								</select>
							</div>
						</div>
					</div>
					<div class="b-row-box" role="row">
						<div class="b-row-item merge-3">
							<div class="b-title-box" role="rowheader">
								<label for="TASK_CONTENT_DATA" data-lang>업무내용<br>Details of Work</label>
							</div>
							<div class="b-con-box" role="cell">
								<input class="form-control" type="text" id="TASK_CONTENT_DATA">
								<div>(*250자 내외)</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /END 수정/삭제 -->
			
			<div class="btn-box">
				<div class="form-row btn-box-right">
					<div class="col-auto">
                              <button class="btn btn-primary search-btn" type="button" onclick="javascript:return fn_Write();" id="insert_btn" data-lang>입력</button>
                              <button class="btn btn-primary search-btn" type="button" onclick="javascript:return fn_update();" id="update_btn" data-lang>수정</button>
                              <button class="btn btn-primary search-btn" type="button" onclick="javascript:return fn_delete();" id="delete_btn" data-lang>삭제</button>
					</div>
				</div>
			</div>
			<br>
			<div class="btn-box">
				<div class="form-row btn-box-right">
					<div class="col-auto">
                    	<button class="btn btn-primary search-btn" type="button" onclick="javascript:return fn_openReport();" id="print_btn" data-lang>출력</button>
					</div>
				</div>
			</div>
			
			<div class="text-secondary">⑤ 선택된 근무 <span class="text-primary"><span class="text-primary" id="SYEAR_TEXT"></span>학년도 <span class="text-primary" id="TERM_TEXT"></span>학기 <span class="text-primary" id="MONTH_TEXT"></span>월</span> 근로 내역을 확인하세요.<br>Please check your record of work in the semester you selected.</div>
			
			<!-- 테이블 리스트 - 헤더 고정 -->
			<section class="sec-5">
				<div class="table-box table-list">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>근로봉사내역</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">근로일<br>Date of Work</th>
									<th scope="col">근로시작시간<br>Start Time of Work</th>
									<th scope="col">근로종료시간<br>Closing Time of Work</th>
									<th scope="col">근로내역<br>Details of Work</th>
									<th scope="col">확정여부<br>Confirmation</th>
									<th scope="col">비고<br>Remarks</th>
								</tr>
							</thead>
							<tbody id="resultTbody2">
						</table>
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
	<tr style="cursor:pointer;" onclick="fn_schList('#:JH_CD#', '#:JH_GCD#', '#:JH_CHARGE_VIA_GCD#')">
		<td><a href ="#popup">#:JH_NM#</a></td>
        <td>#:ORGAN_NM1#</td>
	    <td>#:ORGAN_NM2#</td>
	    <td>#:WORK_PLACE_INFO#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;" onclick="fn_tdClick('#:CONF_FG#','#:WORK_DATE#', '#:WORK_START_HOUR_MINUTE_INFO#', '#:WORK_CLOSE_HOUR_MINUTE_INFO#', '#:TASK_CONTENT#')">
		<td>#:WORK_DATE#</td>
        <td>#:WORK_START_HOUR_MINUTE_INFO#</td>
	    <td>#:WORK_CLOSE_HOUR_MINUTE_INFO#</td>
	    <td><a href ="#popup">#:TASK_CONTENT#</a></td>
	    <td>#:CONF_FG#</td>
	    <td></td>
	</tr>
</script>

<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/javascript">

var date = new Date();
var maxdate = date.getFullYear();

var stdtNo = scwin.loginUser.userId;
var stdtNm = scwin.loginUser.nm;

var CollGradGcdNm = scwin.loginUser.collGradGcdKorNm;
var CollGradGcd = scwin.loginUser.collGradGcd;
var CollCdKorNm = scwin.loginUser.collCdKorNm;
var deptCdNm = scwin.loginUser.deptCdKorNm;
var majorCdNm = (scwin.loginUser.majorCdKorNm == null) ? '' : scwin.loginUser.majorCdKorNm;
var courseGcdNm = scwin.loginUser.degCourseGcdKorNm;

var yearGcd = (CollGradGcd == "0001") ? scwin.loginUser.stdtYearGcdKorNm : (scwin.loginUser.userGcd == "0003") ? scwin.loginUser.cmplTermCnt + '학기' : '' ;

var hjSta = scwin.loginUser.hjStaGcdKorNm;


	function fn_initScreen() {
		/* 콤보박스 선택 이벤트 선언 */
		$("select[id=WORK_ST_TIME_DATA],select[id=WORK_ST_MINUTE_DATA]").change(
			function() {
				var StTime = $("#WORK_ST_TIME_DATA").val() + $("#WORK_ST_MINUTE_DATA").val();
				if (StTime > 2300) {
					alert('23시부터 6시까지는 입력할 수 없습니다.(시작시간)');
					$("#WORK_ST_MINUTE_DATA").val('00');
				}
			});
		
		$("select[id=WORK_END_TIME_DATA],select[id=WORK_END_MINUTE_DATA]").change(
				function() {
					var EdTime = $("#WORK_END_TIME_DATA").val() + $("#WORK_END_MINUTE_DATA").val();
					if (EdTime > 2300) {
						alert('23시부터 6시까지는 입력할 수 없습니다.(종료시간)');
						$("#WORK_END_MINUTE_DATA").val('00');
					}
				});
		
		$("#insert_btn").hide();
		$("#update_btn").hide();
		$("#delete_btn").hide();
		$("#print_btn").hide();		
		
		setHour();
		setMin();
		setWorkMonth();
		
		(CollGradGcd == "0001") ? $("#YEAR_TERM").text("학년") : $("#YEAR_TERM").text("학기");
		
		$("#STDT_UNIV").text(CollGradGcdNm);
		$("#STDT_COURSE").text(courseGcdNm);
		$("#STDT_DEPT").text(deptCdNm);
		$("#SCH_STDT_NO").text(stdtNo);
		$("#STDT_YEAR").text(yearGcd);
		$("#STDT_NM").text(stdtNm);
		
		//fn_sch();
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
					expnCondition : "AND COMMON_DETAIL_CD IN ('0010', '0020')" ,//"AND CHAR_1_CONTENT LIKE '%B%' ",
					dataBound : function(e) {
						$("#SCH_TERM_GCD").val(responseData.termInfo.TERM_GCD);
						
						$("#TERM_GCD").val(responseData.termInfo.TERM_GCD);
						$("#TERM_NM").val(responseData.termInfo.TERM_GCD_KOR_NM); 
						
						 var data = {
								SYEAR : responseData.termInfo.SYEAR,
								TERM_GCD : responseData.termInfo.TERM_GCD
						};
						    
			            fn_schWorkInfo(data);
					}
				});
			}
		});
		
		/* setTimeout(() => {
			fn_schWorkInfo();
		}, 1000); */
	}

	/***************************************************************************
	 * 시간, 분, 월
	 **************************************************************************/	
		function setHour() {
			var array = [
				"startHour", "endHour"
			];
			for (var i = 0; i < array.length; i++) {
				var html = "";
				for (var j = 6; j <= 23; j++) {
					var k = j < 10 ? "0" + j : j;
					html += "<option value="+k+">" + k + "</option>";
				}
				$('#WORK_ST_TIME_DATA').html(html);
				$('#WORK_END_TIME_DATA').html(html);
			}
		}

		function setMin() {
			var array = [
				"startMin", "endMin"
			];
			for (var i = 0; i < array.length; i++) {
				var html = "";
				for (var j = 0; j <= 59; j++) {
					var k = j < 10 ? "0" + j : j;
					html += "<option value="+k+">" + k + "</option>";
				}
				$('#WORK_ST_MINUTE_DATA').html(html);
				$('#WORK_END_MINUTE_DATA').html(html);
			}
		}		


		function setWorkMonth(term) {
			var array = [
				"workMonth"
			];
			for (var i = 0; i < array.length; i++) {
				var html = "";
					for (var j = 1; j <= 12; j++) {
						var m = j > 12 ? j - 12 : j;
						var k = m < 10 ? "0" + m : m;
						html += "<option value="+k+">" + k + "</option>";
				}
				$('#SCH_MONTH').html(html);
				var now = new Date();
				
				var month = now.getMonth()+1;
				$('#SCH_MONTH').val(month);
				
			}
		}

	/***************************************************************************
	 * 입력기간 조회
	 **************************************************************************/
	 var insertDateFg = "";
	function fn_schDate(data) {
		
		// APPLY_DATE 초기화
		$("#APPLY_DATE").empty();
		
		$("#SYEAR").val($("#SCH_SYEAR").val());
		$("#TERM_GCD").val($("#SCH_TERM_GCD").val());
		
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".stdt-info"));
        }

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/jh/workserve/selectApplyDate",
			reqData : data,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data)) {
					
					if(data[0][0].O_RSLT == "N"){
						insertDateFg = "N";
						var a = '④ 입력기간 : 해당학기 입력기간이 아닙니다. 학생과로 문의하세요(510-1237)'
						$("#APPLY_DATE").append(a);
						
						$("#insert_btn").hide();
						$("#update_btn").hide();
						$("#delete_btn").hide();
						$("#print_btn").hide();
						
					}else if(data[0][0].O_RSLT == "Y"){
						insertDateFg = "Y";
						var term = ""
						if(data[1][0].학기 == "0010"){
							term = "1학기"							
						}else{
							term = "2학기"							
						}
						
						var a = '④ 입력기간 : ' + data[1][0].학년도 + " "  + term + " " +data[1][0].시작일시 + ' ~ ' + data[1][0].종료일시
						$("#APPLY_DATE").append(a);
						

					}
				}else{
					insertDateFg = "N";
					var a = '④ 입력기간 : 해당학기 입력기간이 아닙니다. 학생과로 문의하세요(510-1237)'
					$("#APPLY_DATE").append(a);
					
					$("#insert_btn").hide();
					$("#update_btn").hide();
					$("#delete_btn").hide();
					$("#print_btn").hide();
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
			"id" : "WORK_DATE_DATA",
			"name" : "업무일자",
			"notNull" : true
		}, {
			"id" : "WORK_ST_TIME_DATA",
			"name" : "업무시작시간",
			"notNull" : true
		}, {
			"id" : "WORK_ST_MINUTE_DATA",
			"name" : "업무시작분",
			"notNull" : true
		}, {
			"id" : "WORK_END_TIME_DATA",
			"name" : "업무종료시간",
			"notNull" : true
		}, {
			"id" : "WORK_END_MINUTE_DATA",
			"name" : "업무종료분",
			"notNull" : true
		}, {
			"id" : "TASK_CONTENT_DATA",
			"name" : "업무내용",
			"notNull" : true
		},	]);
		
		if (!rtnValue){
			return rtnValue;
		}
		
		return rtnValue;	
	}		
	
	/***************************************************************************
	 * 근무정보
	 **************************************************************************/
	 var jhCdVal;
	 var jhGcdVal;
	 var jhChargeViaGcdVal;
	function fn_schWorkInfo(data) {
		 jhCdVal = "";
		 jhGcdVal = "";
		 jhChargeViaGcdVal = "";
		 
		$("#SYEAR_TEXT").empty();
		$("#TERM_TEXT").empty();
		$("#MONTH_TEXT").empty();
		$("#resultTbody2").empty();
		
		// 초기화
		$("#resultTbody2").listView({
			dataSource : '',
			emptyComment : "등록된 근로내역이 없습니다.",
			dataBound : function(e) {
				totalCnt = 0;
				currentData = '';
			},
			template : $("#resultTemplate2"),
			totalCnt : 0,
			paging : null,
			excel : null
		});
		
		
		$("#SYEAR").val($("#SCH_SYEAR").val());
		$("#TERM_GCD").val($("#SCH_TERM_GCD").val());
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".stdt-info"));
        }

		/* ajax처리 */
		gfn_ajax_request({
            url : "/ost/jh/workserve/selectApplyEnter",
            	reqData : data,
                success : function(data, responseData) {
                	
                	$("#SYEAR_TEXT").append($("#SCH_SYEAR").val());
                	if($("#SCH_TERM_GCD").val() == "0010"){
                		$("#TERM_TEXT").append("1");
                	}else{
                		$("#TERM_TEXT").append("2");
                	}
                	$("#MONTH_TEXT").append($("#SCH_MONTH").val());
					
                	if(data.length > 0){
                		// 장학금코드 == 016 (근로봉사) / 장학금코드 == 007 (장학위원회인정자)
						if(($("#SYEAR").val() < '2020' && data[0].JH_CD == '016') || ($("#SYEAR").val() >= '2020' && data[0].JH_CD == '007')){
		 	    			$("#resultTbody").listView({
		    					dataSource : data,
		    					emptyComment : "해당학기 근로장학생이 아닙니다.",
		    					dataBound : function(e) {
		    						totalCnt = responseData.totalCnt;
		    						currentData = data;
		    					},
		    					template : $("#resultTemplate"),
		    					totalCnt : responseData.totalCnt,
		    					paging : null,
		    					excel : null
		    				});
		 	    			// 바로 조회
		 	    			$("#resultTbody tr:eq(0)").find("td").addClass("active");
		 	    			fn_schList(data[0].JH_CD, data[0].JH_GCD, data[0].JH_CHARGE_VIA_GCD);
							
						}else{
							alert("2019학년도 1학기부터 장학(연구)조교 근무상황 관리가 수기로 바뀜에 따라 근무기관에 문의하여 수기 근무상황부 작성 바랍니다.");
						}

					}else{
	    				$("#resultTbody").listView({
	    					emptyComment : "해당학기 근로장학생이 아닙니다.",
	    					dataBound : function(e) {
	    						totalCnt = responseData.totalCnt;
	    						currentData = data;
	    					},
	    					template : $("#resultTemplate"),
	    					totalCnt : responseData.totalCnt,
	    					paging : null,
	    					excel : null
	    				});
					}
                	
                }
          });			
			
		fn_schDate();
		}	
	
	/***************************************************************************
	 * 근로내역
	 **************************************************************************/
	function fn_schList(jhCd, jhGcd, jhChargeViaGcd) {
		 jhCdVal = jhCd;
		 jhGcdVal = jhGcd;
		 jhChargeViaGcdVal = jhChargeViaGcd;
		 
		$("#SYEAR").val($("#SCH_SYEAR").val());
		$("#TERM_GCD").val($("#SCH_TERM_GCD").val());
		$("#MONTH").val($("#SCH_MONTH").val());
		$("#JH_CD").val(jhCd);
		$("#JH_GCD").val(jhGcd);
		$("#JH_CHARGE_VIA_GCD").val(jhChargeViaGcd);
		
		/* 검색조건데이터 가져오기 */
        var data = gfn_com_searchData($(".stdt-info"));
		
		/* ajax처리 */
		gfn_ajax_request({
            url : "/ost/jh/workserve/selectWorkServe",
            	reqData : data,
                success : function(data, responseData) {
                	data1 = data[0];
            		data2 = data[1][0];
                	if(!gfn_com_isEmptyObject(data)){
                		$("#print_btn").hide();	
                		
                    	if(data2.GUBUN == '1'){
                    		alert(data2.TIME + " 시간 초과하였습니다. 근로 시간을 수정하세요.");
                    	}else{
                    		alert("학기 중 잔여 근로가능시간은 " + data2.TIME + " 시간입니다.");
                    	}
	    				$("#resultTbody2").listView({
	    					dataSource : data1,
	    					emptyComment : "등록된 근로내역이 없습니다.",
	    					dataBound : function(e) {
	    						totalCnt = data1.length;
	    						currentData = data1;
	    					},
	    					template : $("#resultTemplate2"),
	    					totalCnt : data1.length,
	    					paging : null,
	    					excel : null
	    				});
	    				if(insertDateFg == "Y"){
	    					$("#insert_btn").show();
// 	    					$("#print_btn").show();		
	    				}else{
	    					$("#insert_btn").hide();
// 	    					$("#print_btn").hide();		
	    				}
	    				
	    				// 바로 조회
	    				if(data[0].length > 0){
	    					$("#print_btn").show();
	    					
		 	    			$("#resultTbody2 tr:eq(0)").find("td").addClass("active");
		 	    			fn_tdClick(data[0][0].CONF_FG, data[0][0].WORK_DATE, data[0][0].WORK_START_HOUR_MINUTE_INFO, data[0][0].WORK_CLOSE_HOUR_MINUTE_INFO, data[0][0].TASK_CONTENT);
		 	    			
	    				}
                	}else{
                		$("#print_btn").hide();	
                		
	    				$("#resultTbody2").listView({
	    					dataSource : data1,
	    					emptyComment : "등록된 근로내역이 없습니다.",
	    					dataBound : function(e) {
	    						totalCnt = data1.length;
	    						currentData = data1;
	    					},
	    					template : $("#resultTemplate2"),
	    					totalCnt : data1.length,
	    					paging : null,
	    					excel : null
	    				});
                	}
                }
          });
		

		}
	
	/***************************************************************************
	 * 그리드 -> 폼
	 **************************************************************************/
	function fn_tdClick(confFg,workDate,workStartHour,workCloseHour,taskContent) {
		 if(taskContent != null && taskContent != ''){
			if(insertDateFg == "Y"){
				if(confFg == "확정"){
					$("#update_btn").hide();
					$("#delete_btn").hide();
				}else if("미확정"){
					$("#update_btn").show();
					$("#delete_btn").show();
				}
			}
			$("#WORK_DATE_DATA").val(workDate);
			$("#WORK_ST_TIME_DATA").val(workStartHour.substr(0,2));
			$("#WORK_ST_MINUTE_DATA").val(workStartHour.substr(5,2));
			$("#WORK_END_TIME_DATA").val(workCloseHour.substr(0,2));
			$("#WORK_END_MINUTE_DATA").val(workCloseHour.substr(5,2));
			$("#TASK_CONTENT_DATA").val(taskContent);
		
		 }
		
	}
	 
	/***************************************************************************
	 * [입력]
	 **************************************************************************/
	function fn_Write(data) {
		$("#SYEAR").val($("#SCH_SYEAR").val());
		$("#TERM_GCD").val($("#SCH_TERM_GCD").val());
		
		$("#WORK_DATE").val($("#WORK_DATE_DATA").val());
		$("#WORK_ST_TIME").val($("#WORK_ST_TIME_DATA").val());
		$("#WORK_ST_MINUTE").val($("#WORK_ST_MINUTE_DATA").val());
		$("#WORK_END_TIME").val($("#WORK_END_TIME_DATA").val());
		$("#WORK_END_MINUTE").val($("#WORK_END_MINUTE_DATA").val());
		$("#TASK_CONTENT").val($("#TASK_CONTENT_DATA").val());
		
		/* class="search-box"인 곳의 데이터 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".stdt-info"));
		}
		
		// 필수입력 조건 확인
		if (!fn_validate(data)) {
			return false;
		}
		
		if($("#TASK_CONTENT_DATA").val().length > 250){
			alert("업무내용은 250자 내외로 입력해야 합니다.");
			return false;
		}

		/* ajax처리 */
		confirm(
				gva_SAVE_CONFIRM_MSG,
				function(_flag) {
					if (_flag) {
						gfn_ajax_request({
							url : "/ost/jh/workserve/saveWorkInsert",
							reqData : data,
							success : function(data, responseData) {
								//alert("입력되었습니다.");
								if (!gfn_com_isEmptyObject(data)) {
									alert(data[0].Msg);
									fn_schList(jhCdVal, jhGcdVal, jhChargeViaGcdVal);
								}
							}
						});
					}
				});

	}
	
	/***************************************************************************
	 * [수정]
	 **************************************************************************/
	function fn_update(data) {
	
		$("#SYEAR").val($("#SCH_SYEAR").val());
		$("#TERM_GCD").val($("#SCH_TERM_GCD").val());
		
		$("#WORK_DATE").val($("#WORK_DATE_DATA").val().replace(/\-/g,''));
		$("#WORK_ST_TIME").val($("#WORK_ST_TIME_DATA").val());
		$("#WORK_ST_MINUTE").val($("#WORK_ST_MINUTE_DATA").val());
		$("#WORK_END_TIME").val($("#WORK_END_TIME_DATA").val());
		$("#WORK_END_MINUTE").val($("#WORK_END_MINUTE_DATA").val());
		$("#TASK_CONTENT").val($("#TASK_CONTENT_DATA").val());
		
		/* class="search-box"인 곳의 데이터 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".stdt-info"));
		}
		
		// 필수입력 조건 확인
		if (!fn_validate(data)){
			return false;
		}
		
		if($("#TASK_CONTENT_DATA").val().length > 250){
			alert("업무내용은 250자 내외로 입력해야 합니다.");
			return false;
		}
		
		/* ajax처리 */
		confirm(
				"수정하시겠습니까?",
				function(_flag) {
					if (_flag) {
						gfn_ajax_request({
							url : "/ost/jh/workserve/saveWorkServeUpdate",
							reqData : data,
							success : function(data, responseData) {
								if (!gfn_com_isEmptyObject(data)) {
									alert(data[0].Msg);
									fn_schList(jhCdVal, jhGcdVal, jhChargeViaGcdVal);
								}
							}
						});
					}
				});
		
	}
	 
	/***************************************************************************
	 * [삭제]
	 **************************************************************************/
	function fn_delete(data) {
		
		$("#SYEAR").val($("#SCH_SYEAR").val());
		$("#TERM_GCD").val($("#SCH_TERM_GCD").val());
		
		$("#WORK_DATE").val($("#WORK_DATE_DATA").val());
		$("#WORK_ST_TIME").val($("#WORK_ST_TIME_DATA").val());
		$("#WORK_ST_MINUTE").val($("#WORK_ST_MINUTE_DATA").val());
		$("#WORK_END_TIME").val($("#WORK_END_TIME_DATA").val());
		$("#WORK_END_MINUTE").val($("#WORK_END_MINUTE_DATA").val());
		$("#TASK_CONTENT").val($("#TASK_CONTENT_DATA").val());
		
		/* class="search-box"인 곳의 데이터 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".stdt-info"));
		}
		
		// 필수입력 조건 확인
		if (!fn_validate(data)) {
			return false;
		}
 		
		confirm("삭제하시겠습니까?",function(_flag){
    		if(_flag) {
    			 gfn_ajax_request({
   					url : "/ost/jh/workserve/saveWorkDelete",
   					reqData : data,
   					success : function(data, responseData) {
   						if (!gfn_com_isEmptyObject(data)) {
	   						alert(data[0].Msg);
	   						fn_schList(jhCdVal, jhGcdVal, jhChargeViaGcdVal);
   						}
   					}
   				});
    		}
		}
	)}	 

	/***************************************************************************
	 * 출력
	 **************************************************************************/	
	function fn_openReport() {
		var options ={};
                    
        options.rptName = "/ses/jh/workserve/WorkServe_001.crf";
   
        //파라메터 설정
        //var objParam = dma_SearchParam.getJSON();
        var objParam = {};
        objParam.SYEAR			=$("#SCH_SYEAR").val();
        objParam.TERM_GCD		=$("#SCH_TERM_GCD").val();
        objParam.STDT_NO		=stdtNo; 
        objParam.MONTH			=$("#SCH_MONTH").val(); 
        objParam.STDT_NM		=stdtNm;
        objParam.COLL_NM		=CollGradGcdNm;
        objParam.DEPT_NM		=deptCdNm;
        
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
            title : "근무상황부",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}		

</script>