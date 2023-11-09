
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
				<!-- 메시지 박스: 신청기간 -->
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<label id="APPLY_DT" style="color: blue;"> </label>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->
				<!-- 검색 영역 -->
				<div class="accordion">
					<div class="card">
						<div class="card-header" id="heading1">
							<button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true" data-controls="collapse1">통학버스 신청</button>
						</div>
						<div id="collapse1" class="collapse show" aria-labelledby="heading1">
							<div class="search-box">
								<div class="" id="">
									<label class="text-left dfn ml-2 mt-2">● 기본정보</label>
								</div>
								<div class="b-table-box flex-col-3" role="table" aria-label="조회">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label class="" data-lang>학번</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="STDT_NO"></label>
											</div>
										</div>
										<div class="b-row-item merge-2">
											<div class="b-title-box" role="rowheader">
												<label class="" data-lang>학과</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="DEPT_NM"></label>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>성명</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="NM"></label>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>자택전화</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="TELL_NO"></label>
											</div>
										</div>
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>휴대전화</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="PHONE_NO"></label>
											</div>
										</div>
									</div>
								</div>
								<!-- /END 검색 영역 -->

								<!-- 신청목록  -->
								<div class="" id="">
									<label class="text-left dfn ml-2 mt-2">● 신청목록</label> <br> <input type="hidden" id="sic_num" name="sic_num"> <label class="text-left dfn ml-2" style="color: blue;" id="APPLY_INFO"></label>
								</div>
								<div class="b-table-box flex-col-1" role="table" aria-label="입력">
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box " role="rowheader">
												<label class="req" data-lang>탑승정보</label>
											</div>
											<!-- 테이블 -->
											<div class="b-con-box bus-table" role="cell" >
											
											<div class="table-box" style="width:100%">
												<div class="table-body">
													<table class="table table-hover" data-toggle="table"  data-show-column="true">
														<caption>통학버스 탑승정보</caption>
														<colgroup>
															<col style="min-width: 30px;">
															<col style="min-width: 150px;">
															<col style="min-width: 50px;">
															<col style="min-width: 130px;">
															<col style="min-width: 170px;">
															<col style="min-width: 130px;">
															<col style="min-width: 170px;">
														</colgroup>
														<thead>
															<tr>
																<th scope="col"></th>
																<th scope="col">탑승일자</th>
																<th scope="col">신청여부</th>
																<th scope="col">등교시간</th>
																<th scope="col">등교장소</th>
																<th scope="col">하교시간</th>
																<th scope="col">하교장소</th>
															</tr>
														</thead>
														<tbody id="resultTbody">
														</tbody>
													</table>
												</div>
											</div>
											
											</div>
											<!-- /END 테이블 -->
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>요금정보</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="PAY_INFO"></label> <br> <label id="" style="color: blue;">※ 신청 후 요금정보가 조회됩니다.</label>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label data-lang>환불계좌</label>
											</div>
											<div class="b-con-box" role="cell">
												<label id="REFUND_ACCT"></label>
											</div>
										</div>
									</div>
									<div class="b-row-box" role="row">
										<div class="b-row-item">
											<div class="b-title-box" role="rowheader">
												<label class="" data-lang>사진정보</label>
											</div>
											<div class="b-con-box" role="cell">
												<img id="stdtImg" src="/common/images/no_img.png" width="98px" height="118px" alt="이미지없음"/>
												<form id="frm_schoolBusImage" method="post" enctype="multipart/form-data" action="/ost/bus/busapply/saveStdtPhoto.do">
													<input type="file" id="file_Upload" name="file_schoolBusImg" accept=".jpg,.png,.gif,.bmp"  title="학생사진정보 업로드"/>
												</form>
											</div>
									</div>
								</div>
								<!-- 메시지 박스: 밑에 설명글 -->
								<div class="message-box">
									<div class="message-box-inner">
										<div class="message-body">
											<ul class="list list-style-1">
												<li>신청 후 이용일수 및 이용요금 확인 할 것</li>
												<li><strong style="color: red;">수납기간 내 반드시 고지서 출력 후 이용요금 납부</strong> 할 것(미수납 시 신청내역 취소 예정)</li>
												<li>수납 확인자에 한해 모바일 통학증 발급예정</li>
												<li><strong style="color: red;">반드시 신청내역(요일 및 시간 등)에 맞게 통학버스를 이용</strong>하여야 하며, 통학버스 부정 이용 적발 시 승차제한 등 통학버스 이용에 제한이 따를 수 있음</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- /END 메시지 박스 -->
								<!-- 버튼 -->
								<div class="btn-box">
									<div class="form-row btn-box-right">
										<div id="btn_save" class="col-auto">
											<button class="btn btn-primary" type="button" onclick="javascript:return fn_Update();" data-lang>신청</button>
										</div>
										<div id="btn_cancel" class="col-auto">
											<button class="btn btn-primary cancel-btn" type="button" onclick="javascript:return fn_cancelDetail();" data-lang>삭제</button>
										</div>
										<div id="btn_enter" class="col-auto">
											<button class="btn btn-primary" type="button" onclick="fn_print()"  data-lang>고지서출력</button>
										</div>
									</div>
								</div>
								<!-- /END 버튼 -->
							</div>
						</div>
						<!-- /END 신청목록 -->
					</div>
				</div>
			</div>
			</div>
		</section>
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>
			<input class="CHK" type="checkbox" name="CHK" onclick="fn_chkOnclick(this);" title="#:GETON_DAY_DATE_TITLE#">
		</td>
	    <td class="text-left GETON_DAY_DATE">#:GETON_DAY_DATE#</td>
	    <td class="text-left CONF_FG">#:CONF_FG#</td>
		<td>
			<select id="GOSCH_TIME_CD" class="form-control GOSCH_TIME_CD" onchange="fn_onchangeCd(this);" title="등교시간선택"><option value="">선택</option></select>
		</td>
		<td>
			<select id="GOSCH_LOCATION_CD" class="form-control GOSCH_LOCATION_CD" onchange="fn_onchangeCd(this);" title="등교장소선택"><option value="">선택</option></select>
		</td>
		<td>
			<select id="AFTERSCH_TIME_CD" class="form-control AFTERSCH_TIME_CD" onchange="fn_onchangeCd(this);" title="하교시간선택"><option value="">선택</option></select>
		</td>
		<td>
			<select id="AFTERSCH_LOCATION_CD" class="form-control AFTERSCH_LOCATION_CD" onchange="fn_onchangeCd(this);" title="하교장소선택"><option value="">선택</option></select>
		</td>
	</tr>
