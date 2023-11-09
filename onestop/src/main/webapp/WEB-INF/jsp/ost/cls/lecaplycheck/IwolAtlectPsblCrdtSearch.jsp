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
				<!-- 메시지박스 -->
			<div class="message-box">
				<div class="message-box-inner">
					<div class="message-body">
						<ul class="list list-style-1">
<!--							<li><span class="dfn">학점이월제 시행 안내문</span>
								<a class="btn btn-primary" href="javascript:void(0);" onclick="fn_popupMultiFileViewr('${item.SYSTEM_GCD}','${item.ATTACH_FILE_GRP_CD}','${item.ATTACH_FILE_GCD}','${item.ATTACH_FILE_SEQ_NO}','/file/download.do?${item.PARAM_CODE}',this)" onkeypress='this.onclick' data-lang>뷰어<i class="bi bi-eye" aria-hidden="true"></i></a>
								<a class="btn btn-primary" href="/file/download.do?${item.PARAM_CODE }" data-lang>다운로드<i class="bi bi-download" aria-hidden="true"></i></a>
								
 		                    	<a class="btn btn-sm btn-primary" href="javascript:void(0);" onclick="fn_popupMultiFileViewr('/file/download.do?p0U+mcdo21tl46d5UEdTEAIvazwd9LXoAhDoBPhKWg6mKLHNbG2mHpEsfirWmByXe21xKz176PsDUuyXrK/rBw==')" onkeypress='this.onclick' data-lang>뷰어<i class="bi bi-eye" aria-hidden="true"></i></a>
		                    	<a class="btn btn-sm btn-primary" href="/file/download.do?p0U+mcdo21tl46d5UEdTEAIvazwd9LXoAhDoBPhKWg6mKLHNbG2mHpEsfirWmByXe21xKz176PsDUuyXrK/rBw==" data-lang>다운로드<i class="bi bi-download" aria-hidden="true"></i></a>
								
							</li> -->
							<li>
								<div class="text-danger">이월학점은 학적변동 등(전과, 국내타대교류정보 등)의 사유로 변동될 수 있습니다.</div>
							</li>
							<li>자세한 사항은 본인소속 학과사무실로 문의하세요.</li>
						</ul>
					</div>
				</div>
			</div>
			<p class="text-primary" id="TEXT"></p>			
			<!-- /END 메시지박스 -->
				<div class="search-box">
				<!-- 검색영역 -->
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
								    <label class="req" for="SCH_SYEAR" data-lang>학년도/학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_SYEAR" class="form-control" style="width:30%;" title="학년도선택"></select>&nbsp;
									<select id="SCH_TERM_GCD" class="form-control" style="width:30%;" title="학기선택"></select>
									<input id="SCH_STDT_NO" class="form-control" style="display:none;"></input>
								</div>
							</div>
						</div>
					</div>
					
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
                                <button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
							</div>
						</div>
					</div>						
					
				<!-- /END 검색영역 -->
				</div>					
			
			<div class="sec-body-2">
			<!-- 기본정보 -->
			<section class="sec-2">
				<header>
					<h4 class="sec-title">기본정보</h4>
				</header>				
				<div class="b-table-box flex-col-4" role="table" aria-label="기본정보">
					<div class="b-row-box" role="row">
						<div class="b-row-item merge-4">
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
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>교육과정<br>적용학년도</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="EDU_YEAR" data-lang></div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /END 기본정보 -->			
			
			<!-- 당해학기 정보 -->
			<section class="sec-2">
				<header>
					<h4 class="sec-title">당해학기 정보</h4>
				</header>				
				<div class="b-table-box flex-col-1" role="table" aria-label="기본정보">
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>이월학점포함 수강신청 가능학점</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="MAX_ATLECT_PSBL_CRDT" class="text-danger" data-lang></div>
							</div>
						</div>
					</div>
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>수강신청 가능학점</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="APPLY_PSBL_CRDT" data-lang></div>
							</div>
						</div>
					</div>
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>이월학점</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="IWOL_CRDT" data-lang></div>
							</div>
						</div>
					</div>
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>수강기준학점</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="CRITERIA_CRDT" data-lang></div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /END 당해학기 정보 -->

			<!-- 직전학기 정보 -->
			<section class="sec-2">
				<header>
					<h4 class="sec-title">직전학기 정보</h4>
				</header>				
				<div class="b-table-box flex-col-4" role="table" aria-label="기본정보">
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>직전학기</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="PRE_SYEARTERM_GCD" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>평점평균</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="GPA" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>수강취소여부</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="ATLECT_CANCEL_FG" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>학사경고여부</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="AWARNING_TARGET_FG" data-lang></div>
							</div>
						</div>
					</div>
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>수강신청<br>가능학점</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="PRETERM_MAX_ATLECT_PSBL_CRDT" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>수강신청학점</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="PRETERM_LECAPPLY_CRDT" data-lang></div>
							</div>
						</div>
						<div class="b-row-item merge-2">
							<div class="b-title-box" role="rowheader">
								<label data-lang>타대교류여부</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="PART_EXEC_FG" data-lang></div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /END 직전학기 정보 -->

			<!-- 참고사항 -->
			<section class="sec-2">
				<header>
					<h4 class="sec-title">참고사항</h4>
				</header>				
				<div class="b-table-box flex-col-4" role="table" aria-label="기본정보">
					<div class="b-row-box" role="row">
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>학사학위<br>취득유예 여부</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="DELAY_FG" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>재입학생 여부</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="READMISSION_FG" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>편입학생 여부</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="TRANSFER_FG" data-lang></div>
							</div>
						</div>
						<div class="b-row-item">
							<div class="b-title-box" role="rowheader">
								<label data-lang>연계과정 여부</label>
							</div>
							<div class="b-con-box" role="cell">
								<div id="THRU_TERM_CNT" data-lang></div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /END 참고사항 -->
			</div>
			
			

			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>

