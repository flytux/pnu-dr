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
				<!-- /아코디언 -->
				<section class="sec-2">
					<div class="sec-body">


								<div id="collapse1" class="collapse show" aria-labelledby="heading1">
									<div class="card-body">
										<section class="sec-3">
											<div class="sec-body">
												<div class="search-box">
													<!-- 1단 테이블 START -->
													<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
														<div class="b-row-box" role="row" id ="COLL_GRAD">
															<div class="b-row-item">
																<div class="b-title-box" role="rowheader">
																	<label class="req" data-lang>대학/대학원</label>
																</div>
																<div class="b-con-box" role="cell">
																	<input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" style="" name="searchParam"  title="대학/대학원"/>
																</div>
															</div>														
															<div class="b-row-item merge-2">
																<div class="b-title-box" role="rowheader">
																	<label class="req" data-lang>대학원</label>
																</div>
																<div class="b-con-box" role="cell">
																	<input type="text" id="SCH_GRAD_GCD" class="form-control" title="대학원" />
																</div>
															</div>
														</div>
														<div class="b-row-box" role="row">
															<div class="b-row-item">
																<div class="b-title-box" role="rowheader">
																	<label for="SCH_SYEAR" data-lang>입학년도</label>
																</div>
																<div class="b-con-box" role="cell">
																	<input type="number" id="SCH_SYEAR" class="form-control" style="text-align: center" title="입학년도"/>
																</div>
															</div>
															<div class="b-row-item">
																<div class="b-title-box" role="rowheader">
																	<label class="req" for="SCH_COLL_CD" data-lang>단과대학</label>
																</div>
																<div class="b-con-box" role="cell">
																	<input type="text" id="SCH_COLL_CD" class="form-control" title="단과대학"/>
																</div>
															</div>
															<div class="b-row-item">
																<div class="b-title-box" role="rowheader">
																	<label class="req" for="SCH_DEPT_CD" data-lang>학과/전공</label>
																</div>
																<div class="b-con-box" role="cell">
																	<input type="text" id="SCH_DEPT_CD" class="form-control" title="학과/전공"/>
																</div>
															</div>
														</div>
													</div>
													<!-- 1단 테이블 END-->

													<!-- 버튼 목록 START -->
													<div class="btn-box">
														<div class="form-row">
															<div class="col-auto">
																<button class="btn search-btn" type="button" onclick="fn_search()">조회</button>
															</div>
														</div>
													</div>
													<!-- 버튼 목록 END -->
												</div>
											</div>
										</section>
									
										<section class="sec-3">
											<div class="sec-body">
												<header id="title">
													<h4 class="sec-title" id="title">
														<label id='TITLE_DEPT'></label>의 졸업소요학점
													</h4>
												</header>
												<div class="sec-body">
													<div class="table-box" id="table1">
														<div class="table-body">
															<table class="table table-hover" data-toggle="table" data-show-columns="false">
																<caption>졸업소요학점내역</caption>
																<colgroup>
																	<col style="min-width: 150px;">
																	<col style="min-width: 200px;">
																	<col style="min-width: 150px;">
																</colgroup>
																<thead>
																	<tr>
																		<th scope="col" data-width="80">교과목구분</th>
																		<th scope="col" data-width="125">교과목구분명</th>
																		<th scope="col" data-width="120">소요학점</th>
																	</tr>
																</thead>
																<tbody id="resultTbody1">
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</section>
										<section class="sec-3">
											<div class="sec-body">
												<header id="title">
													<h4 class="sec-title" id="title">교양선택 영역별 소요학점</h4>
												</header>
												<div class="table-box" id="table2">
													<div class="table-body">
														<table class="table table-hover" data-toggle="table" data-show-columns="false">
															<caption>교양선택 영역별 소요학점내역</caption>
															<colgroup>
																<col style="min-width: 500px;">
																<col style="min-width: 80px;">
																<col style="min-width: 80px;">
															</colgroup>
															<thead>
																<tr>
																	<th scope="col" data-width="500">교양선택영역</th>
																	<th scope="col" data-width="80">하한소요학점</th>
																	<th scope="col" data-width="80">상한소요학점</th>

																</tr>
															</thead>
															<tbody id="resultTbody2">
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</section>
									</div>
								
						</div>
					</div>
				</section>
			</div>
		</section>
	<!-- /END 아코디언 -->
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate1">
	<tr style="cursor:pointer;">
		<td>#:SUBJ_GCD#</td>
	    <td class="text-left">#:HEV#</td>
		<td class="text-right">#:MIN_CRDT#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
        <td class="text-left">#:AREA_GCD#</td>
	    <td>#:MIN_CRDT#</td>
		<td>#:MAX_CRDT#</td>
	</tr>
