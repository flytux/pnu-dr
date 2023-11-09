<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div id="popups">
	<section class="sec-1">
		<div class="sec-body">
			<div class="b-table-box flex-col-1" role="table" aria-label="1단 테이블">
				<div class="b-row-box" role="row">
					<div class="b-row-item">
						<div class="b-title-box " role="rowheader" style="flex: 0 0 146px; max-width: 140px">
							<label for="PASSWORD">확인번호</label>
						</div>
						<div class="b-con-box" role="cell">
							<input class="form-control" type="text" id="PASSWORD" placeholder="확인번호">
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<div class="_footer">
		<section class="sec-1">
			<div class="sec-body">
				<div class="btn-box">
					<div class="form-row btn-box-right">
						<div class="col-auto">
							<button class="btn btn-danger mb-2 " id="btn_Check">확인</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>

<script>

$(document).ready(popInit());
function popInit() {
	
    $("#btn_Check").bind("click", function(){
    	fn_check();
    });

}
function fn_check(){
	
	if($('#PASSWORD').val() ==""){
		alert("확인번호를 입력해주세요.");	
		$('#PASSWORD').focus();
		return false;
	}
	/* ajax처리 */
	var reqData ={};
	reqData.SESSION_MENU_CD = "${params.SESSION_MENU_CD}";
	reqData.BBS_TYPE_GCD = "${params.BBS_TYPE_GCD}";
	reqData.BBS_TYPE_SEQ_NO = "${params.BBS_TYPE_SEQ_NO}";
	reqData.POSTING_SEQ_NO = "${params.POSTING_SEQ_NO}";
	reqData.PASSWORD = $('#PASSWORD').val();
	reqData.ATTACH_FILE_GRP_CD = "${params.ATTACH_FILE_GRP_CD}";
	reqData.ATTACH_FILE_GCD = "${params.ATTACH_FILE_GCD}";
	
	gfn_ajax_request({
		url : "/bbs/passChkConfirm",
		reqData : reqData,
		success : function(data, responseData) {
			
			if(data.O_RSLT == "Y"){
				
				gfn_com_closeModalWall(1,function(){
					reqData.mode = "DETAIL";
					setTimeout(function() {
						fn_openPopup({
							width : 1000,
				            height : 650,
							//index : 5,
							url : '/bbs/detailPop.do',
							headertitle : '상세',
							reqData : reqData
						});
					}, 300);
				});	
			}else{
				alert(data.O_MSG);
			}
		}
	});
}

</script>