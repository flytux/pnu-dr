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
			
			<div class="search-box">
				<input type="text" id="SCH_STDT_NO" class="form-control" style="display: none;" /> 
			</div>			
			
			<!-- 기본정보 -->
			<section class="sec-2">
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
								<div id="STDT_NO" data-lang></div>
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
			
			<div class="text-center">
				<p class="text-danger">***학기가 진행 중인 경우, 교내/외 장학금의 내역은 변경 될 수 있습니다.***</p>
			</div>
			<!-- 테이블 리스트 - 헤더 고정 -->
			<section class="sec-2">
				<div class="table-box table-list">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>개인별 장학금 내역</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
								<col style="min-width: 30px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2">학년도</th>
									<th scope="col" rowspan="2">학기</th>
									<th scope="col" rowspan="2">구분</th>
									<th scope="col" rowspan="2">장학명</th>
									<th scope="col" colspan="5">학비감면</th>
									<th scope="col" rowspan="2">기타<br>장학금<br>(B)</th>
									<th scope="col" rowspan="2">장학금<br>합계<br>(A+B)</th>
									<th scope="col" rowspan="2">진행<br>상태</th>
								</tr>
								<tr>
									<th scope="col">입학금</th>
									<th scope="col">수업료(Ⅰ)</th>
									<th scope="col">수업료(Ⅱ)</th>
									<th scope="col">기타</th>
									<th scope="col">소계(A)</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
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
	<tr style="cursor:pointer;">
		<td>#:SYEAR#</td>
        <td>#:TERM_GCD#</td>
	    <td>#:JH_CHARGE_VIA_GCD#</td>
	    <td>#:JH_NM#</td>
	    <td>#:ADMS_JH_AMT#</td>
	    <td>#:CLASS_1_JH_AMT#</td>
	    <td>#:CLASS_2_JH_AMT#</td>
	    <td>#:JH_AMT#</td>
	    <td>#:ALL_A#</td>
	    <td>#:JH_ETC_AMT#</td>
	    <td>#:ALL_A_B#</td>
	    <td>#:PROCESS_STAT#</td>
	</tr>
</script>

<script type="text/javascript">

var stdtNo = scwin.loginUser.userId;
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
		
		(CollGradGcd == "0001") ? $("#YEAR_TERM").text("학년") : $("#YEAR_TERM").text("학기");
		
		$("#STDT_UNIV").text(CollGradGcdNm);
		$("#STDT_COURSE").text(courseGcdNm);
		$("#STDT_DEPT").text(deptCdNm);
		$("#STDT_NO").text(stdtNo);
		$("#STDT_YEAR").text(yearGcd);
		$("#STDT_NM").text(stdtNm);
		
		fn_sch();
	}
	
	/***************************************************************************
	 * 신청내역조회
	 **************************************************************************/
	function fn_sch(data) {
		
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".search-box"));
        }

		/* ajax처리 */
		gfn_ajax_request({
            url : "/ost/jh/personjhdetails/selectPersonJhDetails",
            	reqData : data,
                success : function(data, responseData) {    
                	
    				$("#resultTbody").listView({
    					dataSource : data,
    					emptyComment : "장학금 수혜 내역이 등록되어있지 않습니다.",
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
          });			
			
			
		}	
	

</script>