</script>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;

	function fn_initScreen() {
		var syear = scwin.loginUser.userId.substring(0, 4);
		var deptnm = scwin.loginUser.deptCdKorNm;
		var deptcd = scwin.loginUser.deptCd;
		$("#TITLE_DEPT").text(deptnm);
		$("#SCH_SYEAR").val(syear);
		
 		/*개설학과 List 조회후 Select Box 바인드*/
		$("#COLL_GRAD").hide();
		/*학과소속 바인드*/
		gfn_com_assignCombo({
			collGradGcd : $("#SCH_COLL_GRAD_GCD"),
			gradGcd : $("#SCH_GRAD_GCD"),
			collCd : $("#SCH_COLL_CD"),
			deptCd : $("#SCH_DEPT_CD"),
			deptCdExtUrl : {
        		url:"/core/function/getAssignComboDeptMajorCdInfo"
        	},
			comboLvl : 4,
			dataBound : function(e) {
				fn_search();
			}
		});
		
	} 

	 function fn_search(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		
		var valInfo = [{
			"id" : "SCH_SYEAR",
			"name" : "학년도",
			"notNull" : true,
		}, {
			"id" : "SCH_COLL_CD",
			"name" : "단과대학",
			"notNull" : true,
		}, {
			"id" : "SCH_DEPT_CD",
			"name" : "학과/전공",
			"notNull" : true,
		}];
		
		rtnValue = gfn_val_validateDataMap(data, valInfo);
		
		if (!rtnValue){
			return;
		}

		//$("#TITLE_DEPT").text($("#SCH_DEPT_CD").text());
		gfn_ajax_request({
			url : "/ost/jolup/hakbujolupguide/jolupneedcrdt/selectSOYO",
			reqData : data,
			success : function(data, responseData) {
				
				$("#resultTbody1").listView({
                	dataSource : data,
                	emptyComment :"" ,
                    dataBound : function(e) {
                    	totalCnt = responseData.pageInfo.totCnt;
 	                    currentData = data;	         

	            		},
	                     template : $("#resultTemplate1"),
	                     totalCnt : responseData.totalCnt,
						 totalViewYn : "N" ,
 				});
				
				for (index in data) {
					
					if (data[index].SUBJ_GCD === '총') {	
						let html = `<tr style="cursor:pointer;">`;
						html += `<td colspan="3" class="text-center table-secondary"> `
						html += `${'${data[index].HEV}'} : ${'${data[index].MIN_CRDT}'} `
						html += `</td></tr>`
						$('#resultTbody1').children()[index].innerHTML = html;
					}
					else if(data[index].HEV === 'A') {
						let html = `<tr style="cursor:pointer;">`;
						html += `<td colspan="3" class="text-center table-secondary"> `
						html += ` ${'${data[index].SUBJ_GCD}'} : ${'${data[index].MIN_CRDT}'} `
						html += `</td></tr>`
						$('#resultTbody1').children()[index].innerHTML = html;
					}
				}
				
				}
			});
		
		gfn_ajax_request({
			url : "/ost/jolup/hakbujolupguide/jolupneedcrdt/selectCult",
			reqData : data,
			success : function(data, responseData) {

				$("#resultTbody2").listView({
                	dataSource : data,
                	emptyComment :"" ,
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

	
	}
</script>