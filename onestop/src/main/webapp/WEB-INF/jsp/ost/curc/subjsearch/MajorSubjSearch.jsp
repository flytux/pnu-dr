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
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">

						<div class="b-row-box" role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>학년도</label>
								</div>
								<div class="b-con-box" role="cell">
	
										<select id="SCH_SYEAR" class="form-control"></select>

								</div>
							</div>
							<div class="b-row-item merge-1">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_COLL_GRAD_GCD" data-lang>대학/대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" />
								</div>
							</div>
						</div>
						<!-- 1Row -->

						<div class="b-row-box" role="row">

							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_GRAD_GCD" data-lang>대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_GRAD_GCD" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_COLL_CD" data-lang>단과대학</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_CD" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_DEPT_CD" data-lang>학과(부)/전공</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_DEPT_CD" class="form-control" />
								</div>
							</div>
						</div>
						<!-- 2Row -->

					</div>

					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /END 검색 영역 -->
				<!-- 테이블 -->
				<div class="table-box" id=grid01>
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>대학전공과목정보</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 70px;">
								<col style="min-width: 70px;">
								<col style="min-width: 100px;">
								<col style="min-width: 200px;">
								<col style="min-width: 130px;">
								<col style="min-width: 70px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">학년</th>
									<th scope="col">학기</th>
									<th scope="col">교과목구분</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">학점</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>
				</div>

				<!-- /END 테이블 -->
				<!-- 테이블 -->
				<div class="table-box" id=grid02 style="display: none;">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>대학원전공과목정보</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 100px;">
								<col style="min-width: 20px;">
								<col style="min-width: 130px;">
								<col style="min-width: 70px;">
								<col style="min-width: 70px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">교과목구분</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">학점</th>
									<th scope="col">학기</th>
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
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:STDT_YEAR_NM#</td>
        <td>#:OPEN_TERM_NM#</td>
	    <td class="text-left">#:SUBJ_GCD_NM#</td> 
	    <td class="text-left">#:SUBJ_NM#</td>
	    <td>#:SUBJ_NO#</td> 
		<td class="text-right">#:CRDT#</td> 
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td class="text-left">#:SUBJ_GCD_NM#</td>
        <td class="text-left">#:SUBJ_NM#</td>
	    <td>#:SUBJ_NO#</td> 
		<td class="text-right">#:CRDT#</td> 
		<td>#:OPEN_TERM_NM#</td> 
	</tr>
</script>

<script type="text/javascript">
	var totalCnt = 0;
	var date = new Date();
	var maxdate = date.getFullYear();
	$(document).ready(function() {

		$('#SCH_COLL_GRAD_GCD').change(function() {
			if (this.value == '0001') {
				$('#grid01').show();
				$('#grid02').hide();
			} else if (this.value == '0002') {
				$('#grid02').show();
				$('#grid01').hide();
			}
		});

	});

	function fn_initScreen() {
		/*학년도 바인드*/
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : "2017",
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
					defaultValue : maxdate,
					expnCondition : "",
					dataBound : function(e) {

					}
				});

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
			dataBound : function(e) {

			}
		});

	}

	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}

		/* 필수체크 */
		if (!gfn_val_validateDataMap(data, [ {
			"id" : "SCH_SYEAR",
			"name" : "학년도",
			"notNull" : true
		}, {
			"id" : "SCH_COLL_GRAD_GCD",
			"name" : "대학/대학원",
			"notNull" : true
		}, {
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
		} ]))
			return false;

		var temple = '';
		var tbody = '';
		if ($('#SCH_COLL_GRAD_GCD').val() == '0001') {
			temple = $("#resultTemplate");
			tbody = $("#resultTbody");
		} else if ($('#SCH_COLL_GRAD_GCD').val() == '0002') {
			temple = $("#resultTemplate2");
			tbody = $("#resultTbody2");
		}
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/curc/subjsearch/MajorSubjSearch/selectMajorSubjSearch",
			reqData : data,
			success : function(data, responseData) {
				
				tbody.listView({
					dataSource : data,
					dataBound : function(e) {
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;
						if (totalCnt == 0)
							alert("등록된 전공과목이 없습니다.");
					},
					template : temple,
					totalCnt :responseData.pageInfo.totCnt,
					paging : {
						pageInfo : responseData.pageInfo,
						reqData : responseData.reqData,
						func : "fn_sch"
					}
				});
			}
		});
	}
</script>