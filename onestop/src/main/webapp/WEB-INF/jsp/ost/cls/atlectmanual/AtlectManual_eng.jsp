<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<!-- 
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li class="none"><span class="dfn">※ 수업유형(수강신청 결과에 따라 수업유형이 변경될 수 있습니다.)</span></li>
								<li><span class="dfn">대면수업</span> : 100% 대면수업</li>
								<li><span class="dfn">원격수업</span> : 100% 원격수업(중간, 기말고사 등 평가는 대면시험 실시 원칙)</li>
								<li><span class="dfn">혼합수업</span> : 요일, 주차, 기간별로 대면수업과 원격수업을 혼합하여 운영</li>
								<li><span class="dfn">병행수업</span> : 수강인원을 2개 조로 나누어 1조는 강의실에서 대면수업, 2조는 원격수업(실시간화상강의 또는 수업 종료 후 녹화 영상 탑재)으로 운영하되, 조별 수업유형을 번갈아가며 운영</li>
								<li>법학연구소에서 개설한 일반선택 교과목이 행정학과 전공선택 교과목으로 개설되며, 이수 시 ‘일반선택’ 학점으로 인정됩니다.<br/>
										※ 비고란에 '법학연구소 이관과목' 표기</li>
							</ul>
						</div>
					</div>
				</div>
				-->		
				
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">

						<div class="b-row-box" role="row">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>학년도/학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="" style="width: 120px;">
										<select id="SCH_SYEAR" class="form-control" title="학년도선택"></select>
									</div>
									<div class="" style="width: 140px; margin-left: 3px;">
										<select id="SCH_TERM_GCD" class="form-control" name="searchParam" title="학기선택"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row" id="degGbn">
							<div class="b-row-item  merge-3" id="">
									<div class="b-title-box" role="rowheader">
										<label for="SCH_COURSE_COLL_GRAD_GCD" data-lang>개설과정</label>
									</div>
									<div class="b-con-box" role="cell">
										<select id="SCH_COURSE_COLL_GRAD_GCD" class="form-control form-w-lg"></select>
									</div>
							</div>
						</div>
						<div class="b-row-box" role="row" id="searchCollGradGcd">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" data-lang>대학/대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" style="" name="searchParam" />
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row" id="hakGbn">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_GRAD_GCD" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label  data-lang>단과대학</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_CD" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label id="deptMajorCds" class="" data-lang>학과(부)/전공</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_DEPT_CD" class="form-control" />
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row" id="searchGbn">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" data-lang>검색방법</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="radio" id="SEARCH_GBN" name="SEARCH_GBN" class="" style="" value="1" checked="checked" /> 세부구분(영역별, 학과별)
									<div style="margin-left: 20px;"></div>
									<input type="radio" id="SEARCH_GBN" name="SEARCH_GBN" class="" style="" value="2" /> 교과목명 직접입력
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row" id="subjGbn">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SUBJ_GBN" data-lang>과목구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_SUBJ_GBN" style="width: 260px;" name="searchParam" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row" id="sebuGbn">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_DETAIL" data-lang>세부구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_DETAIL" class="form-control"></select>
								</div>
							</div>
						</div>
						
						<div class="b-row-box" role="row" id="subjNm">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label class="req" data-lang>교과목명</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_SUBJ_NM" style="width: 260px;" class="form-control" />
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item" id="capbltyGbn">
								<div class="b-title-box" role="rowheader">
									<label for="SCH_PNU_CAPBLTY_GCD" data-lang>핵심역량</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_PNU_CAPBLTY_GCD" class="form-control"></select>
								</div>
							</div>
							<div class="b-row-item" id="nativeLangGbn">
								<div class="b-title-box" role="rowheader">
									<label for="SCH_NATIVE_LANG_LECT_GCD" data-lang>원어강의</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_NATIVE_LANG_LECT_GCD" class="form-control"></select>
								</div>
								<div class="b-con-box" role="cell" style="display:none;">
									<input type="text" id="SCH_ALLOC_CHK" class="form-control" />
								</div>
								<div class="b-con-box" role="cell" style="display:none;">
									<input type="text" id="TITLE" class="form-control" />
								</div>
								<div class="b-con-box" role="cell" style="display:none;">
									<input type="text" id="USER_NM" class="form-control" />
								</div>
								<div class="b-con-box" role="cell" style="display:none;">
									<input type="text" id="USER_ID" class="form-control" />
								</div>
							</div>							
						</div>
						<!-- 1Row -->

					</div>

					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
								<button class="btn btn-new " onclick="fn_openReport2()" data-lang="">출력</button>
							</div>
						</div>
					</div>
				</div>
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn">참고내용</span>
									<button class="btn btn-danger btn-sm ml-1" type="button" onclick="javascript:$('#doc').toggle('slow');$(this).text((($(this).text() == '펼치기')?'접기':'펼치기'));">접기</button>
								</li>
								<div id="doc" style="">
									<li><span class="dfn">※ </span><span>검색방법을 '교과목명 직접입력'을 선택하신 후, 교과목명으로 검색할 수 있습니다.</span></li>
									<li><span class="dfn" style="color: red;">※ </span><span style="color: red;">교과목명을 클릭하면 '수강신청 제한사항'을 조회할 수 있습니다.</span></li>
									<li><span class="dfn">※ </span> 미확정 : 개설은 되었으나 교육혁신과에서 확정하지 않은 교과목(수강신청이 불가하오니 개설학과로 문의하세요.)</li>
									<li><span class="dfn">※ </span> 미지정 : 확정은 되었으나 시간표가 입력되어 있지 않은 교과목(제한사항이 걸려 있는 경우를 제외하고는 수강신청 가능.)</li>
									<li><span class="dfn">※ 강좌개설은 확정작업 중이므로 참고로 활용하여 주시고, 희망과목 담기 전에 확정되오니 참고하시기 바랍니다.</span></li>
									<li><span class="dfn" style="color: red;">※ </span><span style="color: red;">전문대학원(법전원, 치전원, 한의전원)에서 대학 과정으로 개설한 교과목 조회 시 [개설과정]은 "대학", [대학/대학원]은 "대학원", [대학원], [단과대학], [학과]는 각 개설 대학원 및 학과로 조회하시면 됩니다.</span></li>

								</div>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 검색 영역 -->
				<!-- 테이블 -->
				<div class="table-box" id=grid01>

					<div class="table-body">
						<table class="table table-hover"  data-show-column="true" id="table01">
							<caption>수강편람 교과목정보</caption>
							<colgroup>
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 80px;">
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 20px;">
								<col style="min-width: 90px;">
								<col style="min-width: 20px;">
								<col style="min-width: 150px;">
								<col style="min-width: 20px;">
								<col style="min-width: 70px;">
								<col style="min-width: 20px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col"><a style="font-size:12px"><label data-lang>개설<br/>학과</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>원격<br/>수업</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>원어<br/>강의</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>학<br/>년</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>교과목<br/>구분</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>교과목명<br/>(미확정구분)</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>교과목번호</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>분반</label><br/><label data-lang>학점/시간</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>제한인원</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>교수명</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>시간/강의실</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>수강<br/>대상학과</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>교수<br/>계획표</label></a></th>
									<th scope="col"><a style="font-size:12px"><label data-lang>비고</label></a></th>
								</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>
				</div>

				<!-- /END 테이블 -->

			</div>
		</section>
	</main>
