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
				<!-- 기본정보 START -->
				<div id="table">
					<section class="sec-3">
						<header>
							<h4 class="sec-title">기본정보</h4>
						</header>
						<div class="sec-body">
							<div class="b-table-box" role="table" aria-label="2단 테이블">
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>학번/교번</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: STDT_NO" ></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>성명</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: NM" ></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>주민번호</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text:SSN"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>학년/학기</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: STDT_YEAR_GCD_NM"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>상태</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: COMPNT_STA_GCD_NM"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>소속</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: ASSIGN_NM"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item merge-2">
										<div class="b-title-box" role="rowheader">
											<label>우편번호</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: ZIP_NO"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item merge-2">
										<div class="b-title-box" role="rowheader">
											<label>주소</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: ADDR"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item merge-2">
										<div class="b-title-box" role="rowheader">
											<label>상세주소</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: DETAIL_ADDR"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>전화번호</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: TEL_NO"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>핸드폰</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: CELLULAR_NO"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item merge-2">
										<div class="b-title-box" role="rowheader">
											<label>E-MAIL</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: EMAIL"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- 기본정보 END -->
					<!-- 병역정보 START -->
					<section class="sec-3">
						<header>
							<h4 class="sec-title">병역정보</h4>
						</header>
						<div class="sec-body">
							<div class="b-table-box" role="table" aria-label="병역정보 테이블">
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>군번</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: MIL_NO"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>역종</label>
										</div>
										<div class="b-con-box" role="cell">
											<div class="input-group">
												<span data-bind="text: MIL_SERVE_SHAPE_GCD_NM"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>군별</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: MIL_CLASS_GCD_NM"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>계급</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: MIL_END_RANK_GCD_NM"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>병과</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: MAIN_SPECIAL_ABILITY_CD"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>전역구분</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: MIL_END_GCD_NM"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>입대일자</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: MIL_START_DATE"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>전역일자</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: MIL_END_DATE"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>신분</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: STNDING_GCD_NM"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>신고사유</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: MOVEIN_GCD_NM"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>신고일</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: APPLY_DATE"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>전입일</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: MOVEIN_DATE"></span>
										</div>
									</div>
								</div>
								<div class="b-row-box" role="row">
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>예비군소속</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: YB_COMPNT_ASSIGN_NO"></span>
										</div>
									</div>
									<div class="b-row-item">
										<div class="b-title-box" role="rowheader">
											<label>편성직책</label>
										</div>
										<div class="b-con-box" role="cell">
											<span data-bind="text: YB_JC_GCD_NM"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- 병역정보 END -->
				</div>
		</section>
</div>
</main>
</div>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	var paramData = {};

	function fn_initScreen() {
		fn_initChk();
	}

	// 재학 여부 체크
	function fn_initChk() {
		var hjStaGcd = scwin.loginUser.hjStaGcd;;

		if (hjStaGcd != "0001") {
			alert2("재학생이 아니므로 편성 정보를 조회할 수 없습니다.",function (e){selectMenu("000000000000239");});
			return false;
		}
		fn_milChk();
	}
	
	// 병역정보 체크
	function fn_milChk() {
		gfn_ajax_request({
			url : "/ost/mil/ybCompnStaSearch/selectYbMilInfo",
			reqData : paramData,
			success : function(data, responseData) {
				if(!gfn_com_isEmptyObject(data)) {
					var sRslt = data.O_RSLT;
					var sMsg = data.O_MSG;

					if(sRslt == "Y") {
						fn_ybCompnStaChk();
					}else {
						alert2(sMsg,function (e){selectMenu("000000000000130");});
						return;
					}
				}

			}
		});

	}
	
	// 예비군편성상태 체크
	function fn_ybCompnStaChk() {
		gfn_ajax_request({
			url : "/ost/mil/ybCompnStaSearch/selectYbCompnSta",
			reqData : paramData,
			success : function(data, responseData) {
				if(!gfn_com_isEmptyObject(data)) {
					var sRslt = data.O_RSLT;
					var sMsg = data.O_MSG;

					if(sRslt == "Y") {
						alert(sMsg);
						fn_sch();
					}else {
						alert2(sMsg,function (e){selectMenu("000000000000130");});
						return;
					}
				}

			}
		});

	}

	function fn_sch(data) {

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/mil/ybCompnStaSearch/selectListYbCompnSta",
			reqData : paramData,
			success : function(data, responseData) {
				if(!gfn_com_isEmptyObject(data)) {
					
					// 세션 값 추가
					data.STDT_NO = scwin.loginUser.userId;
					data.NM = scwin.loginUser.nm;
					data.ASSIGN_NM = scwin.loginUser.assignNm;
					
					gfn_com_dataBind($("#table"), data);
				}
			}
		});
	}
</script>