</script>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/javascript">
	/***************************************************************************
	 * 변수
	 **************************************************************************/
	var totalCnt = 0;
	var initData = {};
	var busList = [];
	var getonDatefirst = "";
	var weekday = "";
	var applySerialNo = 0;
	var cancelChasuCd = "";
	var timeLocationChgData = {};

	var stdtNo = scwin.loginUser.userId;
	var nm = scwin.loginUser.nm;
	var assignNm = scwin.loginUser.assignNm;
	var telNo = scwin.loginUser.telNo;
	var phoneNo = scwin.loginUser.cellularNo;

	var imgResult = "";
	var pic = [];
	
	
	// 첨부파일 업로드제한 임의
	$("input[id=file_Upload]").change(function(){
	    
	    var ext = $(this).val().split(".").pop().toLowerCase();
	    if($.inArray(ext,["gif","jpg","jpeg","png","bmp"]) == -1) {
	        alert("gif, jpg, jpeg, png, bmp 파일만 업로드 해주세요.");
	        $("input[id=file_Upload]").val("");
	        return;
	    }
	    
	    var fileSize = this.files[0].size;
	    var maxSize = 5 * 1024 * 1024;
	    if(fileSize > maxSize) {
	        alert("첨부파일은 5MB 이하로 첨부 바랍니다.");
	        $("input[id=file_Upload]").val("");
	        return;
	    }
	    
	    var file  = this.files[0];
	    var _URL = window.URL || window.webkitURL;
	    var img = new Image();
	    
	    /*
	    img.src = _URL.createObjectURL(file);
	    img.onload = function() {
	        
	        if(img.width != 720 || img.height != 270) {
	            alert("이미지 가로 720px, 세로 270px로 맞춰서 올려주세요.");
	            $("input[id=file1]").val("");
	        } 
	    }
	    */
	});


	/***************************************************************************
	 * onpageload
	 **************************************************************************/
	function fn_initScreen() {
		var perMsg = ""; 
        perMsg = "&lt 통학버스 <strong>서면노선 변경</strong> 운영에 따른 10월 신청 안내 &gt</strong><br/>";
        perMsg += "○ 2023.10월부터 부산-밀양캠퍼스 <strong>통학버스 서면노선</strong>은 <strong>7:40 등교시간대만 운영</strong>되며, <strong>그 외 시간대는 운영이 중단</strong>될 예정입니다.<br/>";
        perMsg += "○ 10월 통학버스 신청 학생께서는 <strong style='color: blue;'>7:40 등교시간 외의 서면노선은 신청 불가</strong>한 점 착오 없으시길 바랍니다.<br/>";
        perMsg += "※ 서면노선 변경사항을 반영한 전산시스템은 1개월의 시범운영기간을 거쳐 11월 신청 시부터 적용할 예정입니다. <br/>";
        perMsg += "문의: 051-510-1255 ";
        //alert2(perMsg); 학생과 송륜화 요청 얼럿창 해제
        
		fn_setInit();
		fn_getPhoto();

	}
	/***************************************************************************
	 * fn_setInit
	 **************************************************************************/
	function fn_setInit() {
		fn_getInitInfo(); //신청년도학기 조회

		$("#file_Upload").change(function() {
			//fileNameCheckImg($("#file_schoolBusImg").val());
			imageReadShow(this);
		});
	}

	function imageReadShow(fileName) {
		var reader = new FileReader();
		reader.onload = function(file) {
			$("#stdtImg").attr("src", file.target.result);
			imgResult = file.target.result;
			pic = imgResult.split(",");
		}
		reader.readAsDataURL(fileName.files[0]);
	}
	/***************************************************************************
	 * fn_onchangeCd  -- select 값 변할때
	 **************************************************************************/
	function fn_onchangeCd(obj) {
		getonDatefirst = $(obj).closest("tr").data().GETON_DATE.substring(0, 1);
		weekday = $(obj).closest("tr").data().WEEKDAY; //check한 값의 weekday

		for (var i = 0; i < busList.length; i++) {
			
			//등교 7:40분 서면가능 나머지 시간 서면 선택 불가
            if ($("#resultTbody tr:eq(" + i + ")").find(".GOSCH_TIME_CD").val() != "10"
                    && $("#resultTbody tr:eq(" + i + ")").find(".GOSCH_LOCATION_CD").val() == "10") {
                alert("해당 시간에 등교장소 [서면]은 이용하실 수 없습니다.", $("#resultTbody tr:eq(" + i + ")").find(".GOSCH_TIME_CD"));
                $("#resultTbody tr:eq(" + i + ")").find(".GOSCH_LOCATION_CD").val("20");
                $("#resultTbody tr:eq(" + i + ")").find(".GOSCH_LOCATION_CD").prop("disabled", true);
            }else{
                //$("#resultTbody tr:eq(" + i + ")").find(".GOSCH_LOCATION_CD").prop("disabled", false);
            }
            
            //하교 서면 선택 불가           
            if ($("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_LOCATION_CD").val() == "10") {
                alert("해당 시간에 하교장소 [서면]은 이용하실 수 없습니다.", $("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_TIME_CD"));
                $("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_LOCATION_CD").val("20");
                $("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_LOCATION_CD").prop("disabled", true);
            }else{
                //$("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_LOCATION_CD").prop("disabled", false);
            }
            
			//등교 12:10분 서면 선택 불가
			/*
			if ($("#resultTbody tr:eq(" + i + ")").find(".GOSCH_TIME_CD").val() == "30"
					&& $("#resultTbody tr:eq(" + i + ")").find(
							".GOSCH_LOCATION_CD").val() == "10") {
				alert("해당 시간에 등교장소 [서면]은 이용하실 수 없습니다.", $("#resultTbody tr:eq(" + i + ")").find(".GOSCH_TIME_CD"));
				$("#resultTbody tr:eq(" + i + ")").find(".GOSCH_LOCATION_CD")
						.val("20");
				$("#resultTbody tr:eq(" + i + ")").find(".GOSCH_LOCATION_CD")
						.prop("disabled", true);
			}else{
				$("#resultTbody tr:eq(" + i + ")").find(".GOSCH_LOCATION_CD")
				.prop("disabled", false);
			}
			  */
			
			//하교 12:00분 서면 선택 불가
			/*
			if ($("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_TIME_CD")
					.val() == "10"
					&& $("#resultTbody tr:eq(" + i + ")").find(
							".AFTERSCH_LOCATION_CD").val() == "10") {
				alert("해당 시간에 하교장소 [서면]은 이용하실 수 없습니다.", $("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_TIME_CD"));
				$("#resultTbody tr:eq(" + i + ")")
						.find(".AFTERSCH_LOCATION_CD").val("20");
				$("#resultTbody tr:eq(" + i + ")")
						.find(".AFTERSCH_LOCATION_CD").prop("disabled", true);
			}else{
				$("#resultTbody tr:eq(" + i + ")")
				.find(".AFTERSCH_LOCATION_CD").prop("disabled", false);
			}
            */
			
			//하교 18:30분 서면 선택 불가
			/*
			if ($("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_TIME_CD")
					.val() == "40"
					&& $("#resultTbody tr:eq(" + i + ")").find(
							".AFTERSCH_LOCATION_CD").val() == "10") {
				alert("해당 시간에 하교장소 [서면]은 이용하실 수 없습니다.", $("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_TIME_CD"));
				$("#resultTbody tr:eq(" + i + ")")
						.find(".AFTERSCH_LOCATION_CD").val("20");
				$("#resultTbody tr:eq(" + i + ")")
						.find(".AFTERSCH_LOCATION_CD").prop("disabled", true);
			}else{
				$("#resultTbody tr:eq(" + i + ")")
				.find(".AFTERSCH_LOCATION_CD").prop("disabled", false);
			}
			*/
			 
			//금요일 등교 08:40분 서면 선택불가
			/*
			if(weekday == "0005" 
				&&$("#resultTbody tr:eq(" + i + ")").find(".GOSCH_TIME_CD").val() == "20"
				&& $("#resultTbody tr:eq(" + i + ")").find(
					".GOSCH_LOCATION_CD").val() == "10" )
			{
				alert("해당 시간에 등교장소 [서면]은 이용하실 수 없습니다.", $("#resultTbody tr:eq(" + i + ")").find(".GOSCH_TIME_CD"));
				$("#resultTbody tr:eq(" + i + ")").find(".GOSCH_LOCATION_CD")
						.val("20");
				$("#resultTbody tr:eq(" + i + ")").find(".GOSCH_LOCATION_CD")
						.prop("disabled", true);
			}else{
	            $("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_LOCATION_CD")
	            .prop("disabled", false);
	        }
			*/
			//금요일 하교 16:40분 서면 선택불가
			/*
			if(weekday == "0005" 
                &&$("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_TIME_CD").val() == "30"
			    && $("#resultTbody tr:eq(" + i + ")").find(
			        ".AFTERSCH_LOCATION_CD").val() == "10" )
			{
			    alert("해당 시간에 하교장소 [서면]은 이용하실 수 없습니다.", $("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_TIME_CD"));
			    $("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_LOCATION_CD")
			            .val("20");
			    $("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_LOCATION_CD")
			            .prop("disabled", true);
            }else{
				$("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_LOCATION_CD")
				.prop("disabled", false);
			}
	        */
			
			if ($("#resultTbody tr:eq(" + i + ")").find(".GOSCH_TIME_CD").val() == "30"
					&& $("#resultTbody tr:eq(" + i + ")").find(
							".AFTERSCH_TIME_CD").val() == "10") {
				alert("등교시간보다 하교시간이 빠릅니다.", $("#resultTbody tr:eq(" + i + ")").find(".GOSCH_TIME_CD"));
				$("#resultTbody tr:eq(" + i + ")").find(".AFTERSCH_TIME_CD")
						.val("선택");
			}
		}

	}

	/***************************************************************************
	 * fn_getInitInfo  신청년도학기 조회
	 **************************************************************************/
	function fn_getInitInfo() {
		var paramMap = {};

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/bus/busapply/selectDateCheck",
			reqData : paramMap,
			success : function(data, responseData) {
				initData = {
					"SYEAR" : data[0].SYEAR,
					"TERM_GCD" : data[0].TERM_GCD,
					"CHASU_NO" : data[0].CHASU_NO,
					"STDT_NO" : data[0].STDT_NO
				};
				if(data[0].CHASU_NO != null){
					fn_sch(initData); //신청정보 조회	
				}else{
					$("#btn_cancel").hide();
					$("#btn_save").hide();
					$("#btn_enter").hide();
					
					alert("이용 가능 기간이 아닙니다.")
				}
				
			}
		});
	}
	/***************************************************************************
	 * fn_sch 이용신청 조회
	 **************************************************************************/
	/* 이용신청 조회 */
	function fn_sch(initData) {
		/* 검색조건데이터 가져오기 */

		var btnCancel = "#btn_cancel";
		var btnSave = "#btn_save";
		var btnSaveDel = "#btn_savedel";
		var btnEnter = "#btn_enter";

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/bus/busapply/selectBusApply",
			reqData : initData,
			success : function(data, responseData) {
				var datas1 = data[0][0];
				var datas2 = data[1];
				
				if (!gfn_com_isEmptyObject(datas2)) {
					
					var msgDlgType = '';
					var msg = '';

					msgDlgType = datas1.O_RSLT;
					msg = datas1.O_MSG;

					var datas3 = data[3][0];
					var datas4 = data[4][0];
					var datas5 = data[5][0];
					var datas6 = data[6][0];
					var datas7 = data[7][0];
					var datas8 = data[8][0];
					
					if (msgDlgType == 'W') { //신청기간이 아닐때
						$("#APPLY_DT").html(msg); //신청기간
						$("#collapse1").hide();
						return false;
					} else { //신청기간 or 수납기간 일때
						$("#APPLY_DT").html(msg); //신청기간
						$("#collapse1").show();

						//버튼 컨트롤
						/* if (datas6.취소 == "N") {
							$(btnCancel).hide();
						} */ 
						if (datas6.신청 == "N") {
							$(btnSave).hide();
							$(btnCancel).hide();
							gogi_disabled = "disabled";
						}
						if (datas6.고지서출력 == "N") {
							$(btnEnter).hide();
						} 

						//기본정보 및 기타정보
						$("#STDT_NO").text(stdtNo);
						$("#NM").text(nm);
						$("#DEPT_NM").text(assignNm);
						$("#TELL_NO").text(telNo);
						$("#PHONE_NO").text(phoneNo);

						//사진
						fn_getPhoto();

						//현재월의 신청정보를 조회
						gfn_ajax_request({
							url : "/ost/bus/busapply/selectMonthApplyList",
							reqData : initData,
							success : function(data, responseData) {
								busList = data;

								$("#resultTbody").listView({
									//탑승정보
									dataSource : data,
									dataBound : function(e) {
										currentData = data;
										gfn_ajax_request({
											url : "/ost/bus/busapply/selectBusCd",
											reqData : initData,
											success : function(data,responseData) {
												$.each(data,function(idx,item) {
													if (item.BUS_GCD == '0010') {
														$.each($("#resultTbody tr"),function(i,v) {
															$(this).find("td:eq(3) select").append('<option value="'+ item.DETAIL_CD + '" '
																												+ ($(this).data().GOSCH_TIME_CD == item.DETAIL_CD ? "selected": "")
																												+ '>'
																												+ item.DETAIL_CD_NM
																												+ '</option>');
															if ($(this).data().GOSCH_TIME_CD == "30") {
																$("#resultTbody tr:eq("+ i + ")").find(".AFTERSCH_LOCATION_CD").val("20");
																$("#resultTbody tr:eq("+ i + ")").find(".AFTERSCH_LOCATION_CD").prop("disabled",true);
															}
														});
													} else if (item.BUS_GCD == '0020') {
														$.each($("#resultTbody tr"),function(i,v) {
															$(this).find("td:eq(5) select").append('<option value="'+ item.DETAIL_CD + '" '
																												+ ($(this).data().AFTERSCH_TIME_CD == item.DETAIL_CD ? "selected": "")
																												+ '>'
																												+ item.DETAIL_CD_NM
																												+ '</option>');
															if ($(this).data().AFTERSCH_TIME_CD == "10" || $(this).data().AFTERSCH_TIME_CD == "40") {
																$("#resultTbody tr:eq("+ i + ")").find(".AFTERSCH_LOCATION_CD").val("20");
																$("#resultTbody tr:eq("+ i + ")").find(".AFTERSCH_LOCATION_CD").prop("disabled",true);
															}
														});
														//$("#resultTbody tr td:nth-child(6) select").append('<option value="'+item.DETAIL_CD+'" >'+item.DETAIL_CD_NM+'</option>');
													} else if (item.BUS_GCD == '0030') {
														//$("#resultTbody tr td:nth-child(5) select, #resultTbody tr td:nth-child(7) select").append('<option value="'+item.DETAIL_CD+'" >'+item.DETAIL_CD_NM+'</option>');
														$.each($("#resultTbody tr"),function(i,v) {
															$(this).find("td:eq(4) select").append('<option value="'+ item.DETAIL_CD + '" '
																												+ ($(this).data().GOSCH_LOCATION_CD == item.DETAIL_CD ? "selected": "")
																												+ '>'
																												+ item.DETAIL_CD_NM
																												+ '</option>');
															$(this).find("td:eq(6) select").append('<option value="'+ item.DETAIL_CD + '" '
																												+ ($(this).data().AFTERSCH_LOCATION_CD == item.DETAIL_CD ? "selected": "")
																												+ '>'
																												+ item.DETAIL_CD_NM
																												+ '</option>');
														});
													}
												});
												
												$("#resultTbody").parent().bootstrapTable('resetView');
											}
										});
									},
									template : $("#resultTemplate"),
									totalCnt : data.length,
								});
							}
						});

						$("#PAY_INFO").html(datas3.수납정보); //요금정보
						$("#REFUND_ACCT").html(datas4.계좌정보); //환불계좌
						//datas5.적용정보
						
						if (datas7) {
							$("#sic_num").val(datas7.APPLY_SERIAL_NO);
							applySerialNo = datas7.APPLY_SERIAL_NO;
						}
						//$("#img사진").attr("src", "/schoolBus/getPicture?stdtCd=" + stdtNo);
						$("#APPLY_INFO").text(datas8.신청기본정보); //신청목록 - 메세지 
						if (datas6.취소 == "Y")
							cancelChasuCd = scwin.detailObj.취소차수;
						else
							cancelChasuCd = "";
					}

				} else {
					$("#resultTbody").closest("table").find("colgroup").html("");
					$("#resultTbody").parent().bootstrapTable('resetView');
					$(btnCancel).hide();
					$(btnSave).hide();
					$(btnEnter).hide();
					//alert("올바른 사용자가 아닙니다.")
					alert("이용 가능 기간이 아닙니다.")
					//alert(pnuGetNoDataMessageKo());
				}

			}
		});
	}

	/***************************************************************************
	 * fn_getPhoto 학생 사진 조회
	 **************************************************************************/
	function fn_getPhoto() {
		var paramMap = {
		};

		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/bus/busapply/selectStdtPhoto",
			reqData : paramMap,
			success : function(data, responseData) {
				if (!gfn_com_isEmptyObject(data)) {
					$("#stdtImg").attr("src","data:image/png;base64," + data.PIC);
				}
			}
		});

	}
	/***************************************************************************
	 * fn_chkOnclick
	 **************************************************************************/
	function fn_chkOnclick(obj) {
		weekday = $(obj).closest("tr").data().WEEKDAY; //check한 값의 weekday
		getonDatefirst = $(obj).closest("tr").data().GETON_DATE.substring(0, 1);
		for (var i = 0; i < busList.length; i++) {
			if (getonDatefirst == "0" && busList[i].WEEKDAY == weekday) { // 전체적용의 chk를 클릭했을때 같은요일의 그룹전체 check
				$("#resultTbody tr:eq(" + i + ")").find("input[type=checkbox]")
						.prop(
								"checked",
								$(obj).closest("tr input:checkbox[name=CHK]")
										.is(":checked"));
			}
		}

	}

	/***************************************************************************
	 * fn_batch  -- 일괄적용 클릭시(프로시저에서 버튼생성 후 호출)
	 **************************************************************************/
	function fn_batch(obj) {
		weekday = $(obj).closest("tr").data().WEEKDAY;
		getonDatefirst = $(obj).closest("tr").data().GETON_DATE.substring(0, 1);
		var index = $(obj).parent().parent().index();

		$.each(busList, function(idx, item) {
			if (item.WEEKDAY == weekday) { // 전체적용의 chk를 클릭했을때 같은요일의 그룹전체 check
				$("#resultTbody tr:eq(" + idx + ")").find(".GOSCH_TIME_CD")
						.val(
								$("#resultTbody tr:eq(" + index + ")").find(
										".GOSCH_TIME_CD").val()); // 값이 선택일땐 선택인값으로 넣어줘야함
				$("#resultTbody tr:eq(" + idx + ")").find(".AFTERSCH_TIME_CD")
						.val(
								$("#resultTbody tr:eq(" + index + ")").find(
										".AFTERSCH_TIME_CD").val());
				$("#resultTbody tr:eq(" + idx + ")").find(".GOSCH_LOCATION_CD")
						.val(
								$("#resultTbody tr:eq(" + index + ")").find(
										".GOSCH_LOCATION_CD").val());
				$("#resultTbody tr:eq(" + idx + ")").find(
						".AFTERSCH_LOCATION_CD").val(
						$("#resultTbody tr:eq(" + index + ")").find(
								".AFTERSCH_LOCATION_CD").val());
			}
		});
	}

	/***************************************************************************
	 * fn_validate
	 **************************************************************************/
	function fn_validate() {
		var src = $('#stdtImg').attr("src");
		var findSrc = "common";
		var rtnValue = true;
		
		//사진 필수여부 체크
		if(src=="/common/images/no_img.png"){
			alert("사진은 필수로 등록하셔야합니다.");
		}
		
		//탑승일자 선택 체크
		var size = $("input:checkbox[name=CHK]:checked").length;
		if (size < 1) {
			alert("탑승일자를 최소 하루 이상 선택해 주세요.");
			return false;
		}

		//탑승일자의 선택값 체크
		var rtnObj = {};
		for (var i = 0; i < busList.length; i++) {

			var trObj = $("#resultTbody tr:eq(" + i + ")");
			var bool = trObj.find("input[type=checkbox]").is(":checked");
			var boolChk = busList[i].GETON_DATE.substring(0, 1);

			var status = "";
			if (bool && boolChk != 0) { //체크된값과 전체적용이 아닌 row에 값들을 객체 넣기
					
				var GETON_DAY_DATE = busList[i].GETON_DAY_DATE;
				var DAY_GCD = busList[i].WEEKDAY;
				var GOSCH_TIME_CD = trObj.find(".GOSCH_TIME_CD").val();
				var GOSCH_LOCATION_CD = trObj.find(".GOSCH_LOCATION_CD").val();
				var AFTERSCH_TIME_CD = trObj.find(".AFTERSCH_TIME_CD").val();
				var AFTERSCH_LOCATION_CD = trObj.find(".AFTERSCH_LOCATION_CD").val();
				
				if(GOSCH_TIME_CD == ""){
					alert(GETON_DAY_DATE + "의 등교시간이 선택되지 않았습니다.");
					//trObj.find(".GOSCH_TIME_CD").focus();
					return false;
				}
				if(GOSCH_LOCATION_CD == ""){
					alert(GETON_DAY_DATE + "의 등교장소가 선택되지 않았습니다.");
					return false;
				}
				if(AFTERSCH_TIME_CD == ""){
					alert(GETON_DAY_DATE + "의 하교시간이 선택되지 않았습니다.");
					return false;
				}
				if(AFTERSCH_LOCATION_CD == ""){
					alert(GETON_DAY_DATE + "의 하교장소가 선택되지 않았습니다.");
					return false;
				}
			}
		}

		if (!rtnValue)
			return rtnValue;

		return rtnValue;
	}

	/***************************************************************************
	 * fn_Update 신청(수정)
	 **************************************************************************/
	function fn_Update() {
		fn_savePhoto();

		if (!fn_validate())
			return false;

		var rtnList = [];
		var rtnObj = {};
		for (var i = 0; i < busList.length; i++) {

			var trObj = $("#resultTbody tr:eq(" + i + ")");
			var bool = trObj.find("input[type=checkbox]").is(":checked");
			var boolChk = busList[i].GETON_DATE.substring(0, 1);

			var status = "";
			if (bool && boolChk != 0) { //체크된값과 전체적용이 아닌 row에 값들을 객체 넣기
				rtnObj = {
					rowStatus : trObj.find(".CONF_FG").text() == "N" ? "C"
							: "U",
					GETON_DATE : busList[i].GETON_DATE,
					DAY_GCD : busList[i].WEEKDAY,
					GOSCH_TIME_CD : trObj.find(".GOSCH_TIME_CD").val(),
					GOSCH_LOCATION_CD : trObj.find(".GOSCH_LOCATION_CD").val(),
					AFTERSCH_TIME_CD : trObj.find(".AFTERSCH_TIME_CD").val(),
					AFTERSCH_LOCATION_CD : trObj.find(".AFTERSCH_LOCATION_CD")
							.val(),
					APPLY_SERIAL_NO : applySerialNo, // APPLY_SERIAL_NO얘가 NULL인값이 있음
					SYEAR : initData.SYEAR,
					TERM_GCD : initData.TERM_GCD,
					CHASU_NO : initData.CHASU_NO

				}
				rtnList.push(rtnObj);
			}
		}
		confirm(gva_SAVE_CONFIRM_MSG, function(_flag) {
			if (_flag) {
				gfn_ajax_request({
					url : "/ost/bus/busapply/executeBusApply",
					reqData : rtnList,
					success : function(data, responseData) {
						gfn_ajax_request({
							url : "/ost/bus/busapply/executeBusApplyMaster",
							reqData : rtnObj,
							success : function(data, responseData) {
								alert("통학버스 이용신청이 완료되었습니다.");
								fn_sch(initData); //신청정보 조회
							}
						});
					}
				});
			}
		});

	}

	/***************************************************************************
	 * fn_savePhoto
	 **************************************************************************/
	function fn_savePhoto() {
		var formData = new FormData();
		formData.append("file", $("#file_Upload")[0].files[0]);
		formData.append("SYSTEM_GCD",scwin.systemGcd);
		formData.append("MENU_CD",scwin.menuCd);
		//사진저장
		$.formuploader._gfn_ajax_file_request({
			url: "/file/photo/busapplySaveStdtPhoto"
			, reqData: formData
			, success: function(responseData) {
				//alert("사진 저장 성공.");
			}
		});
	}

	/***************************************************************************
	 * fn_cancelDetail 취소
	 **************************************************************************/
	function fn_cancelDetail() {

		var rtnList = [];
		var rtnObj = {};
		for (var i = 0; i < busList.length; i++) {

			var trObj = $("#resultTbody tr:eq(" + i + ")");
			var bool = trObj.find("input[type=checkbox]").is(":checked");
			var boolChk = busList[i].GETON_DATE.substring(0, 1);

			if (bool && boolChk != 0) { //체크된값과 전체적용이 아닌 row에 값들을 객체 넣기
				rtnObj = {
					GETON_DATE : busList[i].GETON_DATE,
					CANCEL_CHASU_CD : cancelChasuCd,
					APPLY_SERIAL_NO : applySerialNo, // APPLY_SERIAL_NO얘가 NULL인값이 있음 --99로 저장
					SYEAR : initData.SYEAR,
					TERM_GCD : initData.TERM_GCD,
					CHASU_NO : initData.CHASU_NO
				}
				rtnList.push(rtnObj);
			}
		}

		confirm('신청을 삭제하시겠습니까?', function(_flag) {
			if (_flag) {
				gfn_ajax_request({
					url : "/ost/bus/busapply/deleteDetailBusApply",
					reqData : rtnList,
					success : function(data, responseData) {
						if(data.O_RSLT=="Y") {
							alert("통학버스 이용신청 삭제신청이 완료 되었습니다.");
							fn_cancel(rtnObj); //취소 상세저장 성공시 취소 저장
						}
						
					}
				});
			}
		});

	}

	/***************************************************************************
	 * fn_cancel 취소
	 **************************************************************************/
	function fn_cancel(rtnObj) {
		//취소 - 저장
		gfn_ajax_request({
			url : "/ost/bus/busapply/executeBusApplyMaster",
			reqData : rtnObj,
			success : function(data, responseData) {
				alert(data.O_MSG);
				fn_sch(initData);
			}
		});

	}
	
	/***************************************************************************
	 * fn_print
	 **************************************************************************/
	function fn_print() {
		var rtnObj = {};
		for (var i = 0; i < busList.length; i++) {

			var trObj = $("#resultTbody tr:eq(" + i + ")");
			var chkBool = trObj.find("input[type=checkbox]").is(":checked");

			//if (chkBool) { //체크된값
				rtnObj = {
					SYEAR : initData.SYEAR,
					TERM_GCD : initData.TERM_GCD,
					CHASU_NO : initData.CHASU_NO,
					APPLY_SERIAL_NO : applySerialNo // APPLY_SERIAL_NO얘가 NULL인값이 있음 --99로 저장
				}
			//}
		}
		//고지서출력가능여부 조회
		gfn_ajax_request({
			url : "/ost/bus/busapply/printChkBusApply",
			reqData : rtnObj,
			success : function(data, responseData) {
				
				alert(data.O_MSG);
				
				if(data.O_RSLT=="Y")
					fn_openReport(); //y일때
			}
		});

	}
	
	function fn_openReport(isPop) {
		var options ={};
		var objParam = {};
                    
        options.rptName = "/ses/bus/receivingmng/ReceivingMng_001.crf";
        objParam.bind = [{
            db : "ACADEMY",
            proc : "BUS_통학버스_수납관리_고지서출력",
            params : [initData.SYEAR, initData.TERM_GCD, initData.CHASU_NO, stdtNo]
    	}];
   		
        //파라메터 설정
        //var objParam = dma_SearchParam.getJSON();
        /*var objParam = {};
        objParam.SYEAR = initData.SYEAR;
        objParam.TERM_GCD = initData.TERM_GCD;
        objParam.CHASU_NO = initData.CHASU_NO;
        objParam.STDT_NO = stdtNo;*/
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
        fn_openPopup(options);
	}
	
	function fn_openPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "고지서",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
</script>