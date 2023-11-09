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
				<section class="sec-2">
					<div class="sec-body">
						<section class="sec-3">
							<div class="sec-body">
								<div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
									<div class="b-row-box" role="row">
										<div class="b-row-item merge-3">
											<div class="b-title-box" role="rowheader">소속(과정)</div>
											<div class="b-con-box" role="cell" id="UPPER_ASSIGN_NM"></div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학번(성명)</div>
											<div class="b-con-box" role="cell" id="NM"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학년(학기)</div>
											<div class="b-con-box" role="cell" id="STDT_YEAR_GCD"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">학적상태</div>
											<div class="b-con-box" role="cell" id="HJ_STA_GCD_KOR_NM"></div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">주전공</div>
											<div class="b-con-box" role="cell" id="MAJOR_KOR_NM"></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">부전공</div>
											<div class="b-con-box" role="cell" id="MINOR_KOR_NM "></div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">연합전공</div>
											<div class="b-con-box" role="cell" id="UNITED_MAJOR_KOR_NM"></div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">복수전공</div>
											<div class="b-con-box" role="cell" id="DOUBLE_MAJOR_KOR_NM"></div>
										</div>
										<div class="b-row-item merge-2 b-blank">
										</div>
									</div>
								</div>
							</div>
						</section>						
						<section class="sec-3">
							<div class="sec-body">
								<div class="message-box">
										<div class="message-box-inner">
											<div class="message-body text-center" id = "sch_result">
												
											</div>
										</div>
									</div>
							</div>
						</section>
						<section class="sec-3">
							<div class="sec-body">
								<div class="message-box">
									<div class="message-box-inner">
										<div class="message-body">
											<ul class="list list-style-1">
												<li>위 졸업사정 결과에 이상이 있을 경우 해당 학과 사무실 또는 단과대학으로 바로 문의하여 주시기 바랍니다.</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</section>
			</div>
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">

</script>
<script type="text/javascript">
	var totalCnt = 0;
	const ajaxUrl = '/ost/jolup/hakbujolupguide/jolupevaltnresult';
	
	function fn_initScreen() {
		$("#NM").text(scwin.loginUser.userId+'('+scwin.loginUser.nm+')');
		
		if(scwin.loginUser.degCourseGcd=="0001"){			
			if(scwin.loginUser.userGcd == "0003") {
				$("#STDT_YEAR_GCD").text(scwin.loginUser.stdtYearGcdKorNm);
				$("#UPPER_ASSIGN_NM").text(scwin.loginUser.collCdKorNm+ ' ' +scwin.loginUser.assignNm);
			}else {
				$("#STDT_YEAR_GCD").text("");
				$("#UPPER_ASSIGN_NM").text(scwin.loginUser.assignNm);
			}
		}else{
			
			if(scwin.loginUser.userGcd == "0003") {
				$("#STDT_YEAR_GCD").text(scwin.loginUser.atlectTermCnt+"학기");
				$("#UPPER_ASSIGN_NM").text(scwin.loginUser.collCdKorNm+ ' ' +scwin.loginUser.assignNm+' ('+scwin.loginUser.degCourseGcdKorNm+')');
			}else {
				$("#STDT_YEAR_GCD").text("");
				$("#UPPER_ASSIGN_NM").text(scwin.loginUser.assignNm);
			}
		}
		$("#HJ_STA_GCD_KOR_NM").text(scwin.loginUser.hjStaGcdKorNm);		
		$("#MAJOR_KOR_NM").text(scwin.loginUser.majorCdKorNm);
		$("#MINOR_KOR_NM").text(scwin.loginUser.minorKorNm);
		$("#DOUBLE_MAJOR_KOR_NM").text(scwin.loginUser.doubleMajorKorNm);
		$("#UNITED_MAJOR_KOR_NM").text(scwin.loginUser.unitedMajorKorNm );
		
		fn_sch();
	}
	
	function fn_sch(data) {
		/* ajax처리 */
		gfn_ajax_request({	
			url : ajaxUrl + "/selectListJolupEvaltnResult",
			reqData : data,
			success : function(data, responseData) {   
				$('#sch_result').html(data[0].O_MSG);
		    }
		});
	}
</script>