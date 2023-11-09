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
					<section class="sec-3">
						<header>
						</header>
							<div class="sec-body">
								<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>대학(원)</label>
											</div>
											<div class="b-con-box" role="cell" id="COLL_GRAD_NM">												
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학위</label>
											</div>
											<div class="b-con-box" role="cell" id="DEG_COURSE_NM">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학과(부)</label>
											</div>
											<div class="b-con-box" role="cell" id="ASSIGN_NM">
											</div>
										</div>										
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학번</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_NO">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>학년</label>
											</div>
											<div class="b-con-box" role="cell" id="STDT_YEAR_GCD">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>성명</label>
											</div>
											<div class="b-con-box" role="cell" id="NM">
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
				</div>
				<section class="sec-3">
					<header>
						<h4 class="sec-title">등록금 내역</h4>
					</header>
					<div class="sec-body">
						<div class="table-box">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table"  data-show-column="true">
									<caption>등록금 내역</caption>
									<colgroup>
										<col style="min-width: 50px;">
										<col style="min-width: 50px;">
										<col style="min-width: 80px;">
										<col style="min-width: 100px;">
										<col style="min-width: 200px;">
										<col style="min-width: 60px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">학년도</th>
											<th scope="col">학기</th>
											<th scope="col">수납입학금</th>
											<th scope="col">수납수업료Ⅰ</th>
											<th scope="col">수납수업료Ⅱ</th>
											<th scope="col">수납계</th>
										</tr>
									</thead>
									<tbody id="resultTbody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
				
				<!-- 정보입력 START  -->
				<section class="sec-3" style="margin-bottom:60px;">
					<header>
						<h4 class="sec-title">반환정보</h4>
					</header>
						<div class="search-box">
							<input type="text" id="SYEAR" class="form-control" style="display: none;" /> 
							<input type="text" id="TERM_GCD" class="form-control" style="display: none;" /> 
							<input type="text" id="REFUND_BANK_CD" class="form-control" style="display: none;" /> 
							<input type="text" id="REFUND_RATIO_GCD" class="form-control" style="display: none;" /> 
						</div>
						<div class="b-table-box flex-col-3" role="table" aria-label="조회" style="margin-bottom:5px;">
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label for="REFUND_RATIO_NM" data-lang>반환율</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="REFUND_RATIO_NM"></div>
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label for="NONPSBL_REASON_INS_DATE" data-lang>반환사유일자</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="NONPSBL_REASON_INS_DATE"></div>
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label for="EX_REFUND" data-lang>예상반환금</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="EX_REFUND"></div>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label for="REFUND_ADMS_AMT" data-lang>반환입학금</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="REFUND_ADMS_AMT"></div>
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label for="REFUND_CLASS_1_AMT" data-lang>반환수업료Ⅰ</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="REFUND_CLASS_1_AMT"></div>
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label for="REFUND_CLASS_2_AMT" data-lang>반환수업료Ⅱ</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="REFUND_CLASS_2_AMT"></div>
									</div>
								</div>
							</div>
							<div class="b-row-box" role="row">
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label for="REFUND_BANK_NM" data-lang>반환은행</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="REFUND_BANK_NM"></div>
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label for="REFUND_ACCT_NO" data-lang>반환계좌</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="REFUND_ACCT_NO"></div>
									</div>
								</div>
								<div class="b-row-item">
									<div class="b-title-box" role="rowheader">
										<label for="REFUND_ACCT_NM" data-lang>반환예금주</label>
									</div>
									<div class="b-con-box" role="cell">
										<div id="REFUND_ACCT_NM"></div>
									</div>
								</div>
							</div>
					</div>
				</section>
				<!-- 정보입력 END  -->
				
			<div>
				<div class='text-center mb-4'>                                                          
					<div class='form-group'>                                                            
						<button class='btn btn-primary btn-lg' onclick="fn_save()" type='button' id="btnSave">환불신청</button>
						<button class='btn btn-primary btn-lg' onclick="fn_cancel()" type='button' id="btnCancel">환불신청취소</button>
					</div>                                                                              
				</div>                                                                                  
			</div>
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:SYEAR#</td>
		<td>#:TERM_GCD_NM#</td>
		<td>#:GOJI_ADMS_AMT#</td>
		<td>#:GOJI_CLASS_1_AMT#</td>
		<td>#:GOJI_CLASS_2_AMT#</td>
		<td>#:GOJI_TOTAL#</td>
	</tr>
