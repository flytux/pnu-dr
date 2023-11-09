<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title">대학원 수강편람</h2>
				</div>
				<div class="header-item"></div>
			</header>
			<div class="sec-body">
				<!-- 메시지 박스 -->
				<div class="message-box message-box-style-2">
					<div class="message-box-inner">
						<div class="message-header">
							<img src="/common/images/message_box_icon_01.svg" alt="">
						</div>
						<div class="message-body">
							<p>2021학년도 1학기 대학원 수강편람 전 각 안내사항에 대해 참고해주시 바랍니다.</p>
							<ul class="list list-margin-bottom list-narrow-gutter">
								<li><a class="link" href="#">수강신청안내</a></li>
								<li><a class="link" href="#">수강지도 참고사항</a></li>
								<li><a class="link" href="#">생명윤리 교과목 수강안내</a></li>
								<li><a class="link" href="#">연구윤리 및 연구관리 교과목 수강안내</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->

				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-4" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label>학년도</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control">
										<option>선택</option>
									</select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label>학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control">
										<option>선택</option>
									</select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label>대학원</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control">
										<option>선택</option>
									</select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label>학과/전공</label>
								</div>
								<div class="b-con-box" role="cell">
									<select class="form-control">
										<option>선택</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button">조회</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /END 검색 영역 -->

				<!-- 메시지 박스 -->
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn">미확정</span> : 개설은 되었으나 학사과에서 확정하지 않은 교과목(수강신청이 불가하오니 개설학과로 문의하세요.</li>
								<li><span class="dfn">미지정</span> : 확정은 되었으나 시간표가 입력되어 있지 않은 교과목(제한사항이 걸려 있는 경우를 제외하고는 수강신청 가능)</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->

				<!-- 테이블 -->
				<div class="table-box">
					<div class="table-header">
						<div class="header-item">
							<span class="mr-2"> Total <span class="text-total">10</span>건
							</span> <select class="form-control">
								<option>10개씩보기</option>
								<option>20개씩보기</option>
							</select>
						</div>
						<div class="header-item">
							<button class="btn btn-outline-success" type="button">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-excel-fill" viewBox="0 0 16 16">
                        <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM5.884 6.68 8 9.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 10l2.233 2.68a.5.5 0 0 1-.768.64L8 10.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 10 5.116 7.32a.5.5 0 1 1 .768-.64z" />
                      </svg>
								Excel
							</button>
						</div>
					</div>

					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-height="500">
							<caption>대학원 수강편람</caption>
							<colgroup>
								<col span="6">
								<col style="min-width: 75px;">
								<col style="min-width: 140px;">
								<col style="min-width: 140px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">교과목번호</th>
									<th scope="col">분반</th>
									<th scope="col">학점</th>
									<th scope="col">시간</th>
									<th scope="col">제한인원</th>
									<th scope="col">교과목명/미확정구분</th>
									<th scope="col">교수명</th>
									<th scope="col">시간/강의실</th>
									<th scope="col">출력</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th class="table-secondary" scope="row">NR60123</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">간호이론개발</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="table-secondary" scope="row">NR60164</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">건강관련이론</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="table-secondary" scope="row">NR62888</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">논문연구</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="table-secondary" scope="row">NR67306</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">스트레스관리론</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="table-secondary" scope="row">NR67310</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">노인전문간호총론</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="table-secondary" scope="row">NR68006</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">상급정신간호실습(II)</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="table-secondary" scope="row">NR69591</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">지역사회정신간호실습</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="table-secondary" scope="row">NR69603</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">중환자관리의 이론과 실제 및 실습 : 역할개발</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="table-secondary" scope="row">NR69604</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">상급중환자관리임상실습(II)</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="table-secondary" scope="row">NR60123</th>
									<td>001</td>
									<td>3.0</td>
									<td>3.0</td>
									<td>6/100</td>
									<td class="text-left">상급정신간호 세미나</td>
									<td>강인순</td>
									<td>월 10:00 - 13:00<br>양산Y04-209
									</td>
									<td>
										<div class="form-row">
											<div class="col-auto">
												<button class="btn btn-outline-primary" type="button">국문</button>
											</div>
											<div class="col-auto">
												<button class="btn btn-outline-secondary" type="button">영문</button>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="table-footer">
						<!-- 페이지 링크 -->
						<nav class="pagination-box" aria-label="대표코드 페이지 링크">
							<ul class="pagination">
								<li class="page-item first"><a class="page-link" href="#" aria-label="처음"></a></li>
								<li class="page-item prev"><a class="page-link" href="#" aria-label="이전"></a></li>
								<li class="page-item page-info"><span class="text-primary">3</span> / 36</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item active"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item next"><a class="page-link" href="#" aria-label="다음"></a></li>
								<li class="page-item last"><a class="page-link" href="#" aria-label="마지막"></a></li>
							</ul>
						</nav>
						<!-- /END 페이지 링크 -->
					</div>
				</div>
				<!-- /END 테이블 -->
			</div>
		</section>
	</main>
</div>