</div>
<script src="/common/js/gfn/gfn_report.js"></script>
<c:choose>
	<c:when test="${langGcd.value == '0001' }">
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
		<td class="text-left" style="font-size:12px">#:MNG_DEPT_NM#</td> 
        <td style="font-size:12px">#:ALL_CYBER#</td>
        <td style="font-size:12px">#:NATIVE_LANG_NM#</td>
	    <td style="font-size:12px">#:STDT_YEAR_NM#</td> 
	    <td style="font-size:12px">#:SUBJ_GCD_NM#</td>
	    <td class="text-left" ><a class="subj-detail" style="color:blue; font-size:12px" href ="#popup">#:SUBJ_NM#</a></td> 
		<td style="font-size:12px">#:SUBJ_NO#</td> 
		<td style="font-size:12px">#:CLASS_NO#<br/>#:CRDT#/#:SIGAN#</td> 
		<td style="font-size:12px">#:ALLOC_RCNT#
			# if( :COLL_GRAD_GCD == "0001") { #
	               	<button class="btn btn-outline-secondary rcnt-detail" type="button"><i class="bi bi-display" aria-hidden="true"></i><a style="font-size:13px;">상세</a>
					</button>
	        #} else if ( :COLL_GRAD_GCD == "0002") { #
	               
	        #}#
		
		</td> 
		<td class="text-left"><a class="prof-detail" style="color:blue; font-size:12px;" href ="#popup">#:PROF_NM#</a></td> 
		<td class="text-left" style="font-size:12px">#:TIMETABLE_SUMMARY_INFO#</td> 
		<td class="text-left" style="font-size:12px">#:ATLECT_DEPT_NM#</td> 
		
		<td>	
			# if( :PRT_KOR == "국문") { #
	               <button class="btn btn-outline-primary kor" type="button" ><a style="font-size:5px;">국문</a></button>
	        #} else if ( :PRT_KOR == "") { #
	               
	        #}#
			# if( :PRT_ENG == "영문") { #
	               <button class="btn btn-outline-secondary eng" type="button"><a style="font-size:5px;">영문</a></button>
	        #} else if ( :PRT_KOR == "") { #
	               
	        #}#
		</td> 

		<td class="text-left" style="font-size:12px;">
			# if( :REMARK.indexOf("혼합") !== -1) { #
					<a style="color:blue" class="remark-detail" style="font-size:12px">#:REMARK#<a>	               
	        #} else if( :REMARK.indexOf("혼합") == -1){ #
					
	        #}#
		</td> 
	</tr>
</script>
	</c:when>
	<c:when test="${langGcd.value == '0002' }">
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
		<td class="text-left" style="font-size:12px">#:MNG_DEPT_NM#</td> 
        <td style="font-size:12px">#:ALL_CYBER#</td>
        <td style="font-size:12px">#:NATIVE_LANG_NM#</td>
	    <td style="font-size:12px">#:STDT_YEAR_NM#</td> 
	    <td style="font-size:12px">#:SUBJ_GCD_NM#</td>
	    <td class="text-left" ><a class="subj-detail" style="color:blue; font-size:12px" href ="#popup">#:SUBJ_NM#</a></td> 
		<td style="font-size:12px">#:SUBJ_NO#</td> 
		<td style="font-size:12px">#:CLASS_NO#<br/>#:CRDT#/#:SIGAN#</td> 
		<td style="font-size:12px">#:ALLOC_RCNT#
			# if( :COLL_GRAD_GCD == "0001") { #
	               	<button class="btn btn-outline-secondary rcnt-detail" type="button"><i class="bi bi-display" aria-hidden="true"></i><a style="font-size:13px;">상세</a>
					</button>
	        #} else if ( :COLL_GRAD_GCD == "0002") { #
	               
	        #}#
		
		</td> 
		<td class="text-left"><a class="prof-detail" style="color:blue; font-size:12px;" href ="#popup">#:PROF_NM#</a></td> 
		<td class="text-left" style="font-size:12px">#:TIMETABLE_SUMMARY_INFO#</td> 
		<td class="text-left" style="font-size:12px">#:ATLECT_DEPT_NM#</td> 
		
		<td>	
			# if( :PRT_KOR == "국문") { #
	               <button class="btn btn-outline-primary kor" type="button" ><a style="font-size:5px;">국문</a></button>
	        #} else if ( :PRT_KOR == "") { #
	               
	        #}#
			# if( :PRT_ENG == "영문") { #
	               <button class="btn btn-outline-secondary eng" type="button"><a style="font-size:5px;">영문</a></button>
	        #} else if ( :PRT_KOR == "") { #
	               
	        #}#
		</td> 

		<td class="text-left" style="font-size:12px;">
			# if( :REMARK.indexOf("혼합") !== -1) { #
					<a style="color:blue" class="remark-detail" style="font-size:12px">#:REMARK#<a>	               
	        #} else if( :REMARK.indexOf("혼합") == -1){ #
					
	        #}#
		</td> 
	</tr>
