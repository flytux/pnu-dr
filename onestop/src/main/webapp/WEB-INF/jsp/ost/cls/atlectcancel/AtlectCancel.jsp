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
			<section class="sec-2">
				<div class="stdt-info">
					<!-- 3단 테이블 -->
					<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-3">
								<div class="b-title-box" role="rowheader">
									<label data-lang>소속(과정)</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="collInfo"></div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학번(성명)</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="stdtNoNm"></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학년</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="stdtYearGcd"></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학적상태</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="hjStaGcd"></div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>교육과정적용<br>학년도
									</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="curcSyear"></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>이수학기수</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="cmplTermCnt"></div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>학사학위취득<br>유예여부
									</label>
								</div>
								<div class="b-con-box" role="cell">
									<div id="confFg"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- 3단 테이블 END-->
		
					<div class="sec-body" id="search">
						<!-- 검색 영역 -->
						<div class="search-box">
							<div class="b-table-box flex-col-2" role="table" aria-label="조회">
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label class="req" data-lang>학년도/학기</label>
										</div>
										<div class="b-con-box" role="cell">
											<input id="SCH_SYEAR" class="form-control" type="number" style="width: 30%;" data-bind="value: SYEAR" title="학년도입력"></input>&nbsp; 
											<select id="SCH_TERM_GCD" class="form-control" style="width: 30%;" data-bind="value: TERM_GCD" title="학기선택"></select> 
											<input id="SCH_STDT_NO" class="form-control" type="hidden"></input>
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
						<!-- 뷰어 START  -->
						<!-- <div id="download_target2"></div> -->
						<!-- 뷰어 END  -->
						<!-- 메세지Box 영역 -->
						<!--  <div class="message-box">
							<div class="message-box-inner">
								<div class="message-body">
									<ul class="list list-style-1">
										<li><span class="dfn" data-lang></span>User의 소속, 업무구분에 따라 공통 > 기초관리 > 업무공통관리 > 결재템플릿관리 화면에서 등록된 결재단계구분을 조회하여 결재진행상태를 조회한다.</li>
										<li><span class="dfn" data-lang></span>Ex) 아래 진행항태는 학생신청 -> 학과승인 -> 대학승인 -> 최종(담당부서)승인 4단계이다.</li>
										<li><span class="dfn" data-lang></span>SES의 승인화면에서도 결재단계에 따라 결제처리 할 수 있도록 설계한다.</li>
									</ul>
								</div>
							</div>
						</div>
						-->
						<!-- 메세지Box 영역 END-->
						
						<!-- 수강신청과목 선택 테이블 -->
						<div id="ChoiceTable">
							<section class="sec-3">
								<header>
									<h4 class="sec-title">수강신청과목 선택</h4>
								</header>
								<div class="table-box">
									<div class="table-body">
										<table class="table table-hover" data-toggle="table" data-show-column="true">
											<caption>수강신청과목정보</caption>
											<colgroup>
												<col style="min-width: 50px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">NO</th>
													<th scope="col">교과목구분</th>
													<th scope="col">교과목명</th>
													<th scope="col">교과목번호</th>
													<th scope="col">환불액</th>
													<th scope="col">선택</th>
												</tr>
											</thead>
											<tbody id="resultTbody_Choice">
											</tbody>
										</table>
									</div>
								</div>
							</section>
						</div>
						<!-- 수강신청과목 선택 테이블 END -->
						
						<!-- 정규학기 연락처 및 사유입력(수정) 및 수강취소신청 버튼 -->
						<div id="RegularCancel" style="display:none;">
							<section class="sec-3">
								<header>
									<h4 class="sec-title">연락처 및 사유입력(수정)</h4>
								</header>
								<div class="b-table-box flex-col-3" role="table" aria-label="조회">
									<div class="b-row-box " role="row">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label for="REGULAR_STDT_TEL" data-lang>연락처(휴대폰)</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control col-3" type="text" id="REGULAR_STDT_TEL">
											</div>
										</div>
									</div>
									<div class="b-row-box " role="row">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label for="CANCEL_REASON_COMMENT" data-lang>취소신청 사유</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text" id="CANCEL_REASON_COMMENT">
											</div>
										</div>
									</div>
								</div>
								<ul class="list list-style-1">
									<li data-lang><span class="dfn"> 현재 사용하는 연락 가능한 연락처를 입력(수정)해 주십시오. (학생생활기록부와 연동) </span></li>							
									<li data-lang><span class="dfn"> 대학(학부생)인 경우 대학원교과목에 대해서만 출력 내용이 나옵니다. </span></li>							
								</ul><br>
								<div class="text-center">
									<div class="form-group">
										<button class="btn btn-primary btn-lg" id="btnRegularSave" type="button" onclick="fn_RegularSave()" data-lang>수강취소신청</button>
										<button class="btn btn-primary btn-lg" id="btnRegularPrint" type="button" onclick="fn_openReport(true)" data-lang style="display:none;">취소신청서출력</button>
									</div>                              
								</div>
							</section>
						</div>
						<!-- 정규학기 연락처 및 사유입력(수정) 및 수강취소신청 버튼 END -->
						
						<!-- 계절학기 환불계좌정보입력 및 수강취소신청 버튼 -->
						<div id="SeasonCancel" style="display:none;">
							<section class="sec-3">
								<header>
									<h4 class="sec-title">환불계좌번호입력</h4>
								</header>
								<div class="b-table-box flex-col-3" role="table" aria-label="조회">
									<div class="b-row-box " role="row">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label for="SEASON_STDT_TEL" data-lang>연락처(휴대폰)</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control col-3" type="text" id="SEASON_STDT_TEL">
											</div>
										</div>
									</div>
									<div class="b-row-box " role="row" id="bankNm">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label for="SEASON_BANK_CD" data-lang>은행명</label>
											</div>
											<div class="b-con-box" role="cell">
												<!-- <input class="form-control col-3" type="text" id="SEASON_BANK_NM"> -->
												<select id="SEASON_BANK_CD" class="form-control"></select>
											</div>
										</div>
									</div>
									<div class="b-row-box " role="row" id="acctNo">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label for="SEASON_ACCT_NO" data-lang>환불계좌번호<br>(본인명의)</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text" id="SEASON_ACCT_NO">
											</div>
										</div>
									</div>
									<div class="b-row-box " role="row" id="bankFile">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">
												<label data-lang>첨부파일</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="sec-body" id="uploader_target1"></div>
											</div>
										</div>
									</div>
								</div>
								<ul class="list list-style-1">
									<li data-lang><span class="dfn"> 첨부가능문서 : 통장 사본 [4MB 이하의 그림파일 (gif, jpg, png, jpeg)만 업로드가 가능합니다.] </span></li>
									<li data-lang><span class="dfn"> 현금등록을 완료한 학생만 수강취소 신청을 할 수 있습니다. </span></li>
									<li data-lang><span class="dfn"> 수강취소 신청을 완료한 교과목은 다시 수강할 수 없습니다. </span></li>
									<li data-lang><span class="dfn"> 타대생만 해당 </span><br>
									&nbsp;- 본인명의 통장을 스캔 또는 사진촬영하여 upload. (은행명, 계좌번호, 예금주가 명확히 보이도록 할 것)<br>
									&nbsp;- 통장사본을 web으로 upload 못할 경우 본인명의의 통장사본 1부, 환불신청서를 학사과로 제출.				
									</li>		
								</ul><br>
								<div class="text-center">
									<div class="form-group">
										<button class="btn btn-primary btn-lg" id="btnSeasonSave" type="button" onclick="fn_SeasonSave()" data-lang>수강취소신청</button>
									</div>                              
								</div>
							</section>
						</div>
						<!-- 계절학기 환불계좌정보입력 및 수강취소신청 버튼 END -->
						
						<!-- 수강 취소신청 과목 테이블 -->
						<div id="CancelTable">
							<section class="sec-3">
								<header>
									<h4 class="sec-title">수강 취소신청 과목</h4>
								</header>
								<div class="table-box">
									<div class="table-body">
										<table class="table" data-toggle="table">
											<caption>수강취소과목정보</caption>
											<colgroup>
												<col style="min-width: 50px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">NO</th>
													<th scope="col">교과목구분</th>
													<th scope="col">교과목명</th>
													<th scope="col">교과목번호</th>
													<th scope="col">환불액</th>
													<th scope="col">삭제</th>
												</tr>
											</thead>
											<tbody id="resultTbody_Cancel">
											</tbody>
										</table>
									</div>
								</div>
							</section>
						</div>
						<!-- 수강 취소신청 과목 테이블 END -->
						
						<!-- 수강취소 및 환불처리 진행상황 테이블 -->
						<div id="RefundTable">
							<section class="sec-3">
								<header>
									<h4 class="sec-title">수강취소 및 환불처리 진행상황</h4>
								</header>
								<div class="table-box">
									<div class="table-body">
										<table class="table" data-toggle="table">
											<caption>수강취소 및 환불처리 과목정보</caption>
											<colgroup>
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">NO<br>&nbsp;</th>
											<th scope="col" rowspan="2">교과목명<br>&nbsp;</th>
											<th scope="col" rowspan="2">교과목번호<br>&nbsp;</th>
											<th scope="col" rowspan="2">환불차수<br>&nbsp;</th>
											<th scope="col" rowspan="2">환불금액구분<br>&nbsp;</th>
											<th scope="col" rowspan="2">수강취소신청<br>(학생본인)</th>
											<th scope="col" colspan="3">승인일자</th>
											<th scope="col" rowspan="2">환불처리<br>(교육혁신과)</th>
										</tr>
										<tr>
											<th scope="col">학과</th>
											<th scope="col">대학</th>
											<th scope="col">교육혁신과</th>
										</tr>
									</thead>
									<tbody id="resultTbody_Refund">
									</tbody>
										</table>
									</div>
								</div>
							</section>
						</div>
						<!-- 수강취소 및 환불처리 진행상황 테이블 END -->
						
						<!-- 수강취소 및 환불완료 과목 테이블 -->
						<div id="RefundCompleteTable" style="display:none;">
							<section class="sec-3">
								<header>
									<h4 class="sec-title">수강취소 및 환불완료 과목</h4>
								</header>
								<div class="table-box">
									<div class="table-body">
										<table class="table" data-toggle="table">
											<caption>수강취소 및 환불완료 과목정보</caption>
											<colgroup>
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">NO<br>&nbsp;</th>
											<th scope="col" rowspan="2">교과목명<br>&nbsp;</th>
											<th scope="col" rowspan="2">교과목번호<br>&nbsp;</th>
											<th scope="col" rowspan="2">환불액<br>&nbsp;</th>
											<th scope="col" rowspan="2">연락처<br>&nbsp;</th>
											<th scope="col" rowspan="2">은행명<br>&nbsp;</th>
											<th scope="col" rowspan="2">환불 계좌번호<br>&nbsp;</th>
											<th scope="col" rowspan="2">신청일자<br>&nbsp;</th>
											<th scope="col" colspan="3">승인일자</th>
											<th scope="col" rowspan="2">환불일자<br>&nbsp;</th>
										</tr>
										<tr>
											<th scope="col">학과</th>
											<th scope="col">대학</th>
											<th scope="col">교육혁신과</th>
										</tr>
									</thead>
									<tbody id="resultTbody_Complete">
									</tbody>
										</table>
									</div>
								</div>
							</section>
						</div>
						<!-- 수강취소 및 환불완료 과목 테이블 END -->
		
						<!-- 수강취소 환불안내 테이블 -->
						<div id="RefundInfo" style="display: none;">
							<section class="sec-3">
								<header>
									<h4 class="sec-title">수강취소 및 환불일정 안내</h4>
								</header>
								<ul class="list list-style-1">
									<li data-lang id="RefundSchdTxt"><span class="dfn"></span></li>
								</ul>
							</section>
						</div>
						<div id="RefundTable">
							<section class="sec-3">
								<header>
									<h4 class="sec-title" id="refund02">수강취소 및 환불일정 안내</h4>
								</header>
								<div class="table-box" id="refund01">
									<div class="table-body">
										<table class="table" data-toggle="table">
											<caption>수강취소 및 환불일정안내</caption>
											<colgroup>
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">구분</th>
													<th scope="col">전액환불<br>수업 개시일 전</th>
													<th scope="col">2/3 반환 <br>총 수업일수의 1/3 경과전</th>
													<th scope="col">1/2 반환 <br>총 수업일수의 1/2 경과전</th>
													<th scope="col">취소 및 환불 불가<br>총 수업일수의 1/2 경과후</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>신청마감일시</td>
													<td><div id="ALL_REFUND_CLOSE"></div></td>
													<td><div id="THIRD_REFUND_CLOSE"></div></td>
													<td><div id="HALF_REFUND_CLOSE"></div></td>
													<td><div id="REFUND_DEADLINE"></div></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</section>
		
							<!-- 환불절차 START  -->
							<section class="sec-3" style="display: none;">
								<header>
									<h4 class="sec-title">환불절차안내</h4>
								</header>
								<div class="table-box">
									<div class="b-table-box flex-col-1" role="table" aria-label="조회">
										<div class="b-row-box" role="row">
											<div class="b-row-item">
												<div class="b-con-box" role="cell">
													<ul class="list list-style-1">
														<li><span class="dfn" data-lang>학교홈페이지 <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 학생지원시스템 <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 수업 <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 수강취소 <i class="bi bi-forward-fill"><span class="sr-only">오른쪽화살표</span></i> 수강취소 및 환불내역 본인 직접 입력</span><br></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- 환불절차 END  -->
						</div>
						<br>
						<!-- 수강취소 환불안내 테이블 END-->
					</div>
				</div>
			</section>
		</section>
	</main>