</script>
<script type="text/javascript">
	const ajaxPath = '/ost/enroll/enrollamtpayguide/refundapply';
	
	function fn_initScreen() {
		var collGradGcd = scwin.loginUser.collGradGcd;
		var collCdKorNm = scwin.loginUser.collCdKorNm;
		var gradGcdKorNm = scwin.loginUser.gradGcdKorNm;
		var assignNm = scwin.loginUser.assignNm;
		var degCourseGcdKorNm = scwin.loginUser.degCourseGcdKorNm;
		var stdtno = scwin.loginUser.userId;
		var stdtyear = scwin.loginUser.stdtYearGcdKorNm
		var nm = scwin.loginUser.nm;
		
		if(collGradGcd='0001')
			$("#COLL_GRAD_NM").text(collCdKorNm);
		else
			$("#COLL_GRAD_NM").text(gradGcdKorNm);
		
		$("#DEG_COURSE_NM").text(degCourseGcdKorNm);
		$("#ASSIGN_NM").text(assignNm);
		$("#STDT_NO").text(stdtno);
		$("#STDT_YEAR_GCD").text(stdtyear);	
		$("#NM").text(nm);
		
		fn_search();
	}
	
	function fn_search(data){
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
	
		gfn_ajax_request({
			url : ajaxPath + '/selectRefundApply',
            	reqData : data,
                success : function(data, responseData) {    
                	if (!gfn_com_isEmptyObject(data) ) {
                		
	                	// 휴학상태확인 - 휴학상태가 아닐때  메시지 메인화면 리턴
	                	if(data[0][0].O_RSLT == "N"){
	                		alert2(data[0][0].O_MSG,function (e){history.back();});
	                	}
	                	// 등록여부 확인 - 미등록자 일때 메시지 메인화면 리턴
	                	if(data[1][0].O_RSLT == "N"){
	                		alert2(data[1][0].O_MSG,function (e){history.back();});
	                	}
	                	// 장학내역여부 확인 - 장학내역이 있을때 메시지 메인화면 리턴
	                	if(data[2][0].O_RSLT == "N"){
	                		alert2(data[2][0].O_MSG,function (e){history.back();});
	                	}
	    				
	                	// 등록금내역
	                	$("#SYEAR").val(data[4][0].SYEAR); // 학년도
	                	$("#TERM_GCD").val(data[4][0].TERM_GCD); // 학기
	                	
	                	var datas4 = data[4][0];
	                	datas4.GOJI_ADMS_AMT = gfn_str_numberWithCommas(data[4][0].GOJI_ADMS_AMT);
	                	datas4.GOJI_CLASS_1_AMT = gfn_str_numberWithCommas(data[4][0].GOJI_CLASS_1_AMT);
	                	datas4.GOJI_CLASS_2_AMT = gfn_str_numberWithCommas(data[4][0].GOJI_CLASS_2_AMT);
	                	datas4.GOJI_TOTAL = gfn_str_numberWithCommas(data[4][0].GOJI_TOTAL);
	                	
						$("#resultTbody").listView({
							dataSource : data[4],
							emptyComment : '조회내역이 없습니다.',
							dataBound : function(e) {
								totalCnt = responseData.pageInfo.totCnt;
								currentData = data;
							},
							template : $("#resultTemplate"),
							totalCnt : responseData.totalCnt
						});
	                	
						// 반환정보
						if (!gfn_com_isEmptyObject(data[5])) {
							if(data[5][0].RETURN_FG == "Y"){
								$("#btnSave").hide();
								$("#btnCancel").show();
							}else{
								$("#btnSave").show();
								$("#btnCancel").hide();
							}
							
							$("#NONPSBL_REASON_INS_DATE").text(data[5][0].NONPSBL_REASON_INS_DATE); // 반환사유일자
							$("#REFUND_ACCT_NM").text(data[5][0].REFUND_ACCT_NM); // 반환예금주
							$("#REFUND_ACCT_NO").text(data[5][0].REFUND_ACCT_NO); // 반환계좌
							$("#REFUND_ADMS_AMT").text(gfn_str_numberWithCommas(data[5][0].REFUND_ADMS_AMT)); // 반환입학금
							$("#REFUND_BANK_NM").text(data[5][0].REFUND_BANK_NM); // 반환은행
							$("#REFUND_BANK_CD").text(data[5][0].REFUND_BANK_CD); // 반환은행
							$("#REFUND_CLASS_1_AMT").text(gfn_str_numberWithCommas(data[5][0].REFUND_CLASS_1_AMT)); // 반환수업료Ⅰ
							$("#REFUND_CLASS_2_AMT").text(gfn_str_numberWithCommas(data[5][0].REFUND_CLASS_2_AMT)); // 반환수업료Ⅱ
							$("#REFUND_RATIO_NM").text(data[5][0].REFUND_RATIO_NM); // 반환율
							$("#REFUND_RATIO_GCD").text(data[5][0].REFUND_RATIO_GCD); // 반환율

							$("#EX_REFUND").text(gfn_str_numberWithCommas(data[5][0].REFUND_ADMS_AMT + data[5][0].REFUND_CLASS_1_AMT + data[5][0].REFUND_CLASS_2_AMT)); // 반환율
						}
                		
                	}
                }
          });	
	}
	
	/***************************************************************************
	 * 환불신청
	 **************************************************************************/
	function fn_save() {
		var data = gfn_com_inputdata($(".search-box"));
		data.REFUND_ADMS_AMT = $("#REFUND_ADMS_AMT").text().replace(/,/g, '');
		data.REFUND_CLASS_1_AMT = $("#REFUND_CLASS_1_AMT").text().replace(/,/g, '');
		data.REFUND_CLASS_2_AMT = $("#REFUND_CLASS_2_AMT").text().replace(/,/g, '');
		data.REFUND_BANK_NM = $("#REFUND_BANK_NM").text();
		data.REFUND_BANK_CD = $("#REFUND_BANK_CD").text();
		data.REFUND_ACCT_NO = $("#REFUND_ACCT_NO").text();
		data.REFUND_ACCT_NM = $("#REFUND_ACCT_NM").text();
		data.REFUND_RATIO_NM = $("#REFUND_RATIO_NM").text();
		data.REFUND_RATIO_GCD = $("#REFUND_RATIO_GCD").text();
		
		confirm("환불신청하시겠습니까?",function(_flag){
			if(_flag) {
    			gfn_ajax_request({
    				url : ajaxPath + '/executeRefundApply',
        			reqData : data,
        			success : function(data, responseData){
        				alert("환불신청되었습니다.",function(){ location.reload()  });
        			}
        		});
    		}
		})
	}
	/***************************************************************************
	 * 환불신청취소
	 **************************************************************************/
	function fn_cancel() {
		var data = gfn_com_inputdata($(".search-box"));
		
		confirm("환불신청취소하시겠습니까?",function(_flag){
			if(_flag) {
    			gfn_ajax_request({
    				url : ajaxPath + '/cancelRefundApply',
        			reqData : data,
        			success : function(data, responseData){
        				if (!gfn_com_isEmptyObject(data)) {
	        				if(data.O_RSLT =="N"){
	        					alert(data.O_MSG);
	        				}else{
		        				alert("환불신청이 취소되었습니다.",function(){ location.reload()  });
	        				}
        				}
        			}
        		});
    		}
		})
	}
	
	
</script>