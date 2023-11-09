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
				<section class="sec-2">
					<header>
						<h3 class="sec-title"></h3>
					</header>
					<div class="sec-body">
						<section class="sec-2 ">
							<!-- 아코디언 -->
							<div class="sec-body">
								<div class="accordion mb-1">
									<div class="card ">
										<div class="card-header" id="heading1">
											<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true" data-controls="collapse1">졸업생 취업현황</button>
										</div>
										<div id="collapse1" class="collapse show" aria-labelledby="heading1">
											<div class="card-body">
												<section class="sec-3 mb-0">
													<div class="sec-body">
														<!-- 검색 영역 -->
														<div class="search-box">
															<div class="b-table-box flex-col-4" role="table" aria-label="조회">
																<div class="b-row-box" role="row">
																	<div class="b-row-item">
																		<div class="b-title-box" role="rowheader">
																		    <label class="req" for="SCH_SYEAR" data-lang>졸업년도</label>
																		</div>
																		<div class="b-con-box" role="cell">
																			<select class="form-control" id="SCH_SYEAR">
																			</select>
																		</div>
																	</div>
																	<div class="b-row-item merge-3">
																		<div class="b-con-box" role="cell">
																			<div class="custom-control custom-radio custom-control-inline">
													                           <input class="custom-control-input" type="radio" name="RGROUP"  id="R1" value="1" onclick="" checked>
													                           <label class="custom-control-label" for="R1" data-lang>전체</label>
													                        </div>
																		    <div class="dfn">										
		         												               <input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" />
		         												            </div>
		         												            <div class="dfn">		
													                           <input type="text" id="SCH_GRAD_GCD" class="form-control" />
													                        </div>													                        
																			<div class="custom-control custom-radio mr-2">
													                           <input class="custom-control-input" type="radio" name="RGROUP"  id="R2" value="2" onclick="">
													                           <label class="custom-control-label" for="R2" data-lang>단과대학</label>
													                        </div>  
													                        <div style="width:200px;" class="mr-3">		
													                           <input type="text" id="SCH_COLL_CD" class="form-control" />
													                        </div>
																			<div class="custom-control custom-radio mr-2">
													                           <input class="custom-control-input" type="radio" name="RGROUP"  id="R3" value="3" onclick="">
													                           <label class="custom-control-label" for="R3" data-lang>학과</label>
													                        </div>  
													                        <div style="width:200px;">		
													                           <input type="text" id="SCH_DEPT_CD" class="form-control"/>
													                        </div>
																		</div>																	
																	</div>
																</div>	
															</div>
														</div> 
														<!-- /END 검색 영역 -->			
														<!-- 테이블 -->
														<!-- 성별 졸업생 취업현황 -->
														<div class="table-box">
															<div class="table-body">
																<div class="table-responsive">
																	<table class="table table-hover">
																		<caption>성별 졸업생 취업현황</caption>
																		<colgroup>
																			<col style="min-width: 80px;">
																			<col style="min-width: 100px;">
																			<col style="min-width: 100px;">
																			<col style="min-width: 100px;">
																			<col style="min-width: 100px;">
																			<col style="min-width: 100px;">
																		</colgroup>
																		<thead>
																			<tr>
																				<th scope="col" >성별</th>
																				<th scope="col" >졸업자</th>
																				<th scope="col" >취업자</th>
																				<th scope="col" >취업률</th>
																				<th scope="col" >진학자</th>
																				<th scope="col" >진학률</th>
																			</tr>
																		</thead>
																		<tbody id="resultTbody">
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<!-- /END 테이블 -->
														<!-- 리스트 -->
														<section class="sec-2 mb-0">
															<header>
																<h2 class="sec-title"></h2>
															</header>
															<div class="sec-body">
																<p class="info-text mb-0">
																	<b>대학정보공시</b>
																</p>
																<ul class="list list-style-1">
																	<li class="text-danger">2015년 취업통계조사부터 조사기준일이 6월 1일에서 12월 31일로 변경되었습니다.</li>
																	<li>이전년도 12월 31일 기준 취업률 및 취업자 현황은 해당년도 12월에 발표됩니다.<br/>
																		<b>예) 2015년도 취업률 <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 2016년도 12월 발표</b></li>
																	<li>취업통계조사 결과 발표 후 취업자 명단 정보를 제공합니다.</li>
																	<li>문의사항: 051) 510-3714 (취업전략과)</li>
																</ul>
															</div>
														</section>
														<!-- /END 리스트 -->
														<!-- 리스트 -->
														<section class="sec-2 mb-1">
															<header>
																<h2 class="sec-title"></h2>
															</header>
															<div class="sec-body">
																<p class="info-text mb-0">
																	<b>취업현황 개요</b>
																</p>
																<ul class="list list-style-1">
																	<li class="text-primary">취업자(1인창(사)업자, 프리랜서 포함), 제외인정자 및 정확한 취업률은 12월 말에 제공합니다.</li>
																	<li>조사대상자: 기준연도 2월 졸업자 + 전년도 8월 졸업자 <br/>
																		<b>예) 2020년도 조사대상자  <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 2020년도 2월 졸업자 + 2019년도 8월 졸업자</b>
																	</li>
																	<li>주요지표 산출공식</li>
																		<ul class="">
																			<li>취업률(%) = 취업자 / (졸업자-(진학자+입대자+외국인유학생+취업불가능자+제외인정자))*100</li>
																			<li>진학률(%) = 진학자 / 졸업자 * 100</li>
																		</ul>
																	<li>정확한 취업률 확인을 위해서는 다음을 참고바랍니다.<br/>
																		대학알리미 홈페이지 &gt; 학생 &gt; 5-다.졸업생의 취업현황
																		<a class="link link-style-1" href="https://www.academyinfo.go.kr/" title="졸업생의 취업현황 새창열기" target="_blank">바로가기</a>
																	</li>
																</ul>
															</div>
														</section>
														<!-- /END 리스트 -->
													</div>
												</section>
											</div>
										</div>
									</div>
								</div>
								<!-- 취업현황 / 진학현황 -->
								<div class="search-box mb-0">
									<div class="card-header" id="heading2">
										<div class="custom-control custom-radio custom-control-inline">
				                          <input class="custom-control-input" type="radio" name="RGROUP2"  id="KIND1" value="01" onclick="" checked>
				                          <label class="custom-control-label" for="KIND1" data-lang>취업현황</label>
				                        </div>
										<div class="custom-control custom-radio custom-control-inline">
				                          <input class="custom-control-input" type="radio" name="RGROUP2"  id="KIND2" value="02" onclick="">
				                          <label class="custom-control-label" for="KIND2" data-lang>진학현황</label>
				                        </div>
									</div>
								</div>
						
								<div class="row">
									<div class="col">
										<!-- 테이블 리스트 -->
										<div class="table-box">
											<div class="table-header"></div>
											<div class="table-body">
												<div class="table-responsive">
													<table class="table ">
														<caption>취업현황/진학현황</caption>
														<colgroup>
														</colgroup>
														<thead>
															<tr>
															</tr>
														</thead>
														<tbody>
								                           <tr>
								                               <td>
								                                   <ul style="padding-left:0px" id="tab_1_sub"></ul>
								                               </td>	
								                           </tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<div class="col">
										<div class="table-box">
											<div class="table-header">
												<div class="header-item">
												</div>
											</div>
											<div class="table-body">
												<div class="table-responsive">
													<table class="table table-hover">
														<caption>상세스펙</caption>
														<colgroup>
														</colgroup>
														<thead>
															<tr>
															</tr>
														</thead>
														<tbody id="tab_1_sub_right" >
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /END 테이블 -->
							</div>
							<!-- /END 아코디언 -->
						</section>
						<section class="sec-2">
							<div class="sec-body">
							</div>
						</section>
					</div>
				</section>
			</div>
		</section>
	</main>
