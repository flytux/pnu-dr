<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
table caption {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    white-space: nowrap;
    border: 0;
}
</style>
<%pageContext.setAttribute("newLineChar","\n"); %>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title">게시판 상세</h2>
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
				<div class="board-view">
					<div class="board-view-title">
						<h4><c:if test="${bbsData.LEVEL > 0}"><strong class='text-info'>┗ Re : </strong></c:if><c:if test="${bbsData.CATE_TYPE_NM ne ''}">[${bbsData.CATE_TYPE_NM }]</c:if>${bbsData.TITLE_CONTENT }</h4>
						<p class="board-info">
							<span><span class="sr-only">작성자 </span><i class="bi bi-person-fill" ></i> 
								${bbsData.WRITEOUT_USER_NM} 
								<c:if test="${(bbsData.BBS_TYPE_GCD =='0001' && bbsData.BBS_TYPE_SEQ_NO == '7') || (bbsData.BBS_TYPE_GCD =='0005' && bbsData.BBS_TYPE_SEQ_NO == '1')}" >
									( ${bbsData.INS_USER_ID } )
								</c:if>
								<%-- Q&A 게시판일 경우 등록자의 소속을 보여줌 --%>
								<c:if test="${bbsData.BBS_TYPE_GCD=='0005' && bbsData.BBS_TYPE_SEQ_NO=='1'}">${bbsData.ASSIGN_NM}</c:if>
							</span>
							<span><span class="sr-only">작성일 </span><i class="bi bi-alarm" ></i> ${bbsData.INS_DT }</span>
							<span><span class="sr-only">조회수 </span><i class="bi bi-eye" ></i> ${bbsData.SEARCH_TIMESNO }</span>
							<c:if test="${bbsData.EMAIL  =='Y'}">
								<span><span class="sr-only">이메일 </span><i class="bi bi-envelope" ></i> : ${bbsData.EMAIL }</span>
							</c:if>
							<c:if test="${bbsData.POSTING_CLOSE_DATE_FG  =='Y'}">
								<span>게시일자 : ${bbsData.POSTING_START_DT } ~ ${bbsData.POSTING_CLOSE_DT }</span>
							</c:if>
						</p>
					</div>
					<c:if test="${fn:length(bbsFileList)  > 0 && bbsData.BBS_TYPE_GCD != '0002' && bbsMgr.ATTACH_FILE_USE_FG == 'Y'}" >
						<div class="board-view-files">
							<h5 data-lang>첨부파일</h5>
							<ul>
								<c:forEach var="item" items="${bbsFileList}" varStatus="status">
									<li><a href="/file/download.do?${item.PARAM_CODE }">${item.ORIGIN_FILE_NM }</a></li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
					<div class="board-view-cont">
						<c:if test="${bbsData.BBS_TYPE_GCD =='0002' || bbsData.BBS_TYPE_GCD =='0003'}" >
							<c:forEach var="item" items="${bbsFileList}" varStatus="status">
								<img src="/file/download.do?${item.PARAM_CODE }"  alt="<c:if test="${item.FILE_TAG_CONTENT eq '' }">${bbsData.TITLE_CONTENT }</c:if><c:if test="${item.FILE_TAG_CONTENT ne '' }">${item.FILE_TAG_CONTENT }</c:if>"/>
							</c:forEach>
						</c:if>
						${bbsData.CONTENT}
					</div>
				</div>
				<div class="pager d-flex justify-content-between">
					<div class="prev col">
						<c:if test="${!empty bbsData.PREV_SEQ}">
							<a href="/page?menuCD=${menuCD}&mode=DETAIL&seq=${bbsData.PREV_SEQ}" title="이전 게시물">
								<span class="pager-navi"><i class="bi bi-chevron-left"></i> 이전글</span>
								<span class="pager-title"><c:if test="${bbsData.PREV_LEVEL > 0}"><strong class='text-info'>┗ Re : </strong></c:if>${bbsData.PREV_TITLE}</span>
							</a>
						</c:if>
					</div>
					<div class="next col">
						<c:if test="${!empty bbsData.NEXT_SEQ}">
							<a href="/page?menuCD=${menuCD}&mode=DETAIL&seq=${bbsData.NEXT_SEQ}" title="다음 게시물">
								<span class="pager-navi">다음글 <i class="bi bi-chevron-right"></i></span>
								<span class="pager-title"><c:if test="${bbsData.NEXT_LEVEL > 0}"><strong class='text-info'>┗ Re : </strong></c:if>${bbsData.NEXT_TITLE}</span>
							</a>
						</c:if>
					</div>
				</div>
				<c:if test="${bbsMgr.POSTING_REPLY_USE_FG == 'Y' }">
					<div id="accordion">
						<div class="card card-style01">
							<div class="card-header" id="headingOne">
								<c:if test="${bbsMgrAuth.POSTING_REPLY_SEARCH_FG == 'Y' }"><button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" data-expanded="true" data-controls="collapseOne"></c:if>
								<i class="bi bi-chat-dots-fill" aria-hidden="true"></i> 댓글 <span class="badge badge-pill badge-primary">${fn:length(bbsReplyDataList)}</span> 
								<c:if test="${bbsMgrAuth.POSTING_REPLY_SEARCH_FG == 'Y' }"><i class="bi bi-chevron-down" aria-hidden="true"></i></c:if>
								<c:if test="${bbsMgrAuth.POSTING_REPLY_SEARCH_FG == 'Y' }"></button></c:if>
							</div>
							<c:if test="${bbsMgrAuth.POSTING_REPLY_SEARCH_FG == 'Y' }">
								<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
									<div class="card-body">
										<div class="board-comment">
											<c:forEach var="item" items="${bbsReplyDataList}" varStatus="status">
												<div class="messages">
													<div class="heading">
														${item.REPLY_USER_NM} <span class="date">${item.INS_DT}</span>
														<div class="comment-btn">
															<!-- <button class="btn btn-sm" title="댓글 작성"><i class="bi bi-chat-square-fill"></i></button> -->
															<c:if test="${item.replyBbsOwner =='Y'}">
																<button class="btn btn-sm postReplyModifyBtn" data-index="${item.REPLY_POSTING_SEQ_NO }" >
																	<i class="bi bi-pencil-fill"><span class="sr-only">댓글수정</span></i>
																</button>
																<button class="btn btn-sm postReplyDelBtn" data-index="${item.REPLY_POSTING_SEQ_NO }" >
																	<i class="bi bi-trash-fill"><span class="sr-only">댓글삭제</span></i>
																</button>
															</c:if>
														</div>
													</div>
													<blockquote class="comment">${fn:replace(item.CONTENT,newLineChar,"<br/>")}</blockquote>
												</div>
											</c:forEach>
										</div>
										<!-- /END .board-comment-->
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</c:if>
		
				<div class="board-bottom text-right">
					<c:if test="${bbsMgr.REPLY_USE_FG == 'Y' && bbsMgrAuth.REPLY_WRITEOUT_AUTH_FG == 'Y' }">
						<button class="btn btn-new " id="answerWriteBtn" data-lang>답변</button>
					</c:if>
					<c:if test="${bbsMgr.POSTING_REPLY_USE_FG == 'Y' && bbsMgrAuth.POSTING_REPLY_WRITEOUT_AUTH_FG == 'Y' }">
						<button class="btn btn-etc " id="postReplyWriteBtn" data-lang>댓글</button>
					</c:if>
					<c:if test="${bbsMgrAuth.POSTING_UPD_AUTH_FG == 'Y' || bbsData.bbsOwner =='Y'}">
						<button class="btn btn-modify" id="modifyBtn" data-lang>수정</button>
					</c:if>
					<c:if test="${bbsMgrAuth.POSTING_DEL_AUTH_FG == 'Y'  || bbsData.bbsOwner =='Y'}">
						<button class="btn btn-delete " id="delBtn" data-lang>삭제</button>
					</c:if>
					<a href="/page?menuCD=${menuCD}" class="btn btn-secondary">목록</a>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="comment-modal" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" data-lang>댓글달기</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="form-group row">
									<label for="" class="col-form-label col-md-3"><span class="text-danger">＊</span> 이름</label>
									<div class="col-md-9">
										<input id="REPLY_USER_NM" type="text" title="이름" class="form-control" value="${params.SESSION_USER_NM }" readonly>
									</div>
								</div>
								<textarea id="CONTENT" title="내용" class="form-control" rows="5" required></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="replyWriteProcBtn" data-index="" onclick="fn_bbsPostReplySave(this,'WRITE_PROC')" style="display:none" data-lang>등록</button>
								<button type="button" class="btn btn-primary " id="replyModifyProcBtn" data-index=""  onclick="fn_bbsPostReplySave(this,'MODIFY_PROC')" style="display:none" data-lang>수정</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal" data-lang>닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</div>

