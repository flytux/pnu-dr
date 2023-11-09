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
				<section class="sec-2">
					<div class="sec-body">
						<section class="sec-3">
							<div class="sec-body">
								<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item ">
											<div class="b-title-box" role="rowheader">소속(과정)</div>
											<div class="b-con-box" role="cell" id="UPPER_ASSIGN_NM"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학번(성명)</div>
											<div class="b-con-box" role="cell" id="NM"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학년(학기)</div>
											<div class="b-con-box" role="cell" id="STDT_YEAR_GCD"></div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">교육과정<br/>적용년도</div>
											<div class="b-con-box" role="cell" id="CURC_APPLY_SYEAR"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학적상태</div>
											<div class="b-con-box" role="cell" id="HJ_STA_GCD_KOR_NM"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">유예신청</div>
											<div class="b-con-box" role="cell" id="GRACE_FG"></div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">입학일자</div>
											<div class="b-con-box" role="cell" id="ADMS_DATE"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">입학구분</div>
											<div class="b-con-box" role="cell" id="ADMS_TYPE_GCD"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">이수학기</div>
											<div class="b-con-box" role="cell" id="CMPL_TERM_CNT"></div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">신청학점</div>
											<div class="b-con-box" role="cell" id="APPLY_CRDT"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">취득학점</div>
											<div class="b-con-box" role="cell" id="ACQ_CRDT"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">평점</div>
											<div class="b-con-box" role="cell" id="GPA"></div>
										</div>
									</div>
								</div>
							</div>
						</section>
						
						<section class="sec-2">
							<header>
								<h4 class="sec-title">주전공 및 학적신청 ( 부전공, 복수전공, 연합전공) 정보</h4>
							</header>
							<div class="sec-body" >
								<div class="table-box" id="hakjukListTab">
													
								</div>
							</div>	
						</section>
						<section class="sec-2">
							<header>
								<h4 class="sec-title">졸업예정정보 목록</h4>
							</header>
							<div class="message-box allSch_hidden">
								<div class="message-box-inner">
									<div class="message-body">
										<ul class="list list-style-1">
											<li class="text-danger">졸업예정정보는 졸업사정이 완료된 자료가 아닙니다. 정확한 졸업사정 결과는 학과사무실에 문의하시기 바랍니다.</li>
                                            <li class="text-danger">수강신청학점(취득예정학점)은 성적이 확정되면 취득학점에 반영됩니다.</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="sec-body">
								<ul class="nav nav-pills" role="tablist">
									<li class="nav-item" role="presentation"><a class="nav-link active" id="tab1" data-toggle="tab" href="#tab-cont1" role="tab" data-controls="home" data-selected="true">교과목구분별 이수구분</a></li>
									<li class="nav-item" role="presentation"><a class="nav-link" id="tab2" data-toggle="tab" href="#tab-cont2" role="tab" data-controls="profile" data-selected="false">필수교과목 이수여부</a></li>
									<li class="nav-item" role="presentation"><a class="nav-link" id="tab3" data-toggle="tab" href="#tab-cont3" role="tab" data-controls="contact" data-selected="false">교양선택 이수여부</a></li>
									<li class="nav-item" role="presentation"><a class="nav-link" id="tab4" data-toggle="tab" href="#tab-cont4" role="tab" data-controls="contact" data-selected="false">전공 이수여부</a></li>
									<li class="nav-item" role="presentation"><a class="nav-link" id="tab5" data-toggle="tab" href="#tab-cont5" role="tab" data-controls="contact" data-selected="false">졸업요건 이수여부</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade show active" id="tab-cont1" role="tabpanel" aria-labelledby="tab1">
										<div class="table-box" id="grid01">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>기합격과목의전공과목과외국어과목내역</caption>
													<thead>
														<tr>
															<th scope="col" rowspan="2">No</th>
															<th scope="col" colspan="3">졸업기준</th>
															<th scope="col" colspan="5">학생이수정보</th>
														</tr>
														<tr>
															<th scope="col">학적신청구분</th>
															<th scope="col">사정구분</th>
															<th scope="col">기준학점</th>
															
															<th scope="col">취득학점</th>
															<th scope="col">수강신청학점</th>
															<th scope="col">취득예정학점</th>
															<th scope="col">이수여부</th>
															<th scope="col">졸업불가사유</th>
														</tr>
													</thead>
													<tbody id="resultTbody1">
													
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab-cont2" role="tabpanel" aria-labelledby="tab2">
										<div class="table-box" id="grid02">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>기합격과목의전공과목과외국어과목내역</caption>
													<thead>
														<tr>
															<th scope="col" rowspan="2">No</th>
															<th scope="col" colspan="5">졸업기준(교육과정정보)</th>
															<th scope="col" colspan="6">학생이수정보</th>
														</tr>
														<tr>
															<th scope="col">교과목구분</th>
															<th scope="col">교과목명</th>
															<th scope="col">학점</th>
															<th scope="col">이수모형<br/>그룹번호</th>
															<th scope="col">그룹별<br/>이수 수</th>
															
															<th scope="col">교과목구분</th>
															<th scope="col">교과목명</th>
															<th scope="col">등급</th>
															<th scope="col">학점</th>
															<th scope="col">이수여부</th>
															<th scope="col">비고</th>
														</tr>
													</thead>
													<tbody id="resultTbody2">
													
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab-cont3" role="tabpanel" aria-labelledby="tab3">
										<div class="message-box message-box-style-1 mb-2">
											<div class="message-box-inner">
												<div class="message-body">
													<p class="mb-0">교양선택     <input type="text"  id="TOTAL_AREA_CNT" disabled style="width:60px"/>  개 영역 중      <input type="text"  id="AREA_CMPL_CNT" disabled style="width:60px"/>개 영역 이수 : 학생이 이수한 영역수 <input type="text"  id="AREA_GCD_CNT" disabled style="width:60px"/> 개	</p>
												</div>
											</div>
										</div>
										
										<div class="table-box pt-3" id="grid03_2">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>교양영역별 이수 여부 정보</caption>
													<thead>
														<tr>
															<th scope="col" rowspan="2">No</th>
															<th scope="col" colspan="5">졸업기준(이수모형정보)</th>
															<th scope="col" colspan="4">학생이수정보</th>
														</tr>
														<tr>
															<th scope="col">교양영역명</th>
															<th scope="col">필수제외영역구분</th>
															<th scope="col">중복가능영역구분</th>
															<th scope="col">그룹번호</th>
															<th scope="col">그룹별 이수 수</th>
															
															<th scope="col">교과목명</th>
															<th scope="col">등급</th>
															<th scope="col">학점</th>
															<th scope="col">이수여부</th>
														</tr>
													</thead>
													<tbody id="resultTbody3_2">
													
													</tbody>
												</table>
											</div>
										</div>
										<div class="table-box pt-3" id="grid03_3">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>교양선택 중 필수교과목 이수여부</caption>
													<thead>
														<tr>
															<th scope="col" rowspan="2">No</th>
															<th scope="col" colspan="3">졸업기준(이수모형정보)</th>
															<th scope="col" colspan="4">학생이수정보</th>
														</tr>
														<tr>
															<th scope="col">교과목명</th>
															<th scope="col">그룹번호</th>
															<th scope="col">그룹별 이수 수</th>
															
															<th scope="col">교과목명</th>
															<th scope="col">등급</th>
															<th scope="col">학점</th>
															<th scope="col">이수여부</th>
														</tr>
													</thead>
													<tbody id="resultTbody3_3">
													
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab-cont4" role="tabpanel" aria-labelledby="tab4">
										<div class="table-box" id="grid04">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>기합격과목의전공과목과외국어과목내역</caption>
													<thead>
														<tr>
															<th scope="col" rowspan="2">No</th>
															<th scope="col" colspan="3">졸업기준(이수모형정보)</th>
															<th scope="col" colspan="4">학생이수정보</th>
														</tr>
														<tr>
															<th scope="col">교과목명</th>
															<th scope="col">그룹번호</th>
															<th scope="col">그룹별 이수 수</th>
															
															<th scope="col">교과목명</th>
															<th scope="col">등급</th>
															<th scope="col">학점</th>
															<th scope="col">이수여부</th>
														</tr>
													</thead>
													<tbody id="resultTbody4">
													
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab-cont5" role="tabpanel" aria-labelledby="tab5">
										<div class="table-box" id="grid05">
											<div class="table-body">
												<table class="table table-hover" data-toggle="table" data-show-column="true">
													<caption>기합격과목의전공과목과외국어과목내역</caption>
													<thead>
														<tr>
															<th scope="col" rowspan="2">No</th>
															<th scope="col" colspan="3">졸업기준</th>
															<th scope="col" colspan="4">학생이수정보</th>
														</tr>
														<tr>
															<th scope="col">학적신청구분</th>
															<th scope="col">졸업요건명</th>
															<th scope="col">상세졸업요건명</th>
															
															<th scope="col">합격구분</th>
															<th scope="col">취득일자</th>
															<th scope="col">이수여부</th>
															<th scope="col">비고_예외사항_상세내역_점수</th>
														</tr>
													</thead>
													<tbody id="resultTbody5">
													
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</section>
			</div>
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate1">
	<tr style="cursor:pointer;">
	    <td>#:RN#</td>
        <td>#:EVALTN_GCD_NM#</td>
	    <td>#:HEV_CRITERIA_GCD_NM#</td>
		<td>#:MIN_CRDT#</td>
	    <td>#:CMPL_CRDT#</td>
	    <td>#:LECAPPLY_CRDT#</td>
	    <td>#:CMPL_PSBL_CRDT#</td>
	    <td>#:PASS_FG#</td>
	    <td>#:NONPSBL_REASON_COMMENT#</td>
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
	    <td>#:RN#</td>
        <td>#:CURC_SUBJ_GCD_NM#</td>
	    <td>#:CURC_SUBJ_NM#</td>
		<td>#:CURC_CRDT#</td>
	    <td>#:GRP_NO#</td>
	    <td>#:GRP_CMPL_CNT#</td>
	    <td>#:SUBJ_GCD_NM#</td>
	    <td>#:SUBJ_NM#</td>
	    <td>#:GRADE_CD#</td>
	    <td>#:CRDT#</td>
	    <td>#:PASS_FG#</td>
	    <td>#:NOTE#</td>
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplate3_2">
	<tr style="cursor:pointer;">
	    <td>#:RN#</td>
        <td>#:COMMON_DETAIL_CD_KOR_NM#</td>
	    <td>#:ESSENTIAL_EXCEPT_GCD_NM#</td>
		<td>#:DOUBLE_PSBL_FG#</td>
	    <td>#:GRP_NO#</td>
	    <td>#:GRP_CMPL_CNT#</td>
	    <td>#:SUBJ_NM#</td>
	    <td>#:GRADE_CD#</td>
	    <td>#:CRDT#</td>
	    <td>#:PASS_FG#</td>
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplate3_3">
	<tr style="cursor:pointer;">
	    <td>#:RN#</td>
        <td>#:EXCEPT_SUBJ_NM#</td>
	    <td>#:GRP_NO#</td>
	    <td>#:GRP_CMPL_CNT#</td>
	    <td>#:SUBJ_NM#</td>
	    <td>#:GRADE_CD#</td>
	    <td>#:CRDT#</td>
	    <td>#:PASS_FG#</td>
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplate4">
	<tr style="cursor:pointer;">
	    <td>#:RN#</td>
        <td>#:EXCEPT_SUBJ_NM#</td>
	    <td>#:GRP_NO#</td>
		<td>#:GRP_CMPL_CNT#</td>
	    <td>#:SUBJ_NM#</td>
	    <td>#:GRADE_CD#</td>
	    <td>#:CRDT#</td>
	    <td>#:PASS_FG#</td>
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplate5">
	<tr style="cursor:pointer;">
	    <td>#:RN#</td>
        <td>#:EVALTN_GCD_NM#</td>
	    <td>#:JOLUP_FACTOR_GCD_NM#</td>
		<td>#:JOLUP_FACTOR_UPPER_GCD_NM#</td>
	    <td>#:JOLUP_FACTOR_PASS_GCD_NM#</td>
	    <td>#:EXAM_DATE#</td>
	    <td>#:PASS_FG#</td>
	    <td>#:UNUSUAL_REASON_CONTENT#</td>
	</tr>
