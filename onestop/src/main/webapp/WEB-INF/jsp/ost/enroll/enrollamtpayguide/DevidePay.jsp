<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title">분할납부 신청</h2>
				</div>
				<div class="header-item"></div>
			</header>
			<div class="sec-body">
				<!-- sec-2 -->
				<section class="sec-2">
					
					<div class="accordion mb-4">
					
						<div class="card" id = "content"></div>
							<div class="card">
								<div class="card-header" id="heading2">
									<button data-controls="collapse2" data-expanded="true" class="btn btn-block text-left collapsed" data-target="#collapse2" data-toggle="collapse" type="button">분할납부 신청</button>
								</div>
	
								<div aria-labelledby="heading2" class="collapse show" id="collapse2">
									<div class="card-body">
										<!-- 메세지 박스 -->
										<div class="message-box">
											<div class="message-box-inner">
												<div class="message-body">
													<ul class="list list-style-1 ml-2 mt-2 mb-2">
														<li id="divReg">아래 버튼을 눌러 신청 및 신청내역을 확인하시기 바랍니다.</li>
													</ul>
												</div>
											</div>
										</div>
										<!-- END 메세지 박스 -->
										
										<div class="btn-box">
											<div class="form-row justify-content-center">
												<div class="col-auto">
													<button class="btn btn-success mr-2 mt-2" id="btnApply" type="button" onclick="fn_openPopupApply()" data-lang style="display:none;">분할납부신청</button>
												</div>
												<div class="col-auto">
													<button class="btn btn-primary mr-2 mt-2" id="btnApplyConfirm" type="button" onclick="fn_openPopupApplyConfirm()" data-lang style="display:none;">신청내역확인</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- /END sec-2 -->
			</div>
		</section>
	</main>
</div>
<!-- 다중전공신청내역목록 -->
<script type="text/javascript">
	function fn_initScreen() {
		var content;
		var searchParam = {
				"SYSTEM_GCD" : scwin.menuInfo.SYSTEM_GCD,
				"MENU_CD" : scwin.menuInfo.MENU_CD
			};
			gfn_ajax_request({
				url : "/ost/enroll/enrollamtpayguide/devidepay/selectListDevidePayContent",
				reqData : searchParam,
				success : function(data, responseData) {
					if(scwin.loginUser.langGcd =="0001"){
						content = data.KOR_CONTENT;
					}else if(scwin.loginUser.langGcd =="0002"){
						content = data.ENG_CONTENT;
					}else{
						content = data.CHN_CONTENT;
					}
					$("#content").html(content);
				}
			});
		
		setInit();
		//$("#btnApplyConfirm").hide();
	}
	

	/*  팝업창 로드 시 초기설정 함수 */
	function setInit() {

 		if(scwin.loginUser.nm == ''){
			$("#divReg").text("인터넷 분할납부 신청 및 정보조회는 로그인 한 후 사용할 수 있습니다.");
			return;
		}
		if(!(scwin.loginUser.collGradGcd == "0001" || scwin.loginUser.collGradGcd == "0002")){
			$("#divReg").text("타대생(대학원생)이나 교직원은 사용할 수 없습니다.");
			return;
		}
		if(!(scwin.loginUser.hjStaGcd == "0001" || scwin.loginUser.hjStaGcd == "0002" || scwin.loginUser.hjStaGcd == "0003")){
			$("#divReg").text("현재 재적생에 한해 분할 납부신청이 가능합니다!");
			return;
		}

		fn_chkTuition(); 
	}

	/* 등록금조회 */
	function fn_chkTuition() {
		var searchParam = {
			"SYEAR" : scwin.termInfo.SYEAR,
			"TERM_GCD" : scwin.termInfo.TERM_GCD
		};
		gfn_ajax_request({
			url : "/ost/enroll/enrollamtpayguide/devidepay/selectChkTuition",
			reqData : searchParam,
			success : function(data, responseData) {
				if(!gfn_com_isEmptyObject(data)){
					fn_chkApply(data, "0");
				}else{
					$('#divReg').html("분할납부 대상자가 아닙니다.");
					
				}
			}
		});
		
	}

	/* 가능기간 조회 */
	function fn_chkApply(dt, type) {
		//var param = gfn_com_inputdata($("#popups"));
		var param = {};
		gfn_ajax_request({
			url : "/ost/enroll/enrollamtpayguide/devidepay/selectChkApply",
			reqData : param,
			success : function(data, responseData) {

				if(!gfn_com_isEmptyObject(data)){
					if(data.신청가능날짜 =="불가"){
						$("#btnApplyConfirm").show();
					}else{
						if(gfn_com_isEmptyObject(dt)){
							if(data.신청가능날짜  == "가능"){
								$("#btnApply").show();
								$("#btnApplyConfirm").show();
							}else{
								$('#divReg').html("신청기간이 아닙니다.");
							}
						}else{
							if(dt.PAY_PROCESS_GCD == "등록"){
								$('#divReg').html("해당 학기 등록금 납부자는 분할신청 할 수 없습니다!");
							}else{
								if(dt.ZERO_FG == "제로"){
									$('#divReg').html("해당 학기 제로(0원)고지자는 분할신청 할 수 없습니다!");
								}else{
									if(dt.APLLY_FG  == "가능"){
										$("#btnApply").show();
										$("#btnApplyConfirm").hide();
									}else if(dt.APLLY_CONFRIM_FG  == "가능"){
										$("#btnApply").hide();
										$("#btnApplyConfirm").show();
									}else{
										$('#divReg').html("등록 값이 없습니다");
										$("#btnApply").hide();
										$("#btnApplyConfirm").hide();
									}
								}
							}
						}
					} 
					
				}else{
					$('#divReg').html("신청기간이 아닙니다.");
				}
			}
		});
	}
	
	/* 신청 팝업 */
	function fn_openPopupApply() {
		gfn_com_modalPopup({
			width : 1200,
			height : 800,
			index : 1,
			target : null,
			title : "분할납부신청",
			include : "/html/ost/enroll/enrollamtpayguide/DevidePayPop.html"
		});
	}
	
	/* 신청 팝업 */
	function fn_openPopupApplyConfirm() {
		gfn_com_modalPopup({
			width : 1200,
			height : 800,
			index : 1,
			target : null,
			title : "분할납부신청확인",
			include : "/html/ost/enroll/enrollamtpayguide/DevidePayConfirmPop.html"
		});
	}

</script>