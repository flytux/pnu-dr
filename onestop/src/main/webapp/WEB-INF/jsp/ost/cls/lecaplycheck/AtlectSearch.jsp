<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
	                <h2 class="sec-title"></h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<div class="sec-body" id="search">
				<section class="sec-2">
					<!-- 검색 영역 -->
					<div class="search-box">
						<div class="b-table-box flex-col-2" role="table" aria-label="조회">
							<div class="b-row-box" role="row">
								<div class="b-row-item merge-2">
									<div class="b-title-box" role="rowheader">
									    <label class="req" for="SCH_SYEAR" data-lang>학년도/학기</label>
									</div>
									<div class="b-con-box" role="cell">
										<input id="SCH_SYEAR" class="form-control" type="number" style="width:20%;" title="학년도입력"></input>&nbsp;
										<select id="SCH_TERM_GCD" class="form-control" style="width:20%;" title="학기선택"></select>
									</div>
								</div>
							</div>                  
						</div>
						<div class="btn-box">
							<div class="form-row">
								<div class="col-auto">
									<button class="btn search-btn" type="button" onclick="javascript:return fn_openDetailPopup();" data-lang>상세조회</button>
	                                <button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
	                               	<button class="btn search-btn" type="button" onclick="fn_openReport(true)" data-lang>출력</button>
								</div>
							</div>
						</div>
						<!-- 수강신청확인 테이블 -->         
						<div id="LectTable">      
							<section class="sec-3"> 
								<header>
									<h4 class="sec-title">수강신청확인</h4>
								</header>
								<div class="table-box">
									<div class="table-body">                    
										<table class="table" data-toggle="table"  data-show-column="true">
											<caption>수강신청과목정보</caption>
											<colgroup>
												<col style="min-width: 50px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">NO</th>
													<th scope="col">교과목명</th>
													<th scope="col">교과목번호</th>
													<th scope="col">분반</th>
													<th scope="col">학점</th>
													<th scope="col">교과목구분</th>
													<th scope="col">강의시간</th>
													<th scope="col">재이수</th>
												</tr> 
											</thead>
											<tbody id="resultTbody_Lect">
											</tbody>
										</table>
									</div>					
								</div>
							</section>
						</div>
						<!-- 수강신청확인 테이블 END  -->
						<!-- 메세지Box 영역 -->
						<div class="message-box">
							<div class="message-box-inner">
								<div class="message-body">
									<ul class="list list-style-1">
										<li><span class="dfn" data-lang></span><strong>수강확인은 당해년도 학기만 가능합니다.</strong></li>
										<li><span class="dfn" data-lang></span>(R) 표시 : 재이수과목입니다. (R)부분을 클릭하면 재이수정보를 볼 수 있습니다.</li>
										<li><span class="dfn" data-lang></span>강의시간이 표시되지 않은 것은 개설확정을 하지 않아서 입니다. (개설학과로 문의하세요!)</li>
										<li><span class="dfn" data-lang></span>수강신청 했던 과목이 나오지 않을 경우, 해당과목이 폐강인지 확인하세요. (개설학과로 문의하세요!)</li>
										<li><span class="dfn" data-lang></span>계절수업 총 수업일수의 1/3, 1/2 경과 수강신청내역은 성적확정 후에 삭제됩니다.</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- 메세지Box 영역 END-->
						
						<!-- 수강취소현황 테이블 -->      
						<div id="CancelTable">          
							<section class="sec-3">
								<header>
									<h4 class="sec-title">수강취소현황</h4>
								</header>
								<!-- 메세지Box 영역 -->
								<div class="message-box">
									<div class="message-box-inner">
										<div class="message-body">
											<ul class="list list-style-1">
												<li><span class="dfn" data-lang></span>수강취소가 확정되기 전까지는 취소과목이 조회되지 않을 수 있으니 교육혁신과(051-510-1221)로 문의해 보시기 바랍니다.</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- 메세지Box 영역 END-->
								<div class="table-box">
									<div class="table-body">                    
										<table class="table" data-toggle="table" data-show-column="true">
											<caption>수강취소과목정보</caption>
											<colgroup>
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">NO</th>
													<th scope="col">교과목명</th>
													<th scope="col">교과목번호</th>
													<th scope="col">분반</th>
													<th scope="col">학점</th>
													<th scope="col">교과목구분</th>
												</tr> 
											</thead>
											<tbody id="resultTbody_Cancel">
											</tbody>
										</table>
									</div>					
								</div>
							</section>
						</div>
						<!-- 수강취소현황 테이블 END  -->
						
						<!-- 폐강강좌현황 테이블 -->      
						<div id="CloseTable">      
							<section class="sec-3">    
								<header>
									<h4 class="sec-title">폐강강좌현황</h4>
								</header>
								<!-- 메세지Box 영역 -->
								<div class="message-box">
									<div class="message-box-inner">
										<div class="message-body">
											<ul class="list list-style-1">
												<li><span class="dfn" data-lang></span>수강취소가 확정되기 전까지는 폐강과목이 조회되지 않을 수 있으니 교육혁신과(051-510-1221)로 문의해 보시기 바랍니다.</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- 메세지Box 영역 END-->
								<div class="table-box">
									<div class="table-body">                    
										<table class="table" data-toggle="table"  data-show-column="true">
											<caption>폐강강좌정보</caption>
											<colgroup>
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">NO</th>
													<th scope="col">교과목명</th>
													<th scope="col">교과목번호</th>
													<th scope="col">분반</th>
													<th scope="col">학점</th>
													<th scope="col">교과목구분</th>
												</tr> 
											</thead>
											<tbody id="resultTbody_Close">
											</tbody>
										</table>
									</div>					
								</div>
							</section>
						</div>
						<!-- 폐강강좌현황 테이블 END  -->
					</div> 
					<!-- /END 검색 영역 -->
				</section>
			</div>
		</section>      
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplateLect">
	<tr style="cursor:pointer;">
        <td>
			#:RN#
			<input class="form-control" id="SYEAR" type="text" style="display:none;" value="#:SYEAR#"> 
			<input class="form-control" id="TERM_GCD" type="text" style="display:none;" value="#:TERM_GCD#"> 
			<input class="form-control" id="SUBJ_NO" type="text" style="display:none;" value="#:SUBJ_NO#"> 
			<input class="form-control" id="CLASS_NO" type="text" style="display:none;" value="#:CLASS_NO#"> 
		</td>
	    <td class="text-left" scope="row">#:SUBJ_NM#</td>
	    <td>#:SUBJ_NO#</td>
		<td>#:CLASS_NO#</td>
		<td>#:CRDT#</td>
		<td class="text-left" scope="row">#:SUBJ_GCD_NM#</td>
		<td class="text-left" scope="row">#:TIMETABLE_SUMMARY_INFO#</td>
		<td>
			# if( :RECMPL_FG == "") { #
	               <div></div>
	        #} else { #
	               <button class="btn btn-outline-primary mb-2 detail-btn">#:RECMPL_FG#</button>
	        #}#
		</td>
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplateCancel">
	<tr style="cursor:pointer;">
        <td>#:RN#</td>
	    <td class="text-left" scope="row">#:SUBJ_NM#</td>
	    <td>#:SUBJ_NO#</td>
		<td>#:CLASS_NO#</td>
		<td>#:CRDT#</td>
		<td class="text-left" scope="row">#:SUBJ_GCD_NM#</td>
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplateClose">
	<tr style="cursor:pointer;">
        <td>#:RN#</td>
	    <td class="text-left" scope="row">#:SUBJ_NM#</td>
	    <td>#:SUBJ_NO#</td>
		<td>#:CLASS_NO#</td>
		<td>#:CRDT#</td>
		<td class="text-left" scope="row">#:SUBJ_GCD_NM#</td>
	</tr>