<script src="/common/js/gfn/gfn_bbs.js?1118"></script>
<script src="/common/js/gfn/gfn_ums.js?1118"></script>

<script type="text/javascript">
var reqData ={};
reqData.SESSION_MENU_CD = "${params.SESSION_MENU_CD}";
reqData.BBS_TYPE_GCD = "${bbsData.BBS_TYPE_GCD}";
reqData.BBS_TYPE_SEQ_NO = "${bbsData.BBS_TYPE_SEQ_NO}";
reqData.POSTING_SEQ_NO = "${bbsData.POSTING_SEQ_NO}";
reqData.ATTACH_FILE_GRP_CD = "${bbsData.ATTACH_FILE_GRP_CD}";
reqData.ATTACH_FILE_GCD = "${bbsData.ATTACH_FILE_GCD}";

	$(document).ready(function() {
		loadLangInfo("popup");

		$("#answerWriteBtn").click(function(){
			reqData.mode = "ANSWER";
			fn_openChangePopup2({
				//index: $(this).closest("#popup").attr("idx"),
				index : 5,
				url : '/bbs/answerWritePop.do',
				headertitle : '답변',
				reqData : reqData
			});
		});
		
		$("#modifyBtn").click(function(){
			reqData.mode = "MODIFY";
			fn_openChangePopup2({
				index : 5,
				url : '/bbs/writePop.do',
				headertitle : '수정',
				reqData : reqData
			});
		});
		
		$("#delBtn").click(function(){
			reqData.mode = "DEL_PROC";
			var pop_index = $(this).closest("#popup").attr("idx");
			
			confirm(gva_DELETE_CONFIRM_MSG,function(_flag){
	    		if(_flag) {
	    			gfn_ajax_request({
	    				url : "/bbs/saveBbsInfo",
	    				reqData : reqData,
	    				success : function(data, responseData) {
	    					alert("게시글이 삭제되었습니다.", fn_moveToList);
	    					/*gfn_com_closeModalWall(pop_index, function() {
	    						fn_sch();
	    					});*/
	    				}
	    			});
	    		}
	    	});
		});		

		$("#postReplyWriteBtn").click(function() {
			$("#comment-modal").modal();
			$("#comment-modal").find("#CONTENT").html("");
			$("#replyWriteProcBtn").show();
			$("#replyModifyProcBtn").hide();
		});
		
		$(".postReplyModifyBtn").click(function() {
			$("#comment-modal").modal();
			$("#comment-modal").find("#CONTENT").html($(this).closest(".messages").find(".comment").html());
			$("#replyModifyProcBtn").data("index",$(this).data("index")); 
			$("#replyWriteProcBtn").hide();
			$("#replyModifyProcBtn").show();
		});
		
		$(".postReplyDelBtn").click(function() {
			var _this = $(this);
			confirm(gva_DELETE_CONFIRM_MSG,function(_flag){
	    		if(_flag) {
	    			fn_bbsPostReplySave(_this,"DEL_PROC");
	    		}
	    	});
		});
		
		$("#comment-modal").draggable();
		
		$.each($(".board-view-cont").find("table"),function(){
			if($(this).find("thead").length == 0){
				$(this).prepend("<thead></thead>");
			}
			
			if($(this).find("caption").length == 0){
				$(this).prepend("<caption>"+$(".board-view-title h4").text()+"</caption>");
			}
		});
		
		$.each($(".board-view-cont").find("img"),function(){
			if($(this).attr("alt") == ""){
				$(this).attr("alt", $(".board-view-title h4").text());
			}
		});

	});

	function fn_bbsPostReplySave(_this,mode) {
		var param = gfn_com_inputdata($("#comment-modal"));
		if(mode != "DEL_PROC" && !fn_validate(param)) {
			return false;
		}
		
		param["mode"] =mode;
		param["BBS_TYPE_GCD"] = "${bbsData.BBS_TYPE_GCD}";
		param["BBS_TYPE_SEQ_NO"] = "${bbsData.BBS_TYPE_SEQ_NO}";
		param["POSTING_SEQ_NO"] = "${bbsData.POSTING_SEQ_NO}";
		param["REPLY_POSTING_SEQ_NO"]  =$(_this).data("index");
		gfn_ajax_request({
			url : "/bbs/saveBbsPostReplyInfo",
			reqData : param,
			success : function(data, responseData) {
				$("#comment-modal").modal("hide");
				$(".modal-backdrop").remove();
				
				if(mode == 'WRITE_PROC') {
					<c:if test="${bbsData.GUIDE_SEND_RCV_FG =='Y'}" > // 사용자 수신 동의했을시 메시지 발송  
						gfn_ums_getPaymntId2(gfn_str_parseNullDefault(scwin.loginUser.assignCd, '000000'), 'sample_msgSend_withApi2');
					</c:if>
					<c:if test="${bbsData.GUIDE_SEND_RCV_FG !='Y'}" > // 사용자 수신 미동의했을시 메시지 미발송
						alert("댓글이 저장되었습니다.", fn_refreshDetail);
					</c:if>
				}else if(mode == 'MODIFY_PROC') {
					alert("댓글이 수정되었습니다.", fn_refreshDetail);
				}else {
					alert("댓글이 삭제되었습니다.", fn_refreshDetail);
				}
			}
		});
	}
	
	var sample_msgSend_withApi2 = function(paymentId) {
		if(gfn_str_parseNullDefault(paymentId, 'ISNULL') == 'ISNULL') {
			alert("답변 저장은 완료되었으나 \n해당 부서에서 사용할 수 있는 메시지 발송 과금아이디가 없습니다. \n 부서별 과금아이디 신청바랍니다.", fn_refresh);
			return;
		}
        var result = false;
        var param = {};
        param.STDT_NO = '${bbsData.INS_USER_ID}';
        gfn_ajax_request({
			url : "/ost/hj/stdtinfo/stdtinfoupd/selectStdtInfoUpd2",
			reqData : param,
			success : function(data, responseData){
					console.log(data);
			   		 var dma_01 = {};
			         //신규작성시 미입력, 메시지정보 키값1
			         dma_01.WRITEOUT_DATE = '';
			         //신규작성시 미입력, 메시지정보 키값2
			         dma_01.MSG_SEND_SEQ_NO = '';
			         //필수 -발신자 아이디 정보, 미입력시 로그인사용자 정보사용
			         dma_01.SEND_USER_ID = scwin.loginUser.userId;
			         //필수 -발신자 부서 정보, 미입력시 로그인사용자 정보사용
			         dma_01.DIVISION_CD = (gfn_str_parseNull(scwin.loginUser.assignCd)=='')?'000000':scwin.loginUser.assignCd;  //"312300";//scwin.loginUser.deptCd;
			         //필수 -발신자구분 개인기반발신(0001), 부서기반발신(0002) 과금 주체에 따라 기입. 
			         dma_01.SEND_USER_GCD = '0001';
			         //필수 -발신내역조회 메뉴에서 조회시 사용될 메시지 제목
			         dma_01.MSG_TITLE_CONTENT = '[학생지원시스템 QNA 답변 등록 알림]';

			         //긴급발송 사용여부
			         dma_01.URGENT_SEND_USE_FG = ''//'Y';

			         //PUSH 사용여부
			         if('${bbsMgr.GUIDE_SEND_GCD }' =='0001' || '${bbsMgr.GUIDE_SEND_GCD }' =='0002'){
			            dma_01.PUSH_SEND_FG = 'Y';    
			         }else{
			            dma_01.PUSH_SEND_FG = 'N';
			         }
			         
			         var title_content = "${bbsData.TITLE_CONTENT}";
			         var title_str = title_content.replaceAll("'","\'");
			         
			         //안드로이드 푸쉬 제목, 미입력시 '부산대학교'
			         dma_01.PUSH_TITLE_CONTENT = '[학생지원시스템 QNA 답변 등록 알림]';
			         //PUSH 필수 - 내용
			         dma_01.PUSH_CONTENT = '[학생지원시스템 QNA 답변 등록 알림]\n\n'+ title_str +' 작성 글에 답변이 등록되었습니다.';
			         //PUSH 사용시 연결될 URL 링크
			         dma_01.PUSH_SHORTCUT_URL_CONTENT = 'https://onestop.pusan.ac.kr'+ fn_getBbsUrl2();

			         //알림톡(카카오톡) 사용여부
			         if('${bbsMgr.GUIDE_SEND_GCD }' =='0002'){
			            dma_01.ALRIM_SEND_FG = 'Y';    
			         }else{
			            dma_01.ALRIM_SEND_FG = 'N';
			         }
			         
			         //알림톡 필수 - 알림톡 템플릿 아이디
			         dma_01.ALRIMTALK_TEMPLATE_ID = 'pnu_common_0001';
			         //알림톡 필수 - 알림톡 템플릿 내용 common.gfn_ums_getAlrimtalkTemplateContent 참고
			         dma_01.ALRIM_CONTENT = '[학생지원시스템 QNA 답변 등록 알림]\n\n'+ title_str +' 작성 글에 답변이 등록되었습니다.';
			       

			         //알림톡 필수 - SMS 사용여부 
			         if('${bbsMgr.GUIDE_SEND_GCD }' =='0002'){
			         	dma_01.SMS_SEND_FG = 'Y';
			         }else{
			            dma_01.SMS_SEND_FG = 'N';
			         }
			         
			         
			         //SMS 필수 - 과금아이디 common.gfn_ums_getPaymntId()
			         dma_01.PAYMNT_ID = paymentId;
			         //SMS 필수 - 발신번호 SMS발송시 발신자로 나타나는번호, 개발시에는 발송직전에 '01054153371'로 바뀜
			         dma_01.SEND_TEL_NO = scwin.loginUser.extsNo;
			         //SMS 필수 - 내용
			         dma_01.SMS_CONTENT = '[학생지원시스템 QNA 답변 등록 알림]\n\n'+ title_str +' 작성 글에 답변이 등록되었습니다.\n\nhttps://one.pusan.ac.kr'+ fn_getBbsUrl2();

			         //SMS 첨부파일사용시 사용(현재 미동작)
			         dma_01.SYSTEM_GCD = '';
			         dma_01.ATTACH_FILE_GRP_CD = '';

			         //PUSH, SMS 둘 다 활성화시 필수, PUSH 발송 후 SMS 발송까지의 대기시간 (단위 : 분)
			         dma_01.PUSH_SWITCH_SEND_RCV_TIME = 30;//30;

			         //예약발송 사용여부
			         dma_01.RESERVE_SEND_FG = '';//'Y';
			         //예약발송 필수 - 날짜 yyyyMMddhhmmss
			         dma_01.SEND_DT = '';//'20230101112233';

			         //DB에서 조회시 사용될 기록란
			         dma_01.REMARK = '';

			         //수신자 데이터 리스트
			         //RCV_USER_ID: 필수입력, 수신자 아이디
			         //TEL_NO: 수신자 전화번호. 해당 내용 입력시 DB 전화번호 무시하고 입력번호로 수신동의무시하고 발송함, 미입력시 DB 전화번호 사용
			         //알림톡, SMS 내용 중 가변 치환내용 있는경우 수신자목록의 UMS_CONTENT에 각각의 내용 입력필요,이외 미입력
			         //개발자 테스트를위해 수신자 데이터의 전화번호는 발송직전에 '01054153371'로 바뀜 
					 var rcv_user_info = {};
					 rcv_user_info.RCV_USER_ID = '${bbsData.INS_USER_ID}';
					 console.log(data);
					 rcv_user_info.RCV_TEL_NO = data[0].STDT_CELLULAR_NO;
					 rcv_user_info.RCV_CONTENT = "";
					 rcv_user_info.SESSION_SYSTEM_GCD = '0002';
					 rcv_user_info.SESSION_MENU_CD = scwin.menuCd;
					 rcv_user_info.SESSION_USER_ID = scwin.loginUser.userId;
					 rcv_user_info.SESSION_USER_IP = scwin.loginUser.userIp;
					 
					 gfn_ums_sendMsg(dma_01, [rcv_user_info], 'fn_getMsgKey2');
			}
		});
    }
	
	var fn_getMsgKey2 = function(data, responseData) {
		if(gfn_str_parseNull(data.MSG_SEND_SEQ_NO) != ''){
		    alert("댓글 저장 및 메시지 발송이 완료되었습니다.", fn_refreshDetail);
		}else{
		    alert("댓글 저장은 완료되었으나 메시지 발송이 실패하였습니다.", fn_refreshDetail);
		}
	}

	function fn_validate(param) {
		return gfn_val_validateDataMap(param, [ 
			{"id" : "CONTENT", "name" : "내용", "notNull" : true} 
		]);
	}
	
	function fn_refreshDetail() {
		location.reload();
	}
	
	function fn_moveToList() {
		location.href = '/page?menuCD=${menuCD}'; 
	}
	
	function fn_getBbsUrl2() {
		return "/page?menuCD=${menuCD}&mode=DETAIL&seq=${bbsData.POSTING_SEQ_NO}";
	}

</script>