</div>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/x-tbody-template" id="resultTemplateChoice">
	<tr style="cursor:pointer;" id="subject-choice#:RN#">
        <td>
			#:RN#
			<input class="form-control" id="SYEAR" type="text" style="display:none;" value="#:SYEAR#"> 
			<input class="form-control" id="TERM_GCD" type="text" style="display:none;" value="#:TERM_GCD#"> 
			<input class="form-control" id="SUBJ_NO" type="text" style="display:none;" value="#:SUBJ_NO#"> 
			<input class="form-control" id="SUBJ_NM" type="text" style="display:none;" value="#:SUBJ_NM#"> 
			<input class="form-control" id="CLASS_NO" type="text" style="display:none;" value="#:CLASS_NO#"> 
			<input class="form-control" id="STDT_NO" type="text" style="display:none;" value="#:STDT_NO#"> 
			<input class="form-control" id="CRDT" type="text" style="display:none;" value="#:CRDT#"> 
			<input class="form-control" id="STDT_GCD" type="text" style="display:none;" value="#:STDT_GCD#"> 
			<input class="form-control" id="REFUND_AMT" type="text" style="display:none;" value="#:REFUND_AMT#"> 
			<input class="form-control" id="BANK_CD" type="text" style="display:none;" value="#:BANK_CD#"> 
			<input class="form-control" id="ACCT_NM" type="text" style="display:none;" value="#:ACCT_NM#"> 
			<input class="form-control" id="REFUND_CHASU" type="text" style="display:none;" value="#:REFUND_CHASU#"> 
			<input class="form-control" id="COLL_GRAD_GCD" type="text" style="display:none;" value=""> 
			<input class="form-control" id="RESPITE" type="text" style="display:none;" value=""> 
			<input class="form-control" id="MNG_FG" type="text" style="display:none;" value="N"> 
			<input class="form-control" id="STDT_TEL" type="text" style="display:none;" value=""> 
			<input class="form-control" id="CANCEL_REASON_COMMENT" type="text" style="display:none;" value=""> 
			<input class="form-control" id="BANK_NM" type="text" style="display:none;" value=""> 
			<input class="form-control" id="ACCT_NO" type="text" style="display:none;" value=""> 
			<input class="form-control" id="ATTACH_FILE_GRP_CD" type="text" style="display:none;" value=""> 
		</td>
	    <td scope="row">#:SUBJ_GCD_NM#</td>
	    <td class="text-left"><label for="CHK#:RN#">#:SUBJ_NM#</label></td>
		<td>#:SUBJ_NO#</td>
		# if( :TERM_GCD == "0010" || :TERM_GCD == "0020") { #
		<td>-</td>
		#} else {#
		<td>#:REFUND_AMT#</td>
		#}#
		# if( :CHK_GB == "Y") { #
		<td><input type="checkbox" id ="CHK#:RN#" value=""></td>
		#} else {#
		<td><input type="checkbox" disabled id ="CHK#:RN#" value=""></td>
		#}#
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplateCancel">
	<tr style="cursor:pointer;">
        <td>
			#:RN#
		</td>
	    <td class="text-left" scope="row">#:SUBJ_GCD_NM#</td>
	    <td>#:SUBJ_NM#</td>
		<td>#:SUBJ_NO#</td>
		# if( :TERM_GCD == "0010" || :TERM_GCD == "0020") { #
		<td>-</td>
		#} else {#
		<td>#:REFUND_AMT#</td>
		#}#
		# if( :ATLECT_CANCEL_STA_GCD == "0001") { #
			<td><button class="btn btn-primary btn-lg" id="" type="button" onclick="fn_cancelApplyDelete('#:SYEAR#', '#:TERM_GCD#', '#:STDT_NO#', '#:SUBJ_NO#', '#:CLASS_NO#')" data-lang>삭제</button></td>
		#} else {#
			<td></td>
		#}#
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplateRefund">
	<tr style="cursor:pointer;">
        <td>
			#:RN#
		</td>
	    <td class="text-left" scope="row">#:SUBJ_NM#</td>
		<td>#:SUBJ_NO#</td>
		# if( :TERM_GCD == "0010" || :TERM_GCD == "0020") { #
		<td>-</td>
		#} else {#
		<td>#:REFUND_CHASU#</td>
		#}#
		<td>#:SCLASS_REFUND_GCD#</td>
		<td>#:CANCEL_APPLY_ID#</td>
		<td>#:DEPT_CONF_DT#</td>
		<td>#:COLL_CONF_DT#</td>
		<td>#:CHARGE_CONF_DT#</td>
		# if( :TERM_GCD == "0010" || :TERM_GCD == "0020") { #
		<td>-</td>
		#} else {#
		<td>#:CONF_FG#</td>
		#}#
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplateComplete">
	<tr style="cursor:pointer;">
        <td>
			#:RN#
		</td>
	    <td class="text-left" scope="row">#:SUBJ_NM#</td>
		<td>#:SUBJ_NO#</td>
		<td>#:REFUND_AMT#</td>
		<td>#:CELLULAR_NO#</td>
		<td>#:BANK_NM#</td>
		<td>#:ACCT_NO#</td>
		<td>#:APPLY_DT#</td>
		<td>#:DEPT_CONF_DT#</td>
		<td>#:COLL_CONF_DT#</td>
		<td>#:CHARGE_CONF_DT#</td>
		<td>#:REFUND_DT#</td>
	</tr>