</div>
<!-- 성별 졸업생 취업현황 -->
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
	    <td class="text-center">#:성별#</td>
	    <td class="text-center">#:졸업자#</td>
	    <td class="text-center">#:취업자#</td>
	    <td class="text-center">#:취업률#</td>
	    <td class="text-center">#:진학자#</td>
	    <td class="text-center">#:진학률#</td>
	</tr>
</script>
<script type="text/javascript">
	
	function fn_initScreen() {				
		// 	fn_sch();
		//$("label[for='R2']").text(scwin.loginUser.collCdKorNm);
		//$("label[for='R3']").text(scwin.loginUser.deptCdKorNm);

		/*학과소속 바인드*/
		gfn_com_assignCombo({
			collGradGcd : $("#SCH_COLL_GRAD_GCD"),
			gradGcd : $("#SCH_GRAD_GCD"),
			collCd : $("#SCH_COLL_CD"),
			deptCd : $("#SCH_DEPT_CD"), 
			comboLvl : 4,
			dataBound : function(e) {
				
				$("#SCH_COLL_CD_multi .select-pure__select").addClass("disabled");
				$("#SCH_COLL_CD_multi .select-pure__options").addClass("hide");
				$("#SCH_DEPT_CD_multi .select-pure__select").addClass("disabled");
				$("#SCH_DEPT_CD_multi .select-pure__options").addClass("hide");				
				
				/* 단과대학 변경시 */
				$('#SCH_COLL_CD').change(function() {
					fn_sch();
				});				
				
				/* 학과 변경시 */
				$('#SCH_DEPT_CD').change(function() {
					fn_sch();
				});				
			}
		});
		
		$("#SCH_COLL_GRAD_GCD").closest(".dfn").hide();
		$("#SCH_GRAD_GCD").closest(".dfn").hide();
		
		fn_getMultiDept(); //소속단과대학, 소속학과, 복수전공학과 인경우만 취업/진학현황, 상세 스펙 조회가능 
	}
	
	var multiDeptCd = "";
	
	/* 복수전공학과 조회 */
	function fn_getMultiDept() {
		gfn_ajax_request({
	        url : "/ost/scm/scmsituation/JolupStdtEplymtSituation/getMultiDept",
	        reqData : null,
	        success : function(data, responseData) {
	        	multiDeptCd = data.MULTI_DEPT_CD;
	        	fn_getJolupYear();
	        }
	    });
	}
	
	/* 졸업년도조회 */
	function fn_getJolupYear() {
		gfn_ajax_request({
	        url : "/ost/scm/scmsituation/JolupStdtEplymtSituation/getJolupYear",
	        reqData : null,
	        success : function(data, responseData) {

	        	$("#SCH_SYEAR").dropDownList({ //졸업년도     
	        		dataSource : data,
	        		commonCode : null,
	        		dataTextField : "SCM_YEAR",
	        		dataValueField : "SCM_YEAR",
	        		dataBound : function(e) {
	        		}
	        	});
	        	fn_sch();
	        }
	    });
	}
	
	/* 성별 졸업생 취업현황 조회조건 변경시 */
	$('input[type=radio][name=RGROUP]').change(function() {
		
		if ( this.value == "2" ) {
			$("#SCH_COLL_CD_multi .select-pure__select").removeClass("disabled");
			$("#SCH_COLL_CD_multi .select-pure__options").removeClass("hide");
			$("#SCH_DEPT_CD_multi .select-pure__select").addClass("disabled");
			$("#SCH_DEPT_CD_multi .select-pure__options").addClass("hide");
		} else if ( this.value == "3" ) {
			$("#SCH_COLL_CD_multi .select-pure__select").removeClass("disabled");
			$("#SCH_COLL_CD_multi .select-pure__options").removeClass("hide");
			$("#SCH_DEPT_CD_multi .select-pure__select").removeClass("disabled");
			$("#SCH_DEPT_CD_multi .select-pure__options").removeClass("hide");
		} else {
			$("#SCH_COLL_CD_multi .select-pure__select").addClass("disabled");
			$("#SCH_COLL_CD_multi .select-pure__options").addClass("hide");
			$("#SCH_DEPT_CD_multi .select-pure__select").addClass("disabled");
			$("#SCH_DEPT_CD_multi .select-pure__options").addClass("hide");
		}		
		
		fn_sch();
	});
	
	/* 졸업생 취업현황/진학현황 변경시 */
	$('input[type=radio][name=RGROUP2]').change(function() {
		searchParam.RGROUP2 = this.value;
		fn_statusSearch();
	});
	
	/* 졸업년도 변경시*/
	$('#SCH_SYEAR').change(function() {
		fn_sch();
	});

	
	/* 성별 졸업생 취업현황 조회 */
	var searchParam = '';
	function fn_sch() {
		searchParam = gfn_com_searchData($(".search-box"));
	    searchParam.SCH_COLL_GRAD_GCD = scwin.loginUser.collGradGcd;
	    searchParam.SCH_GRAD_GCD = scwin.loginUser.gradGcd;
		
		switch(searchParam.RGROUP){
			case '1':
				searchParam.SCH_COLL_CD = '';
				searchParam.SCH_DEPT_CD = '';
				break;
			case '2':
				searchParam.SCH_COLL_CD = $("#SCH_COLL_CD").val();
				searchParam.SCH_DEPT_CD = '';
				break;
			case '3':
				searchParam.SCH_COLL_CD = $("#SCH_COLL_CD").val();
				searchParam.SCH_DEPT_CD = $("#SCH_DEPT_CD").val();
				break;
			default:
				break;
		}
		
		$("#tab_1_sub_right").html("");//right menu 초기화
		
		gfn_ajax_request({
	        url : "/ost/scm/scmsituation/JolupStdtEplymtSituation/selectListJolupStdtEplymtSituation",
	        reqData : searchParam,
	        success : function(data, responseData) {
	        	if (data.length == 1 && data[0]["성별"] == "전체" && data[0]["졸업자"] == 0 ) {
	        		$("#resultTbody").html("<tr><td colspan='6' class='text-center'>해당 연도의 졸업생 통계자료가 존재하지 않습니다.</td></tr>");
	        	} else {
		        	$("#resultTbody").listView({
		                dataSource : data,
		                emptyComment : '해당 연도의 졸업생 통계자료가 존재하지 않습니다.',
		                dataBound : function(e) {
		                },
		                template : $("#resultTemplate"),
		                totalCnt : data.length,
		            });
	        	}
		    }
	    });
		
    	fn_statusSearch(searchParam);
	}
	
	
	/* 졸업생 취업현황/진학현황 조회 */
	function fn_statusSearch() {
	    var sub_url =  searchParam.RGROUP2 == 01 ? "/selectEmploymentStatus" : "/selectFurtherStatus";
	    
		if (searchParam.RGROUP == "1" //전체
			 || ( searchParam.RGROUP == "2" && scwin.loginUser.collCd == $("#SCH_COLL_CD").val() ) //검색조건이 단과대학이고 선택한 단과대학이 소속단과대학과 일치하면
			 || ( searchParam.RGROUP == "3" && (scwin.loginUser.deptCd == $("#SCH_DEPT_CD").val() || multiDeptCd == $("#SCH_DEPT_CD").val()) ) //검색조건이 학과이고 선택한 학과가 소속학과이거나 복수전공과 일치하면 
			   ) {
			
			gfn_ajax_request({
		        url : "/ost/scm/scmsituation/JolupStdtEplymtSituation" + sub_url,
		        reqData : searchParam,
		        success : function(data, responseData) {
	
		        	
					var datas=data;
					var size=datas.length;
					var i=0;
					var html='';
					if(size>0){
						var com_gcd = ""; 
						var crnt_com_gcd = "";
						var com_gcd_nm = ""; 
						var crnt_com_gcd_nm = "";
						var com_nm = "";
						var level_depth = "";
						
						for(var j=0; j<datas.length; j++){
							var dr = datas[j];
							com_gcd = dr["회사구분코드"];
							com_gcd_nm = dr["회사구분"];
							com_nm = dr["회사명"] == null ? "undefined" : dr["회사명"];
							level_depth = dr["LEVEL_DEPTH"];
							if (com_gcd != crnt_com_gcd && com_gcd_nm != crnt_com_gcd_nm) {
								if(j>0) {
									i++;
									//그룹닽기
									html +='</table>';
									html +='</div>';
									html +='</li>';
								}
								//그룹
								
								//여기부터  눌렀을때  
								html +='<li style="padding: 7px 5px 7px 10px;font-size:16px;font-weight:500;color:#146794;background-color:#eee; border-top: 1px';
								html +='solid #dddddd; border-bottom: 1px solid #dddddd;cursor:pointer"'; 
								html +='class="text-left showSingle" target="'+i+'" comcd="'+com_gcd+'" ';
								html +='onclick="fn_specSearch(\''+com_gcd+'\',\''+com_gcd_nm+'\',\'ALL\',1)" >'+com_gcd_nm+'('+dr["인원수"]+')';
								html +='</li>';
								//상세내역
								html +='<li class="" id="li'+i+'" style="display:none">';
								html +='<div style="width:100%; height:280px; overflow:auto;">';
								html +='<table class="table table-hover">';
								html +='<caption>졸업생 취업현황/진학현황</caption>';
							}
							if (com_nm != "") {
								if(level_depth != '1'){
									html +='<tr style="cursor:pointer;">';
									html +='<td class="text-left" onclick="fn_specSearch(\''+com_gcd+'\',\''+com_gcd_nm+'\',\''+com_nm+'\',2)">'+com_nm+'</td>';
									html +='<td class="text-left">'+dr["인원수"]+'</td>';
									html +='</tr>';
								}
							}
							if (j == (datas.length-1)) {
								//마지막 그룹닫기
								html +='</table>';
								html +='</div>';
								html +='</li>';
							}
							crnt_com_gcd = com_gcd;
							crnt_com_gcd_nm = com_gcd_nm;
							if (j==0) { fn_specSearch(com_gcd, com_gcd_nm, 'ALL', 1); }
						}
					}else{
						html +='<li>해당 연도의 졸업생 통계자료가 존재하지 않습니다.</li>';
					}
					_size=i;
					$("#tab_1_sub").html(html);
					fn_statusClick();
		        }
		    });
		} else {
			$("#tab_1_sub").html("<li>해당 연도의 졸업생 통계자료가 존재하지 않습니다.</li>");
		}
	}	
	
	
	
	/* 졸업생 취업현황/진학현황 li 클릭시*/
	function fn_statusClick(){
	    $('.showSingle').click(function () {
	    	if ( $(this).attr('comcd') != "46" && $(this).attr('comcd') != "47") { //1인창(사)업자, 프리랜서는 집계만 표시
	    		$('#li' + $(this).attr('target')).slideToggle();		
	    	}
	    	
	    	for(var i=0;i<=_size;i++){
	    		if(i != Number($(this).attr('target'))){
	    			$('#li' + i).slideUp();
	    		}
	    	}
	    });	
	}					
	
	/* 상세스펙조회 */
	function fn_specSearch(business_gubun,business_gubun_name,business_name,num) {//회사구분코드/회사구분/회사명/level_depth		
		searchParam.COMPANY_CD = business_gubun; //회사구분코드
		searchParam.COMPANY_NM = num == 1 ? 'ALL' : business_name;
		searchParam.SHOW_FG = 'N';
	
		gfn_ajax_request({
	        url : "/ost/scm/scmsituation/JolupStdtEplymtSituation/selectSpec",
	        reqData : searchParam,
	        success : function(data, responseData) {

				var datas=data;
				var size=datas.length;
				var html='';
				var remark = (num == 1) ? business_gubun_name : business_name;
				html +='<tr><td class="text-left" colSpan="2" id="msg">['+remark+'] 취업/진학한 졸업생의 경력사항을 통계처리하였습니다.';
				html +='<br/><span class="text-danger">※취업/진학자가 1명일 경우 개인정보보호를 위해 공개하지 않습니다.</span></TD></TR>';
				if(size>0){
					for(var i=0; i<datas.length; i++){
						var dr = datas[i];
						html += '<tr">';
						html += '<td class="text-left">';
						html += (dr["레벨2"] > 1) ? "&nbsp;&nbsp;" : "";
						html += dr["구분"] + '</td>';
						html += '<td class="text-right">' 
						html += !(dr["구분값"] == "undefined" || dr["구분값"] == null) ? dr["구분값"] : "-"; 
						html += '</td>';
						html += '</tr>';
					} 
				}
				$("#tab_1_sub_right").html(html);
	        }
	    });
	}	

</script>
