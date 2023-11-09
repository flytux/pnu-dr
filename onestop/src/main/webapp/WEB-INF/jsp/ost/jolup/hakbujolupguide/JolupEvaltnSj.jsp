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
						<section class="sec-3">
							<div class="sec-body">
								<div class="search-box"></div>
							</div>
						</section>

						<section class="sec-3">
							<header id="title">
								<h4 class="sec-title" id="title">학적신청내역</h4>
							</header>
							<div class="sec-body">
								<div class="table-box" id="table1">
									<div class="table-body">
										<table class="table table-hover" data-toggle="table" data-show-columns="false">
											<caption>학적신청내역</caption>
											<colgroup>
												<col style="min-width: 150px;">
												<col style="min-width: 200px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" data-width="80">구분</th>
													<th scope="col" data-width="125">학과명</th>
												</tr>
											</thead>
											<tbody id="resultTbody1">
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3">
							<header id="title">
								<h4 class="sec-title" id="title">학적변동내역(전과,재입학,편입학 내역)</h4>
							</header>
							<div class="table-box" id="table2">
								<div class="table-body">
									<table class="table table-hover" data-toggle="table" data-show-columns="false">
										<caption>전과,재입학,편입학의 학적변동내역</caption>
										<colgroup>
											<col style="min-width: 100px;">
											<col style="min-width: 80px;">
											<col style="min-width: 80px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" data-width="100">학년도</th>
												<th scope="col" data-width="80">학기</th>
												<th scope="col" data-width="80">학적변동내역</th>
											</tr>
										</thead>
										<tbody id="resultTbody2">
										</tbody>
									</table>
								</div>
							</div>
						</section>


						<section class="sec-3">
							<header id="title">
								<h4 class="sec-title" id="title">수강신청내역</h4>
							</header>
							<div class="table-box" id="table3">
								<div class="table-body">
									<table class="table table-hover" data-toggle="table" data-show-columns="false">
										<caption>수강신청내역</caption>
										<colgroup>
											<col style="min-width: 80px;">
											<col style="min-width: 80px;">
											<col style="min-width: 80px;">
											<col style="min-width: 80px;">
											<col style="min-width: 180px;">
											<col style="min-width: 80px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" data-width="100">학년도</th>
												<th scope="col" data-width="80">학기</th>
												<th scope="col" data-width="80">교과구분</th>
												<th scope="col" data-width="150">교과목번호</th>
												<th scope="col" data-width="180">교과목명</th>
												<th scope="col" data-width="50">학점</th>
											</tr>
										</thead>
										<tbody id="resultTbody3">
										</tbody>
									</table>
								</div>
							</div>
						</section>


						<section class="sec-3">
							<header id="title">
								<h4 class="sec-title" id="title">성적이수내역</h4>
							</header>
							<div class="table-box" id="table4">
								<div class="table-body">
									<table class="table table-hover" data-toggle="table" data-show-columns="false">
										<caption>성적이수내역</caption>
										<colgroup>
											<col style="min-width: 80px;">
											<col style="min-width: 70px;">
											<col style="min-width: 70px;">
											<col style="min-width: 70px;">
											<col style="min-width: 70px;">
											<col style="min-width: 70px;">
											<col style="min-width: 70px;">
											<col style="min-width: 70px;">
											<col style="min-width: 70px;">
											<col style="min-width: 70px;">
											<col style="min-width: 70px;">
											<col style="min-width: 80px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" data-width="80">구분</th>
												<th scope="col" data-width="70">교양필수<br>(교양공통)
												</th>
												<th scope="col" data-width="70">전공기초<br>(기초필수) </th>
												<th scope="col" data-width="70">교양선택</th>
												<th scope="col" data-width="70">전공필수</th>
												<th scope="col" data-width="70">전공선택</th>
												<th scope="col" data-width="70">일반선택<br>(자유선택)
												</th>
												<th scope="col" data-width="70">부전공</th>
												<th scope="col" data-width="70">교직</th>
												<th scope="col" data-width="70">복수전공</th>
												<th scope="col" data-width="70">연합전공</th>
												<th scope="col" data-width="70">총계</th>
											</tr>
										</thead>
										<tbody id="resultTbody4">
										</tbody>
									</table>
								</div>
							</div>
						</section>

						<section class="sec-3">
							<div class="table-box" id="table5">
								<div class="table-body">
									<table class="table table-hover" data-toggle="table" data-show-columns="false">
										<caption>교과목정보</caption>
										<colgroup>
											<col style="min-width: 100px;">
											<col style="min-width: 80px;">
											<col style="min-width: 300px;">
											<col style="min-width: 80px;">
											<col style="min-width: 100px;">
											<col style="min-width: 80px;">
											<col style="min-width: 80px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" data-width="100">이수구분</th>
												<th scope="col" data-width="80">교과목코드</th>
												<th scope="col" data-width="300">교과목명</th>
												<th scope="col" data-width="80">학년도</th>
												<th scope="col" data-width="120">학기</th>
												<th scope="col" data-width="80">학점</th>
												<th scope="col" data-width="80">성적</th>
											</tr>
										</thead>
										<tbody id="resultTbody5">
										</tbody>
									</table>
								</div>
							</div>
						</section>
					</div>
				</section>
			</div>


			<!-- /END 아코디언 -->

		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate1">
	<tr style="cursor:pointer;">
		<td>#:MULTI_DETAIL_GCD#</td>
	    <td class="text-left">#:DEPT_KOR_NM#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
        <td class="text-left">#:SYEAR#</td>
	    <td>#:TERM_GCD#</td>
		<td>#:CHG_DETAIL_GCD#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate3">
	<tr style="cursor:pointer;">
        <td>#:SYEAR#</td>
	    <td class="text-left">#:TERM_GCD#</td>
		<td>#:SUBJ_GCD#</td>
		<td>#:SUBJ_NO#</td>
	    <td class="text-left">#:SUBJ_NM#</td>
		<td>#:CRDT#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate4">
	<tr style="cursor:pointer;">
        <td class="table-secondary" scope="row">#:구분#</td>
	    <td>#:교양공통(교양필수)#</td>
		<td>#:기초필수#</td>
		<td>#:교양선택#</td>
	    <td>#:전공필수#</td>
		<td>#:전공선택#</td>
		<td>#:일반선택(자유선택)#</td>
	    <td>#:부전공#</td>
		<td>#:교직#</td>
		<td>#:복수전공#</td>
	    <td>#:연합전공#</td>
		<td class="table-secondary" scope="row">#:총계#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate5">
	<tr style="cursor:pointer;">
        <td>#:SUBJ_GCD#</td>
	    <td>#:SUBJ_NO#</td>
	    <td class="text-left">#:SUBJ_NM#</td>
		<td>#:SYEAR#</td>
		<td>#:TERM_GCD#</td>
	    <td>#:CRDT#</td>
		<td>#:GRADE#</td>
	</tr>
