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
				<section class="sec-2">
					<header>
						<h4 class="sec-title" data-lang>교직선발</h4>
					</header>
					<div class="sec-body">
						<!-- 테이블 -->
						<div class="table-box">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table" data-show-column="true" id="table">
									<caption>교직선발</caption>
									<colgroup>
										<col style="min-width: 200px;">
										<col style="min-width: 200px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 200px;">
										<col style="min-width: 200px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">대학</th>
											<th scope="col">학과</th>
											<th scope="col">학번</th>
											<th scope="col">성명</th>
											<th scope="col">교직선발일자</th>
											<th scope="col">교직이수취소일자</th>
										</tr>
									</thead>
									<tbody id="resultTbody"></tbody>
								</table>
							</div>
						</div>
						<!-- /END 테이블 -->
						<div>
							<p class="info-text info-text-style-1 text-danger">
								사범대학생의 경우 입학일을 교직선발일자로 본다.
							</p>
						</div>
					</div>
				</section>
				<section class="sec-2">
					<header>
						<h4 class="sec-title" data-lang>교원자격 취득</h4>
					</header>
					<div class="sec-body">
						<!-- 테이블 -->
						<div class="table-box">
							<div class="table-body">
								<table class="table table-hover" data-toggle="table" data-show-column="true">
									<caption>교원자격취득</caption>
									<colgroup>
										<col style="min-width: 200px;">
										<col style="min-width: 200px;">
										<col style="min-width: 200px;">
										<col style="min-width: 100px;">
										<col style="min-width: 150px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">교원자격취득일자</th>
											<th scope="col">전공구분</th>
											<th scope="col">자격종별</th>
											<th scope="col">표시과목</th>
											<th scope="col">증서번호</th>
										</tr>
									</thead>
									<tbody id="resultTbody2"></tbody>
								</table>
							</div>
						</div>
						<!-- /END 테이블 -->
					</div>
				</section>
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>

<!-- 교직선발 -->
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td class="text-left">#:COLL_NM#</td>
		<td class="text-left">#:DEPT_NM#</td>
		<td>#:STDT_NO#</td>
		<td class="text-left">#:STDT_KOR_NM#</td>
		<td>#:TEACH_APPLY_DATE#</td>
		<td>#:TEACH_CANCEL_DATE#</td>
	</tr>
</script>
<!-- 교원자격취득 -->
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
		<td>#:FACULTY_LICENSE_ISSUE_DATE#</td>
		<td class="text-left">#:TEACH_JOLUP_GCD#</td>
		<td class="text-left">#:FACULTY_LICENSE_KOR_NM#</td>
		<td class="text-left">#:TEACH_DISPLAY_SUBJ_KOR_NM#</td>
 		<td>#:FACULTY_LICENSE_NO#</td>
	</tr>
</script>

<script type="text/javascript">
	function fn_initScreen() {		
		fn_teachApplySch();
		fn_FacultyLicenseSch();
	}
	
	/* 교직선발 조회 */
	function fn_teachApplySch(data) {
		searchParam = {};
		
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/FacultyLicenseAcqSearch/selectListTeachApply",
	        reqData : searchParam,
	        success : function(data, responseData) {
	        	$("#resultTbody").listView({
	                dataSource : data,
	                emptyComment : '교직선발 정보가 없습니다.',
	                dataBound : function(e) {
	                },
	                template : $("#resultTemplate"),
					totalCnt : responseData.totalCnt
	            });
	        }
	    });
	}
	
	/* 교원자격취득 조회 */
	function fn_FacultyLicenseSch() {
		searchParam = {};
		
		gfn_ajax_request({
			url : "/ost/kj/teachcourseguide/FacultyLicenseAcqSearch/selectListFacultyLicense",
	        reqData : searchParam,
	        success : function(data, responseData) {
	        	$("#resultTbody2").listView({
	                dataSource : data,
	                emptyComment : '교원자격취득 정보가 없습니다',
	                dataBound : function(e) {
	                },
	                template : $("#resultTemplate2"),
					totalCnt : responseData.totalCnt
	            });
	        	
	        }
	    });
	}
	
</script>