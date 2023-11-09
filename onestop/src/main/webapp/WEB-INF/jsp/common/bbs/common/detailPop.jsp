<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%pageContext.setAttribute("newLineChar","\n"); %>
<div id="popups">
	<section class="sec-1">
		<div class="sec-body">


			<div class="board-view">
				<div class="board-view-title">
					<h4><c:if test="${bbsData.CATE_TYPE_NM != '' }">[${bbsData.CATE_TYPE_NM }]</c:if>${bbsData.TITLE_CONTENT }</h4>
					<p class="board-info">
						<span><span class="sr-only">작성자 </span><i class="bi bi-person-fill" ></i> 
						${bbsData.WRITEOUT_USER_NM} 
						<c:if test="${(bbsData.BBS_TYPE_GCD =='0001' && bbsData.BBS_TYPE_SEQ_NO == '7') || (bbsData.BBS_TYPE_GCD =='0005' && bbsData.BBS_TYPE_SEQ_NO == '1')}" >
							( ${bbsData.INS_USER_ID } )
						</c:if>
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
				<c:if test="${fn:length(bbsFileList)  > 0 && bbsMgr.ATTACH_FILE_USE_FG == 'Y'}" >
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
				${bbsData.CONTENT}</div>
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
							<!-- <div class="form-group row">
																<label for="" class="col-form-label col-md-3"><span class="text-danger">＊</span> 비밀번호</label>
																<div class="col-md-9">
																		<input name="" type="password" title="비밀번호" class="form-control">
																</div>
														</div> -->
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
	
	<div class="_footer">
		<section class="sec-1">
			<div class="sec-body">
				<div class="btn-box">
					<div class="form-row btn-box-right">
						<div class="col-auto">
						
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
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>

<script type="text/javascript">
var reqData ={};
reqData.SESSION_MENU_CD = "${params.SESSION_MENU_CD}";
reqData.BBS_TYPE_GCD = "${bbsData.BBS_TYPE_GCD}";
reqData.BBS_TYPE_SEQ_NO = "${bbsData.BBS_TYPE_SEQ_NO}";
reqData.POSTING_SEQ_NO = "${bbsData.POSTING_SEQ_NO}";
reqData.ATTACH_FILE_GRP_CD = "${bbsData.ATTACH_FILE_GRP_CD}";
reqData.ATTACH_FILE_GCD = "${bbsData.ATTACH_FILE_GCD}";

	$(document).ready(popInit());

	function popInit() {
		loadLangInfo("popup");

		$("#answerWriteBtn").click(function(){
			reqData.mode = "ANSWER";
			fn_openChangePopup({
				//index: $(this).closest("#popup").attr("idx"),
				index : 5,
				url : '/bbs/answerWritePop.do',
				headertitle : '답변',
				reqData : reqData
			});
		});
		
		$("#modifyBtn").click(function(){
			reqData.mode = "MODIFY";
			fn_openChangePopup({
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
	    					alert("삭제완료");
	    					gfn_com_closeModalWall(pop_index, function() {
	    						fn_sch();
	    					});
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

	}


	function fn_bbsPostReplySave(_this,mode) {
		var param = gfn_com_inputdata($("#comment-modal"));
		if(mode != "DEL_PROC"){
			if (!fn_validate(param))
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
					reqData.mode = "DETAIL";
					fn_openChangePopup({
						url : '/bbs/detailPop.do',
						headertitle : '상세',
						index : 5,
						reqData : reqData,
						dataBound : function(e) {
							alert(data.msg);
			            }
					
					});

			}
		});
	}

	function fn_validate(param) {
		var rtnValue = true;

		rtnValue = gfn_val_validateDataMap(param, [ {
			"id" : "CONTENT",
			"name" : "내용",
			"notNull" : true,
		} ]);

		if (!rtnValue)
			return rtnValue;

		return rtnValue;
	}
</script>