</script>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/javascript">

	var totalCnt = 0;
    var _autoComplete;
	var _multi;

	function fn_initScreen() {		
		gfn_com_DropDownLists([{          
			elements : $("#SCH_TERM_GCD"),
            commonCode : "0001_TERM_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "", 
            expnCondition : "AND CHAR_1_CONTENT LIKE'%B%'",
            hakbuGradFg : false,
            dataBound : function(e) {
            }
        }]);
		
		var Searchdata = gfn_com_inputdata($(".search-box"));
		
		Searchdata.SYSTEM_GCD = scwin.menuInfo.SYSTEM_GCD;
		Searchdata.MENU_CD = scwin.menuInfo.MENU_CD;

		/* 기준학년도학기 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AtlectSearch/selectOneShafYyShtm",
			reqData : Searchdata,
			success : function(data, responseData) {
				$("#SCH_SYEAR").val(data.SYEAR);
				$("#SCH_TERM_GCD").val(data.TERM_GCD);
			}
		});
		
		//fn_openReport(false);
	}
	
	/***************************************************************************
	 * 학사일정, 수강신청확인 내역 조회
	 **************************************************************************/
	function fn_sch() {
		var rtnValue = true;
		var Searchdata = gfn_com_inputdata($(".search-box"));

		var valInfo1 = [{
			"id" : "SCH_SYEAR",
			"name" : "학년도",
			"notNull" : true,
		}, {
			"id" : "SCH_TERM_GCD",
			"name" : "학기",
			"notNull" : true,
		}];
		
		rtnValue = gfn_val_validateDataMap(Searchdata, valInfo1);
		
		if (!rtnValue){
			return;
		}
		
		Searchdata.COLL_GRAD_GCD =scwin.loginUser.collGradGcd;
		
		/* 학사일정, 수강신청확인 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AtlectSearch/searchSchdChk",
			reqData : Searchdata,
			success : function(data, responseData) {
				if(data.resultYn == "N") {
					alert(data.msg);
					return;
				} else {
					$("#resultTbody_Lect").listView({
						dataSource : responseData.list,
						dataBound : function(e) {
							$('#resultTbody_Lect .detail-btn').bind(
								"click",
								function(e) {
									scwin.detailObj = $(this).closest(
											"tr").data();
									fn_openPopup({
										filename : 'AutoApplySubjMngPop',
										headertitle : '재이수 내역 확인'
									});
								});
							totalCnt = responseData.totalCnt;
							currentData = data;
						},
						template : $("#resultTemplateLect"),
						totalCnt : responseData.totalCnt,
						paging : null,
						excel : null
					});
					fn_schCancelList();
					fn_schCloseList();
				}
			}
		});
	}
	
	/***************************************************************************
	 * 수강취소현황 조회
	 **************************************************************************/
	function fn_schCancelList() {
		var Searchdata = gfn_com_inputdata($(".search-box"));
		
		/* 기준학년도학기 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AtlectSearch/searchCancelList",
			reqData : Searchdata,
			success : function(data, responseData) {
// 				console.log(data);
// 				console.log(responseData);
				$("#resultTbody_Cancel").listView({
					dataSource : responseData.data,
					dataBound : function(e) {
						totalCnt = responseData.totalCnt;
						currentData = data;
					},
					template : $("#resultTemplateCancel"),
					totalCnt : responseData.totalCnt,
					emptyComment : '해당 년도와 학기에 수강취소한 과목이 존재하지 않습니다.',
					paging : null,
					excel : null
				});
			}
		});
		
	}
	
	/***************************************************************************
	 * 폐강강좌현황 조회
	 **************************************************************************/
	function fn_schCloseList() {
		var Searchdata = gfn_com_inputdata($(".search-box"));
		Searchdata.COLL_GRAD_GCD = scwin.loginUser.collGradGcd;
		
		/* 기준학년도학기 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AtlectSearch/searchClosedList",
			reqData : Searchdata,
			success : function(data, responseData) {
				$("#resultTbody_Close").listView({
					dataSource : responseData.data,
					dataBound : function(e) {
						totalCnt = responseData.totalCnt;
						currentData = data;
					},
					template : $("#resultTemplateClose"),
					totalCnt : responseData.totalCnt,
					emptyComment : '해당 년도와 학기에 폐강과목이 존재하지 않습니다.',
					paging : null,
					excel : null
				});
			}
		});
	}
	
	/***************************************************************************
	 * 재이수 상세정보 팝업 호출
	 **************************************************************************/
	function fn_openPopup(_option) {
		gfn_com_modalPopup({
			width : 1500,
			height : 400,
			index : 1,
			target : null,
			title :  _option.headertitle,
			include : "/html/ost/cls/lecaplycheck/" + _option.filename + ".html"
		}); 
	}
	
	/***************************************************************************
	 * 재이수 상세정보 팝업 호출
	 **************************************************************************/
	 
	function fn_openDetailPopup() {
		scwin.detailObj01 = gfn_com_inputdata($(".search-box"));
		scwin.detailObj01.COLL_GRAD_GCD =scwin.loginUser.collGradGcd;
		
		/* 학사일정, 수강신청확인 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AtlectSearch/searchSchdChk",
			reqData : scwin.detailObj01,
			success : function(data, responseData) {
				if(data.resultYn == "N") {
					alert(data.msg);
					return;
				} else {
					gfn_com_modalPopup({
						width : 1600,
						height : 500,
						index : 1,
						target : null,
						title :  "수강 상세내역 확인",
						include : "/html/ost/cls/lecaplycheck/AtlectSearchDetailPop.html"
					}); 
				}
			}
		});
		
	
	}
	
	function fn_openReport(isPop) {
		var Searchdata = gfn_com_inputdata($(".search-box"));
		Searchdata.COLL_GRAD_GCD =scwin.loginUser.collGradGcd;
		Searchdata.STDT_NO = scwin.loginUser.userId;
		
		/* 학사일정, 수강신청확인 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AtlectSearch/searchSchdChk",
			reqData : Searchdata,
			success : function(data, responseData) {
				if(data.resultYn == "N") {
					alert(data.msg);
					return;
				} else {
					var options = {};
                    
			        options.rptName = "/ses/cls/lecaplycheck/AtlectSearch_001.crf";
			   
			        //파라메터 설정
			        var objParam = {};
			        objParam.SCH_SYEAR 					     = $("#SCH_SYEAR").val();
			        objParam.SCH_TERM_GCD                  = $("#SCH_TERM_GCD").val();
			        objParam.STDT_NO             				 = scwin.loginUser.userId; 
			        objParam.COLL_CD                             = scwin.loginUser.collCd; 
			        objParam.DEPT_CD                             = scwin.loginUser.deptCd; 
			        objParam.NM                    					 = scwin.loginUser.nm; 
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
			        if (isPop) {
			        	fn_openReportPopup(options);
			        } 
					
				}
			}
		});
		
		
	}
	
	/***************************************************************************
	 * 재이수 상세정보 팝업 호출
	 **************************************************************************/
	function fn_openReportPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "수강신청확인서",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}

</script>