</script>

<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;

	var apprConfDt; // 학생승인확인가능일시
	var respite; // 학생유예여부
	
	var subjectTableCnt = 0; // 수강신청과목 row 갯수

	var crdt = 0;            // 신청학점
	var cancelCrdt = 0;  // 취소학점
	var applyCnt = 0;    // 신청과목수
	var cancelCnt = 0;  // 취소과목수
	
	var stdtGcd; // 학생구분
	
	var basicSyear;
	var basicTermGcd;
    
	function fn_initScreen() {
		
/* 		$('select[id=SCH_TERM_GCD]').change(
				function() {
					if(this.value == '0011' || this.value == '0021'){
						$("#refund01").show();						
						$("#refund02").show();						
					}else{ 
						$("#refund01").hide();						
						$("#refund02").hide();						
					}

				}); */

		gfn_com_DropDownLists([ {
			elements : $("#SCH_TERM_GCD"),
			commonCode : "0001_TERM_GCD",
			dataTextField : "COMMON_DETAIL_CD_KOR_NM",
			dataValueField : "COMMON_DETAIL_CD",
			optionLabel : "선택",
			optionValue : "",
			defaultValue : "",
			expnCondition : "AND CHAR_1_CONTENT LIKE'%B%'",
			hakbuGradFg : false,
			dataBound : function(e) {
			}
		} ]);
		
		$("#REGULAR_STDT_TEL").telEditor({
        	txtVal : (scwin.loginUser.cellularNo).substr(scwin.loginUser.cellularNo.indexOf('|')+1),
        	originVal : "0000|"+scwin.loginUser.cellularNo,
        	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
        	telnoNm : "휴대폰번호",
            callbackFunc : function(e){

            },
			dataBound : function(e) {

            }
        });
		
		$("#SEASON_STDT_TEL").telEditor({
			txtVal : (scwin.loginUser.cellularNo).substr(scwin.loginUser.cellularNo.indexOf('|')+1),
        	originVal : "0000|"+scwin.loginUser.cellularNo,
        	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
        	telnoNm : "휴대폰번호",
            callbackFunc : function(e){

            },
			dataBound : function(e) {

            }
        });
		
		var uploader_target1 = $("#uploader_target1").formuploader({
			SYSTEM_GCD : "0002",  //시스템코드
			ATTACH_FILE_GCD : "9999", // 첨부파일 종류 코드 
			//ATTACH_FILE_GRP_CD : "20220101",  /* 첨부파일 그룹 코드  */
			ACCEPT_EXT : "GIF,JPG,PNG,JPEG",  // 허용확장자 ( 메뉴설정에서 들고 오거나 지정한 확장자가 없으면 기본 확장자로 사용. )
			UPLOAD_SIZE : "4mb", // 최대 파일용량 (mb) (메뉴설정에서 들고 오거나 지정한 용량 없으면 기본 20mb )
			FILE_ADD_YN : "Y",  //신규추가가능여부
			FILE_DEL_YN : "Y",   //삭제가능여부
	        FILE_DWN_YN : "Y",  //다운로드가능여부
	       	FILE_INFO_YN : "Y", /* 확장자와 제한용량 정보표시 여부*/
	       	FILE_AREA_WIDTH_PER : 70, /* 첨부파일영역의 %값 */
	       	FILE_VIEWER_YN : "Y", /* 첨부파일뷰어 표시 여부 */
	       	FILE_TAG_CONTENT_YN : "N", /* 첨부파일 대체텍스트 표시 여부 */
	       	dataBound : function(e,_target) { /* 업로드 완료후 처리 함수*/
				alert("업로드 완료",_target);
	        }
		});	
		
		var options = {};
		options.url = '/file/selectList';
		options.reqData = {
			SYSTEM_GCD:  "0002",
			ATTACH_FILE_GCD: "0001",
			ATTACH_FILE_GRP_CD: "9af35ce7-807c-20e0-f73e-d37d3cea035b"
		};
		options.success = function(data, responseData) {
			var download_target_html = "";
			download_target_html += "<div class='message-box message-box-style-2'>";
			download_target_html += "<div class='message-box-inner'>";
			download_target_html += "	<div class='message-header'>";
			download_target_html += "		<img src='/common/images/message_box_icon_01.svg' alt=''>";
			download_target_html += "	</div>";
			download_target_html += "	<div class='message-body'>";

			$.each(data,function(idx,file){
				download_target_html += "<div class='my-2'>";
				download_target_html += file.ORIGIN_FILE_NM;
				download_target_html += " <a class='btn btn-sm btn-primary' href='javascript:void(0);'  onclick='fn_popupMultiFileViewr(\"/file/download.do?"+file.PARAM_CODE+"\",this)' onkeypress='this.onclick' >뷰어<i class='bi bi-eye' aria-hidden='true'></i></a>";
				download_target_html += " <a class='btn btn-sm btn-primary' href='/file/download.do?"+file.PARAM_CODE+"'>다운로드<i class='bi bi-download' aria-hidden='true'></i></a>";
				download_target_html += "	</div>";
			});

			download_target_html += "	</div>";
			download_target_html += "</div>";
			download_target_html += "</div>";
			
			$("#download_target2").html(download_target_html);
		};

		gfn_ajax_request(options);
		
		var collInfo = "";
		if(scwin.loginUser.userGcd == "0003") {
			collInfo = scwin.loginUser.collGradGcdKorNm + ' '+ scwin.loginUser.collCdKorNm + ' ' + scwin.loginUser.assignNm+ ' (' + scwin.loginUser.degCourseGcdKorNm + ')';
		}else{
			collInfo = scwin.loginUser.assignNm;
		}
		$("#collInfo").text(collInfo);
		$("#stdtNoNm").text(scwin.loginUser.userId + ' (' + scwin.loginUser.nm + ')');
		$("#stdtYearGcd").text(scwin.loginUser.stdtYearGcdKorNm);
		$("#hjStaGcd").text(scwin.loginUser.hjStaGcdKorNm);
		$("#cmplTermCnt").text(scwin.loginUser.cmplTermCnt);
		$("#SCH_STDT_NO").val(scwin.loginUser.userId);

		var param = gfn_com_inputdata($(".search-box"));
		param.SYSTEM_GCD = scwin.menuInfo.SYSTEM_GCD;
		param.MENU_CD = scwin.menuInfo.MENU_CD;
		
		/* 기준학년도학기 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/AtlectSearch/selectOneShafYyShtm",
			reqData : param,
			success : function(data, responseData) {
				$("#SCH_SYEAR").val(data.SYEAR);
				$("#SCH_TERM_GCD").val(data.TERM_GCD);
/* 				if(data.TERM_GCD == '0011' || data.TERM_GCD == '0021'){
					$("#refund01").show();						
					$("#refund02").show();						
				}else{ 
					$("#refund01").hide();						
					$("#refund02").hide();						
				} */
			}
		});
		/* 교육과정적용학년도, 이수학기수, 학사학위취득 유예여부 조회 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/atlectcancel/AtlectCancel/searchCurcStdtYear",
			reqData : param,
			success : function(data, responseData) {
				$("#curcSyear").text(data.SYEAR);
				$("#confFg").text(data.CONF_FG);
				if(data.CONF_FG == "해당없음") {
					respite = "N"
				} else {
					respite = "Y"
				}
				
				gfn_com_dataBind($(".search-box"), data);

				/* 학기가 계절학인 경우 환불일정 안내 공지 */
				if (data.TERM_GCD == "0011" || data.TERM_GCD == "0021") {
					gfn_ajax_request({
						url : "/ost/cls/atlectcancel/AtlectCancel/searchRefundSchdInfo",
						reqData : data,
						success : function(data, responseData) {
							if (data.ALL_REFUND_CLOSE == ""
									|| data.THIRD_REFUND_CLOSE == ""
									|| data.HALF_REFUND_CLOSE == ""
									|| data.REFUND_DEADLINE == "") {
								$("#RefundTable").hide();
								$("#RefundInfo").show();
								$("#RefundSchdTxt").text("수강취소 환불일정이 등록되지 않았습니다.");
							} else {
								$("#ALL_REFUND_CLOSE").text(data.ALL_REFUND_CLOSE);
								$("#THIRD_REFUND_CLOSE").text(data.THIRD_REFUND_CLOSE);
								$("#HALF_REFUND_CLOSE").text(data.HALF_REFUND_CLOSE);
								$("#REFUND_DEADLINE").text(data.REFUND_DEADLINE);
								$("#RefundTable").show();
								$("#RefundInfo").hide();
							}
						}
					});
				}
			}
		});

		/* 수강신청학점, 수강신청과목수 조회 ajax처리 */
		/* gfn_ajax_request({
			url : "/ost/cls/atlectcancel/AtlectCancel/searchLecApplyCrdtCnt",
			reqData : param,
			success : function(data, responseData) {
				crdt = data.CRDT;
				cancelCrdt = data.CANCEL_CRDT;
				applyCnt = data.APPLY_CNT;
				cancelCnt = data.CANCEL_CNT;
			}
		}); */
		// 수강취소 학사일정 조회
		fn_schdChk();
		
		selectBankList();
	}
	
	/***************************************************************************
	 * 수강취소 학사일정 조회
	 **************************************************************************/
	function fn_schdChk() {
		
		basicSyear = $("#SCH_SYEAR").val();
		basicTermGcd = $("#SCH_TERM_GCD").val();
		
		var param = gfn_com_inputdata($(".search-box"));
		param.SYSTEM_GCD = scwin.menuInfo.SYSTEM_GCD;
		param.MENU_CD = scwin.menuInfo.MENU_CD;
		
		/* 승인확인가능일자 조회 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/atlectcancel/AtlectCancel/searchApprConfDt",
			reqData : param,
			success : function(data, responseData) {
				apprConfDt = data.SCHD_START_DT;
			}
		});

		/* 수강취소 및 환불일정 학사일정 조회 ajax처리 */
		/*gfn_ajax_request({
			url : "/ost/cls/atlectcancel/AtlectCancel/searchCancelSchdChk",
			reqData : param,
			success : function(data, responseData) {
				debugger
				if (data.resultYn == "Y") {
					if ($("#SCH_TERM_GCD").val() == "0011" || $("#SCH_TERM_GCD").val() == "0021") {
						alert(data.msg, function() {fn_subjectChk()});
					} else {
						alert(data.msg);
					}
				} else {
					alert(data.msg);
					$("#btnRegularSave").prop("disabled", true);
					$("#btnSeasonSave").prop("disabled", true);
				}
			}
		});*/
	}
	
	function selectBankList(){
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/acctnoupd/selectBankList"
	          ,success: function(data, responseData){
	       	  $("#SEASON_BANK_CD").dropDownList({          
	      			  dataSource : data,
	                  dataTextField : "BANK_NM",
	                  dataValueField : "BANK_CD",
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
	
	/***************************************************************************
	 * 수강취소 대상자 조회
	 **************************************************************************/
	function fn_subjectChk() {
		var param = gfn_com_inputdata($(".search-box"));

		/* 수강취소 대상자 조회 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/atlectcancel/AtlectCancel/searchCancelSubjectChk",
			reqData : param,
			success : function(data, responseData) {
				
				 if(data.O_RSLT != "OK") {
					alert(data.O_MSG);
					$("#btnRegularSave").prop("disabled", true);
                    $("#btnSeasonSave").prop("disabled", true);
				}  else {
					$("#btnRegularSave").prop("disabled", false);
                    $("#btnSeasonSave").prop("disabled", false);
				}
			}
		});
	}
	
	function fn_searchCheck() {
		var param = gfn_com_searchData($(".search-box"));
		param.SYSTEM_GCD = scwin.menuInfo.SYSTEM_GCD;
        param.MENU_CD = scwin.menuInfo.MENU_CD;
        
        if($("#SCH_TERM_GCD").val() == '0011' || $("#SCH_TERM_GCD").val() == '0021'){
			$("#refund01").show();						
			$("#refund02").show();						
		}else{ 
			$("#refund01").hide();						
			$("#refund02").hide();						
		}
        
		/* 수강취소 및 환불일정 학사일정 조회 ajax처리 */
        gfn_ajax_request({
            url : "/ost/cls/atlectcancel/AtlectCancel/searchCancelSchdChk",
            reqData : param,
            success : function(data, responseData) {

                
                if (data.resultYn == "Y") {
                    if ($("#SCH_TERM_GCD").val() == "0011" || $("#SCH_TERM_GCD").val() == "0021") {
                        alert(data.msg, function() {fn_subjectChk()});
                        $("#btnSeasonSave").prop("disabled", false);
                    } else {
                        alert(data.msg);
                        $("#btnRegularSave").prop("disabled", false);
                    }
                	
                } else {
                    alert(data.msg);
                    $("#btnRegularSave").prop("disabled", true);
                    $("#btnSeasonSave").prop("disabled", true);
                }  
            }
        });
		
	}
	
	/***************************************************************************
	 * 조회
	 **************************************************************************/
	function fn_sch() {
		
		var rtnValue = true;
		var param = gfn_com_searchData($(".search-box"));
		
		//조회시 타대학생 환불계좌정보 초기화 
		$("#SEASON_BANK_CD").val("");
		$("#SEASON_ACCT_NO").val("");
		var uploader_target1 = $("#uploader_target1").formuploader({
			SYSTEM_GCD : "0002",  //시스템코드
			ATTACH_FILE_GCD : "9999", // 첨부파일 종류 코드 
			//ATTACH_FILE_GRP_CD : "20220101",  /* 첨부파일 그룹 코드  */
			ACCEPT_EXT : "GIF,JPG,PNG,JPEG",  // 허용확장자 ( 메뉴설정에서 들고 오거나 지정한 확장자가 없으면 기본 확장자로 사용. )
			UPLOAD_SIZE : "4mb", // 최대 파일용량 (mb) (메뉴설정에서 들고 오거나 지정한 용량 없으면 기본 20mb )
			FILE_ADD_YN : "Y",  //신규추가가능여부
			FILE_DEL_YN : "Y",   //삭제가능여부
	        FILE_DWN_YN : "Y",  //다운로드가능여부
	       	FILE_INFO_YN : "Y", /* 확장자와 제한용량 정보표시 여부*/
	       	FILE_AREA_WIDTH_PER : 70, /* 첨부파일영역의 %값 */
	       	FILE_VIEWER_YN : "Y", /* 첨부파일뷰어 표시 여부 */
	       	FILE_TAG_CONTENT_YN : "N", /* 첨부파일 대체텍스트 표시 여부 */
	       	dataBound : function(e,_target) { /* 업로드 완료후 처리 함수*/
				alert("업로드 완료",_target);
	        }
		});	
		
		var valInfo1 = [{
			"id" : "SCH_SYEAR",
			"name" : "학년도",
			"notNull" : true,
		}, {
			"id" : "SCH_TERM_GCD",
			"name" : "학기",
			"notNull" : true,
		}];
		
		rtnValue = gfn_val_validateDataMap(param, valInfo1);
		
		if (!rtnValue){
			return;
		}
		
		// 학생이 대학원이고 학기가 정규학기일때 취소신청서 출력버튼 제어
		if(scwin.loginUser.collGradGcd == "0002" || scwin.loginUser.collGradGcd == "0001") {
			if($("#SCH_TERM_GCD").val() == "0010" || $("#SCH_TERM_GCD").val() == "0020") {
				$("#btnRegularPrint").show();
			} else {
				$("#btnRegularPrint").hide();
			}
		}
	    
		fn_searchCheck();
		
		/* 수강신청 학생 구분코드 조회 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/atlectcancel/AtlectCancel/selectStdtGcd",
			reqData : param,
			success : function(data, responseData) {
				if(data != null) {
					stdtGcd = data.STDT_GCD;
					if(stdtGcd == '0003') {
						$("#bankNm").show();
						$("#acctNo").show();
						$("#bankFile").show();
					} else {
						$("#bankNm").hide();
						$("#acctNo").hide();
						$("#bankFile").hide();
					}
				} else {
					$("#RefundCompleteTable").hide(); // 계절학기 환불완료 그리드 컴포넌트
					$("#SeasonCancel").hide(); // 계절학기 신청취소 컴포넌트
					$("#RegularCancel").hide(); // 정규학기 신청취소 컴포넌트
				}
			}
		});

		/* 수강신청과목 선택 조회 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/atlectcancel/AtlectCancel/searchCancelSubjectChkList",
			reqData : param,
			success : function(data, responseData) {
				
				subjectTableCnt = responseData.totalCnt;
				$("#resultTbody_Choice").listView(
					{
						dataSource : data,
						dataBound : function(e) {
							totalCnt = responseData.pageInfo.totCnt;
							currentData = data;
						},
						template : $("#resultTemplateChoice"),
						totalCnt : responseData.totalCnt,
						paging : {
							pageInfo : responseData.pageInfo,
							reqData : responseData.reqData,
							func : "fn_sch"
						},
						excel : null
					});
			}
		});
		
		/* 수강취소신청과목 조회 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/atlectcancel/AtlectCancel/searchCancelSubjectApplyList",
			reqData : param,
			success : function(data, responseData) {
				
				$("#resultTbody_Cancel").listView(
					{
						dataSource : data,
						dataBound : function(e) {
							totalCnt = responseData.totCnt;
							currentData = data;
						},
						template : $("#resultTemplateCancel"),
						totalCnt : responseData.totalCnt,
						paging : null,
						emptyComment : '해당 년도와 학기에 수강취소 신청한 과목이 존재하지 않습니다.',
						excel : null
					});
			}
		});
		
		/* 수강취소 및 환불처리 진행상황 조회 ajax처리 */
		gfn_ajax_request({
			url : "/ost/cls/atlectcancel/AtlectCancel/searchCancelRefundProgressList",
			reqData : param,
			success : function(data, responseData) {
				$("#resultTbody_Refund").listView(
					{
						dataSource : data,
						dataBound : function(e) {
							totalCnt = responseData.totCnt;
							currentData = data;
						},
						template : $("#resultTemplateRefund"),
						totalCnt : responseData.totalCnt,
						paging : null,
						emptyComment : '해당 년도와 학기에 환불처리가 진행중인 과목이 존재하지 않습니다.',
						excel : null
					});
			}
		});
		
		if($("#SCH_TERM_GCD").val() == '0011' || $("#SCH_TERM_GCD").val() == '0021') {
			$("#RegularCancel").hide(); // 정규학기 신청취소 컴포넌트
			$("#RefundCompleteTable").show(); // 계절학기 환불완료 그리드 컴포넌트
			$("#SeasonCancel").show(); // 계절학기 신청취소 컴포넌트
			
			/* 수강취소 및 환불처리 진행상황 조회 ajax처리 */
			gfn_ajax_request({
				url : "/ost/cls/atlectcancel/AtlectCancel/searchCancelRefundCompleteList",
				reqData : param,
				success : function(data, responseData) {
					$("#resultTbody_Complete").listView(
						{
							dataSource : data,
							dataBound : function(e) {
								totalCnt = responseData.totCnt;
								currentData = data;
							},
							template : $("#resultTemplateComplete"),
							totalCnt : responseData.totalCnt,
							paging : null,
							emptyComment : '해당 년도와 학기에 환불처리가 완료된 과목이 존재하지 않습니다.',
							excel : null
						});
				}
			});
		} else {
			$("#RefundCompleteTable").hide(); // 계절학기 환불완료 그리드 컴포넌트
			$("#SeasonCancel").hide(); // 계절학기 신청취소 컴포넌트
			$("#RegularCancel").show(); // 정규학기 신청취소 컴포넌트
		}
	}
	
	/***************************************************************************
	 * 정규학기 수강취소 버튼 저장
	 **************************************************************************/
	function fn_RegularSave() {
		var rtnValue = true;
		var param = gfn_com_searchData($("#RegularCancel"));
		var valInfo1 = [{
			"id" : "REGULAR_STDT_TEL",
			"name" : "연락처",
			"notNull" : true,
		}, {
			"id" : "CANCEL_REASON_COMMENT",
			"name" : "취소신청 사유",
			"notNull" : true,
		}];
		
		rtnValue = gfn_val_validateDataMap(param, valInfo1);
		if (!rtnValue){
			return;
		}
		confirm(gva_SAVE_CONFIRM_MSG,function(_flag){
    		if(_flag) {
    			var param1 = new Array();

    			// 폼값을 list에 담아줌
    			
    			for (var i = 0; i<subjectTableCnt; i++) {
    				var map = gfn_com_inputdata($("#subject-choice"+(i+1)));
    				if(Object.keys(map).includes("CHK"+(i+1))) {
    					map.COLL_GRAD_GCD = scwin.loginUser.collGradGcd;
    					map.RESPITE = respite;
        				map.CANCEL_REASON_COMMENT = param.CANCEL_REASON_COMMENT;
        				map.STDT_TEL = $("#REGULAR_STDT_TEL").val();
        				param1.push(map);	
    				}
    			}
    			if(param == "") {
    				alert("선택된 항목이 없습니다.");
    			} else {
    				/*정규학기 수강취소신청 저장 전 체크 ajax처리 */
    				gfn_ajax_request({
    					url : "/ost/cls/atlectcancel/AtlectCancel/selectRegularSubjectCancelChk",
    					reqData : param1,
    					success : function(data, responseData) {
    						if(data.O_RSLT == "E") {
    							alert(data.O_MSG);
    							return;
    						} else {
    							/*정규학기 수강취소신청 저장 ajax처리 */
    		    				gfn_ajax_request({
    		    					url : "/ost/cls/atlectcancel/AtlectCancel/saveRegularSubjectCancel",
    		    					reqData : param1,
    		    					success : function(data, responseData) {
    		    						if(data.O_RSLT == "I") {
    		    							if (data.STDT_GCD == '0002') {
    		    								alert("수강취소원을 출력하여 담당교수 및 학과장(전공주임) 날인하여 소속학과로 제출, 학생지원시스템(수엄-수강신청 및 확인-수강확인)에서 " +apprConfDt+ "이후 반드시 확인 해주세요.", function() {fn_sch()});
    		    							} else {
    		    								alert("★필수체크★ [수강취소신청과목] 목록에 없으면 취소되지 않은 경우 입니다. 반드시 취소되었는지 확인해주세요. 수강취소내역을 학생지원시스템(수업-수강신청 및 확인-수강확인)에서 " +apprConfDt+ "이후 반드시 확인 해주세요.", function() {fn_sch()});
    		    							}
    		    						} else {
    		    							alert(data.O_MSG);
    		    							return;
    		    						}
    		    					}
    		    				});
    						}
    					}
    				});
    			}
    		}
    	});
	}
	
	/***************************************************************************
	 * 정규학기 대학원 수강교과목 취소 신청서 출력
	 **************************************************************************/
	function fn_openReport(isPop) {
		/***************************출력 전 확인  ***************/
		var param1 = {};
		param1.SCH_SYEAR 					     = $("#SCH_SYEAR").val();
		param1.SCH_TERM_GCD                  = $("#SCH_TERM_GCD").val();
		param1.SCH_STDT_NO             		 = scwin.loginUser.userId; 
		
		gfn_ajax_request({ 
			url : "/ost/cls/atlectcancel/AtlectCancel/reportPreChk",
			reqData : param1,
			success : function(data, responseData) {
				if(data.length > 0 ){
					if(data[0].O_RSLT == 'N'){
						alert(data[0].O_MSG);
						return;
					}else if(data[0].O_RSLT == 'Y'){
						var options = {};
	                    
				        options.rptName = "/ses/cls/atlectcancel/AtlectCancel_001.crf";
				   
				        //파라메터 설정
				        var objParam = {};
				        objParam.SCH_SYEAR 					     = $("#SCH_SYEAR").val();
				        objParam.SCH_TERM_GCD                  = $("#SCH_TERM_GCD").val();
				        objParam.SCH_STDT_NO             		 = scwin.loginUser.userId; 
				        objParam.bind = [{
				            db : "OST",
				            proc : "OST_수강취소_정규학기_대학원취소신청서_출력",
				            params : [
				            	 $("#SCH_SYEAR").val()
				                ,$("#SCH_TERM_GCD").val()
				                ,scwin.loginUser.userId
							]
				    		}]
				        
				        
				        console.log(objParam);
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
				        if (isPop) {
				        	fn_openReportPopup(options);
				        } 
						
					}
				}
			}	
		});
		/******************************************/
	}
	
	/***************************************************************************
	 * 정규학기 대학원 수강교과목 취소 신청서 출력
	 **************************************************************************/
	function fn_openReportPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 900,
            height : 1200,
            target : null,            
            title : "수강교과목 취소 신청서(대학원)",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
	
	/***************************************************************************
	 * 정규학기 수강취소신청 삭제 버튼
	 **************************************************************************/
	function fn_cancelApplyDelete(syear, termGcd, stdtNo, subjNo, classNo) {
		confirm("선택한 교과목 수강취소건을 삭제 하시겠습니까?",function(_flag){
    		if(_flag) {
    			var param = {
    					"SYEAR" : syear,
    					"TERM_GCD" : termGcd,
    					"SUBJ_NO" : subjNo,
    					"CLASS_NO" : classNo
    			};
    			
    			if(termGcd == "0010" || termGcd == "0020") {
    				/*정규학기 수강취소신청 저장 전 체크 ajax처리 */
      				gfn_ajax_request({
      					url : "/ost/cls/atlectcancel/AtlectCancel/saveRegularCancelApplyDelete",
      					reqData : param,
      					success : function(data, responseData) {
      						if(data.O_RSLT == "I") {
      							alert(data.O_MSG,function(){fn_sch()});
      						} else {
      							alert(data.O_MSG);
      						}
      					}
      				});
    			} else {
    				/*계절학기 수강취소신청 삭제 전 대상자 체크 ajax처리 */
      				/*gfn_ajax_request({
      					url : "/ost/cls/atlectcancel/AtlectCancel/searchSeasonCancelSubjectDeleteChk",
      					reqData : search,
      					success : function(data, responseData) {
      						
      						if(data.O_RSLT == "W") {
      							alert(data.O_MSG);
      							return;
      						} else {
      							*/
      							/*계절학기 수강취소신청 저장 전 체크 ajax처리 */
      		      				gfn_ajax_request({
      		      					url : "/ost/cls/atlectcancel/AtlectCancel/saveSeasonCancelApplyDelete",
      		      					reqData : param,
      		      					success : function(data, responseData) {
      		      						if(data.O_RSLT == "I") {
      		      							alert(data.O_MSG,function(){fn_sch()});
      		      						} else {
      		      							alert(data.O_MSG);
      		      						}
      		      					}
      		      				});
      						/* }
      					}
      				}); */
    			}
    		}
    	});
	}
	
	/***************************************************************************
	 * 계절학기 수강취소신청 버튼
	 **************************************************************************/
	function fn_SeasonSave() {
		
		var fileGrpCd = $("input[name=attach_file_grp_cd]");
		
		if(stdtGcd == "0003") {
			if(fileGrpCd.length == 0) {
				alert("첨부파일을 등록해 주세요.");
				return;
			}
		}
		
		var rtnValue = true;
		var param = gfn_com_searchData($("#SeasonCancel"));
		var valInfo1 = [{
			"id" : "SEASON_STDT_TEL",
			"name" : "연락처",
			"notNull" : true,
		}];

		var valInfo2 = [{
			"id" : "SEASON_STDT_TEL",
			"name" : "연락처",
			"notNull" : true,
		},{
			"id" : "SEASON_BANK_CD",
			"name" : "은행명",
			"notNull" : true,
		},{
			"id" : "SEASON_ACCT_NO",
			"name" : "환불계좌번호",
			"notNull" : true,
		}];
		
		if(stdtGcd == "0003") {
			rtnValue = gfn_val_validateDataMap(param, valInfo2);
		} else {
			rtnValue = gfn_val_validateDataMap(param, valInfo1);
		}

		if (!rtnValue){
			return;
		}
		
		confirm("선택한 교과목을 수강취소(환불) 하시겠습니까?",function(_flag){
    		if(_flag) {
    			var param = new Array();
    			var search = gfn_com_inputdata($(".search-box"));

    			// 폼값을 list에 담아줌
    			for (var i = 0; i<subjectTableCnt; i++) {
    				var map = gfn_com_inputdata($("#subject-choice"+(i+1)));
    				if(Object.keys(map).includes("CHK"+(i+1))) {
    					map.COLL_GRAD_GCD = scwin.loginUser.collGradGcd;
    					map.RESPITE = respite;
        				map.STDT_TEL = $("#SEASON_STDT_TEL").val();
        				if(stdtGcd == "0003") {
        					map.BANK_CD = $("#SEASON_BANK_CD").val();
            				map.ACCT_NO = $("#SEASON_ACCT_NO").val();
            				map.ATTACH_FILE_GRP_CD = $("input[name=attach_file_grp_cd]").val();
            				map.ACCT_NM = scwin.loginUser.nm;
        				}
        				map.SYEAR = search.SCH_SYEAR;
        				map.TERM_GCD = search.SCH_TERM_GCD;
        				map.STDT_GCD = stdtGcd;
        				param.push(map);	
        				
        				
    				}
    			}
    			
    			
  				/*계절학기 수강취소신청 저장 전 대상자 체크 ajax처리 */
  				/*gfn_ajax_request({
  					url : "/ost/cls/atlectcancel/AtlectCancel/searchSeasonCancelSubjectChk",
  					reqData : search,
  					success : function(data, responseData) {
  						debugger
  						if(data.O_RSLT == "W") {
  							alert(data.O_MSG);
  							return;
  						} else {*/

						/*계절학기 수강취소신청 저장 ajax처리 */
		  				gfn_ajax_request({
		  					url : "/ost/cls/atlectcancel/AtlectCancel/saveSeasonSubjectCancel",
		  					reqData : param,
		  					success : function(data, responseData) {
		  						if(data.O_RSLT == "W") {
		  							alert(data.O_MSG);
		  							return;
		  						} else {
		  							alert("수강취소신청이 완료되었습니다.",function(){fn_sch() 
		  								
		  								
		  								
		  							});
		  						}
		  					}
		  				});
 						//}
  				//	}
  				//});
    		}
    	});
	}
</script>