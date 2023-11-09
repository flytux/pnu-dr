<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title">스타일 가이드</h2>
				</div>
				<div class="header-item">
					<ul class="list list-narrow-gutter">
						<li>
							<button class="btn btn-icon share-btn" type="button">
								<img src="/common/images/share.svg" alt="공유">
							</button>
						</li>
						<li>
							<button class="btn btn-icon print-btn" type="button">
								<img src="/common/images/print.svg" alt="프린트">
							</button>
						</li>
					</ul>
				</div>
			</header>
			<div class="sec-body">
				<!-- 폼 -->
				<section class="sec-2">
					<header>
						<h3 class="sec-title">폼</h3>
					</header>
					<div class="sec-body">
						<div class="message-box mb-3">
							<div class="message-box-inner">
								<div class="message-body">
									<code>&lt;select&gt;</code>
									,
									<code>&lt;textarea&gt;</code>
									및 텍스트 입력
									<code>&lt;input&gt;</code>
									요소(
									<code>type="text"</code>
									,
									<code>type="search"</code>
									,
									<code>type="number"</code>
									등등)에만
									<code>.form-control</code>
									클래스 지정.
								</div>
							</div>
						</div>

						<section class="sec-3">
							<header>
								<h3 class="sec-title">폼 row</h3>
							</header>
							<div class="sec-body">
								<div class="form-row">
									<div class="col">
										<input class="form-control" type="text">
									</div>
									<div class="col">
										<select class="form-control">
											<option>선택</option>
										</select>
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3">
							<header>
								<h3 class="sec-title">폼 sizing</h3>
							</header>
							<div class="sec-body">
								<div class="form-row mb-3">
									<div class="col-7">
										<input class="form-control" type="text">
									</div>
									<div class="col">
										<select class="form-control">
											<option>선택</option>
										</select>
									</div>
									<div class="col">
										<input class="form-control" type="text">
									</div>
								</div>

								<div class="form-row mb-2">
									<div class="col-sm-7">
										<input class="form-control mb-2" type="text">
									</div>
									<div class="col-sm">
										<select class="form-control mb-2">
											<option>선택</option>
										</select>
									</div>
									<div class="col-sm">
										<input class="form-control mb-2" type="text">
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3">
							<header>
								<h3 class="sec-title">폼 auto sizing</h3>
							</header>
							<div class="sec-body">
								<div class="form-row align-items-center">
									<div class="col-auto">
										<input class="form-control mb-2" type="text">
									</div>
									<div class="col-auto">
										<select class="form-control mb-2">
											<option>선택</option>
										</select>
									</div>
									<div class="col-auto">
										<button class="btn btn-primary mb-2" type="button">버튼</button>
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3">
							<header>
								<h3 class="sec-title">
									폼 + 아이콘 <small>(<a href="https://icons.getbootstrap.com/icons/search/" target="_blank" class="text-primary" title="이동">부트스트랩 아이콘</a> 사용)
									</small>
								</h3>
							</header>
							<div class="sec-body">
								<div class="form-row align-items-center">
									<div class="col-auto mb-2">
										<!-- 인풋+아이콘 -->
										<div class="input-group">
											<input class="form-control" type="text">
											<div class="input-group-append">
												<button type="button" class="btn form-control">
													<i class="bi bi-search"><span class="sr-only">검색</span></i>
												</button>
											</div>
										</div>
										<!-- / 인풋+아이콘 -->
									</div>
									<div class="col-auto mb-2">
										<!-- 인풋+아이콘 -->
										<div class="input-group">
											<input type="text" id="siteCheckEnymd" name="siteCheckEnymd" class="form-control datepicker hasDatepicker">
											<div class="input-group-append">
												<button type="button" class="btn form-control ui-datepicker-trigger">
													<i class="bi bi-calendar-event"><span class="sr-only">달력열기</span></i>
												</button>
											</div>
										</div>
										<!-- / 인풋+아이콘 -->
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3">
							<header>
								<h3 class="sec-title">체크박스</h3>
							</header>
							<div class="sec-body">
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" id="checkInline1" class="custom-control-input"> <label class="custom-control-label" for="checkInline1">선택 1</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" id="checkInline2" class="custom-control-input"> <label class="custom-control-label" for="checkInline2">선택 2</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" id="checkInline3" class="custom-control-input"> <label class="custom-control-label" for="checkInline3">선택 3</label>
								</div>
							</div>
						</section>

						<section class="sec-3">
							<header>
								<h3 class="sec-title">라디오</h3>
							</header>
							<div class="sec-body">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="customRadioInline1" name="customRadioInline" class="custom-control-input"> <label class="custom-control-label" for="customRadioInline1">선택 1</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="customRadioInline2" name="customRadioInline" class="custom-control-input"> <label class="custom-control-label" for="customRadioInline2">선택 2</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="customRadioInline3" name="customRadioInline" class="custom-control-input"> <label class="custom-control-label" for="customRadioInline3">선택 3</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="customRadioInline4" name="customRadioInline" class="custom-control-input"> <label class="custom-control-label" for="customRadioInline4">선택 4</label>
								</div>
							</div>
						</section>

					</div>
				</section>
				<!-- /END 폼 -->

				<!-- 테이블 -->
				<section class="sec-2">
					<header>
						<h3 class="sec-title">테이블</h3>
					</header>
					<div class="sec-body">
						<!-- 1단 테이블 -->
						<section class="sec-3">
							<header>
								<h4 class="sec-title">1단 테이블</h4>
							</header>
							<div class="sec-body">
								<div class="b-table-box flex-col-1" role="table" aria-label="1단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 2단 테이블 -->
						<section class="sec-3">
							<header>
								<h4 class="sec-title">2단 테이블</h4>
							</header>
							<div class="sec-body">
								<div class="b-table-box" role="table" aria-label="2단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<!-- 인풋+아이콘 -->
												<div class="input-group">
													<input class="form-control" type="text">
													<div class="input-group-append">
														<button type="button" class="btn form-control">
															<i class="bi bi-search"><span class="sr-only">검색</span></i>
														</button>
													</div>
												</div>
												<!-- / 인풋+아이콘 -->
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<!-- 인풋+아이콘 -->
												<div class="input-group">
													<input type="text" class="form-control datepicker hasDatepicker">
													<div class="input-group-append">
														<button type="button" class="btn form-control ui-datepicker-trigger">
															<i class="bi bi-calendar-event"><span class="sr-only">달력열기</span></i>
														</button>
													</div>
												</div>
												<!-- / 인풋+아이콘 -->
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 3단 테이블 -->
						<section class="sec-3">
							<header>
								<h4 class="sec-title">3단 테이블</h4>
							</header>
							<div class="sec-body">
								<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>

											<!-- <div class="b-con-box" role="cell">
                              <input class="form-control" type="text">
                            </div> -->
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 4단 테이블 -->
						<section class="sec-3">
							<header>
								<h4 class="sec-title">4단 테이블</h4>
							</header>
							<div class="sec-body">
								<div class="b-table-box flex-col-4" role="table" aria-label="4단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 5단 테이블 -->
						<section class="sec-3">
							<header>
								<h4 class="sec-title">5단 테이블</h4>
							</header>
							<div class="sec-body">
								<div class="b-table-box flex-col-5" role="table" aria-label="5단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<input class="form-control" type="text">
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<select class="form-control">
													<option>선택</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 테이블 리스트 -->
						<section class="sec-3">
							<header>
								<h4 class="sec-title">테이블 리스트</h4>
							</header>
							<div class="sec-body">
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
										<div class="table-responsive">
											<table class="table table-hover">
												<caption>대학원 수강편람</caption>
												<colgroup>
													<col span="5">
													<col style="min-width: 230px;">
													<col style="min-width: 75px;">
													<col style="min-width: 140px;">
													<col style="min-width: 140px;">
												</colgroup>
												<thead>
													<tr>
														<th scope="col">제목</th>
														<th scope="col">제목</th>
														<th scope="col">제목</th>
														<th scope="col">제목</th>
														<th scope="col">제목</th>
														<th scope="col">제목</th>
														<th scope="col">제목</th>
														<th scope="col">제목</th>
														<th scope="col">제목</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th scope="row">NR60123</th>
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
														<th scope="row">NR60164</th>
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
														<th scope="row">NR62888</th>
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
												</tbody>
											</table>
										</div>
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
							</div>
						</section>

						<!-- 테이블 리스트 - 헤더 고정 -->
						<section class="sec-3">
							<header>
								<h4 class="sec-title">테이블 리스트 - 헤더 고정</h4>
							</header>
							<div class="sec-body">
								<div class="table-box">
									<div class="table-body">
										<table class="table table-hover" data-toggle="table" data-height="500">
											<caption>대학원 수강편람</caption>
											<colgroup>
												<col span="5">
												<col style="min-width: 230px;">
												<col style="min-width: 75px;">
												<col style="min-width: 140px;">
												<col style="min-width: 140px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">제목</th>
													<th scope="col">제목</th>
													<th scope="col">제목</th>
													<th scope="col">제목</th>
													<th scope="col">제목</th>
													<th scope="col">제목</th>
													<th scope="col">제목</th>
													<th scope="col">제목</th>
													<th scope="col">제목</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">NR60123</th>
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
													<th scope="row">NR60164</th>
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
													<th scope="row">NR62888</th>
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
													<th scope="row">NR67306</th>
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
													<th scope="row">NR67310</th>
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
													<th scope="row">NR68006</th>
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
													<th scope="row">NR69591</th>
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
													<th scope="row">NR69603</th>
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
								</div>
							</div>
						</section>
					</div>
				</section>
				<!-- /END 테이블 -->

				<!-- 테이블안 폼  -->
				<section class="sec-2">
					<header>
						<h3 class="sec-title">테이블안 폼</h3>
					</header>
					<div class="sec-body">
						<!-- 기본형 -->
						<section class="sec-3">
							<header>
								<h4 class="sec-title">기본형</h4>
							</header>
							<div class="sec-body">
								<div class="b-table-box" role="table" aria-label="기본형">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="row">
													<div class="col-6">
														<input class="form-control" type="text">
													</div>
													<div class="col-6">
														<input class="form-control" type="text">
													</div>
												</div>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="row">
													<div class="col-2">
														<input class="form-control" type="text">
													</div>
													<div class="col-10">
														<input class="form-control" type="text">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="row">
													<div class="col-8">
														<input class="form-control" type="text">
													</div>
													<div class="col-4">
														<input class="form-control" type="text">
													</div>
												</div>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="row">
													<div class="col-9">
														<input class="form-control" type="text">
													</div>
													<div class="col-3">
														<input class="form-control" type="text">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 반응형 -->
						<section class="sec-3">
							<header>
								<h4 class="sec-title">반응형</h4>
							</header>
							<div class="sec-body">
								<div class="b-table-box" role="table" aria-label="반응형">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="row">
													<div class="col-xl-6">
														<input class="form-control" type="text">
													</div>
													<div class="col-xl-6">
														<input class="form-control" type="text">
													</div>
												</div>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="row">
													<div class="col-xl-2">
														<input class="form-control" type="text">
													</div>
													<div class="col-xl-10">
														<input class="form-control" type="text">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="row">
													<div class="col-lg-8">
														<input class="form-control" type="text">
													</div>
													<div class="col-lg-4">
														<input class="form-control" type="text">
													</div>
												</div>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label>라벨</label>
											</div>
											<div class="b-con-box" role="cell">
												<div class="row">
													<div class="col-md-9">
														<input class="form-control" type="text">
													</div>
													<div class="col-md-3">
														<input class="form-control" type="text">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

					</div>
				</section>
				<!-- /END 테이블안 폼 -->

				<!-- 검색영역 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">검색영역</h2>
					</header>
					<div class="sec-body">
						<div class="search-box">
							<div class="b-table-box flex-col-4" role="table" aria-label="검색">
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>라벨</label>
										</div>
										<div class="b-con-box" role="cell">
											<select class="form-control">
												<option>선택</option>
											</select>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>라벨</label>
										</div>
										<div class="b-con-box" role="cell">
											<select class="form-control">
												<option>선택</option>
											</select>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>라벨</label>
										</div>
										<div class="b-con-box" role="cell">
											<select class="form-control">
												<option>선택</option>
											</select>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>라벨</label>
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
									<div class="col-auto">
										<button class="btn print-btn" type="button">프린트</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- /END 검색영역 -->

				<!-- 첨부파일 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">첨부파일</h2>
					</header>
					<div class="sec-body">
						<section class="sec-3">
							<header>
								<h4 class="sec-title">기본형</h4>
							</header>
							<div class="sec-body">
								<div class="attach">
									<div class="drop-zone">
										<p class="non-info">Drag &amp; Drop</p>
									</div>
									<div class="attach-btn">
										<button type="button" class="btn btn-primary">Upload Files</button>
									</div>
								</div>
							</div>
						</section>
						<section class="sec-3">
							<header>
								<h4 class="sec-title">Drag &amp; Drop 후 리스트</h4>
							</header>
							<div class="sec-body">
								<div class="attach attached">
									<div class="drop-zone">
										<ul class="attach-list">
											<li><a href="#"><span class="attach-name">첨부파일입니다.</span><span class="attach-size">(1.68 MB)</span></a>
												<button type="button" class="btn">
													<i class="bi bi-x"><span class="sr-only">삭제</span></i>
												</button></li>
											<li><a href="#"><span class="attach-name">첨부파일입니다. 첨부파일입니다. 첨부파일입니다.</span><span class="attach-size">(1.68 MB)</span></a>
												<button type="button" class="btn">
													<i class="bi bi-x"><span class="sr-only">삭제</span></i>
												</button></li>
											<li><a href="#"><span class="attach-name">첨부파일입니다. 첨부파일입니다. 첨부파일입니다. 첨부파일입니다. 첨부파일입니다. 첨부파일입니다.</span><span class="attach-size">(1.68 MB)</span></a>
												<button type="button" class="btn">
													<i class="bi bi-x"><span class="sr-only">삭제</span></i>
												</button></li>
											<li><a href="#"><span class="attach-name">첨부파일입니다. 첨부파일입니다. 첨부파일입니다.</span><span class="attach-size">(1.68 MB)</span></a>
												<button type="button" class="btn">
													<i class="bi bi-x"><span class="sr-only">삭제</span></i>
												</button></li>
											<li><a href="#"><span class="attach-name">첨부파일입니다. 첨부파일입니다. 첨부파일입니다.</span><span class="attach-size">(1.68 MB)</span></a>
												<button type="button" class="btn">
													<i class="bi bi-x"><span class="sr-only">삭제</span></i>
												</button></li>
											<li><a href="#"><span class="attach-name">첨부파일입니다. 첨부파일입니다. 첨부파일입니다.</span><span class="attach-size">(1.68 MB)</span></a>
												<button type="button" class="btn">
													<i class="bi bi-x"><span class="sr-only">삭제</span></i>
												</button></li>
											<li><a href="#"><span class="attach-name">첨부파일입니다. 첨부파일입니다. 첨부파일입니다.</span><span class="attach-size">(1.68 MB)</span></a>
												<button type="button" class="btn">
													<i class="bi bi-x"><span class="sr-only">삭제</span></i>
												</button></li>
											<li><a href="#"><span class="attach-name">첨부파일입니다. 첨부파일입니다. 첨부파일입니다.</span><span class="attach-size">(1.68 MB)</span></a>
												<button type="button" class="btn">
													<i class="bi bi-x"><span class="sr-only">삭제</span></i>
												</button></li>
										</ul>
									</div>
									<div class="attach-btn">
										<button type="button" class="btn btn-primary">Upload Files</button>
									</div>
								</div>
							</div>
						</section>
					</div>
				</section>
				<!-- /END 첨부파일 -->


				<!-- 안내문 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">안내문</h2>
					</header>
					<div class="sec-body">
						<div class="message-box">
							<div class="message-box-inner">
								<div class="message-body">
									<ul class="list list-style-1">
										<li><span class="dfn">미확정</span> : 개설은 되었으나 학사과에서 확정하지 않은 교과목(수강신청이 불가하오니 개설학과로 문의하세요)</li>
										<li><span class="dfn">미지정</span> : 확정은 되었으나 시간표가 입력되어 있지 않은 교과목(제한사항이 걸려 있는 경우를 제외하고는 수강신청 가능)</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="message-box message-box-style-2">
							<div class="message-box-inner">
								<div class="message-header">
									<img src="/common/images/message_box_icon_01.svg" alt="">
								</div>
								<div class="message-body">
									<p>2022학년도 등록금 책정표를 고지하오니 다운로드 받아 참고하시기 바랍니다.</p>
									<div class="my-2">
										2022학년도 등록금 책정표 (게시일 2022.1.19.) <a class="link btn-sm" href="#">링크 바로가기</a>
									</div>
									<div class="my-2">
										정원외 외국인, 2022학년도 1학기 (게시일 2022.1.19.) <a class="btn btn-sm btn-primary" href="#">뷰어 <i class="bi bi-eye" aria-hidden="true"></i></a> <a class="btn btn-sm btn-primary" href="#">다운로드 <i class="bi bi-download" aria-hidden="true"></i></a>
									</div>
									<div class="my-2">
										정원외 외국인, 2022학년도 2학기 (게시일 2022.1.19.) <a class="btn btn-sm btn-primary" href="#">뷰어 <i class="bi bi-eye" aria-hidden="true"></i></a> <a class="btn btn-sm btn-primary" href="#">다운로드 <i class="bi bi-download" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
						</div>

						<div class="message-box message-box-style-1">
							<div class="message-box-inner">
								<div class="message-header">
									<span class="deco-icon">!</span> 주의사항
								</div>
								<div class="message-body">
									<p>2021학년도 1학기 대학원 수강편람 전 각 안내사항에 대해 참고해주시 바랍니다.</p>
									<p>2021학년도 1학기 대학원 수강편람 전 각 안내사항에 대해 참고해주시 바랍니다.</p>
									<p class="mb-0">2021학년도 1학기 대학원 수강편람 전 각 안내사항에 대해 참고해주시 바랍니다.</p>
								</div>
							</div>
						</div>

						<p class="info-text">
							<b>미확정</b> : 개설은 되었으나 학사과에서 확정하지 않은 교과목(수강신청이 불가하오니 개설학과로 문의하세요)
						</p>
						<p class="info-text info-text-style-1">
							<b>미확정</b> : 개설은 되었으나 학사과에서 확정하지 않은 교과목(수강신청이 불가하오니 개설학과로 문의하세요)
						</p>
						<p class="info-text info-text-style-2">
							<b>미확정</b> : 개설은 되었으나 학사과에서 확정하지 않은 교과목(수강신청이 불가하오니 개설학과로 문의하세요)
						</p>
					</div>
				</section>
				<!-- /END 안내문 -->

				<!-- 리스트 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">리스트</h2>
					</header>
					<div class="sec-body">
						<section class="sec-3">
							<header>
								<h3 class="sec-title">.list.list-style-1</h3>
							</header>
							<div class="sec-body">
								<ul class="list list-style-1">
									<li>회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정이용 방지와 비인가 사용방지, 가입의사 확인, 연령확인, 분쟁 조정을 위한 기록 보존, 불만처리 등 민원처리, 고지사항 전달 등을 목적으로 개인정보를 처리합니다.</li>
									<li>입시전형 업무, 신입생 선발, 학사관리 및 학교행정 업무 등</li>
									<li>장애학생 지원, 장학금 업무, 도서 대출 반납 및 이용자 관리, 생활관생 관리, 수강생 학사관리(평생교육원, 보육교사교육원 등), 취업 지원, 학자금 대출 등</li>
								</ul>
							</div>
						</section>
						<section class="sec-3">
							<header>
								<h3 class="sec-title">.list.list-style-2</h3>
							</header>
							<div class="sec-body">
								<ul class="list list-style-2">
									<li>회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정이용 방지와 비인가 사용방지, 가입의사 확인, 연령확인, 분쟁 조정을 위한 기록 보존, 불만처리 등 민원처리, 고지사항 전달 등을 목적으로 개인정보를 처리합니다.</li>
									<li>입시전형 업무, 신입생 선발, 학사관리 및 학교행정 업무 등</li>
									<li>장애학생 지원, 장학금 업무, 도서 대출 반납 및 이용자 관리, 생활관생 관리, 수강생 학사관리(평생교육원, 보육교사교육원 등), 취업 지원, 학자금 대출 등</li>
								</ul>
							</div>
						</section>
					</div>
				</section>
				<!-- /END 리스트 -->

				<!-- 버튼 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">버튼</h2>
					</header>
					<div class="sec-body">
						<section class="sec-3 mb-3">
							<header>
								<h3 class="sec-title">기본</h3>
							</header>
							<div class="sec-body">
								<div class="form-row align-items-center">
									<div class="col-auto">
										<button class="btn btn-primary mb-2">.btn-primary</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-secondary mb-2">.btn-secondary</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-success mb-2">.btn-success</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-danger mb-2">.btn-danger</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-warning mb-2">.btn-warning</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-light mb-2">.btn-light</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-dark mb-2">.btn-dark</button>
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3 mb-3">
							<header>
								<h3 class="sec-title">작은 버튼</h3>
							</header>
							<div class="sec-body">
								<div class="form-row align-items-center">
									<div class="col-auto">
										<button class="btn btn-sm btn-primary mb-2">.btn-primary</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-sm btn-secondary mb-2">.btn-secondary</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-sm btn-success mb-2">.btn-success</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-sm btn-danger mb-2">.btn-danger</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-sm btn-warning mb-2">.btn-warning</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-sm btn-light mb-2">.btn-light</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-sm btn-dark mb-2">.btn-dark</button>
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3 mb-3">
							<header>
								<h3 class="sec-title">큰 버튼</h3>
							</header>
							<div class="sec-body">
								<div class="form-row align-items-center">
									<div class="col-auto">
										<button class="btn btn-lg btn-primary mb-2">.btn-primary</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-lg btn-secondary mb-2">.btn-secondary</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-lg btn-success mb-2">.btn-success</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-lg btn-danger mb-2">.btn-danger</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-lg btn-warning mb-2">.btn-warning</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-lg btn-light mb-2">.btn-light</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-lg btn-dark mb-2">.btn-dark</button>
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3 mb-3">
							<header>
								<h3 class="sec-title">버튼 outline</h3>
							</header>
							<div class="sec-body">
								<div class="form-row align-items-center">
									<div class="col-auto">
										<button class="btn btn-outline-primary mb-2">.btn-primary</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-outline-secondary mb-2">.btn-secondary</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-outline-success mb-2">.btn-success</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-outline-danger mb-2">.btn-danger</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-outline-warning mb-2">.btn-warning</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-outline-light mb-2">.btn-light</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-outline-dark mb-2">.btn-dark</button>
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3 mb-3">
							<header>
								<h3 class="sec-title">시스템 버튼</h3>
							</header>
							<div class="sec-body">
								<div class="form-row align-items-center">
									<div class="col-auto">
										<button class="btn btn-search mb-2">조회</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-new mb-2">신규</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-modify mb-2">수정</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-delete mb-2">삭제</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-save mb-2">저장</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-etc mb-2">기타</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-print mb-2">출력</button>
									</div>
								</div>
							</div>
						</section>

					</div>
				</section>
				<!-- /END 버튼 -->

				<!-- 폰트 컬러 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">폰트 컬러</h2>
					</header>
					<div class="sec-body">
						<p class="text-primary">폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.</p>
						<p class="text-secondary">폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.</p>
						<p class="text-success">폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.</p>
						<p class="text-danger">폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.</p>
						<p class="text-warning">폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.</p>
						<p class="text-light">폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.</p>
						<p class="text-dark">폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.폰트컬러입니다.</p>
					</div>
				</section>
				<!-- /END 폰트 컬러 -->


				<!-- 아이콘 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">아이콘</h2>
					</header>
					<div class="sec-body">
						<a class="link link-style-1 mb-3" href="https://icons.getbootstrap.com/" target="_blank">부트스트랩 아이콘 참고</a><br>
						<div class="row text-center">
							<div class="col h3">
								<i class="bi bi-alarm"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-bar-chart"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-bell"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-book" aria-hidden="true"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-bookmark-check-fill"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-briefcase"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-calendar-check"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-chat-dots-fill"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-chat-right-text-fill"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-check-circle-fill"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-check2-square"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-star"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-display" aria-hidden="true"></i>
							</div>
							<div class="w-100"></div>
							<div class="col h3">
								<i class="bi bi-arrow-right-circle"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-arrow-right-circle-fill"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-envelope"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-folder"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-geo-alt" aria-hidden="true"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-info-circle"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-journal-arrow-down"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-key"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-link-45deg"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-lock"><span class="sr-only">비밀글</span></i>
							</div>
							<div class="col h3">
								<i class="bi bi-pencil-square"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-printer"></i>
							</div>
							<div class="col h3">
								<i class="bi bi-shield-lock-fill"></i>
							</div>
							<div class="w-100"></div>
						</div>
					</div>
				</section>
				<!-- /END 폰트 컬러 -->

				<!-- 아코디언 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">아코디언</h2>
					</header>
					<div class="sec-body">
						<a class="link link-style-1 mb-3" href="https://getbootstrap.com/docs/4.6/components/collapse/#accordion-example" target="_blank">부트스트랩 아코디언 참고</a>

						<div class="accordion">
							<div class="card">
								<div class="card-header" id="heading1">
									<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true" data-controls="collapse1">item #1</button>
								</div>
								<div id="collapse1" class="collapse show" aria-labelledby="heading1">
									<div class="card-body">
										<ul class="list list-style-1">
											<li>회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정이용 방지와 비인가 사용방지, 가입의사 확인, 연령확인, 분쟁 조정을 위한 기록 보존, 불만처리 등 민원처리, 고지사항 전달 등을 목적으로 개인정보를 처리합니다.</li>
											<li>입시전형 업무, 신입생 선발, 학사관리 및 학교행정 업무 등</li>
											<li>장애학생 지원, 장학금 업무, 도서 대출 반납 및 이용자 관리, 생활관생 관리, 수강생 학사관리(평생교육원, 보육교사교육원 등), 취업 지원, 학자금 대출 등</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="heading2">
									<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse2" data-expanded="false" data-controls="collapse2">item #2</button>
								</div>
								<div id="collapse2" class="collapse" aria-labelledby="heading2">
									<div class="card-body">
										<ul class="list list-style-1">
											<li>회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정이용 방지와 비인가 사용방지, 가입의사 확인, 연령확인, 분쟁 조정을 위한 기록 보존, 불만처리 등 민원처리, 고지사항 전달 등을 목적으로 개인정보를 처리합니다.</li>
											<li>입시전형 업무, 신입생 선발, 학사관리 및 학교행정 업무 등</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="heading3">
									<button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse3" data-expanded="false" data-controls="collapse3">item #3</button>
								</div>
								<div id="collapse3" class="collapse" aria-labelledby="heading3">
									<div class="card-body">
										<ul class="list list-style-1">
											<li>회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정이용 방지와 비인가 사용방지, 가입의사 확인, 연령확인, 분쟁 조정을 위한 기록 보존, 불만처리 등 민원처리, 고지사항 전달 등을 목적으로 개인정보를 처리합니다.</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- /END 아코디언 -->

				<!-- 탭 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">탭</h2>
					</header>
					<div class="sec-body">
						<ul class="nav nav-pills" role="tablist">
							<li class="nav-item" role="presentation"><a class="nav-link active" id="tab1" data-toggle="tab" href="#tab-cont1" role="tab" data-controls="home" data-selected="true">개인정보의 처리 목적</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link" id="tab2" data-toggle="tab" href="#tab-cont2" role="tab" data-controls="profile" data-selected="false">개인정보의 처리 및 보유 기간</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link" id="tab3" data-toggle="tab" href="#tab-cont3" role="tab" data-controls="contact" data-selected="false">개인정보의 제3자 제공</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="tab-cont1" role="tabpanel" aria-labelledby="tab1">부산대학교는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.</div>
							<div class="tab-pane fade" id="tab-cont2" role="tabpanel" aria-labelledby="tab2">부산대학교가 개인정보 보호법 제32조에 따라 등록‧공개하는 개인정보파일의 처리목적, 항목, 보유기간 등은 아래의 방법으로 확인할 수 있습니다.</div>
							<div class="tab-pane fade" id="tab-cont3" role="tabpanel" aria-labelledby="tab3">부산대학교는 원칙적으로 이용자의 개인정보를 제1조에서 명시한 범위 내에서 처리하며, 이용자의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.</div>
						</div>
					</div>
				</section>
				<!-- /END 탭 -->

				<!-- 단계 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">단계</h2>
					</header>
					<div class="sec-body">
						<ol class="flow-list">
							<li>
								<div class="txt-box">
									<strong>01. 접수</strong> 2022-02-18 13:20:50
								</div>
							</li>
							<li>
								<div class="txt-box">
									<strong>02. 서류등록</strong> 2022-02-18 13:20:50
								</div>
							</li>
							<li>
								<div class="txt-box">
									<strong>03. 학과승인/반려</strong> <span class="badge badge-primary mr-2">승인</span> 2022-02-18 13:20:50<br> <span class="badge badge-warning mr-2">반려</span> 2022-02-18 13:20:50
								</div>
							</li>
							<li>
								<div class="txt-box">
									<strong>04. 학과승인/반려</strong> 2022-02-18 13:20:50
								</div>
							</li>
							<li class="disabled">
								<div class="txt-box">
									<strong>05. 최종승인/반려</strong> 비활성화 상태입니다.
								</div>
							</li>
						</ol>
					</div>
				</section>
				<!-- /END 단계 -->

				<!-- 화면 분할 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">화면분할</h2>
					</header>
					<div class="sec-body">
						<a class="link link-style-1 mb-3" href="https://getbootstrap.com/docs/4.6/layout/grid/" target="_blank">부트스트랩 참고</a>
						<section class="sec-3">
							<header>
								<h2 class="sec-title">
									<strong>"col"</strong>의 갯수 만큼 자동으로 한줄에 표현
								</h2>
							</header>
							<div class="sec-body">
								<div class="row">
									<div class="col">
										<p class="bg-light p-3">첫번째 영역</p>
									</div>
									<div class="col">
										<p class="bg-light p-3">두번째 영역</p>
									</div>
									<div class="col">
										<p class="bg-light p-3">세번째 영역</p>
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3">
							<header>
								<h2 class="sec-title">
									<strong>"col-*"</strong>의 뒤의 숫자만큼 영역을 잡습니다.
								</h2>
							</header>
							<div class="sec-body">
								<div class="row">
									<div class="col-6">
										<p class="bg-light p-3">첫번째 영역</p>
									</div>
									<div class="col-6">
										<p class="bg-light p-3">두번째 영역</p>
									</div>
									<div class="col-5">
										<p class="bg-light p-3">세번째 영역</p>
									</div>
									<div class="col-3">
										<p class="bg-light p-3">네번째 영역</p>
									</div>
									<div class="col-4">
										<div class="bg-light p-3">
											<div class="row">
												<div class="col-2">5-1</div>
												<div class="col-8">5-2</div>
												<div class="col-2">5-3</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

						<section class="sec-3">
							<header>
								<h2 class="sec-title">
									col 사이의 간격이 필요없을 경우 "row"와 동일한 영역에 <strong>"no-gutters"</strong> class 추가
								</h2>
							</header>
							<div class="sec-body">
								<div class="row no-gutters">
									<div class="col-7">
										<p class="bg-light p-3">첫번째 영역</p>
									</div>
									<div class="col-3">
										<p class="bg-light p-3">두번째 영역</p>
									</div>
									<div class="col-2">
										<p class="bg-light p-3">세번째 영역</p>
									</div>
								</div>
							</div>
						</section>

					</div>
				</section>
				<!-- /END 화면분할 -->

				<!-- 기타 -->
				<section class="sec-2">
					<header>
						<h2 class="sec-title">기타</h2>
					</header>
					<div class="sec-body">
						<section class="sec-3">
							<header>
								<h2 class="sec-title">링크</h2>
							</header>
							<div class="sec-body">
								<div class="form-row">
									<div class="col-auto">
										<a class="link mr-2" href="#">바로가기</a>
									</div>
									<div class="col-auto">
										<a class="link link-style-1" href="#">바로가기</a>
									</div>
								</div>
							</div>
						</section>
					</div>
				</section>
				<!-- /END 기타 -->
			</div>
		</section>
	</main>
</div>