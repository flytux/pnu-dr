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
					<div class="b-table-box flex-col-4" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_COLL_GRAD_GCD" data-lang>대학/대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" />
								</div>
							</div>
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
								<div class="b-con-box">
								<input type="text" id="SCH_COLL_CD" class="form-control" />
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_DEPT_CD" data-lang>학과(부)/전공</label>
								</div>
								<div class="b-con-box" role="cell">
									<input type="text" id="SCH_DEPT_CD" class="form-control"/>
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
				</div>
				<!-- /END 검색 영역 -->
				<!-- 테이블 -->
				<div class="table-box" id=grid01>
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>타과 전공인정과목 정보</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 80px;">
								<col style="min-width: 100px;">
								<col style="min-width: 250px;">
								<col style="min-width: 100px;">
								<col style="min-width: 140px;">
								<col style="min-width: 50px;">
								<col style="min-width: 50px;">
								<col style="min-width: 50px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">년도</th>
									<th scope="col">구분</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">주관학과</th>
									<th scope="col">학점</th>
									<th scope="col">이론시간</th>
									<th scope="col">실습시간</th>
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
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:CURC_APPLY_SYEAR#</td>//학년도
	    <td>#:SUBJ_GCD_NM#</td> //구분
	    <td class="text-left">#:SUBJ_NM#</td> //교과목명
	    <td>#:SUBJ_NO#</td> //교과목번호
		<td>#:OPEN_DEPT_CD#</td> //주관학과
		<td>#:CRDT#</td> //학점
		<td>#:THEORY_SISU#</td> //이론시간
		<td>#:PRAC_SISU#</td> //실습시간
	</tr>
</script>

<script type="text/javascript">
	var totalCnt = 0;

	function fn_initScreen() {

		gfn_com_assignCombo({
			collGradGcd : $("#SCH_COLL_GRAD_GCD"),
			gradGcd : $("#SCH_GRAD_GCD"),
			collCd : $("#SCH_COLL_CD"),
			deptCd : $("#SCH_DEPT_CD"),
			comboLvl : 4,
			gradGcdExtUrl : "/ost/curc/subjsearch/ExdeptMajorSubjSearch/selectOpenGrad",
			collCdExtUrl : "/ost/curc/subjsearch/ExdeptMajorSubjSearch/selectOpenColl",
			deptCdExtUrl : "/ost/curc/subjsearch/ExdeptMajorSubjSearch/selectOpenDept",
			initChk : false,
			dataBound : function(e) {

					$("#SCH_COLL_GRAD_GCD").setValue("0002", function() {
					$("#SCH_COLL_GRAD_GCD").setReadOnly(true);
				});
			}
		});
		 //공통컴포넌트 대학원 세팅 후 비활성화 X */


		}
	

	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}

		/* 필수체크 */
		if (!gfn_val_validateDataMap(data, [ {
			"id" : "SCH_COLL_GRAD_GCD",
			"name" : "대학/대학원",
			"notNull" : true
		//mandatory : true
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

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/curc/subjsearch/ExdeptMajorSubjSearch/selectExdeptMajorSubjSearch",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody").listView({
					dataSource : data,
					emptyComment : '등록된 대학원 전공과목이 없습니다.',
					dataBound : function(e) {
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;						
					},
					template : $("#resultTemplate"),
					totalCnt : responseData.totalCnt,
					paging : {
						pageInfo : responseData.pageInfo,
						reqData : responseData.reqData,
						func : "fn_sch"
					}
				});
			}
		});
	}

	/***************************************************************************************************
	select 조회
	 ***************************************************************************************************/
	function SearchSelectNode() {

		/*개설학과 List 조회후 Select Box 바인드*/
		gfn_ajax_request({
			url : "/ost/curc/subjsearch/ExdeptMajorSubjSearch/selectOpenDept",
			reqData : {},
			success : function(data, responseData) {


				$("#SCH_DEPT_CD").dropDownList({
					dataSource : data,
					commonCode : "",
					dataTextField : "DEPT_KOR_NM",
					dataValueField : "DEPT_CD",
					optionLabel : "선택",
					optionValue : "",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {

					}
				});

			}
		});
	}
</script>