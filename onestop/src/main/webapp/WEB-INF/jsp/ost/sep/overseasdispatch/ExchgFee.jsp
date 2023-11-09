<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title" id="titleHeader"></h2>
				</div>
				<div class="header-item"></div>
			</header>
			<!-- 지원서 -->
			<div class="sec-body" id="info">
				<!-- 메시지 박스 -->
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li>
									<span class="dfn" data-lang>지원기간 : </span>
								    <span class="dfn text-primary" data-lang id="schdDate"></span>
							    </li>
								<li>
									<span class="dfn" data-lang>지원서류제출기간 : </span>
								    <span class="dfn text-primary" data-lang id="submitDate"></span></li>
								</li>
								<li><span class="dfn" data-lang>지원서류 제출장소 : 소속 단과대학 행정실</span></li>
								<li><span class="dfn" data-lang>문의 : outbound@pusan.ac.kr</span></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->

				<!-- 개인정보 영역 -->
				<div class="sec-body">
					<section class="sec-2">
						<div class="stdt-info">
							<div class="search-box">
								<input type="text" id="rowStatus" class="form-control" style="display: none;" /> 
								<input type="text" id="SYEAR" class="form-control" style="display: none;" /> 
								<input type="text" id="TERM_GCD" class="form-control" style="display: none;" /> 
								<input type="text" id="CHASU_NO" class="form-control" style="display: none;" /> 
								<input type="text" id="STDT_NO" class="form-control" style="display: none;" /> 
								<input type="text" id="CMPL_TERM_CNT" class="form-control" style="display: none;" /> 
								<input type="text" id="EXCHG_GCD" class="form-control" style="display: none;" /> 
								<input type="text" id="EXCHG_DETAIL_GCD" class="form-control" style="display: none;" />
								<input type="text" id="LANG_GCD" class="form-control" style="display: none;" value="0001"/> 
							</div>
							<!-- <div class="card-header" id="heading1" style="background-color: #d3d3d3;">
								<label class="text-left dfn" style="font-size: 18px;"><strong>개인정보(*필수항목)</strong></label>
							</div> -->
							<section class="sec-3" style="margin-bottom:60px;">
								<header>
									<h4 class="sec-title">개인정보(*필수항목)</h4>
								</header>
								<div class="sec-body">
									<div class="b-table-box flex-col-2" role="table" aria-label="개인정보">
										<div class="b-row-box" role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label data-lang>이름</label>
												</div>
												<div class="b-con-box" role="cell">
													<div id="STDT_KOR_NM"></div>
												</div>
											</div>
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label data-lang>학번</label>
												</div>
												<div class="b-con-box" role="cell">
													<div id="STDT_NO_LAB"></div>
												</div>
											</div>
										</div>
										<div class="b-row-box" role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label data-lang>소속대학</label>
												</div>
												<div class="b-con-box" role="cell">
													<div id="COLL_CD"></div>
												</div>
											</div>
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label data-lang>소속학과</label>
												</div>
												<div class="b-con-box" role="cell">
													<div id="DEPT_CD"></div>
												</div>
											</div>
										</div>
										<div class="b-row-box" role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label data-lang>성별</label>
												</div>
												<div class="b-con-box" role="cell">
													<div id="GENDER_GCD"></div>
												</div>
											</div>
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label data-lang>생년월일</label>
												</div>
												<div class="b-con-box" role="cell">
													<div id="BIRTH_DATE"></div>
												</div>
											</div>
										</div>
										<div class="b-row-box" role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label class="req" for="STDT_CELLULAR_NO" data-lang>휴대전화</label>
												</div>
												<div class="b-con-box" role="cell">
													<input type="text" id="STDT_CELLULAR_NO" class="form-control" />
												</div>
											</div>
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label class="req" for="STDT_EMAIL" data-lang>이메일</label>
												</div>
												<div class="b-con-box" role="cell">
													<input type="text" id="STDT_EMAIL" class="form-control" />
												</div>
											</div>
										</div>
										<div class="b-row-box " role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label class="req" for="EMGCY_TEL_NO" data-lang>비상연락처</label>
												</div>
												<div class="b-con-box" role="cell">
													<input type="text" id="EMGCY_TEL_NO" class="form-control" />
												</div>
											</div>
				
											<div class="b-row-item">
												<div class="b-con-box" role="cell">
													<div class="text-primary">* 중요한 공지사항을 누락하는 일이 없도록, 이메일, 휴대폰번호는 최신으로 업데이트해주시기 바랍니다.</div>
												</div>
											</div>
				
										</div>
										<div class="b-row-box " role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label for="CMPL_TERM_CNT_LAB" data-lang>이수학기</label>
												</div>
												<div class="b-con-box">
													<div id="CMPL_TERM_CNT_LAB"></div>
												</div>
											</div>
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label for="RANK" data-lang>등수</label>
												</div>
												<div class="b-con-box">
													<div id="RANK"></div>
												</div>
											</div>
										</div>
										<div class="b-row-box " role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label for="CRITERIA_INWON" data-lang>석차기준인원</label>
												</div>
												<div class="b-con-box">
													<div id="CRITERIA_INWON"></div>
												</div>
											</div>
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label for="HJ_STA_GCD" data-lang>학적상태</label>
												</div>
												<div class="b-con-box">
													<div id="HJ_STA_GCD"></div>
												</div>
											</div>
										</div>
										<div class="b-row-box " role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label for="EXUNIV_CMPL_TERM_CNT" data-lang>타대이수학점</label>
												</div>
												<div class="b-con-box">
													<div id="EXUNIV_CMPL_TERM_CNT"></div>
												</div>
											</div>
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label for="EXUNIV_CMPL_TERM_PO_CNT" data-lang>타대이수<br>가능학점</label>
												</div>
												<div class="b-con-box">
													<div id="EXUNIV_CMPL_TERM_PO_CNT"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- /END 개인정보 영역 -->

							<!-- 해외파견 프로그램 참가경험 테이블 START  -->
							<!-- <div class="card-header" id="heading1" style="background-color: #d3d3d3;">
								<label class="text-left dfn" style="font-size: 18px;" data-lang><strong>해외파견 프로그램 참가경험</strong></label>
							</div> -->
							<section class="sec-3" style="margin-bottom:60px;">
								<header>
									<h4 class="sec-title">해외파견 프로그램 참가경험</h4>
								</header>
								<div class="b-table-box flex-col-1" role="table" aria-label="조회">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
													<label data-lang>참가경험유무</label>
												</div>
											<div class="b-con-box" role="cell">
											    <div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="RGROUP" id="R1" value="Y" disabled=true> <label class="form-check-label" for="R1">Yes</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="RGROUP" id="R2" value="N" disabled=true> <label class="form-check-label" for="R2">No</label>
												</div>
												<span class="dfn" data-lang>※ 우리 대학(국제협력실) 주관 학점인정 프로그램에 한함. (예) 어학연수, 계절학기, 교환학생, 학과단위사업 </span>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- 해외파견 프로그램 참가경험 테이블 END  -->
		
							<!-- 해외파견 프로그램 참가내역 테이블 START  -->
							<!-- <div class="card-header" id="heading1" style="background-color:#d3d3d3;">
								<label class="text-left dfn" style="font-size:18px;"><strong>해외파견 프로그램 참가내역</strong></label>							
							</div>	 -->
							<section class="sec-3" style="margin-bottom:60px;">
								<header>
									<h4 class="sec-title">해외파견 프로그램 참가내역</h4>
								</header>
								<!-- 테이블 -->                
								<div class="table-box">
									<div class="table-body">                    
										<table class="table" data-toggle="table" >
											<caption>해외파견 프로그램 참가내역</caption>
											<colgroup>
												<col style="min-width: 150px;">
												<col style="min-width: 100px;">
												<col style="min-width: 250px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">파견대학명</th>
													<th scope="col">교류기간</th>
													<th scope="col">비고</th>
												</tr> 
											</thead>
											<tbody id="resultTbody_Exchg">
											</tbody>
										</table>
									</div>					
								</div>
							</section>
							<!-- 해외파견 프로그램 참가경험 테이블 END  -->
		
							<!-- 원어강의 참가 수 START  -->
							<!-- <div class="card-header" id="heading1" style="background-color: #d3d3d3;">
								<div class="input-group">
									<label class="text-left dfn" style="font-size: 18px;" data-lang><strong>원어강의 참가 수</strong></label>
									<div class="input-group-append" style="margin-left: 10px;">
										<input type="number" id="NATIVE_LANG_LECT_CNT" class="form-control" style="width: 30%;" readOnly=true value="0"/> 
										<label class="" style="font-size: 15px; margin-left: 10px;" data-lang>* 우리대학에서 개설한 원어강의만 인정</label>
									</div>
								</div>
							</div> -->
							<section class="sec-3" style="margin-bottom:60px;">
								<header>
									<div class="input-group-append" style="">
										<h4 class="sec-title">원어강의 참가 수</h4>
										<input type="number" id="NATIVE_LANG_LECT_CNT" class="form-control" style="width: 80px; margin-left: 10px" readOnly=true value="0" title="원어강의 참가 수"/> 
										<span class="dfn" data-lang style="font-size: 15px; margin-left:10px; margin-top:7px;">※ 우리대학에서 개설한 원어강의만 인정</span>
									</div>
								</header>
								<div class="table-box table-list">
									<div class="table-body">
										<table class="table table-hover">
											<caption>원어강의 참가내역</caption>
											<colgroup>
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
												<col style="min-width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">학년도</th>
													<th scope="col">학기</th>
													<th scope="col">교과목명</th>
													<th scope="col">외국어강의구분</th>
													<th scope="col">성적등급</th>
												</tr>
											</thead>
											<tbody id="resultTbodyNative">
											</tbody>
										</table>
									</div>
								</div>
								<ul class="list list-style-1">
									<li><span class="dfn" data-lang> 성적표에 원어강의 이수표시(E,J,C 등)가 없는 과목은 "과목명", "강의교수", "개설학과,", "이수학기" 를 기재하여 메일(outbound@pusan.ac.kr)로 송부 </span></li>
								</ul>
							</section>
							<!-- 원어강의 참가 수 END  -->
							
							<!-- 정보입력 START  -->
							<!-- <div class="card-header" id="heading1" style="background-color: #d3d3d3;">
								<label class="text-left dfn" style="font-size: 18px;" data-lang><strong>정보입력</strong></label>
							</div> -->
							<section class="sec-3" style="margin-bottom:60px;">
								<header>
									<h4 class="sec-title">정보입력</h4>
								</header>
								<div class="b-table-box flex-col-4" role="table" aria-label="조회" style="margin-bottom:5px;">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="FOREIGN_LANGUAGE_1_GCD" data-lang>1지망 지원언어</label>
											</div>
											<div class="b-con-box" role="cell">
												<select id="FOREIGN_LANGUAGE_1_GCD" class="form-control" auto-bind="OFFICIAL_FOREIGN_LANGUAGE_1_GCD" onchange ="fn_onchange1()"></select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="OFFICIAL_FOREIGN_LANGUAGE_1_GCD" data-lang>공인외국어명1</label>
											</div>
											<div class="b-con-box" role="cell">
												<select id="OFFICIAL_FOREIGN_LANGUAGE_1_GCD" class="form-control" ></select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_SCORE" data-lang>점수1</label>
											</div>
											<div class="b-con-box" role="cell">
												<input type="number" id="ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_SCORE" class="form-control" value="0" min="0" max="9999"/>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_GRADE_GCD" data-lang>등급1</label>
											</div>
											<div class="b-con-box" role="cell">
												<select id="ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_GRADE_GCD" class="form-control"></select>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="FOREIGN_LANGUAGE_2_GCD" data-lang>2지망 지원언어</label>
											</div>
											<div class="b-con-box" role="cell">
												<select id="FOREIGN_LANGUAGE_2_GCD" class="form-control" auto-bind="OFFICIAL_FOREIGN_LANGUAGE_2_GCD" onchange ="fn_onchange2()"></select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="OFFICIAL_FOREIGN_LANGUAGE_2_GCD" data-lang>공인외국어명2</label>
											</div>
											<div class="b-con-box" role="cell">
												<select id="OFFICIAL_FOREIGN_LANGUAGE_2_GCD" class="form-control"></select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_SCORE" data-lang>점수2</label>
											</div>
											<div class="b-con-box" role="cell">
												<input type="number" id="ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_SCORE" class="form-control" value="0" min="0" max="9999"/>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_GRADE_GCD" data-lang>등급2</label>
											</div>
											<div class="b-con-box" role="cell">
												<select id="ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_GRADE_GCD" class="form-control"></select>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="FOREIGN_LANGUAGE_3_GCD" data-lang>3지망 지원언어</label>
											</div>
											<div class="b-con-box" role="cell">
												<select id="FOREIGN_LANGUAGE_3_GCD" class="form-control" auto-bind="OFFICIAL_FOREIGN_LANGUAGE_3_GCD" onchange ="fn_onchange3()"></select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="OFFICIAL_FOREIGN_LANGUAGE_3_GCD" data-lang>공인외국어명3</label>
											</div>
											<div class="b-con-box" role="cell">
												<select id="OFFICIAL_FOREIGN_LANGUAGE_3_GCD" class="form-control"></select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_SCORE" data-lang>점수3</label>
											</div>
											<div class="b-con-box" role="cell">
												<input type="number" id="ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_SCORE" class="form-control" value="0" min="0" max="9999"/>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_GRADE_GCD" data-lang>등급3</label>
											</div>
											<div class="b-con-box" role="cell">
												<select id="ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_GRADE_GCD" class="form-control"></select>
											</div>
										</div>
									</div>
								</div>
								<ul class="list list-style-1">
									<li data-lang><span class="dfn"> 점수는 숫자만 입력하세요 (예 : 900, 6.5) </span></li>
									<li data-lang><span class="dfn"> 영어는 점수만 기재하고, 나머지는 급수와 점수 모두 입력하세요. </span></li>									
								</ul>
							</section>
							<!-- 정보입력 END  -->
							
							<!-- 교과외 활동 START  -->
							<!-- <div class="card-header" id="heading1" style="background-color: #d3d3d3;">
								<label class="text-left dfn" style="font-size: 18px;" data-lang><strong>교과외 활동</strong></label>
							</div> -->
							<section class="sec-3" style="margin-bottom:60px;">
								<header>
									<h4 class="sec-title">교과외 활동</h4>
								</header>
								<div class="b-table-box flex-col-1" role="table" aria-label="조회" style="margin-bottom:5px;">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>활동 구분</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="custom-control custom-checkbox custom-control-inline">
													<input type="checkbox" class="custom-control-input" name="EXCHG_STDT_FRIEND_FG" id="EXCHG_STDT_FRIEND_FG" value="Y"> <label for="EXCHG_STDT_FRIEND_FG" class="custom-control-label"><strong>교환학생Buddy</strong></label>
												</div>
												<div class="custom-control custom-checkbox custom-control-inline">
													<input type="checkbox" class="custom-control-input" name="INVITE_PROF_HELP_FG" id="INVITE_PROF_HELP_FG" value="Y"> <label for="INVITE_PROF_HELP_FG" class="custom-control-label"><strong>한국어 홍보대사</strong></label>
												</div>
												<div class="custom-control custom-checkbox custom-control-inline">
													<input type="checkbox" class="custom-control-input" name="LANG_TRADE_HELP_FG" id="LANG_TRADE_HELP_FG" value="Y"> <label for="LANG_TRADE_HELP_FG" class="custom-control-label"><strong>언어교환도우미</strong></label>
												</div>
												<div class="custom-control custom-checkbox custom-control-inline">
													<input type="checkbox" class="custom-control-input" name="PNU_TOEFL_ATLECT_FG" id="PNU_TOEFL_ATLECT_FG" value="Y"> <label for="PNU_TOEFL_ATLECT_FG" class="custom-control-label"><strong>iPNU토플특강</strong></label>
												</div>
											</div>
										</div>
									</div>
									<div class="b-row-box " role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label for="SERVE_ACTIV_PTCPT_TIMESNO" data-lang>교과외 활동 수</label>
											</div>
											<div class="b-con-box" role="cell">
												<input type="number" id="SERVE_ACTIV_PTCPT_TIMESNO" class="form-control" style="width: 60px;" value="0" min="0" max="999"/> 
												<span class="dfn" data-lang style="font-size: 15px; margin-left:15px;">※ 참가 확인서를 제출해야 인정가능</span>
											</div>
										</div>
									</div>
								</div>
								<div class="info-text info-text-style-2">
									<b>교과외 활동 종료 후 참가확인서를 발급받은 경우에 한함</b>
								</div>
							</section>
							<!-- 교과외 활동 END  -->
							
							<!-- 희망지원대학 START  -->
							<!-- <div class="card-header" id="heading1" style="background-color: #d3d3d3;">
								<label class="text-left dfn" style="font-size: 18px;" data-lang><strong>희망지원대학</strong></label>
							</div> -->
							<section class="sec-3">
								<header>
									<h4 class="sec-title">희망지원대학</h4>
								</header>
								<div class="b-table-box flex-col-1" role="table" aria-label="조회">
									<div class="b-row-box " role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>※1지망</label>
											</div>
											<div class="input-group">
												<div class="b-con-box" role="cell">
													<div class="form-check form-check-inline">
										                  <input class="form-check-input" type="radio" name="APPLY_1_EXCHG_DETAIL_GCD" id="APPLY_1_EXCHG_DETAIL_GCD1" value="0001" checked onclick="fn_searchCollList('1','')">
										                  <label class="form-check-label" for="APPLY_1_EXCHG_DETAIL_GCD1">교환</label>
										            </div>
										            <div class="form-check form-check-inline">
										                  <input class="form-check-input" type="radio" name="APPLY_1_EXCHG_DETAIL_GCD" id="APPLY_1_EXCHG_DETAIL_GCD2" value="0002" onclick="fn_searchCollList('1','')">
										                  <label class="form-check-label" for="APPLY_1_EXCHG_DETAIL_GCD2">교비</label>
										            </div>
										            <div class="input-group-append" style="margin-left: 10px;">
														<select id="APPLY_1_EXUNIV_CD" class="form-control" title="1지망선택"></select>
													</div>
												</div>
											</div>
											<!-- 지원가능대학 전달 param -->
											<div class="search-coll-box-01">
												<input type="text" id="SYEAR_01" class="form-control" style="display: none;" /> 
												<input type="text" id="TERM_GCD_01" class="form-control" style="display: none;" /> 
												<input type="text" id="EXCHG_DETAIL_GCD_01" class="form-control" style="display: none;" /> 
												<input type="text" id="LANG_GCD_01" class="form-control" style="display: none;" /> 
												<input type="text" id="DEG_COURSE_GCD_01" class="form-control" style="display: none;" /> 
												<input type="text" id="CMPL_TERM_CNT_01" class="form-control" style="display: none;" /> 
												<input type="text" id="CHASU_NO_01" class="form-control" style="display: none;" /> 
											</div>
											<!-- 지원가능대학 전달 param END -->
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>※2지망</label>
											</div>
											<div class="input-group">
												<div class="b-con-box" role="cell">
													<div class="form-check form-check-inline">
										                  <input class="form-check-input" type="radio" name="APPLY_2_EXCHG_DETAIL_GCD" id="APPLY_2_EXCHG_DETAIL_GCD1" value="0001" checked onclick="fn_searchCollList('2','')">
										                  <label class="form-check-label" for="APPLY_2_EXCHG_DETAIL_GCD1">교환</label>
										            </div>
										            <div class="form-check form-check-inline">
										                  <input class="form-check-input" type="radio" name="APPLY_2_EXCHG_DETAIL_GCD" id="APPLY_2_EXCHG_DETAIL_GCD2" value="0002" onclick="fn_searchCollList('2','')">
										                  <label class="form-check-label" for="APPLY_2_EXCHG_DETAIL_GCD2">교비</label>
										            </div>
										            <div class="input-group-append" style="margin-left: 10px;">
										            	<select id="APPLY_2_EXUNIV_CD" class="form-control" style="" title="2지망선택"></select>
										            </div>
												</div>
											</div>
											<!-- 지원가능대학 전달 param -->
											<div class="search-coll-box-02">
												<input type="text" id="SYEAR_02" class="form-control" style="display: none;" /> 
												<input type="text" id="TERM_GCD_02" class="form-control" style="display: none;" /> 
												<input type="text" id="EXCHG_DETAIL_GCD_02" class="form-control" style="display: none;" /> 
												<input type="text" id="LANG_GCD_02" class="form-control" style="display: none;" /> 
												<input type="text" id="DEG_COURSE_GCD_02" class="form-control" style="display: none;" /> 
												<input type="text" id="CMPL_TERM_CNT_02" class="form-control" style="display: none;" /> 
												<input type="text" id="CHASU_NO_02" class="form-control" style="display: none;" /> 
											</div>
											<!-- 지원가능대학 전달 param END -->
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>※3지망</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="input-group">
													<div class="form-check form-check-inline">
										                  <input class="form-check-input" type="radio" name="APPLY_3_EXCHG_DETAIL_GCD" id="APPLY_3_EXCHG_DETAIL_GCD1" value="0001" checked onclick="fn_searchCollList('3','')">
										                  <label class="form-check-label" for="APPLY_3_EXCHG_DETAIL_GCD1">교환</label>
										            </div>
										            <div class="form-check form-check-inline">
										                  <input class="form-check-input" type="radio" name="APPLY_3_EXCHG_DETAIL_GCD" id="APPLY_3_EXCHG_DETAIL_GCD2" value="0002" onclick="fn_searchCollList('3','')">
										                  <label class="form-check-label" for="APPLY_3_EXCHG_DETAIL_GCD2">교비</label>
										            </div>
										            <div class="input-group-append" style="margin-left: 10px;">
										            	<select id="APPLY_3_EXUNIV_CD" class="form-control" style="" title="3지망선택"></select>
										            </div>
												</div>
												<!-- 지원가능대학 전달 param -->
												<div class="search-coll-box-03">
													<input type="text" id="SYEAR_03" class="form-control" style="display: none;" /> 
													<input type="text" id="TERM_GCD_03" class="form-control" style="display: none;" /> 
													<input type="text" id="EXCHG_DETAIL_GCD_03" class="form-control" style="display: none;" /> 
													<input type="text" id="LANG_GCD_03" class="form-control" style="display: none;" /> 
													<input type="text" id="DEG_COURSE_GCD_03" class="form-control" style="display: none;" /> 
													<input type="text" id="CMPL_TERM_CNT_03" class="form-control" style="display: none;" /> 
													<input type="text" id="CHASU_NO_03" class="form-control" style="display: none;" /> 
												</div>
												<!-- 지원가능대학 전달 param END -->
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- 희망지원대학 END  -->
							<!-- 여권정보 START  -->
							<div class="b-table-box flex-col-3" role="table" aria-label="조회" style="margin-bottom:5px;">
								<div class="b-row-box " role="row">
									<div class="b-row-item merge-3">
										<div class="b-title-box" role="rowheader">
											<label data-lang>여권소지여부</label>
										</div>
										<div class="b-con-box" role="cell">
											<div class="form-check form-check-inline">
								                  <input class="form-check-input" type="radio" name="passPort" id="passPort1" value="Y" onclick="fn_passPortYnChk()">
								                  <label class="form-check-label" for="passPort1">Y</label>
								            </div>
								            <div class="form-check form-check-inline">
								                  <input class="form-check-input" type="radio" name="passPort" id="passPort2" value="N" onclick="fn_passPortYnChk()">
								                  <label class="form-check-label" for="passPort2">N</label>
								            </div>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label for="PASSPORT_ENG_NM" data-lang>영문이름(여권)</label>
										</div>
										<div class="b-con-box" role="cell">
											<input class="form-control" type="text" id="PASSPORT_ENG_NM">
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label for="PASSPORT_NO" data-lang>여권번호</label>
										</div>
										<div class="b-con-box" role="cell">
											<input class="form-control" type="text" id="PASSPORT_NO">
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label for="PASSPORT_EXPIRE_DATE" data-lang>여권만료일</label>
										</div>
										<div class="b-con-box" role="cell">
											<input type="text" id="PASSPORT_EXPIRE_DATE" name="PASSPORT_EXPIRE_DATE" class="form-control datepicker" />
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item merge-3">
										<div class="b-title-box" role="rowheader">
											<label for="PASSPORT_ISSUE_SUPPOSE_DATE" data-lang>여권발급예정일</label>
										</div>
										<div class="b-con-box" role="cell">
											<div class="row">
												<div class="col-lg-9">
													<input type="text" id="PASSPORT_ISSUE_SUPPOSE_DATE" name="PASSPORT_ISSUE_SUPPOSE_DATE" class="form-control datepicker" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<ul class="list list-style-1">
								<li data-lang><span class="text-primary"> 영문이름은 아래의 안내사항에 따라 기재하여 주세요. </span><br/>
								    <span class="text-primary"> - 여권에 나와있는 순서대로, 띄어쓰기 동일하게 작성 </span><br/>
								    <span class="text-primary"> - 전체 대문자로, 성과 이름 사이 '/ (빗금)' 을 사용하여 구분  ex) KIM/YUNA, LEE/JUN SU </span>
								</li>
								<li data-lang><span class="text-primary"> 여권이 만료되거나 미소지한 경우 발급예정일을 작성해주세요. </span></li>			
							</ul>
							<!-- 여권정보 END  -->
							<!-- 입력 버튼 -->				
							<div class="text-center">
								<div class="form-group">
									<button class="btn btn-primary btn-lg" id="btnSave" type="button" onclick="javascript:return fn_save();" data-lang>입력</button>
									<button class="btn btn-primary btn-lg" id="btnCancel" type="button" onclick="javascript:return fn_cancel();" data-lang>신청취소</button>
								</div>                              
							</div>
							<!-- 입력 버튼 -->	
						</div>
					</section>
				</div>
			</div>
			<div class="sec-body" id="schdInfo" style="display:none;">
				<!-- 신청기간이 아닐시 안내 메시지 박스 -->
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn" data-lang>신청기간 :
										<label class="text-primary" id="schdDateInfo"></label>
								</span></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 신청기간이 아닐시 안내 메시지 박스 -->
			</div>
		</section>
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplateNative">
	<tr style="cursor:pointer;">
        <td>#:SYEAR#</td>
	    <td>#:TERM_GCD#</td>
	    <td class="text-left" scope="row">#:SUBJ_NM#</td>
		<td class="text-left" scope="row">#:NATIVE_LANG_LECT_GCD#</td>
		<td>#:GRADE_CD#</td>
	</tr>