</script>
<script type="text/javascript">
	function fn_initScreen() {
		fn_search();
		fn_sj_search();
	}

	function fn_search(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		gfn_ajax_request({
			url : "/ost/jolup/hakbujolupguide/jolupevaltnsj/selectHakjukApply",
			reqData : data,
			success : function(data, responseData) {

				$("#resultTbody1").listView({
					dataSource : data,
					emptyComment : "학적신청내역이 없습니다.",
					dataBound : function(e) {
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;

					},
					template : $("#resultTemplate1"),
					totalCnt : responseData.totalCnt,
					totalViewYn : "N"

				});
			}
		});

		gfn_ajax_request({
			url : "ost/jolup/hakbujolupguide/jolupevaltnsj/selectHakjukChange",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody2").listView({
					dataSource : data,
					emptyComment : "학적변동내역이 없습니다.",
					dataBound : function(e) {
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;
					},
					template : $("#resultTemplate2"),
					totalCnt : responseData.totalCnt,
					totalViewYn : "N"
				});
			}
		});

		gfn_ajax_request({
			url : "ost/jolup/hakbujolupguide/jolupevaltnsj/selectLectApply",
			reqData : data,
			success : function(data, responseData) {

				$("#resultTbody3").listView({
					dataSource : data,
					emptyComment : "",
					dataBound : function(e) {
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;
					},
					template : $("#resultTemplate3"),
					totalCnt : responseData.totalCnt,
					totalViewYn : "N",
				});
			}
		});

		gfn_ajax_request({
			url : "ost/jolup/hakbujolupguide/jolupevaltnsj/selectSjIsu",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody4").listView({
					dataSource : data,
					emptyComment : "",
					dataBound : function(e) {
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;

					},
					template : $("#resultTemplate4"),
					totalCnt : responseData.totalCnt,
					totalViewYn : "N",
				});
			}
		});
	}

	function fn_sj_search(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/jolup/hakbujolupguide/jolupevaltnsj/selectSubjSj",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody5").listView({
					dataSource : data,
					emptyComment : "",
					dataBound : function(e) {
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;

					},
					template : $("#resultTemplate5"),
					totalCnt : responseData.totalCnt,
					paging : {
						pageInfo : responseData.pageInfo,
						reqData : responseData.reqData,
						func : "fn_sj_search"
					}
				});
			}
		});
	}
</script>