<script type="text/javascript">

var date = new Date();
var maxdate = date.getFullYear();

var stdtNo = scwin.loginUser.userId;
var stdtNm = scwin.loginUser.nm;

var stdtYear = (scwin.loginUser.userId).substr(0,4);

var curcapplysyear = scwin.loginUser.curcApplySyear; //교육과정 적용년도

var CollGradGcdNm = scwin.loginUser.collGradGcdKorNm;
var CollGradGcd = scwin.loginUser.collGradGcd;
var CollCdKorNm = scwin.loginUser.collCdKorNm;
var deptCdNm = scwin.loginUser.deptCdKorNm;
var majorCdNm = (scwin.loginUser.majorCdKorNm == null) ? '' : scwin.loginUser.majorCdKorNm;
var courseGcdNm = scwin.loginUser.degCourseGcdKorNm;
var yearGcd = (CollGradGcd == "0001") ? scwin.loginUser.stdtYearGcdKorNm : scwin.loginUser.cmplTermCnt + '학기' ;

var hjSta = scwin.loginUser.hjStaGcdKorNm;

	function fn_initScreen() {		
		
		$(".sec-body-2").hide();
		
		(CollGradGcd == "0001") ? $("#YEAR_TERM").text("학년") : $("#YEAR_TERM").text("학기");
		
		// 소속(과정)
		$("#DEPT").text(CollGradGcdNm + " " + CollCdKorNm + " " + deptCdNm + " " + majorCdNm + "(" + courseGcdNm + ")");
		// 학번(성명)
		$("#STDT_NO_VAL").text(stdtNo + " (" + stdtNm + ")");
		// 학년(학기)
		$("#TERM_GCD").text(yearGcd);
		// 학적상태
		$("#HJ_STA_GCD").text(hjSta);		
		// 교육과정 적용학년도
		$("#EDU_YEAR").text(curcapplysyear);		

		/*학년도 바인드*/
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : "2011",
				"ENDYEAR" : maxdate
			},
			success : function(data, responseData) {

				$("#SCH_SYEAR").dropDownList({
				dataSource : data,
				commonCode : "",
				dataTextField : "LABEL",
				dataValueField : "CODE",
				optionLabel : "선택",
				optionValue : "",
				defaultValue : maxdate,
				expnCondition : "",
				dataBound : function(e) {
	
				}	
				});
			}
		});		

		/* 학기 */
		gfn_com_DropDownLists([{          
			elements : $("#SCH_TERM_GCD"),
            commonCode : "0001_TERM_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "", 
            expnCondition : "AND COMMON_DETAIL_CD IN ('0010', '0020', '0011', '0021') AND CHAR_1_CONTENT LIKE '%B%' " ,
            hakbuGradFg : false,
            dataBound : function(e) {
        		var param = gfn_com_inputdata($(".search-box"));
        		param.SYSTEM_GCD = scwin.menuInfo.SYSTEM_GCD;
        		param.MENU_CD = scwin.menuInfo.MENU_CD;
            	/* 기준학년도학기 ajax처리 */
        		gfn_ajax_request({
        			url : "/ost/cls/lecaplycheck/AtlectSearch/selectOneShafYyShtm",
        			reqData : param,
        			success : function(data, responseData) {
        				
        				$("#SCH_SYEAR").val(data.SYEAR);
        				$("#SCH_TERM_GCD").val(data.TERM_GCD);
        			}
        		});
            }
        }]);
		
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
	 * 조회
	 **************************************************************************/
	function fn_sch(data) {
		
		// TEXT 초기화
		$("#TEXT").empty();		
	
		
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}
		
		/* 필수체크 */
		if (!fn_validate(data)){
			return false;
		}		

		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/iwolatlectpsblcrdtsearch/selectIwolAtlectPsblCrdtSearch",
			reqData : data,
			success : function(data, responseData) {
				
				if (!gfn_com_isEmptyObject(data)) {
					
					$(".sec-body-2").show();
					

					$("#MAX_ATLECT_PSBL_CRDT").text(data[0].MAX_ATLECT_PSBL_CRDT);
					$("#APPLY_PSBL_CRDT").text(data[0].APPLY_PSBL_CRDT);
					$("#IWOL_CRDT").text(data[0].IWOL_CRDT);
					$("#CRITERIA_CRDT").text(data[0].CRITERIA_CRDT);
					
					$("#PRE_SYEARTERM_GCD").text(data[0].PRE_SYEARTERM_GCD);
					$("#GPA").text(data[0].GPA);
					$("#PRETERM_MAX_ATLECT_PSBL_CRDT").text(data[0].PRETERM_MAX_ATLECT_PSBL_CRDT);
					$("#PRETERM_LECAPPLY_CRDT").text(data[0].PRETERM_LECAPPLY_CRDT);
					$("#ATLECT_CANCEL_FG").text(data[0].ATLECT_CANCEL_FG);
					$("#AWARNING_TARGET_FG").text(data[0].AWARNING_TARGET_FG);
					$("#PART_EXEC_FG").text(data[0].PART_EXEC_FG);

					$("#DELAY_FG").text(data[0].DELAY_FG);
					$("#READMISSION_FG").text(data[0].READMISSION_FG);
					$("#TRANSFER_FG").text(data[0].TRANSFER_FG);
					$("#CMPL_TERM_CNT").text(data[0].CMPL_TERM_CNT);
					
				}else{
					$(".sec-body-2").hide();
					$("#TEXT").append("※ 학점이월제 관련 정보가 없습니다. 본인소속 학과사무실로 문의하세요. ");
				}
			
			}
		});
	}
	
	// 뷰어, 다운로드 - 800_학점이월제%20시행%20안내문.hwp

</script>