</script>
	</c:when>
</c:choose>

<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	var termInfo = [];
	var subjGcdJson1 = [ {
		CODE : 3,
		LABEL : '교양선택 및 일반선택(일반교양)'
	}, {
		CODE : 5,
		LABEL : '일반선택'
	}, {
		CODE : 4,
		LABEL : '교양필수(정보화교양)'
	}, {
		CODE : 2,
		LABEL : '전공기초 및 기타1학년'
	}, {
		CODE : 1,
		LABEL : '전공,교직과목(2,3,4학년)'
	} ];
	var subjGcdJson2 = [ {
		CODE : 3,
		LABEL : '일반교양'
	}, {
		CODE : 2,
		LABEL : '정보화소양,기초필수'
	}, {
		CODE : 1,
		LABEL : '전공,교직과목(2,3,4학년)'
	} ];
	/***************************************************************************************************
	Event
	 ***************************************************************************************************/
	$(document)
			.ready(
					function() {
						gfn_com_DropDownLists([ {
							elements : $("#SCH_COURSE_COLL_GRAD_GCD"),
							commonCode : "0001_COURSE_COLL_GRAD_GCD",
							dataTextField : "COMMON_DETAIL_CD_KOR_NM",
							dataValueField : "COMMON_DETAIL_CD",
							optionLabel : "전체",
							optionValue : "",
							defaultValue : "",
							expnCondition : "",
							hakbuGradFg : false,
							dataBound : function(e) {
							}
						}]);
						$('select[id=SCH_SYEAR],select[id=SCH_TERM_GCD]')
								.change(
										function() {
											/* value 값이 다있을때 원어강의 Code,Value 재조회*/
											if ($("#SCH_SYEAR").val() != ''
													&& $("#SCH_TERM_GCD").val() != ''
													&& $("#SCH_COLL_GRAD_GCD").val() != ' ') {
												fn_SearchSelectNode();
											}
											/*학년도 변경시 과목구분 목록 재설정 */
											if (this.id == 'SCH_SYEAR') {
												fn_SetSubjGbnList(this.value);
												gfn_com_DropDownLists([ {
													elements : $("#SCH_DETAIL"),
													commonCode : "0001_AREA_GCD",
													dataTextField : "COMMON_DETAIL_CD_KOR_NM",
													dataValueField : "COMMON_DETAIL_CD",
													optionLabel : "선택",
													optionValue : "",
													defaultValue : "",
													expnCondition : "AND ISNULL(CHAR_1_CONTENT, '0000') <='"
															+ $("#SCH_SYEAR").val()
															+ "' AND '"
															+ $("#SCH_SYEAR")
																	.val()
															+ "' < ISNULL(CHAR_3_CONTENT, '9999')",
													hakbuGradFg : false,
													dataBound : function(e) {
													}
												} ]);

											}

										});

						/*대학 대학원 구분 변경시*/
						$("#SCH_COLL_GRAD_GCD").change(function() {
											/* value 값이 다있을때 원어강의 Code,Value 재조회*/
											if ($("#SCH_SYEAR").val() != ''
													&& $("#SCH_TERM_GCD").val() != ''
													&& $("#SCH_COLL_GRAD_GCD").val() != '') {
												fn_SearchSelectNode();
											}
											/* if(this.value == "0001"){
												$("#deptMajorCds").addClass("req");

											}else{
												$("#deptMajorCds").removeClass("req");
											} */
										});
						$("[name=searchParam],[name=SEARCH_GBN]").change(
								function() {
									fn_VisibleSet();
								});
					});
					$(".search-box").change(
							function(info) {
								chk = 'N';						
							});
	/***************************************************************************
	 * fn_setCommonCd
	 **************************************************************************/
	function fn_initScreen() {
		fn_SearchSelectNode();
		//code select
		fn_setCommonCd();
		if(scwin.loginUser.userId != null){
			$("#SCH_ALLOC_CHK").val('Y');
		}else{
			$("#SCH_ALLOC_CHK").val('N');
		}
		$("#TITLE").val('목록');
		$("#USER_NM").val(scwin.loginUser.nm);
		$("#USER_ID").val(scwin.loginUser.userId);
	}
	/***************************************************************************
	 * 조건부 HIDE,SHOW 관리
	 CODE : 3,
		LABEL : '교양선택 및 일반선택(일반교양)'
	}, {
		CODE : 5,
		LABEL : '일반선택'
	}, {
		CODE : 4,
		LABEL : '교양필수(정보화교양)'
	}, {
		CODE : 2,
		LABEL : '전공기초 및 기타1학년'
	}, {
		CODE : 1,
		LABEL : '전공,교직과목(2,3,4학년)'
	 **************************************************************************/
	function fn_VisibleSet(info) {
		if (info) { //조회시 필수체크 변경
			var validJsonArray = new Array();
			
			if ($("#SCH_TERM_GCD").val() == "0010"
					|| $("#SCH_TERM_GCD").val() == "0020") { //정규학기
			
				if ($("#SCH_COLL_GRAD_GCD").val() == "0001") { //대학일때

					$("#searchGbn").show(); //검색방법
					$("#subjGbn").show(); //과목구분
					
					$("#subjNm .b-title-box label").addClass("req");
					$("#SCH_SUBJ_NM").val('');
					
					
					if ($("input[type=radio][name=SEARCH_GBN]:checked").val() == "1") { //검색방법이 세부구분(영역별,학과별) 일떄 

						if ($("#SCH_SUBJ_GBN").val() == "3") { //과목구분이 교양선택 및 일반선택(일반교양) 일떄 
							validJsonArray = [ {
								"id" : "SCH_SYEAR",
								"name" : "학년도",
								"notNull" : true
							}, {
								"id" : "SCH_TERM_GCD",
								"name" : "학기",
								"notNull" : true
							}, {
								"id" : "SCH_COLL_GRAD_GCD",
								"name" : "대학/대학원",
								"notNull" : true
							}, {
								"id" : "SCH_DETAIL",
								"name" : "세부구분",
								"notNull" : true
							} ];
						} else if ($("#SCH_SUBJ_GBN").val() == "5") { // 일반 선택 선택시
							validJsonArray = [ {
								"id" : "SCH_SYEAR",
								"name" : "학년도",
								"notNull" : true
							}, {
								"id" : "SCH_TERM_GCD",
								"name" : "학기",
								"notNull" : true
							}, {
								"id" : "SCH_COLL_GRAD_GCD",
								"name" : "대학/대학원",
								"notNull" : true
							} ];

						} else if ($("#SCH_SUBJ_GBN").val() == "4"
								|| $("#SCH_SUBJ_GBN").val() == "2"
								|| $("#SCH_SUBJ_GBN").val() == "1") {
							validJsonArray = [ {
								"id" : "SCH_SYEAR",
								"name" : "학년도",
								"notNull" : true
							}, {
								"id" : "SCH_TERM_GCD",
								"name" : "학기",
								"notNull" : true
							}, {
								"id" : "SCH_COLL_GRAD_GCD",
								"name" : "대학/대학원",
								"notNull" : true
							}/* , {
								"id" : "SCH_GRAD_GCD",
								"name" : "대학원",
								"notNull" : true
							}, {
								"id" : "SCH_COLL_CD",
								"name" : "단과대학",
								"notNull" : true
							}, {
								"id" : "SCH_DEPT_CD",
								"name" : "학과(부)/전공",
								"notNull" : true
							} */ ];
						}
					} else if ($("input[type=radio][name=SEARCH_GBN]:checked")
							.val() == "2") { //검색방법이 교과목명 직접입력 일떄
						
						if ($("#SCH_SUBJ_GBN").val() == "3") { //과목구분이 교양선택 및 일반선택(일반교양) 일떄 
							validJsonArray = [ {
								"id" : "SCH_SYEAR",
								"name" : "학년도",
								"notNull" : true
							}, {
								"id" : "SCH_TERM_GCD",
								"name" : "학기",
								"notNull" : true
							}, {
								"id" : "SCH_COLL_GRAD_GCD",
								"name" : "대학/대학원",
								"notNull" : true
							}, {
								"id" : "SCH_SUBJ_NM",
								"name" : "교과목명",
								"notNull" : true
							} ];

						} else if ($("#SCH_SUBJ_GBN").val() == "5") { // 일반 선택 선택시
							validJsonArray = [ {
								"id" : "SCH_SYEAR",
								"name" : "학년도",
								"notNull" : true
							}, {
								"id" : "SCH_TERM_GCD",
								"name" : "학기",
								"notNull" : true
							}, {
								"id" : "SCH_COLL_GRAD_GCD",
								"name" : "대학/대학원",
								"notNull" : true
							}, {
								"id" : "SCH_SUBJ_NM",
								"name" : "교과목명",
								"notNull" : true
							} ];
						} else if ($("#SCH_SUBJ_GBN").val() == "4"
								|| $("#SCH_SUBJ_GBN").val() == "2"
								|| $("#SCH_SUBJ_GBN").val() == "1") {
							validJsonArray = [ {
								"id" : "SCH_SYEAR",
								"name" : "학년도",
								"notNull" : true
							}, {
								"id" : "SCH_TERM_GCD",
								"name" : "학기",
								"notNull" : true
							}, {
								"id" : "SCH_COLL_GRAD_GCD",
								"name" : "대학/대학원",
								"notNull" : true
							}, {
								"id" : "SCH_SUBJ_NM",
								"name" : "교과목명",
								"notNull" : true
							} ];
						}
					}
				} else if ($("#SCH_COLL_GRAD_GCD").val() == "0002") { //대학원일때

					validJsonArray = [ {
						"id" : "SCH_SYEAR",
						"name" : "학년도",
						"notNull" : true
					}, {
						"id" : "SCH_TERM_GCD",
						"name" : "학기",
						"notNull" : true
					}, {
						"id" : "SCH_COLL_GRAD_GCD",
						"name" : "대학/대학원",
						"notNull" : true
					}/* , {
						"id" : "SCH_GRAD_GCD",
						"name" : "대학원",
						"notNull" : true
					}, {
						"id" : "SCH_COLL_CD",
						"name" : "단과대학",
						"notNull" : true
					} *//* , {
						"id" : "SCH_DEPT_CD",
						"name" : "학과(부)/전공",
						"notNull" : true
					} */ ];

				}else{
					
				
					validJsonArray = [ {
						"id" : "SCH_SYEAR",
						"name" : "학년도",
						"notNull" : true
					}, {
						"id" : "SCH_TERM_GCD",
						"name" : "학기",
						"notNull" : true
					}, {
						"id" : "SCH_COLL_GRAD_GCD",
						"name" : "대학/대학원",
						"notNull" : true
					} ];
				
				}
			} else if ($("#SCH_TERM_GCD").val() == "0011"
					|| $("#SCH_TERM_GCD").val() == "0021") { //계절학기
				validJsonArray = [ {
					"id" : "SCH_SYEAR",
					"name" : "학년도",
					"notNull" : true
				}, {
					"id" : "SCH_TERM_GCD",
					"name" : "학기",
					"notNull" : true
				}];
			}
			return validJsonArray;
		} else { //searchParameter 변경시 hideShow 관리
			if ($("#SCH_TERM_GCD").val() == "0010"
					|| $("#SCH_TERM_GCD").val() == "0020") { //정규학기
				
				if(scwin.loginUser.collGradGcd == '') {
					$("#searchCollGradGcd").show();		// 대학/대학원 컴포넌트 
				} else {
					$("#searchCollGradGcd").show();		// 대학/대학원 컴포넌트 
				}
				
				if ($("#SCH_COLL_GRAD_GCD").val() == "0001" || $("#SCH_COLL_GRAD_GCD").val() == "") { //대학일때
					$("#degGbn").show();					
					$("#subjGbn").show(); //과목구분
					$("#searchGbn").show(); //검색방법
					if ($("input[type=radio][name=SEARCH_GBN]:checked").val() == "1") { //검색방법이 세부구분(영역별,학과별) 일떄 
						if ($("#SCH_SUBJ_GBN").val() == "3") { //과목구분이 교양선택 및 일반선택(일반교양) 일떄 

							$("#sebuGbn").show();
							$("#hakGbn").hide();
							$("#subjNm").hide();
							$("#capbltyGbn").show();
							$("#nativeLangGbn").show();
						} else if ($("#SCH_SUBJ_GBN").val() == "5") { // 일반 선택 선택시
							$("#sebuGbn").hide();
							$("#hakGbn").hide();
							$("#subjNm").hide();
							$("#capbltyGbn").show();
							$("#nativeLangGbn").show();
						} else if ($("#SCH_SUBJ_GBN").val() == "4"
								|| $("#SCH_SUBJ_GBN").val() == "2"
								|| $("#SCH_SUBJ_GBN").val() == "1") {
							$("#sebuGbn").hide();
							$("#hakGbn").show();
							$("#subjNm").hide();
							$("#capbltyGbn").show();
							$("#nativeLangGbn").show();
						}
					} else if ($("input[type=radio][name=SEARCH_GBN]:checked")
							.val() == "2") { //검색방법이 교과목명 직접입력 일떄
						$("#subjGbn").hide(); //과목구분
						if ($("#SCH_SUBJ_GBN").val() == "3") { //과목구분이 교양선택 및 일반선택(일반교양) 일떄 

							$("#sebuGbn").hide();
							$("#hakGbn").hide();
							$("#subjNm").show();
							$("#capbltyGbn").show();
							$("#nativeLangGbn").show();
						} else if ($("#SCH_SUBJ_GBN").val() == "5") { // 일반 선택 선택시
							$("#sebuGbn").hide();
							$("#hakGbn").hide();
							$("#subjNm").show();
							$("#capbltyGbn").show();
							$("#nativeLangGbn").show();
						} else if ($("#SCH_SUBJ_GBN").val() == "4"
								|| $("#SCH_SUBJ_GBN").val() == "2"
								|| $("#SCH_SUBJ_GBN").val() == "1") {
							$("#sebuGbn").hide();
							$("#hakGbn").hide();
							$("#subjNm").show();
							$("#capbltyGbn").show();
							$("#nativeLangGbn").show();
						}
					}
				} else if ($("#SCH_COLL_GRAD_GCD").val() == "0002") { //대학원일때
					$("#degGbn").show();
					$("#subjGbn").hide(); //과목구분
					$("#searchGbn").hide(); //검색방법

					$("#sebuGbn").hide();
					$("#hakGbn").show();
					$("#subjNm").hide();
					$("#capbltyGbn").hide();
					$("#nativeLangGbn").show();
					
					$("#subjNm").show();
					$("#subjNm .b-title-box label").removeClass("req");

				}
			} else if ($("#SCH_TERM_GCD").val() == "0011"
					|| $("#SCH_TERM_GCD").val() == "0021") { //계절학기

				$("#searchCollGradGcd").hide();		// 대학/대학원 컴포넌트 
				$("#SCH_COLL_GRAD_GCD").val('');	
				
				$("#degGbn").hide();				
				$("#subjGbn").hide(); //과목구분
				$("#searchGbn").hide(); //검색방법

				$("#sebuGbn").hide();
				$("#hakGbn").hide();
				$("#subjNm").hide();
				$("#capbltyGbn").hide();
				$("#nativeLangGbn").hide();
			}
		}

	}

	/***************************************************************************
	 *  과목구분 목록 재설정
	 **************************************************************************/
	function fn_SetSubjGbnList(year) {
		/* 2004 년도 전후로 목록이 변경 */
		if (2004 < year) {
			/*과목구분 코드 바인드*/
			$("#SCH_SUBJ_GBN").dropDownList({
				dataSource : subjGcdJson1,
				commonCode : "",
				dataTextField : "LABEL",
				dataValueField : "CODE",
				optionLabel : "",
				optionValue : "",
				defaultValue : "",
				expnCondition : "",
				dataBound : function(e) {
					if(scwin.loginUser.stdtYearGcd == '0001' || scwin.loginUser.stdtYearGcd == null) {
						$("#SCH_SUBJ_GBN").val('2')
					} else if(scwin.loginUser.stdtYearGcd == '0002' ||  scwin.loginUser.stdtYearGcd == '0003' || scwin.loginUser.stdtYearGcd == '0004'){
						$("#SCH_SUBJ_GBN").val('1')
					}
				}
			});
		} else if (2004 >= year) {
			/*과목구분 코드 바인드*/
			$("#SCH_SUBJ_GBN").dropDownList({
				dataSource : subjGcdJson2,
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

		}

	}

	/***************************************************************************************************
	교양필수(정보화소양),전공기초 및 기타1학년, 전공,교직과목(2,3,4학년) 선택시 세부구분  학과 목록 조회
	 ***************************************************************************************************/
	function fn_SearchDetailSelectList() {
		/* 학과 List 조회후 Select Box 바인드*/
		gfn_ajax_request({
			url : "/ost/cls/atlectmanual/atlectmanual/selectDetailSelectList",
			reqData : {
				"SCH_SYEAR" : $("#SCH_SYEAR").val(),
				"SCH_TERM_GCD" : $("#SCH_TERM_GCD").val(),
				"SCH_COLL_GRAD_GCD" : $("#SCH_COLL_GRAD_GCD").val(),
				"SCH_SUBJ_GBN" : $("#SCH_SUBJ_GBN").val()
			},
			success : function(data, responseData) {

				$("#SCH_DETAIL").dropDownList({
					dataSource : data,
					commonCode : "",
					dataTextField : "DEPT_KOR_NM",
					dataValueField : "ATLECT_DEPT_CD",
					optionLabel : "",
					optionValue : "",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {

					}
				});

			}
		});
	}
	/***************************************************************************************************
	배정인원 조회 가능여부  조회
	 ***************************************************************************************************/
	 var SearchYn = 'N';
	 function fn_SearchPersonnellSearchFg(){
		 gfn_ajax_request({
				url : "/ost/cls/atlectmanual/atlectmanual/selectPeronnellSearchPossFg",
				reqData : {
					"SCH_SYEAR" : $("#SCH_SYEAR").val(),
					"SCH_TERM_GCD" : $("#SCH_TERM_GCD").val()
				},
				success : function(data, responseData) {
					SearchYn = data.ALLOW_YN
				}
			});
	}
	/***************************************************************************************************
	select 목록 조회
	 ***************************************************************************************************/
	function fn_SearchSelectNode() {
		/* 원어강의 List 조회후 Select Box 바인드*/
		gfn_ajax_request({
			url : "/ost/cls/atlectmanual/atlectmanual/selectLativeLangLectGcd",
			reqData : {
				"SCH_SYEAR" : $("#SCH_SYEAR").val(),
				"SCH_TERM_GCD" : $("#SCH_TERM_GCD").val(),
				"SCH_COLL_GRAD_GCD" : $("#SCH_COLL_GRAD_GCD").val()
			},
			success : function(data, responseData) {

				$("#SCH_NATIVE_LANG_LECT_GCD").dropDownList({
					dataSource : data,
					commonCode : "",
					dataTextField : "LABEL",
					dataValueField : "CODE",
					optionLabel : "전체",
					optionValue : "",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {

					}
				});

			}
		});
	}
	function profsearcherCallback(info) {
		$("#profDept").val(info.ASSIGN_NM);

	}
	/***************************************************************************
	 * fn_setCommonCd
	 **************************************************************************/
	function fn_setCommonCd() {
		/*학년도 바인드*/
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : "2000",
				"ENDYEAR" : "2022"
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
						termInfo = responseData.termInfo;
						$("#SCH_SYEAR").val(responseData.termInfo.SYEAR);
						/* 2004 년도 전후로 목록이 변경 */
						fn_SetSubjGbnList(responseData.termInfo.SYEAR);
						/*학기 공통코드 바인드*/
						$("#SCH_TERM_GCD").dropDownList({
							dataSource : null,
							commonCode : "0001_TERM_GCD",
							dataTextField : "COMMON_DETAIL_CD_KOR_NM",
							dataValueField : "COMMON_DETAIL_CD",
							optionLabel : "",
							optionValue : "",
							defaultValue : "",
							expnCondition : "AND CHAR_1_CONTENT LIKE '%B%' ",
							dataBound : function(e) {
								$("#SCH_TERM_GCD").val(termInfo.TERM_GCD);
								$("#subjGbn").hide(); //과목구분
								$("#searchGbn").hide(); //검색방법

								$("#sebuGbn").hide();
								$("#hakGbn").hide();
								$("#subjNm").hide();
								$("#capbltyGbn").hide();
								$("#nativeLangGbn").hide();
							}
						});
					}
				});
				gfn_com_DropDownLists([ {
					elements : $("#SCH_DETAIL"),
					commonCode : "0001_AREA_GCD",
					dataTextField : "COMMON_DETAIL_CD_KOR_NM",
					dataValueField : "COMMON_DETAIL_CD",
					optionLabel : "선택",
					optionValue : "",
					defaultValue : "",
					expnCondition : "AND ISNULL(CHAR_1_CONTENT, '0000') <='"
							+ $("#SCH_SYEAR").val() + "' AND '"
							+ $("#SCH_SYEAR").val()
							+ "' < ISNULL(CHAR_3_CONTENT, '9999')",
					hakbuGradFg : false,
					dataBound : function(e) {
					}
				} ]);

			}
		});

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
			all2 : 'Y', all3 : 'Y',all4 : 'Y',all5 : 'Y',   
			
			dataBound : function(e) {

			}
		});

		/*핵심역량 공통코드 바인드*/
		$("#SCH_PNU_CAPBLTY_GCD").dropDownList({
			dataSource : null,
			commonCode : "0001_PNU_CAPBLTY_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "전체",
			optionValue : "",
			defaultValue : "",
			expnCondition : "AND CHAR_1_CONTENT = 'Y' ",
			dataBound : function(e) {

			}
		});
	}
	var paramData
	var chk = 'N';
	/***************************************************************************
	 * 조회 Event
	 **************************************************************************/
	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
			paramData = data;
		}
		if(chk =="N"){
		    data.pageSize = 50;
		}
		var json = fn_VisibleSet(true);
		/* 필수체크 */
		if (!gfn_val_validateDataMap(data, json))
			return false;
		fn_SearchPersonnellSearchFg();
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/atlectmanual/atlectmanual/selectAtlectManual",
			reqData : data,
			success : function(data, responseData) {
				chk = "Y";
				$("#resultTbody").listView(
						{
							dataSource : data,
							dataBound : function(e) {
								$('#resultTbody .subj-detail').bind(
										"click",
										function(e) {

											 scwin.detailObj01 = $(this).closest("td")
												.closest("tr").data();
											fn_openPopup({
												width : 800,
												height : 200,
												filename : 'AtlectManualPrecautionSearchPop',
												headertitle : '제한사항'
											}); 
										});
								$('#resultTbody .rcnt-detail').bind(
										"click",
										function(e) {
											if(SearchYn == 'Y'){

												 scwin.detailObj01 = $(this).closest("td")
													.closest("tr").data();
												fn_openPopup({
													width : 400,
													height : 370,
													filename : 'AtlectManualPersonnelSearchPop',
													headertitle : '배정인원상세보기'
												});	
											}else if(SearchYn == 'N'){
												alert('수강신청기간에는 일시적으로 서비스를 제한합니다.');
											}
											 
										});
								$('#resultTbody .remark-detail').bind(
										"click",
										function(e) {
												 scwin.detailObj01 = $(this).closest("td")
													.closest("tr").data();
												fn_openPopup({
													width : 800,
													height : 550,
													filename : 'AtlectManualMixSearchPop',
													headertitle : '혼합 개설교과목 일자별 수업유형'
												});	
										});
								$('#resultTbody .prof-detail').bind(
										"click",
										function(e) {

												 scwin.detailObj01 = $(this).closest("td")
													.closest("tr").data();
												fn_openPopup({
													width : 1000,
													height : 300,
													filename : 'AtlectManualDetailProfSearchPop',
													headertitle : '교수상세정보보기'
												});	
										});
								$('#resultTbody .kor').bind(
										"click",
										function(e) {
												 param = $(this).closest("tr").data();

												 fn_openReport(param,'KOR');
										});
								$('#resultTbody .eng').bind(
										"click",
										function(e) {
											param = $(this).closest("tr").data();

												 fn_openReport(param,'ENG');
										});
								totalCnt = responseData.pageInfo.totCnt;
								currentData = data;
							},
							template : $("#resultTemplate"),
							totalCnt : responseData.pageInfo.totCnt,
							paging : {
								pageInfo : responseData.pageInfo,
								reqData : responseData.reqData,
								func : "fn_sch"
							},
							excel : "fn_excelDownload"
						});
				$('#table01').rowspan(1);
			}

		});
	}
	function fn_openReport(param,gbn) {
		var options ={};
        var objParam = {};	
    	var SCH_LANG_GCD = "";
	 	if(gbn == "KOR"){
	 		SCH_LANG_GCD      = '0001';
        }else if(gbn == "ENG"){
        	SCH_LANG_GCD		= '0002';
        }
	 	var id = "";
	 	if(scwin.loginUser == {}){
	 			id = "";
	 	}else{
	 			id = scwin.loginUser.userId;
	 	}
	 	

        
        if(gfn_str_parseNull(param.EDUCERT_GCD) == ""){ //교육인증 구분코드 없을때./////////////////////////////////////////////////////////////////////////////
        	if(gbn == "KOR") { //국문
                options.rptName = "/ses/cls/sylmng/sylprint/SylPrint_001.crf";
            } else {//영문
                options.rptName = "/ses/cls/sylmng/sylprint/SylPrint_002.crf";
            }	
        	objParam.SCH_CURC_APPLY_SYEAR = paramData.SCH_SYEAR;
        	objParam.SCH_TERM_GCD = paramData.SCH_TERM_GCD;
        	
		    		objParam.bind = [{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["MST"
			                ,paramData.SCH_SYEAR
			                ,paramData.SCH_TERM_GCD
			                ,param.PROF_NO
			                ,param.SUBJ_NO
			                ,param.CLASS_NO
			                ,SCH_LANG_GCD
			                ,""
			                ,""
			                ,""
			                ,""
			                ,""
			                ,""
			                ,""
			                ,""
			                ,""
			                ,""
			                ,id
			                ,""
			                ,""
			                ,""
						]
		        },{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["DTL"
	                	,"{dataset.SYEAR}"
                        ,"{dataset.TERM_GCD}"
                        ,"{dataset.PROF_NO}"
                        ,"{dataset.SUBJ_NO}"
                        ,"{dataset.CLASS_NO}"
                        ,"{dataset.LANG_GCD}"
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,"{dataset.EDUCERT_GCD}"
		                ,""
		                ,"USER_ID"
                        ,"USER_NM"
                        ,"DEPT_CD"
                        ,"SEARCH_SCOPE_GCD"
						]
		        },{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["DTL2"
	                	,"{dataset.SYEAR}"
                        ,"{dataset.TERM_GCD}"
                        ,"{dataset.PROF_NO}"
                        ,"{dataset.SUBJ_NO}"
                        ,"{dataset.CLASS_NO}"
                        ,"{dataset.LANG_GCD}"
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,"USER_ID"
                        ,"USER_NM"
                        ,"DEPT_CD"
                        ,"SEARCH_SCOPE_GCD"
						]
		        },{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["DTL1"
	                	,"{dataset.SYEAR}"
                        ,"{dataset.TERM_GCD}"
                        ,"{dataset.PROF_NO}"
                        ,"{dataset.SUBJ_NO}"
                        ,"{dataset.CLASS_NO}"
                        ,"{dataset.LANG_GCD}"
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,"USER_ID"
                        ,"USER_NM"
                        ,"DEPT_CD"
                        ,"SEARCH_SCOPE_GCD"
						]
		        }];
        
        }else{////////교육인증 구분코드 존재할때./////////////////////////////////////////////////
        	if(gbn == "KOR"){
        		options.rptName = "/ses/ae/sylmng/sylprint/SylPrint"+param.EDUCERT_GCD+"_001.crf";
        		objParam.bind = [{
	                db : "EDUCERT",
	                proc : "AE_교수계획표관리_통합_교수계획표_출력",
	                params : [
	                paramData.SCH_SYEAR
	                ,paramData.SCH_TERM_GCD
	                ,param.SUBJ_NO
	                ,param.CLASS_NO
	                ,param.PROF_NO
	                ,SCH_LANG_GCD
	                ,param.EDUCERT_GCD
	                ]
	       		 }];
        	}else if(gbn == "ENG"){
        		options.rptName = "/ses/ae/sylmng/sylprint/SylPrint"+param.EDUCERT_GCD+"_002.crf";
        		objParam.bind = [{
	                db : "EDUCERT",
	                proc : "AE_교수계획표관리_통합_교수계획표_출력",
	                params : [
	                paramData.SCH_SYEAR
	                ,paramData.SCH_TERM_GCD
	                ,param.SUBJ_NO
	                ,param.CLASS_NO
	                ,param.PROF_NO
	                ,SCH_LANG_GCD
	                ,param.EDUCERT_GCD
	                ]
	       		 }];
        	}
        	
        }

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

        fn_openPopup2(options);
        

	}
	//출력 버튼 이벤트
	function fn_openReport2() {
		var options ={};
                    
    	    
        options.rptName = "/ses/cls/atlectmanual/AtlectManual_001.crf";
        
        //파라메터 설정
        var objParam = gfn_com_searchData($(".search-box"));
        var json = fn_VisibleSet(true);
		/* 필수체크 */
		if (!gfn_val_validateDataMap(objParam, json))
			return false;
	    
    	
        //레포트를 생성시킬 group component 또는 id를 넣는다.
        options.div = 'grp_report3';

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

        fn_openPopup3(options);

	}
	function fn_openPopup2(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "교수계획표",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
	function fn_openPopup3(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "수강편람",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
	
	function fn_openPopup(_option) {
		gfn_com_modalPopup({
			width : _option.width,
			height : _option.height,
			index : 1,
			/* position : {
				top : 300,
				left : 300
			}, */
			target : null,
			title :  _option.headertitle,
			//scrolling : "on",
			//scroll : "off",
			//move : "on",
			include : "/html/ost/cls/atlectmanual/" + _option.filename + ".html"
		});
	}
	function fn_excelDownload() {

		data = gfn_com_searchData($(".search-box"));
		data.pageSize = totalCnt; //전체데이터를 가지고 오기 위해서 pageSize를 전체건수로 세팅
		gfn_ajax_request({
			url : "/ost/cls/atlectmanual/atlectmanual/selectAtlectManual",
			reqData : data,
			success : function(data, responseData) {
				if (data.length > 0) {
					/* [엑셀다운로드 공통] */
					gfn_com_excelDownloadFile([ {
						key : "ALL_CYBER",
						name : "100%사이버강좌"
					}, {
						key : "NATIVE_LANG_NM",
						name : "원어강의"
					}, {
						key : "STDT_YEAR_NM",
						name : "학년"
					}, {
						key : "SUBJ_GCD_NM",
						name : "교과목구분"
					}, {
						key : "SUBJ_NM",
						name : "교과목명(미확정구분)"
					}, {
						key : "SUBJ_NO",
						name : "교과목번호"
					}, {
						key : "CLASS_NO",
						name : "분반"
					}, {
						key : "CRDT",
						name : "학점"
					}, {
						key : "SIGAN",
						name : "시간"
					}, {
						key : "ALLOC_RCNT",
						name : "제한인원"
					}, {
						key : "PROF_NM",
						name : "교수명"
					}, {
						key : "TIMETABLE_SUMMARY_INFO",
						name : "시간/강의실"
					}, {
						key : "ATLECT_DEPT_NM",
						name : "수강대상학과"
					}, {
						key : "MNG_DEPT_NM",
						name : "개설학과"
					}, {
						key : "PRT_KOR",
						name : "교수계획표(국문)"
					}, {
						key : "PRT_ENG",
						name : "교수계획표(영문)"
					}, {
						key : "REMARK",
						name : "비고"
					} ], /* 엑셀에 표시할 컬럼 및 명칭 */
					data, /* 엑셀로 다운로드 할 데이터 */
					"수업_수강편람" /* 엑셀로 다운로드 할 파일명 (확장자제외) */
					);
				} else {
					alert("엑셀로 다운로드할 데이터가 없습니다.");
					return false;
				}
			}
		});
	}
</script>