</script>

<script type="text/x-tbody-template" id="resultTemplateExchg">
	<tr style="cursor:pointer;">
        <td class="text-left" scope="row">#:EXUNIV_KOR_NM#</td>
	    <td class="text-left" scope="row">#:EXCHG_SYEAR_TERM_GCD#</td>
	    <td class="text-left" scope="row">#:REMARK#</td>
	</tr>
</script>

<script type="text/javascript">
	var exchgGcd = "0001";
	var exchgDetailGcd = "0011";
	var param = [];

	var _autoComplete;
	var _multi;

	function fn_initScreen() {
		fn_schdSyearTerm();
		
		$("#STDT_EMAIL").emailEditor({
        	val : "",
            callbackFunc : function(e){

            },
			dataBound : function(e) {

            }
        });

		gfn_com_DropDownLists([{          
			elements : $("#FOREIGN_LANGUAGE_1_GCD"),
            commonCode : "0001_FOREIGN_LANGUAGE_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "", 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {
            	
            }
        }, {        
			elements : $("#FOREIGN_LANGUAGE_2_GCD"),
            commonCode : "0001_FOREIGN_LANGUAGE_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "", 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {

            }
        }, {        
			elements : $("#FOREIGN_LANGUAGE_3_GCD"),
            commonCode : "0001_FOREIGN_LANGUAGE_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "", 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {

            }
        }, {      
			elements : $("#OFFICIAL_FOREIGN_LANGUAGE_1_GCD"),
            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "0001", 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {

            }
        }, {          
			elements : $("#OFFICIAL_FOREIGN_LANGUAGE_2_GCD"),
            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "0001", 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {

            }
        }, {          
			elements : $("#OFFICIAL_FOREIGN_LANGUAGE_3_GCD"),
            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "0001", 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {

            }
        }, {          
			elements : $("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_GRADE_GCD"),
            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GRADE_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "0001", 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {

            }
        }, {          
			elements : $("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_GRADE_GCD"),
            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GRADE_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "0001", 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {

            }
        }, {          
			elements : $("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_GRADE_GCD"),
            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GRADE_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "0001", 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {

            }
        }])
        agreeDltInfo = [];
	}

	/***************************************************************************
	 * 학생교류 신청가능 학년도,학기 조회
	 **************************************************************************/
	function fn_schdSyearTerm(data) {

		$("#EXCHG_GCD").val(exchgGcd);
		$("#EXCHG_DETAIL_GCD").val(exchgDetailGcd);

		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/exchgfee/searchSchdYearTerm",
			reqData : data,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data)) {
					// 정규학기
					var termData = "";
					for(var i=0; i<data.length; i++){
						if(data[i].TERM_GCD == "0010" || data[i].TERM_GCD == "0020"){
							termData = data[i];
							break;
						}
					}
					//테스트 주석
					if(termData == ""){
						//alert2("신청서 작성기간이 아닙니다.",function (e){selectMenu("000000000000204");});
					}else{
						 if (termData.FG == "N") {
							//alert2("신청서 작성기간이 아닙니다.<br/> " + termData.SCHD,function (e){selectMenu("000000000000204");});
							return;
						} else {
							$("#titleHeader").text(termData.SYEAR + "학년도 " + termData.TERM_GCD_NM + " 해외교환&교비 지원서");
							$("#schdDate").text(termData.SCHD);
							$("#SYEAR").val(termData.SYEAR);
							$("#TERM_GCD").val(termData.TERM_GCD);
							$("#CHASU_NO").val(termData.CHASU_NO);
							//$("#STDT_NO").val(scwin.loginUser.userId);
		
							// 신청기간 체크
							fn_schdChk();
						} 
					}
				}else{
					alert2("신청서 작성기간이 아닙니다.",function (e){selectMenu("000000000000204");});
				}
			}
		});
	
	}

	/***************************************************************************
	 * 학생교류 신청기간 조회
	 **************************************************************************/
	function fn_schdChk(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/exchgfee/searchSchdChk",
			reqData : data,
			success : function(data, responseData) {
				$("#submitDate").text(data.SUBMIT_DATE);
				fn_searchExchgStdtInfo();
			}
		});
	}

	/***************************************************************************
	 * 해외교환/교비 신청자 정보 조회
	 **************************************************************************/
	function fn_searchExchgStdtInfo(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/exchgfee/searchExchgStdtInfo",
			reqData : data,
			success : function(data, responseData) {
				if (gfn_com_isEmptyObject(data) ) {
					alert2("신청지원대상이 아닙니다. ",function (e){selectMenu("000000000000204");});
					return;
				} else {
					if (data.APPLY_CANCEL_FG == "Y") {
						alert("신청 취소한 기록이 있습니다. 이전 자료를 불러오겠습니다.");
						$("#rowStatus").val("U");
					} else if(data.APPLY_CANCEL_FG == "N") {
						$("#rowStatus").val("U");
					} else {
						$("#rowStatus").val("C");
						$("#btnCancel").hide();
					}

					//개인정보
					$("#STDT_KOR_NM").text(data.STDT_KOR_NM); // 이름
					$("#STDT_NO_LAB").text(data.STDT_NO); // 학번
					$("#COLL_CD").text(data.COLL_CD); // 소속대학
					$("#DEPT_CD").text(data.DEPT_CD); // 소속학과
					$("#GENDER_GCD").text(data.GENDER_GCD); // 성별
					$("#BIRTH_DATE").text(data.BIRTH_DATE); // 생년월일
					$("#STDT_EMAIL").val(data.STDT_EMAIL); // 이메일
					//$("#STDT_CELLULAR_NO").val(data.STDT_CELLULAR_NO); // 휴대전화
					//$("#EMGCY_TEL_NO").val(data.EMGCY_TEL_NO); // 비상연락처
					$("#CMPL_TERM_CNT").val(data.CMPL_TERM_CNT); // 이수학기
					$("#CMPL_TERM_CNT_LAB").text(data.CMPL_TERM_CNT); // 이수학기
					$("#RANK").text(data.RANK); // 등수
					$("#CRITERIA_INWON").text(data.CRITERIA_INWON); // 석차기준인원
					$("#HJ_STA_GCD").text(data.HJ_STA_GCD); // 학적상태
					$("#EXUNIV_CMPL_TERM_CNT").text(data.EXUNIV_CMPL_TERM_CNT); // 타대이수학점
					$("#EXUNIV_CMPL_TERM_PO_CNT").text(data.EXUNIV_CMPL_TERM_PO_CNT); // 타대이수가능학점
					
					// 휴대전화
					$("#STDT_CELLULAR_NO").telEditor({
			        	txtVal : data.STDT_CELLULAR_NO,
			        	originVal : "0000|",
			        	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
			        	telnoNm : "휴대폰번호",
			            callbackFunc : function(e){

			            },
						dataBound : function(e) {

			            }
			        });
					
					// 비상연락처
					$("#EMGCY_TEL_NO").telEditor({
			        	txtVal : data.EMGCY_TEL_NO,
			        	originVal : "0000|",
			        	telnoGbn : "C", /* 휴대폰번호 : C, 전화번호(팩스) : T, ALL : A */
			        	telnoNm : "휴대폰번호",
			            callbackFunc : function(e){

			            },
						dataBound : function(e) {

			            }
			        });
					
					gfn_com_DropDownLists([{          
							elements : $("#OFFICIAL_FOREIGN_LANGUAGE_1_GCD"),
				            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
				            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
				            dataValueField : "COMMON_DETAIL_CD",
				            optionLabel : "선택",
				            optionValue : "",
				            defaultValue : ""+data.OFFICIAL_FOREIGN_LANGUAGE_1_GCD+"", 
				            expnCondition : "AND (CHAR_1_CONTENT = '"+data.FOREIGN_LANGUAGE_1_GCD+"' OR CHAR_1_CONTENT LIKE '%ALL%')",
				            hakbuGradFg : false,
				            dataBound : function(e) {}
				        },{          
							elements : $("#OFFICIAL_FOREIGN_LANGUAGE_2_GCD"),
				            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
				            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
				            dataValueField : "COMMON_DETAIL_CD",
				            optionLabel : "선택",
				            optionValue : "",
				            defaultValue : ""+data.OFFICIAL_FOREIGN_LANGUAGE_2_GCD+"", 
				            expnCondition : "AND (CHAR_1_CONTENT = '"+data.FOREIGN_LANGUAGE_2_GCD+"' OR CHAR_1_CONTENT LIKE '%ALL%')",
				            hakbuGradFg : false,
				            dataBound : function(e) {}
				        },{          
							elements : $("#OFFICIAL_FOREIGN_LANGUAGE_3_GCD"),
				            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
				            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
				            dataValueField : "COMMON_DETAIL_CD",
				            optionLabel : "선택",
				            optionValue : "",
				            defaultValue : ""+data.OFFICIAL_FOREIGN_LANGUAGE_3_GCD+"", 
				            expnCondition : "AND (CHAR_1_CONTENT = '"+data.FOREIGN_LANGUAGE_3_GCD+"' OR CHAR_1_CONTENT LIKE '%ALL%')",
				            hakbuGradFg : false,
				            dataBound : function(e) {}
				        }
					]);
					
					// 정보입력
					// 1
					$("#FOREIGN_LANGUAGE_1_GCD").val(data.FOREIGN_LANGUAGE_1_GCD); // 지원희망외국어
					$("#OFFICIAL_FOREIGN_LANGUAGE_1_GCD").val(data.OFFICIAL_FOREIGN_LANGUAGE_1_GCD); // 공인외국어점수
					$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_SCORE").val(data.ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_SCORE); // 점수
					$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_GRADE_GCD").val(data.ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_GRADE_GCD); // 등급
					// 2
					$("#FOREIGN_LANGUAGE_2_GCD").val(data.FOREIGN_LANGUAGE_2_GCD); // 지원희망외국어
					$("#OFFICIAL_FOREIGN_LANGUAGE_2_GCD").val(data.OFFICIAL_FOREIGN_LANGUAGE_2_GCD); // 공인외국어점수
					$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_SCORE").val(data.ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_SCORE); // 점수
					$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_GRADE_GCD").val(data.ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_GRADE_GCD); // 등급
					// 3
					$("#FOREIGN_LANGUAGE_3_GCD").val(data.FOREIGN_LANGUAGE_3_GCD); // 지원희망외국어
					$("#OFFICIAL_FOREIGN_LANGUAGE_3_GCD").val(data.OFFICIAL_FOREIGN_LANGUAGE_3_GCD); // 공인외국어점수
					$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_SCORE").val(data.ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_SCORE); // 점수
					$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_GRADE_GCD").val(data.ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_GRADE_GCD); // 등급

					// 교과외 활동
					$("#EXCHG_STDT_FRIEND_FG").val(data.EXCHG_STDT_FRIEND_FG); // 교환학생Buddy
					$("#INVITE_PROF_HELP_FG").val(data.INVITE_PROF_HELP_FG); // 한국어 홍보대사
					$("#LANG_TRADE_HELP_FG").val(data.LANG_TRADE_HELP_FG); // 언어교환도우미
					$("#PNU_TOEFL_ATLECT_FG").val(data.PNU_TOEFL_ATLECT_FG); // IPNU토플특강
					$("#SERVE_ACTIV_PTCPT_TIMESNO").val(data.SERVE_ACTIV_PTCPT_TIMESNO); // 교과외 활동 수
					$("input[id='EXCHG_STDT_FRIEND_FG'][value='Y']").prop("checked", true);
					$("input[id='INVITE_PROF_HELP_FG'][value='Y']").prop("checked", true);
					$("input[id='LANG_TRADE_HELP_FG'][value='Y']").prop("checked", true);
					$("input[id='PNU_TOEFL_ATLECT_FG'][value='Y']").prop("checked", true);
					
					//희망지원대학
					$("input:radio[name ='APPLY_1_EXCHG_DETAIL_GCD']:input[value="+data.APPLY_1_EXCHG_DETAIL_GCD+"]").attr("checked", true);
					$("input:radio[name ='APPLY_2_EXCHG_DETAIL_GCD']:input[value="+data.APPLY_2_EXCHG_DETAIL_GCD+"]").attr("checked", true);
					$("input:radio[name ='APPLY_3_EXCHG_DETAIL_GCD']:input[value="+data.APPLY_3_EXCHG_DETAIL_GCD+"]").attr("checked", true);
					
					// 지원가능대학 조회
					fn_searchCollList('1',data.APPLY_1_EXUNIV_CD);
					fn_searchCollList('2',data.APPLY_2_EXUNIV_CD);
					fn_searchCollList('3',data.APPLY_3_EXUNIV_CD);
					
					// 여권정보
					if(data.PASSPORT_NO != "") {
						$("input:radio[name ='passPort']:input[value='Y']").attr("checked", true);
						//$("#passPort1").prop("checked", true)
					} else {
						$("input:radio[name ='passPort']:input[value='N']").attr("checked", true);
						//$("#passPort2").prop("checked", true)
					}
					$("#PASSPORT_ENG_NM").val(data.PASSPORT_ENG_NM); // 영문이름(여권)
					$("#PASSPORT_NO").val(data.PASSPORT_NO); // 여권번호
					$("#PASSPORT_EXPIRE_DATE").val(data.PASSPORT_EXPIRE_DATE); // 여권만료일
					$("#PASSPORT_ISSUE_SUPPOSE_DATE").val(data.PASSPORT_ISSUE_SUPPOSE_DATE); // 여권발급예정일
					
					// 여권소지여부에 따른 폼 disabeld 처리
			        fn_passPortYnChk();

					// 해외파견 프로그램 참가내역
					fn_searchDispatchApplyList();

					// 원어강의참가조회
					fn_searchNativeApplyList();
				}
			}
		});
	}

	/***************************************************************************
	 * 해외파견 프로그램 참가내역
	 **************************************************************************/
	function fn_searchDispatchApplyList(data) {

		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/exchgfee/searchDispatchApplyList",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody_Exchg").listView({
					dataSource : data,
					dataBound : function(e) {
						totalCnt = responseData.totalCnt;
						currentData = data;
					},
					template : $("#resultTemplateExchg"),
					totalCnt : responseData.totalCnt,
					paging : null,
					excel : null
				});
				
				if(responseData.totalCnt == 0) {
					$("input:radio[name ='RGROUP']:input[value='N']").attr("checked", true);
				} else {
					$("input:radio[name ='RGROUP']:input[value='Y']").attr("checked", true);
				}
			}
		});
	}

	/***************************************************************************
	 * 원어강의참가조회
	 **************************************************************************/
	function fn_searchNativeApplyList(data) {

		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}

		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/exchgfee/searchNativeApplyList",
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbodyNative").listView({
					dataSource : data,
					dataBound : function(e) {
						totalCnt = responseData.totalCnt;
						currentData = data;
					},
					template : $("#resultTemplateNative"),
					totalCnt : responseData.totalCnt,
					paging : null,
					excel : null
				});
				$("#NATIVE_LANG_LECT_CNT").val(responseData.totalCnt);
			}
		});
	}
	
	/***************************************************************************
	 * 지원가능대학 조회
	 **************************************************************************/
	function fn_searchCollList(num, value) {
		if(num == "1") {
			$("#SYEAR_01").val($("#SYEAR").val());
			$("#TERM_GCD_01").val($("#TERM_GCD").val());
			$("#EXCHG_DETAIL_GCD_01").val($(':radio[name="APPLY_1_EXCHG_DETAIL_GCD"]:checked').val());
			$("#LANG_GCD_01").val($("#FOREIGN_LANGUAGE_1_GCD").val());
			$("#DEG_COURSE_GCD_01").val(scwin.loginUser.degCourseGcd);
			$("#CMPL_TERM_CNT_01").val($("#CMPL_TERM_CNT").val());
			$("#CHASU_NO_01").val($("#CHASU_NO").val());
			
			var data = gfn_com_inputdata($(".search-coll-box-01"));

			gfn_ajax_request({
				url : "/ost/sep/overseasdispatch/exchgfee/searchCollList01",
				reqData : data,
				success : function(data, responseData) {
					$("#APPLY_1_EXUNIV_CD").dropDownList({
						dataSource : data,
						dataTextField : "EXUNIV_NM",
						dataValueField : "EXUNIV_CD",
						optionLabel : "선택",
						optionValue : "",
						defaultValue : "",
						expnCondition : "",
						dataBound : function(e) {
						
						}
					});
					
					// 희망지원대학
					$("#APPLY_1_EXUNIV_CD").val(value); // 1지망 대학
				}
			});
		} else if (num == "2") {
			$("#SYEAR_02").val($("#SYEAR").val());
			$("#TERM_GCD_02").val($("#TERM_GCD").val());
			$("#EXCHG_DETAIL_GCD_02").val($(':radio[name="APPLY_2_EXCHG_DETAIL_GCD"]:checked').val());
			$("#LANG_GCD_02").val($("#FOREIGN_LANGUAGE_2_GCD").val());
			$("#DEG_COURSE_GCD_02").val(scwin.loginUser.degCourseGcd);
			$("#CMPL_TERM_CNT_02").val($("#CMPL_TERM_CNT").val());
			$("#CHASU_NO_02").val($("#CHASU_NO").val());
			
			var data = gfn_com_inputdata($(".search-coll-box-02"));

			gfn_ajax_request({
				url : "/ost/sep/overseasdispatch/exchgfee/searchCollList02",
				reqData : data,
				success : function(data, responseData) {
					$("#APPLY_2_EXUNIV_CD").dropDownList({
						dataSource : data,
						dataTextField : "EXUNIV_NM",
						dataValueField : "EXUNIV_CD",
						optionLabel : "선택",
						optionValue : "",
						defaultValue : "",
						expnCondition : "",
						dataBound : function(e) {

						}
					});
					
					// 희망지원대학
					$("#APPLY_2_EXUNIV_CD").val(value); // 1지망 대학
				}
			});
		} else if (num == "3") {
			$("#SYEAR_03").val($("#SYEAR").val());
			$("#TERM_GCD_03").val($("#TERM_GCD").val());
			$("#EXCHG_DETAIL_GCD_03").val($(':radio[name="APPLY_3_EXCHG_DETAIL_GCD"]:checked').val());
			$("#LANG_GCD_03").val($("#FOREIGN_LANGUAGE_3_GCD").val());
			$("#DEG_COURSE_GCD_03").val(scwin.loginUser.degCourseGcd);
			$("#CMPL_TERM_CNT_03").val($("#CMPL_TERM_CNT").val());
			$("#CHASU_NO_03").val($("#CHASU_NO").val());
			
			var data = gfn_com_inputdata($(".search-coll-box-03"));

			gfn_ajax_request({
				url : "/ost/sep/overseasdispatch/exchgfee/searchCollList03",
				reqData : data,
				success : function(data, responseData) {
					$("#APPLY_3_EXUNIV_CD").dropDownList({
						dataSource : data,
						dataTextField : "EXUNIV_NM",
						dataValueField : "EXUNIV_CD",
						optionLabel : "선택",
						optionValue : "",
						defaultValue : "",
						expnCondition : "",
						dataBound : function(e) {

						}
					});
					// 희망지원대학
					$("#APPLY_3_EXUNIV_CD").val(value); // 3지망 대학
				}
			});
		}
	}
	
	/***************************************************************************
	 * 여권여부 변경 이벤트
	 **************************************************************************/
	function fn_passPortYnChk() {
		if($(':radio[name="passPort"]:checked').val() == "Y") {
        	$("#PASSPORT_ENG_NM").attr("disabled", false);
        	$("#PASSPORT_NO").attr("disabled", false);
        	$("#PASSPORT_EXPIRE_DATE").attr("disabled", false);
        	
        	//$("#PASSPORT_ISSUE_SUPPOSE_DATE").val('');
        	$("#PASSPORT_ISSUE_SUPPOSE_DATE").attr("disabled", true);
        } else if($(':radio[name="passPort"]:checked').val() == "N") {
        	$("#PASSPORT_ENG_NM").attr("disabled", true);
        	$("#PASSPORT_NO").attr("disabled", true);
        	$("#PASSPORT_EXPIRE_DATE").attr("disabled", true);
        	/* $("#PASSPORT_ENG_NM").val('');
        	$("#PASSPORT_NO").val('');
        	$("#PASSPORT_EXPIRE_DATE").val(''); */
        	
        	$("#PASSPORT_ISSUE_SUPPOSE_DATE").attr("disabled", false);
        }
		//$("#FOREIGN_LANGUAGE_GCD").attr("onchange","fn_langChange");
		$("#FOREIGN_LANGUAGE_1_GCD").change(function() {
			fn_searchCollList('1');
	    });
		$("#FOREIGN_LANGUAGE_2_GCD").change(function() {
			fn_searchCollList('2');
	    });
		$("#FOREIGN_LANGUAGE_3_GCD").change(function() {
			fn_searchCollList('3');
	    });
	}
	
	/***************************************************************************
	 * 입력
	 **************************************************************************/
	function fn_save(param) {
		if($("#STDT_CELLULAR_NO").val() == "") {
			alert("휴대전화를 입력하세요.",$("#STDT_CELLULAR_NO"));
			return;
		} else if($("#EMGCY_TEL_NO").val() == "") {
			alert("비상연락처를 입력하세요.",$("#EMGCY_TEL_NO"));
			return;
		} else if($("#STDT_EMAIL").val() == "") {
			alert("이메일을 입력하세요.",$("#STDT_EMAIL"));
			return;
		} 
		
		if($(':radio[name="passPort"]:checked').val() == "Y") {
			if($("#PASSPORT_ENG_NM").val() == "") {
				alert("영문이름(여권)을 입력하세요.");
				$("#PASSPORT_ENG_NM").focus();
				return;
			} else if($("#PASSPORT_NO").val() == "") {
				alert("여권번호를 입력하세요.");
				$("#PASSPORT_NO").focus();
				return;
			} else if($("#PASSPORT_EXPIRE_DATE").val() == "") {
				alert("여권만료일을 입력하세요.");
				$("#PASSPORT_EXPIRE_DATE").focus();
				return;
			}
		} else if($(':radio[name="passPort"]:checked').val() == "N") {
			if($("#PASSPORT_ISSUE_SUPPOSE_DATE").val() == "") {
				alert("여권발급예정일을 입력하세요.");
				$("#PASSPORT_ISSUE_SUPPOSE_DATE").focus();
				return;
			}
		} 
		
		if($("#APPLY_1_EXUNIV_CD").val() == "") {
			alert("1지망 항목을 선택해주세요.");
			$("#APPLY_1_EXUNIV_CD").focus();
			return;
		} else if($("#APPLY_2_EXUNIV_CD").val() == "") {
			alert("2지망 항목을 선택해주세요.");
			$("#APPLY_2_EXUNIV_CD").focus();
			return;
		} else if($("#APPLY_3_EXUNIV_CD").val() == "") {
			alert("3지망 항목을 선택해주세요.");
			$("#APPLY_3_EXUNIV_CD").focus();
			return;
		} 
		// 희망지원대학 validation
		if($("#APPLY_1_EXUNIV_CD").val() != "999" && $("#APPLY_1_EXUNIV_CD").val() != "") {
			if($("#APPLY_1_EXUNIV_CD").val() == $("#APPLY_2_EXUNIV_CD").val()) {
				alert("희망지원대학은 동일할 수 없습니다.");
				$("#APPLY_2_EXUNIV_CD").focus();
				return;
			} else if($("#APPLY_1_EXUNIV_CD").val() == $("#APPLY_3_EXUNIV_CD").val()) {
				alert("희망지원대학은 동일할 수 없습니다.");
				$("#APPLY_3_EXUNIV_CD").focus();
				return;
			} 
		} 
		// 희망지원대학 validation
		if($("#APPLY_2_EXUNIV_CD").val() != "999" && $("#APPLY_2_EXUNIV_CD").val() != "") {
			if($("#APPLY_2_EXUNIV_CD").val() == $("#APPLY_3_EXUNIV_CD").val()) {
				alert("희망지원대학은 동일할 수 없습니다.");
				$("#APPLY_3_EXUNIV_CD").focus();
				return;
			}
		}
		// 교환학생 check박스 데이터 처리
		if($("#EXCHG_STDT_FRIEND_FG").prop("checked")) {
			$("#EXCHG_STDT_FRIEND_FG").val("Y");
		} else {
			$("#EXCHG_STDT_FRIEND_FG").val("N");
		}
		
		// 한국어 홍보대사 check박스 데이터 처리
		if($("#INVITE_PROF_HELP_FG").prop("checked")) {
			$("#INVITE_PROF_HELP_FG").val("Y");
		} else {
			$("#INVITE_PROF_HELP_FG").val("N");
		}
		
		// 언어교환도우미 check박스 데이터 처리
		if($("#LANG_TRADE_HELP_FG").prop("checked")) {
			$("#LANG_TRADE_HELP_FG").val("Y");
		} else {
			$("#LANG_TRADE_HELP_FG").val("N");
		}
		
		// iPNU토플특강 check박스 데이터 처리
		if($("#PNU_TOEFL_ATLECT_FG").prop("checked")) {
			$("#PNU_TOEFL_ATLECT_FG").val("Y");
		} else {
			$("#PNU_TOEFL_ATLECT_FG").val("N");
		}
		
		if($("#EXUNIV_CMPL_TERM_CNT").text() >= 12){
			confirm("타대이수학점이 12점이 이상입니다. 신청하시겠습니까?", function(_flag) {
				if (_flag) {
					// 개인정보동의팝업
					fn_clause();
				}
			});
		}else{
			// 개인정보동의팝업
			confirm(gva_SAVE_CONFIRM_MSG, function(_flag) {
				if (_flag) {
					fn_clause();
				}
			});
		}
	}
	
	var agreeDltInfo = [];
	/***************************************************************************
	 * 개인정보동의 팝업
	 **************************************************************************/
	function fn_clause() {
		param = gfn_com_inputdata($(".stdt-info"));
		
		gfn_com_clausePop({
			title : '정보동의팝업',
			systemGcd : '0002',
			clauseSeqNo : 31,
			params : {
				agree_title : "교환/교비"
			},
			callbackFunc : function(data){
				/* 필수동의 사항에 동의한 경우 콜백 실행 */
				agreeDltInfo = data;
				fn_applySaveCallback();// 저장함수 넣기
			}
		});
	}
	
	/***************************************************************************
	 * 교환/교비 신청 Callback
	 **************************************************************************/
	function fn_applySaveCallback() {
 			if($(':radio[name="passPort"]:checked').val() == "Y") {
 	        	$("#PASSPORT_ISSUE_SUPPOSE_DATE").val('');
 	        } else if($(':radio[name="passPort"]:checked').val() == "N") {
 	        	$("#PASSPORT_ENG_NM").val('');
 	        	$("#PASSPORT_NO").val('');
 	        	$("#PASSPORT_EXPIRE_DATE").val('');
 	        }
 			
 			if($("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_SCORE").val() == ""){
 				$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_1_SCORE").val("0")
 			}
 			if($("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_SCORE").val() == ""){
 				$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_2_SCORE").val("0")
 			}
 			if($("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_SCORE").val() == ""){
 				$("#ACQ_OFFICIAL_FOREIGN_LANGUAGE_3_SCORE").val("0")
 			}
 			
 			param = gfn_com_inputdata($(".stdt-info"));
 			param["agreeDltInfo"] = agreeDltInfo;
 			
 			gfn_ajax_request({
 				url : "/ost/sep/overseasdispatch/exchgfee/saveExchgFee",
     			reqData : param,
     			success : function(data, responseData){
     				if(data.O_RSLT == 'Y') {
     					alert(data.O_MSG,function(){ location.reload()  });
     				} else {
     					alert(data.O_MSG);
     				}
     			}
     		});
	}
	
	/***************************************************************************
	 * 교환/교비 신청취소
	 **************************************************************************/
	function fn_cancel(data) {
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_inputdata($(".search-box"));
		}
		confirm("신청취소하시겠습니까?",function(_flag){
			if(_flag) {
    			gfn_ajax_request({
    				url : "/ost/sep/overseasdispatch/exchgfee/cancelExchgFee",
        			reqData : data,
        			success : function(data, responseData){
        				alert(data.O_MSG,function(){ location.reload()  });
        			}
        		});
    		}
		})
	}
	
	/***************************************************************************
	 * 필터
	 **************************************************************************/
	function fn_onchange1(){
		if($("#FOREIGN_LANGUAGE_1_GCD").val() == ""){
			gfn_com_DropDownLists([
				{          
					elements : $("#OFFICIAL_FOREIGN_LANGUAGE_1_GCD"),
		            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
		            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
		            dataValueField : "COMMON_DETAIL_CD",
		            optionLabel : "선택",
		            optionValue : "",
		            defaultValue : "", 
		            expnCondition : "AND CHAR_1_CONTENT = '"+$("#FOREIGN_LANGUAGE_1_GCD").val()+"'",
		            hakbuGradFg : false,
		            dataBound : function(e) {
							
		            }
		        }]);	
		}else{
		gfn_com_DropDownLists([
			{          
				elements : $("#OFFICIAL_FOREIGN_LANGUAGE_1_GCD"),
	            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
	            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
	            dataValueField : "COMMON_DETAIL_CD",
	            optionLabel : "선택",
	            optionValue : "",
	            defaultValue : "", 
	            expnCondition : "AND (CHAR_1_CONTENT = '"+$("#FOREIGN_LANGUAGE_1_GCD").val()+"' OR CHAR_1_CONTENT LIKE'%ALL%')",
	            hakbuGradFg : false,
	            dataBound : function(e) {
						
	            }
	        }]);		
		}
	}
	
	function fn_onchange2(){
		if($("#FOREIGN_LANGUAGE_2_GCD").val() == ""){
			gfn_com_DropDownLists([
				{          
					elements : $("#OFFICIAL_FOREIGN_LANGUAGE_2_GCD"),
		            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
		            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
		            dataValueField : "COMMON_DETAIL_CD",
		            optionLabel : "선택",
		            optionValue : "",
		            defaultValue : "", 
		            expnCondition : "AND CHAR_1_CONTENT = '"+$("#FOREIGN_LANGUAGE_2_GCD").val()+"'",
		            hakbuGradFg : false,
		            dataBound : function(e) {
							
		            }
		        }]);	
		}else{
		gfn_com_DropDownLists([
			{          
				elements : $("#OFFICIAL_FOREIGN_LANGUAGE_2_GCD"),
	            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
	            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
	            dataValueField : "COMMON_DETAIL_CD",
	            optionLabel : "선택",
	            optionValue : "",
	            defaultValue : "", 
	            expnCondition : "AND (CHAR_1_CONTENT = '"+$("#FOREIGN_LANGUAGE_2_GCD").val()+"' OR CHAR_1_CONTENT LIKE'%ALL%')",
	            hakbuGradFg : false,
	            dataBound : function(e) {
						
	            }
	        }]);		
		}
	}
	
	function fn_onchange3(){
		if($("#FOREIGN_LANGUAGE_3_GCD").val() == ""){
			gfn_com_DropDownLists([
				{          
					elements : $("#OFFICIAL_FOREIGN_LANGUAGE_3_GCD"),
		            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
		            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
		            dataValueField : "COMMON_DETAIL_CD",
		            optionLabel : "선택",
		            optionValue : "",
		            defaultValue : "", 
		            expnCondition : "AND CHAR_1_CONTENT = '"+$("#FOREIGN_LANGUAGE_3_GCD").val()+"'",
		            hakbuGradFg : false,
		            dataBound : function(e) {
							
		            }
		        }]);	
		}else{
		gfn_com_DropDownLists([
			{          
				elements : $("#OFFICIAL_FOREIGN_LANGUAGE_3_GCD"),
	            commonCode : "0001_OFFICIAL_FOREIGN_LANGUAGE_GCD",
	            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
	            dataValueField : "COMMON_DETAIL_CD",
	            optionLabel : "선택",
	            optionValue : "",
	            defaultValue : "", 
	            expnCondition : "AND (CHAR_1_CONTENT = '"+$("#FOREIGN_LANGUAGE_2_GCD").val()+"' OR CHAR_1_CONTENT LIKE'%ALL%')",
	            hakbuGradFg : false,
	            dataBound : function(e) {
						
	            }
	        }]);		
		}
	}
</script>