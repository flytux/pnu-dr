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
			<div class="sec-body">
				<div class="search-box">
					<input type="text" id="STDT_NO" class="form-control" style="display:none;"/>
				</div>
				<section class="sec-2">
					<header>
						<h3 class="sec-title"></h3>
					</header>
					<div class="sec-body">
						<!-- 2단 테이블 -->
						<section class="sec-2">
							<div class="card-header" id="heading1">
								<label class="text-left dfn" data-lang>기본정보</label>
							</div>
							<div class="sec-body">
								<div class="b-table-box" role="table" aria-label="2단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>학번</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id=STDT_STAFF_NO ></label>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>성명</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="NM"></label>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>상태</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="HJ_STA_GCD"></label>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>소속</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="DEPT_CD"></label>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item merge-2">
											<div class="b-title-box" role="rowheader">
												<label data-lang>주소</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="ADDR"></label>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>전화번호</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="TEL_NO"></label>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>핸드폰</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="CELLULAR_NO"></label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 2단 테이블 -->
						<section class="sec-2">
							<div class="card-header" id="heading1">
								<label class="text-left dfn" data-lang>병역정보</label>
							</div>
							<div class="sec-body">
								<div class="b-table-box" role="table" aria-label="2단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>군번</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="MIL_NO"></label>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>역종</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="MIL_SERVE_SHAPE_GCD"></label>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>예비군소속</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="YB_COMPNT_ASSIGN_NO"></label>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>편성상태</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="COMPNT_STA_GCD"></label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 메시지 박스 -->
						<div class="message-box">
							<div class="message-box-inner">
								<div class="message-body">
									<ul class="list list-style-1">
                                        <li >신청 기간 외 신청 시 신청 내역이 삭제될 수 있습니다. 신청 기간은 학생지원 시스템 공지사항을 참조해 주시기 바랍니다.</li>
										<li >틀린 정보가 있을 경우엔 예비군연대로 연락바랍니다. (☎ <a href="tel:051-510-1906">510-1906~7)</a></li>
										<li >선택버튼을 클릭하면 지원됩니다.</li>
										<li >선택여부는 선택클릭 후 결과이므로 체크하지 않아도 됩니다.</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- /END 메시지 박스 -->

						<!-- 테이블 -->
						<!-- 교육일자,편성인원 -->
						<div class="table-box">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table" data-show-column="true">
									<caption>교육일자,편성인원</caption>
									<colgroup>
										<col style="min-width: 150px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 50px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" >교육일자</th>
											<th scope="col" >편성인원</th>
											<th scope="col" >선택여부</th>
											<th scope="col" >선택</th>
										</tr>
									</thead>
									<tbody id="resultTbody">
									</tbody>
								</table>
							</div>
						</div>
						<!-- /END 테이블 -->
						

						<!-- 테이블 -->
						<!-- 신청내역 목록 -->
						<div class="table-box">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table"  data-show-column="true">
									<caption>신청내역 목록</caption>
									<colgroup>
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
									</colgroup>
									<thead>
										<tr>
<!-- 											<th scope="col">학번</th> -->
<!-- 											<th scope="col">훈련명</th> -->
<!-- 											<th scope="col">교육일자</th> -->
<!-- 											<th scope="col" style="">교육구분코드</th> -->
										</tr>
									</thead>
									<tbody id="resultTbody2">
									</tbody>
								</table>
							</div>
						</div>
						<!-- /END 테이블 -->
					</div>
				</section>
			</div>
		</section>
	</main>
</div>
<!-- 교육일자,편성인원 -->
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
	    <td class="text-center">#:EDU_DATE#</td>
	    <td class="text-center">#:LIMIT_INWON_CNT#</td>
		<td>
			<input class="" type="checkbox" name="EDU_GB" id="EDU_GB" title="#:EDU_DATE#">
		</td>
		<td>
			<button class="btn btn-outline-primary detail-btn" type="button">선택</button>
		</td>
	</tr>
</script>

<!-- 신청내역 목록-->
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
	    <td class="text-center">#:STDT_NO#</td>
	    <td class="text-left">#:EDU_GCD_NM#</td>
	    <td class="text-center">#:EDU_DATE#</td>
		<td>
			<button class="btn btn-outline-primary detail-btn" type="button">삭제</button>
		</td>
	</tr>