</script>


<script src="/common/js/tabs.js"></script>
<script type="text/javascript">
	var totalCnt = 0;
	const ajaxUrl = '/ost/jolup/hakbujolupguide/jolupsupposeInfo';
	const reqData = {};
	function fn_initScreen() {
		fn_stdtJolupInfo();  
		
		
	}
	
	
	
	function fileViewAjax(option){
	    gfn_ajax_request({	
			url : option.url,
			reqData : option.data,
			dataType : "text",
			success : function(data, responseData) {    
			    $(option.view_target).html(responseData);
				setTimeout(function(){
					$(option.view_target).find(".table").bootstrapTable('resetView');
				},300);
			    
		    }
		});
		
	}
	
	function fn_stdtJolupInfo(data) {
		/* ajax처리 */
		gfn_ajax_request({	
			url : ajaxUrl + "/selectListJolupSupposeInfo",
			reqData : data,
			success : function(data, responseData) {    
				$("#NM").text(scwin.loginUser.userId+'('+scwin.loginUser.nm+')');
				if(scwin.loginUser.degCourseGcd=="0001"){
					$("#STDT_YEAR_GCD").text(scwin.loginUser.stdtYearGcdKorNm);
					$("#UPPER_ASSIGN_NM").text(scwin.loginUser.collCdKorNm+ ' ' +scwin.loginUser.assignNm);
				}else{
					$("#STDT_YEAR_GCD").text(scwin.loginUser.atlectTermCnt+"학기");
					$("#UPPER_ASSIGN_NM").text(scwin.loginUser.collCdKorNm+ ' ' +scwin.loginUser.assignNm+' ('+scwin.loginUser.degCourseGcdKorNm+')');
				}
				$("#HJ_STA_GCD_KOR_NM").text(scwin.loginUser.hjStaGcdKorNm);		
				$("#CURC_APPLY_SYEAR").text(data.CURC_APPLY_SYEAR);
				$("#GRACE_FG").text(data.GRACE_FG);
				$("#ADMS_DATE").text(data.ADMS_DATE);
				$("#ADMS_TYPE_GCD").text(data.ADMS_TYPE_GCD_NM);
				$("#CMPL_TERM_CNT").text(data.CMPL_TERM_CNT);
				$("#APPLY_CRDT").text(data.APPLY_CRDT);
				$("#ACQ_CRDT").text(data.ACQ_CRDT);
				$("#GPA").text(data.GPA); 
				/********************* 2022-07-21 **********************/
		        /* s: 학적 리스트 출력*/
		        fileViewAjax({
		            url : ajaxUrl + "/hakjukList",
		            data: {},
		            view_target : $("#hakjukListTab")
		        });
		        /* e: 학적 리스트 출력*/
		        /********************* 2022-07-21 **********************/
		    }
		});
	}
	
	function fn_setRowTable(reqData){
		if(scwin.loginUser.hjStaGcd != "0007"){
			gfn_ajax_request({
				url : ajaxUrl + "/subjGbnList",
				reqData : reqData,
				success : function(data, responseData) {
					$("#resultTbody1").listView({
		            	dataSource : data,
		            	emptyComment : "조회내역이 없습니다.",
		                dataBound : function(e) {	  
		                	totalCnt = responseData.pageInfo.totCnt;
			                    currentData = data;	 
		            	},
						template : $("#resultTemplate1"),
						totalCnt : responseData.totalCnt,
							totalViewYn : "N" ,
					});		
					
				}
			});
			
			gfn_ajax_request({
				url : ajaxUrl + "/mandatorySubjList",
				reqData : reqData,
				success : function(data, responseData) {
					$("#resultTbody2").listView({
		            	dataSource : data,
		            	emptyComment : "조회내역이 없습니다.",
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
			
			gfn_ajax_request({
				url : ajaxUrl + "/cultureChoiceList1",
				reqData : reqData,
				success : function(data, responseData) {
					if(data.length==1){
						$("#AREA_CMPL_CNT").val(data[0].AREA_CMPL_CNT);
						$("#AREA_GCD_CNT").val(data[0].AREA_GCD_CNT);
						$("#TOTAL_AREA_CNT").val(data[0].TOTAL_AREA_CNT);
					}else{
						$("#AREA_CMPL_CNT").val("");
						$("#AREA_GCD_CNT").val("");
						$("#TOTAL_AREA_CNT").val("");
					}
				}
			});
			
			
			gfn_ajax_request({
				url : ajaxUrl + "/cultureChoiceList2",
				reqData : reqData,
				success : function(data, responseData) {
					$("#resultTbody3_2").listView({
		            	dataSource : data,
		            	emptyComment : "조회내역이 없습니다.",
		                dataBound : function(e) {	  
		                	totalCnt = responseData.pageInfo.totCnt;
			                    currentData = data;	 
		            	},
						template : $("#resultTemplate3_2"),
						totalCnt : responseData.totalCnt,
							totalViewYn : "N" ,
					});		
					
				}
			});
			
			gfn_ajax_request({
				url : ajaxUrl + "/cultureChoiceList3",
				reqData : reqData,
				success : function(data, responseData) {
					$("#resultTbody3_3").listView({
		            	dataSource : data,
		            	emptyComment : "조회내역이 없습니다.",
		                dataBound : function(e) {	  
		                	totalCnt = responseData.pageInfo.totCnt;
			                    currentData = data;	 
		            	},
						template : $("#resultTemplate3_3"),
						totalCnt : responseData.totalCnt,
							totalViewYn : "N" ,
					});		
					
				}
			});
			
			gfn_ajax_request({
				url : ajaxUrl + "/majorList",
				reqData : reqData,
				success : function(data, responseData) {
					$("#resultTbody4").listView({
		            	dataSource : data,
		            	emptyComment : "조회내역이 없습니다.",
		                dataBound : function(e) {	  
		                	totalCnt = responseData.pageInfo.totCnt;
			                    currentData = data;	 
		            	},
						template : $("#resultTemplate4"),
						totalCnt : responseData.totalCnt,
							totalViewYn : "N" ,
					});		
					
				}
			});

			gfn_ajax_request({
                url : ajaxUrl + "/jolupReqList",
                reqData : reqData,
                success : function(data, responseData) {
                    $("#resultTbody5").listView({
                        dataSource : data,
                        emptyComment : "조회내역이 없습니다.",
                        dataBound : function(e) {     
                            totalCnt = responseData.pageInfo.totCnt;
                            currentData = data;  
                        },
                        template : $("#resultTemplate5"),
                            totalCnt : responseData.totalCnt,
                            totalViewYn : "N" ,
                    });     
                    
                }
            }); 

		} else {
			gfn_ajax_request({
				url : ajaxUrl + "/jolupReqList",
				reqData : reqData,
				success : function(data, responseData) {
					$("#resultTbody5").listView({
		            	dataSource : data,
		            	emptyComment : "조회내역이 없습니다.",
		                dataBound : function(e) {	  
	                		totalCnt = responseData.pageInfo.totCnt;
		                    currentData = data;	 
		            	},
						template : $("#resultTemplate5"),
							totalCnt : responseData.totalCnt,
							totalViewYn : "N" ,
					});		
					
				}
			}); 
			
			$("#resultTbody1").html("<tr><td colspan='9' class='text-center'>수료자에게는 제공되지 않는 항목입니다. 졸업요건 이수여부만 조회 가능합니다.</td></tr>");
			$("#resultTbody2").html("<tr><td colspan='12' class='text-center'>수료자에게는 제공되지 않는 항목입니다. 졸업요건 이수여부만 조회 가능합니다.</td></tr>");
			$("#resultTbody3_2").html("<tr><td colspan='10' class='text-center'>수료자에게는 제공되지 않는 항목입니다. 졸업요건 이수여부만 조회 가능합니다.</td></tr>");
			$("#resultTbody3_3").html("<tr><td colspan='8' class='text-center'>수료자에게는 제공되지 않는 항목입니다. 졸업요건 이수여부만 조회 가능합니다.</td></tr>");
			$("#resultTbody4").html("<tr><td colspan='8' class='text-center'>수료자에게는 제공되지 않는 항목입니다. 졸업요건 이수여부만 조회 가능합니다.</td></tr>");
		}
		
	}
	
</script>