</script>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	
	function fn_initScreen() {				
		//var stdtNo = scwin.loginUser.userId; //학번
		//$("#STDT_NO").val(stdtNo);
		//fn_sch();
		
		fn_scheduleChk();
	}
	
	var data1, data2;
	
	function fn_scheduleChk() {
        /* 일정체크 */
        gfn_ajax_request({
            url : "/ost/mil/ybdrillapply/selectYbschedulecheck",
            reqData : {},
            success : function(data, responseData) {
                if(data[0].O_RSLT == "N"){
                    alert(data[0].O_MSG);
                    return;
                }else{
                    fn_sch();
                }
            }
        });
    }
	
	function fn_sch(data) {
		if (gfn_com_isEmptyObject(data)) {
	        data = gfn_com_searchData($(".search-box"));
	    }
	
		/* 학생기본조회 */
		gfn_ajax_request({
	        url : "/ost/mil/ybdrillapply/selectListYbDrillApply",
	        reqData : data,
	        success : function(data, responseData) {
	        	if (gfn_com_isEmptyObject(data[0])) {
	                alert('교육대상자가 아니거나 편성상태가 아닙니다. 편성상태 확인은 예비군연대로 문의바랍니다.(051-510-1906~7)\n 생명자원과학대학 소속 학생의경우, 밀양캠퍼스 예비군대대로 신청바랍니다.(055-350-5195)');
	                return;
	            }else{
	            	data1 = data[0];
	            	data2 = data[1]; 
	            	fn_sch2();
	            }
	        }
	    });
	}
	
	function fn_sch2() {
		/* 교육일자조회 */
		gfn_ajax_request({
	        url : "/ost/mil/ybdrillapply/selectListYbDrillApply2",
	        reqData : {},
	        success : function(data, responseData) {
	        	if (gfn_com_isEmptyObject(data[0])) {
	                var txt  = ""; 
	                if (!gfn_com_isEmptyObject(data[1])) {
	                	 for(var i in data[1]){
	 	                	if(i < 1 ) txt = '\n'+data[1][i].SCHEDULE + '(' + data[1][i].REMARK + ')';  
	 	                	txt += ',\n'+data[1][i].SCHEDULE + '(' + data[1][i].REMARK + ')';  
	 	                }
	                	
	                }
	                alert("신청기간이 아니거나 해당 교육일정이 모두 마감되었습니다."+txt);
	            	data1 = '';
	            	data2 = '';
	                return false;
	            }
    	
	        	//기본정보 세팅 
	        	$("#STDT_STAFF_NO").text(scwin.loginUser.userId);
				$("#NM").text(data1[0].NM);        	
				$("#HJ_STA_GCD").text(data1[0].HJ_STA_GCD);        	
				$("#DEPT_CD").text(data1[0].ASSIGN);        	
				$("#ADDR").text(data1[0].ADDR);        	
				$("#TEL_NO").text(data1[0].TEL_NO);        	
				$("#CELLULAR_NO").text(data1[0].CELLULAR_NO);        	
	
	        	//병역정보 세팅
				$("#MIL_NO").text(data1[0].MIL_NO);       
				$("#MIL_SERVE_SHAPE_GCD").text(data1[0].MIL_SERVE_SHAPE_GCD);       
				$("#YB_COMPNT_ASSIGN_NO").text(data1[0].YB_COMPNT_ASSIGN_NO);       
				$("#COMPNT_STA_GCD").text(data1[0].COMPNT_STA_GCD);       
	        	
				//신청내역 세팅
	        	$("#resultTbody2").listView({
	                dataSource : data2,
	                emptyComment : '신청내역이 없습니다.',
	                dataBound : function(e) {
	                    $('#resultTbody2 .detail-btn').bind("click", function(e){
	                    	scwin.detailObj = $(this).closest("tr").data();   
	                		fn_delete();
	                    });
	                    currentData = data2;
	                },
	                template : $("#resultTemplate2"),
	                totalCnt : data2.length,
	            });
	        	
				//교육일자, 편성인원 세팅
	        	$("#resultTbody").listView({
	                dataSource : data[0],
	                dataBound : function(e) {
	                	$("#resultTbody tr").find("td:not(:last)").bind("click", function(e) {
	                        scwin.detailObj = $(this).closest("tr").data();  
	                    });
	                    $('#resultTbody .detail-btn').bind("click", function(e){
	                    	scwin.detailObj = $(this).closest("tr").data();   
	                		fn_preInsert();
	                    });
	                    currentData = data[0];
	                },
	                template : $("#resultTemplate"),
	                totalCnt : data[0].length,
	            });

				for(var i = 0; i < data[0].length; i++){
					if(data1[0].EDU_GB == $("#resultTbody tr:eq("+ i +")").data().NUM){
						$("#resultTbody tr:eq("+ i +") td:eq(2)").find("input[type=checkbox]").prop("checked",true);
					}
					
				}
				
	           	data1 = '';
	           	data2 = '';
	        }
	    });
	}
	
	function fn_preInsert(_option) {
		confirm('선택하시겠습니까?',function(_flag){
			if(_flag) {
			   	var param = scwin.detailObj;
			   	
				//입력체크 
				gfn_ajax_request({
			        url : "/ost/mil/ybdrillapply/selectYbDrillApply",
			        reqData : param,
			        success : function(data, responseData) {
			        	if(data.O_MSG == "N"){
			        		alert("선택한 날짜에 인원이 초과 되었습니다."); 
				        	return;
			        	}
			        	fn_preInsert2();
			        }
			    });
			}
		});
	}	
	
	function fn_preInsert2(_option) {
	   	var param = scwin.detailObj;
		
		//입력체크 2
		gfn_ajax_request({
	        url : "/ost/mil/ybdrillapply/selectYbDrillApply2",
	        reqData : param,
	        success : function(data, responseData) {
	        	
	        	if(data.O_RSLT != 'Y') {
	        		alert(data.O_MSG);
	        	}else{
	        		fn_insert();
	        	}
	        }
	    });
	}	
	
	
	
	function fn_insert(_option) {
	   	var param = scwin.detailObj;
	
		//입력
		gfn_ajax_request({
	        url : "/ost/mil/ybdrillapply/insertYbDrillApply",
	        reqData : param,
	        success : function(data, responseData) {
	       		alert(data.O_MSG);
	       		fn_sch();
	        }
	    });
		
	}
	
	function fn_delete(_option) {
		confirm('삭제하시겠습니까?',function(_flag){
			if(_flag) {
			   	var param = scwin.detailObj;
				//삭제 	
				gfn_ajax_request({
			        url : "/ost/mil/ybdrillapply/deleteYbDrillApply",
			        reqData : param,
			        success : function(data, responseData) {
			       		if(data.O_RSLT == "Y"){
			       			alert('신청 취소 되었습니다.');
			       		}else{
				       		alert(data.O_MSG)
			       		}
			       		fn_sch();
	//		 			location.reload();
			        }
			    });
			}
		});
	}

</script>
