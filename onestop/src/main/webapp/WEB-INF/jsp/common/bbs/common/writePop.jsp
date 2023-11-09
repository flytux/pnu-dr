<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="popups">
	<section class="sec-1">
		<div class="sec-body">
		<div class="col-md req-txt"><span class="text-danger">＊ 필수입력</span> 항목입니다.</div>
			<div class="card bg-light">
				<div class="card-body">


					<div class="form-row">
						<c:if test="${bbsMgrAuth.NOTICE_AUTH_FG == 'Y' && params.mode != 'ANSWER'}">
							<div class="form-group">
								<div class="label" ><label for="NOTICE_FG1" data-lang>공지사용 여부</label></div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="NOTICE_FG1" name="NOTICE_FG" class="custom-control-input" <c:if test="${bbsData.NOTICE_FG == 'Y'}">checked</c:if> value="Y"> <label class="custom-control-label" for="NOTICE_FG1" data-lang>사용함</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="NOTICE_FG2" name="NOTICE_FG" class="custom-control-input" <c:if test="${bbsData.NOTICE_FG == 'N' || bbsData.NOTICE_FG == null }">checked</c:if> value="N"> <label class="custom-control-label" for="NOTICE_FG2" data-lang>사용안함</label>
								</div>
							</div>
						</c:if>
						<c:if test="${bbsMgr.POSTING_CLOSE_DATE_USE_FG == 'Y'}">
							<div class="form-group col-lg-7">
								<div class="form-check label">
									<input class="form-check-input" id="POSTING_CLOSE_DATE_FG" type="checkbox" value="Y" <c:if test="${bbsData.POSTING_CLOSE_DATE_FG == 'Y'}">checked</c:if>> <label class="form-check-label" for="POSTING_CLOSE_DATE_FG" data-lang>게시종료일자</label>
								</div>
								<div class="form-inline">
									<input type="text" title="시작시간" class="form-control " style="width: 155px" id="POSTING_START_DT" value="${bbsData.POSTING_START_DT}" <c:if test="${bbsData.POSTING_CLOSE_DATE_FG != 'Y'}">disabled</c:if> placeholder="0000-00-00 00:00" maxlength="16"> ~ <input type="text" title="종료시간" class="form-control" style="width: 155px" id="POSTING_CLOSE_DT" value="${bbsData.POSTING_CLOSE_DT}" <c:if test="${bbsData.POSTING_CLOSE_DATE_FG != 'Y'}">disabled</c:if> placeholder="0000-00-00 00:00" maxlength="16">
								</div>
							</div>

						</c:if>
					</div>


					<c:if test="${bbsMgr.CATE_FG == 'Y' && fn:length(bbsCateList) > 0}">
						<div class="form-row">
							<div class="form-group">
								<div class="label" ><label for="CATE_TYPE_SEQ_NO" data-lang>카테고리</label></div>
								<select id="CATE_TYPE_SEQ_NO" class="form-control form-w-xl" title="카테고리선택">
									<option value="" data-lang="">선택</option>
									<c:forEach var="item" items="${bbsCateList}" varStatus="status">
										<option value="${item.CATE_TYPE_SEQ_NO }" <c:if test="${item.CATE_TYPE_SEQ_NO == bbsData.CATE_TYPE_SEQ_NO }">SELECTED</c:if>>${item.CATE_TYPE_NM }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</c:if>


					<c:if test="${bbsMgr.PASSWORD_USE_FG == 'Y' && params.mode != 'ANSWER' }">
						<div class="form-row">
							<div class="form-group">
								<div class="label" ><label for="CATE_TYPE_SEQ_NO" data-lang>비밀글 여부</label></div>
								<div class="form-check label">
									<input class="form-check-input" id="SECRET_FG" type="checkbox" value="Y" <c:if test="${bbsData.SECRET_FG == 'Y'}">checked</c:if>> <label class="form-check-label" for="SECRET_FG" data-lang>비밀글</label>
								</div>
								<%--
								<div class="form-inline">
									<input type="password" id="PASSWORD" class="form-control w-45" placeholder="확인번호" title="확인번호 입력" <c:if test="${bbsData.SECRET_FG != 'Y'}">disabled</c:if>>
								</div>
								--%>
							</div>
						</div>
					</c:if>

					<c:if test="${bbsMgr.NM_CLOSED_USE_FG == 'Y' }">
						<div class="form-group">
							<div class="label" data-lang><label for="NM_CLOSED_FG1" data-lang>이름비공개 여부</label></div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="NM_CLOSED_FG1" name="NM_CLOSED_FG" class="custom-control-input" <c:if test="${bbsData.NM_CLOSED_FG == 'Y'}">checked</c:if> value="Y"> <label class="custom-control-label" for="NM_CLOSED_FG1" data-lang>사용함</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="NM_CLOSED_FG2" name="NM_CLOSED_FG" class="custom-control-input" <c:if test="${bbsData.NM_CLOSED_FG == 'N' || bbsData.NM_CLOSED_FG == null }">checked</c:if> value="N"> <label class="custom-control-label" for="NM_CLOSED_FG2" data-lang>사용안함</label>
							</div>
						</div>
					</c:if>
					
					<c:if test="${params.mode != 'ANSWER' && bbsMgr.BBS_TYPE_GCD == '0005'}" >
						<div class="form-row">
							<div class="form-group">
								<div class="label" ><label for="GUIDE_SEND_RCV_FG" data-lang>안내발송수신 여부</label><strong class="text-danger">*</strong></div>
								<select id="GUIDE_SEND_RCV_FG" class="form-control form-w-xl" title="안내발송수신여부선택">
									<option value="" data-lang >선택</option>
									<option value="Y" data-lang <c:if test="${'Y' == bbsData.GUIDE_SEND_RCV_FG }">SELECTED</c:if>>수신</option>
									<option value="N" data-lang <c:if test="${'N' == bbsData.GUIDE_SEND_RCV_FG }">SELECTED</c:if>>미수신</option>
								</select>
							</div>
						</div>
					</c:if>
					<div class="form-row">
						<div class="form-group col-md-9">
							<label for="TITLE_CONTENT" data-lang>제목</label> <strong class="text-danger">*</strong> <input id="TITLE_CONTENT" class="form-control" value="${bbsData.TITLE_CONTENT}"></input>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-lg-4">
							<label for="WRITEOUT_USER_NM" data-lang>작성자</label> <strong class="text-danger">*</strong>
							<c:set var="WRITEOUT_USER_NM" value="${params.SESSION_USER_NM }" />
							<c:if test="${bbsData.WRITEOUT_USER_NM !='' && bbsData.WRITEOUT_USER_NM != null && params.mode != 'ANSWER'}">
								<c:set var="WRITEOUT_USER_NM" value="${bbsData.WRITEOUT_USER_NM}" />
							</c:if>

							<input id="WRITEOUT_USER_NM" class="form-control" value="${WRITEOUT_USER_NM }" readonly="readonly" />
						</div>

					</div>
					<c:if test="${bbsMgr.EMAIL_USE_FG  =='Y'}">
						<div class="form-row">
							<div class="form-group col-lg-6">
								<label for="EMAIL" data-lang>이메일</label> <input id="EMAIL" class="form-control"></input>

							</div>
						</div>
					</c:if>
					<div class="form-row mb-3">
						<label data-lang>내용</label> <strong class="text-danger">*</strong>
						<textarea id="CONTENT" title="내용" class="form-control" rows="15" required="">${bbsData.CONTENT}</textarea>
					</div>

					<c:if test="${ bbsMgr.ATTACH_FILE_USE_FG eq 'Y'}">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label data-lang>첨부파일</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="sec-body" id="uploader_target1"></div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${ bbsMgr.PERINFO_AGREE_USE_FG eq 'Y'}">
						<div class="form-check label">
							<input class="form-check-input" type="checkbox" id="PERINFO_AGREE_FG" <c:if test="${bbsData.PERINFO_AGREE_FG == 'Y'}">checked</c:if> value="Y"> <label class="form-check-label" for="PERINFO_AGREE_FG">개인정보취급방침에 동의합니다.<strong class="text-danger">(필수)</strong></label>
						</div>
						<div class="pre mb-3">${bbsMgr.PERINFO_AGREE_CONTENT }</div>
					</c:if>
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
							<c:if test="${bbsData.TEMP_SAVE_FG != 'N'}">
							<button class="btn btn-save mb-2" onclick="javascript:return fn_tempSubmit(this);" data-lang>임시저장</button>
							</c:if>
							<button class="btn btn-save mb-2" onclick="javascript:return fn_submit(this);" data-lang>저장</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

</div>
<script charset="utf-8" src="/common/js/jquery-ui-timepicker-addon.js"></script>
<script charset="utf-8" src="/common/ckeditor/ckeditor.js"></script>
<script charset="utf-8" src="/common/js/gfn/gfn_ums.js?1118"></script>
<script type="text/javascript">
	scwin.bbsEditorUseYn = "Y";
	
	var ATTACH_FILE_GRP_CD ="";
	var NEW_BBS_POSTING_SEQ_NO = '${bbsData.POSTING_SEQ_NO}';	<%-- 새글 게시물 번호 --%>
	var params_mode = "${params.mode}";
	
    $(document).ready(popInit());
   
    function popInit() {
    	//console.log('scwin.PAYMNT_ID = '+ scwin.PAYMNT_ID);
    	//비로그인시 작성자 입력 가능 
    	//$("#WRITEOUT_USER_NM").attr("disabled",false);
    	
		if(scwin.bbsEditorUseYn == "Y"){
			var cssPathArr = [	'/common/css/jquery-ui.min.css',
								'/common/bootstrap-4.6.1/css/bootstrap.min.css',
								'/common/bootstrap-table-master/dist/bootstrap-table.min.css',
								'/common/css/common.css',
								'/common/css/style.css',
								'/common/css/contents.css'
			];
			var optionCkeditor = {	height: "200",
	    	                        customConfig : '/common/ckeditor/custom_config.js',
	    	                        contentsCss : cssPathArr,
	    	                        filebrowserUploadUrl : '/file/CKEDITORImgPasteUpload.do?SYSTEM_GCD=' + scwin.menuInfo.SYSTEM_GCD
		    	                                          + '&SESSION_MENU_CD=' + scwin.menuInfo.MENU_CD
		    	                                          + '&SESSION_USER_ID=' + scwin.loginUser.userId
		    	                                          + '&SESSION_USER_IP=' + scwin.loginUser.userIp
		    	                                          + '&' +scwin.tokenHeaderNm+ '=' + scwin.token
		    	                                          + '&' +scwin.tokenParameterNm+ '=' + scwin.token
			};
	    	CKEDITOR.replace("CONTENT",optionCkeditor);
		} 
		//다국어 적용
    	loadLangInfo("popup");
    	
    	var calendar_date = {
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin : ['일','월','화','수','목','금','토'],
			currentText : '현재날짜',
			closeText : '선택',
			changeMonth : true,
			changeYear : true,
			yearRange : 'c-10:c+10',
			dateFormat : 'yy-mm-dd',
			timeFormat: 'hh:mm',
			format: "YYYY-MM-DD HH:mm:ss",
			buttonImageOnly : false
        };
    	gfn_com_createDateTimeComp2("POSTING_START_DT",calendar_date);
    	gfn_com_createDateTimeComp2("POSTING_CLOSE_DT",calendar_date);
    	
		<c:if test="${params.mode =='WRITE' }">
			//ATTACH_FILE_GRP_CD = $.formuploader._getRandomKey();
			ATTACH_FILE_GRP_CD = "";
		</c:if>
		<c:if test="${params.mode =='MODIFY' }">
			ATTACH_FILE_GRP_CD = "${bbsData.ATTACH_FILE_GRP_CD}";
		</c:if>
		<c:if test="${bbsMgr.EMAIL_USE_FG  =='Y'}">
         	$("#EMAIL").emailEditor({
             	val : "${bbsData.EMAIL}",
             	index : 2
             });
		</c:if>
   		<c:if test="${ bbsMgr.ATTACH_FILE_USE_FG eq 'Y'}">
			var uploader_target1 = $("#uploader_target1").formuploader({
				SYSTEM_GCD : "${SESSION_SYSTEM_GCD}",  //시스템코드
         		ATTACH_FILE_GCD : "0001", // 첨부파일 종류 코드 
         		ATTACH_FILE_GRP_CD : ATTACH_FILE_GRP_CD,  // 첨부파일 그룹 코드 
         		ACCEPT_EXT : scwin.menuInfo.FILE_EXTENSION_CONTENT,  // 허용확장자 ( 메뉴설정에서 들고 오거나 지정한 확장자가 없으면 기본 확장자로 사용. )
         		UPLOAD_SIZE : scwin.menuInfo.FILE_SIZE / 1024 / 1024, // 최대 파일용량 (mb) (메뉴설정에서 들고 오거나 지정한 용량 없으면 기본 20mb )
         		<c:if test="${bbsMgr.BBS_TYPE_GCD =='0002'}" ><%-- 0002: 웹진형 --%>
         		UPLOAD_CNT : 1, 
         		</c:if>
         		<c:if test="${bbsMgr.BBS_TYPE_GCD =='0003'}" ><%-- 0003: 갤러리형 --%>
         		UPLOAD_CNT : 10, 
         		</c:if>
				FILE_TAG_CONTENT_YN : "Y",
				dataBound : function(data,_target) { /* 업로드 완료후 처리 함수*/
					alert("업로드 완료",_target);
					ATTACH_FILE_GRP_CD = data.ATTACH_FILE_GRP_CD;
				}
         	});
		</c:if>
         	
      	<%--
      	//비밀번호 사용여부 (사용안함)
      	<c:if test="${bbsMgr.PASSWORD_USE_FG == 'Y'}">
      		$("#SECRET_FG").change(function(){
      			if($(this).is(':checked')){
      				$("#PASSWORD").attr("disabled",false);
      			}else{
      				$("#PASSWORD").attr("disabled",true);
      			}
      		});
      	</c:if>
      	--%>
         	
       	//게시종료일자 사용여부
       	<c:if test="${bbsMgr.POSTING_CLOSE_DATE_USE_FG == 'Y'}">
       		<c:if test="${bbsMgr.POSTING_CLOSE_DATE_FG == 'Y'}">
       		
       		</c:if>
       		<c:if test="${bbsData.POSTING_CLOSE_DATE_FG == 'N' || bbsData.POSTING_CLOSE_DATE_FG == null}">
       			$( "#POSTING_START_DT" ).closest(".input-group").find(".ui-datepicker-trigger").attr("disabled",true);
       			$( "#POSTING_CLOSE_DT" ).closest(".input-group").find(".ui-datepicker-trigger").attr("disabled",true);
       		</c:if>
       		
       		$("#POSTING_CLOSE_DATE_FG").change(function(){
       			var posting_start_id = "#POSTING_START_DT";
       			var posting_close_id = "#POSTING_CLOSE_DT";
       			
       			if($(this).is(':checked')){
       				$(posting_start_id).attr("disabled",false);
       				$(posting_start_id).closest(".input-group").find(".ui-datepicker-trigger").attr("disabled",false);
       				$(posting_close_id).attr("disabled",false);
       				$(posting_close_id).closest(".input-group").find(".ui-datepicker-trigger").attr("disabled",false);
       			}else{
       				$(posting_start_id).attr("disabled",true);
       				$(posting_start_id).closest(".input-group").find(".ui-datepicker-trigger").attr("disabled",true);
       				$(posting_close_id).attr("disabled",true);
       				$(posting_close_id).closest(".input-group").find(".ui-datepicker-trigger").attr("disabled",true);
       			}
       		});
       	</c:if>
    }
    
    <%-- 유효성 검사 --%>
    function fn_validate(param) {
		var rtnValue = gfn_val_validateDataMap(param, [
			{"id" : "TITLE_CONTENT", "name" : "제목", "notNull" : true}
		   ,{"id" : "WRITEOUT_USER_NM", "name" : "작성자", "notNull" : true}
		<c:if test="${params.mode != 'ANSWER' && bbsMgr.BBS_TYPE_GCD == '0005'}" >
	       ,{"id" : "GUIDE_SEND_RCV_FG", "name" : "안내발송수신여부", "notNull" : true}
		</c:if>
		<c:if test="${ bbsMgr.PERINFO_AGREE_USE_FG eq 'Y'}">
		   ,{"id" : "PERINFO_AGREE_FG", "name" : "개인정보동의", "notNull" : true}
		</c:if>
		]);
		return rtnValue;
	}
    
    <%-- 기타 유효성 검사 --%>
    function fn_validateEtc() {
    	var rtnValue = true;
    	if(scwin.bbsEditorUseYn == "Y"){
			$("#CONTENT" ).val(CKEDITOR.instances['CONTENT'].getData());
	        if($("#CONTENT").val() == ""){
	        	alert("내용을 입력해주세요.",CKEDITOR.instances['CONTENT']);
	        	rtnValue = false;
	        }
    	}
    	<%--
		if($("#SECRET_FG").is(":checked")) {
        	if($("#PASSWORD").val() == ""){
        		alert("비밀번호를 입력해주세요.",$("#PASSWORD"));
        		rtnValue = false;
        	}
        }
		--%>
		if($("#POSTING_CLOSE_DATE_FG").is(":checked")) {
			if($("#POSTING_START_DT").val() == ""){
        		alert("게시시작일자를 입력해주세요.",$("#POSTING_START_DT"));
        		rtnValue = false;
        	}
			
        	if($("#POSTING_CLOSE_DT").val() == ""){
        		alert("게시종료일자를 입력해주세요.",$("#POSTING_CLOSE_DT"));
        		rtnValue = false;
        	}
        }
		return rtnValue;
	}
    
    <%-- 임시글 저장 --%>
    function fn_tempSubmit(_this) {
    	var TEMP_SAVE_FG = 'Y';
    	var param = gfn_com_inputdata($("#popups"));

    	if (!fn_validate(param)) return false;
    	if (!fn_validateEtc()) return false;

    	confirm(gva_TEMP_SAVE_CONFIRM_MSG,function(_flag){
    		if(_flag) {
    			
    			if(gfn_str_parseNull($("#uploader_target1").find("input[name=attach_file_grp_cd]").val()) != ""){
    				var options = {};
            	 	options.target= "uploader_target1";
        			options.success = function(data, responseData) {
        				fn_bbsSave(_this,TEMP_SAVE_FG);
        			};
            	 	$.formuploader._completeFile(options);		
    			}else{
    				fn_bbsSave(_this,TEMP_SAVE_FG);
    			}
    			
    		}
    	});
    }
    
    <%-- 글 저장 --%>
    function fn_submit(_this) {
    	var TEMP_SAVE_FG = 'N';
    	var param = gfn_com_inputdata($("#popups"));

    	if (!fn_validate(param)) return false;
    	if (!fn_validateEtc()) return false;

    	confirm(gva_SAVE_CONFIRM_MSG,function(_flag){
    		if(_flag) {
    			
    			if(gfn_str_parseNull($("#uploader_target1").find("input[name=attach_file_grp_cd]").val()) != ""){
    				var options = {};
            	 	options.target= "uploader_target1";
        			options.success = function(data, responseData) {
        				fn_bbsSave(_this,TEMP_SAVE_FG);
        			};
            	 	$.formuploader._completeFile(options);		
    			}else{
    				fn_bbsSave(_this,TEMP_SAVE_FG);
    			}
    			
    		}
    	});
    }
    
    <%-- 게시글 저장 --%>
	function fn_bbsSave(_this,TEMP_SAVE_FG){
    
    	var param = gfn_com_inputdata($("#popups"));
    	param["mode"] = "${params.mode}"+"_PROC";
      	param["BBS_TYPE_GCD"] = "${bbsMgr.BBS_TYPE_GCD}";
     	param["BBS_TYPE_SEQ_NO"] = "${bbsMgr.BBS_TYPE_SEQ_NO}";
     	param["ATTACH_FILE_GRP_CD"] = ATTACH_FILE_GRP_CD;
     	param["POSTING_SEQ_NO"] = "${bbsData.POSTING_SEQ_NO}";
     	param["POSTING_GRP_NO"] = "${bbsData.POSTING_GRP_NO}";
     	
     	<c:if test="${params.mode == 'ANSWER'}" >
     		param["LEVEL"] = parseInt("${bbsData.LEVEL}")+1;
     		param["POSTING_GRP_SEQ_NO"] = parseInt("${bbsData.POSTING_GRP_SEQ_NO}")+1;
     	</c:if>
     	<c:if test="${params.mode != 'ANSWER'}" >
     		param["LEVEL"] = 0;
     		param["POSTING_GRP_SEQ_NO"] = 1;
     	</c:if>
     	gfn_com_closeModalWall($(_this).closest("#popup").attr("idx"),function(){
			//fn_sch();
		});		

     	param["CONTENT"] = $("#CONTENT" ).val(); 
     	param["TEMP_SAVE_FG"] = TEMP_SAVE_FG;

     	gfn_ajax_request({
 			url : "/bbs/saveBbsInfo", 
 			reqData : param,
 			success : function(data, responseData){
				<c:if test="${params.mode !='MODIFY' }">
					NEW_BBS_POSTING_SEQ_NO = responseData.data.NEW_BBS_POSTING_SEQ_NO;
				</c:if>
 				<%-- 게시글 저장후 메시지 발송 등 처리 --%>
				<c:choose>
					<c:when test="${params.mode == 'ANSWER' && bbsData.GUIDE_SEND_RCV_FG =='Y'}"><%-- 답변이고 사용자 수신 동의했을시 메시지 발송 --%>
						gfn_ums_getPaymntId2(gfn_str_parseNullDefault(scwin.loginUser.assignCd, '000000'), 'sample_msgSend_withApi');
						//gfn_ums_getPaymntId2('341000', 'sample_msgSend_withApi');	
					</c:when>
					<%--<c:when test="${(params.mode == 'ANSWER' && bbsData.GUIDE_SEND_RCV_FG !='Y') || params.mode == 'WRITE'}">
						alert(data.msg, fn_refresh);
					</c:when>--%>
					<c:otherwise>
						alert(data.msg, fn_refresh);
					</c:otherwise>
 				</c:choose>
 			}
 		});

	}
     
	var sample_msgSend_withApi = function(paymentId) {
		if(gfn_str_parseNullDefault(paymentId, 'ISNULL') == 'ISNULL') {
			alert("답변 저장은 완료되었으나 \n해당 부서에서 사용할 수 있는 메시지 발송 과금아이디가 없습니다. \n 부서별 과금아이디 신청바랍니다.", fn_refresh);
			return;
		}
		
		var result = false;
		var param = {};
		param.STDT_NO = '${bbsData.INS_USER_ID}';
		gfn_ajax_request({
			url : "/ost/hj/stdtinfo/stdtinfoupd/selectStdtInfoUpd",<%-- OST_학적_학적부_개인정보_조회(@STDT_NO) --%>
			reqData : param,
			success : function(data, responseData){
				var dma_01 = {};
				//신규작성시 미입력, 메시지정보 키값1
				dma_01.WRITEOUT_DATE = '';
				//신규작성시 미입력, 메시지정보 키값2
				dma_01.MSG_SEND_SEQ_NO = '';
				//필수 -발신자 아이디 정보, 미입력시 로그인사용자 정보사용
				dma_01.SEND_USER_ID = scwin.loginUser.userId;
				//필수 -발신자 부서 정보, 미입력시 로그인사용자 정보사용
				dma_01.DIVISION_CD = gfn_str_parseNullDefault(scwin.loginUser.assignCd, '000000');  //"312300";//scwin.loginUser.deptCd;
				//필수 -발신자구분 개인기반발신(0001), 부서기반발신(0002) 과금 주체에 따라 기입. 
				dma_01.SEND_USER_GCD = '0002';
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
				dma_01.PUSH_SHORTCUT_URL_CONTENT = 'https://onestop.pusan.ac.kr'+ fn_getBbsUrl();
				
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
				//dma_01.PAYMNT_ID = scwin.PAYMNT_ID ;
				dma_01.PAYMNT_ID = paymentId;
				//SMS 필수 - 발신번호 SMS발송시 발신자로 나타나는번호, 개발시에는 발송직전에 '01054153371'로 바뀜
				dma_01.SEND_TEL_NO = scwin.loginUser.extsNo;
				//SMS 필수 - 내용
				dma_01.SMS_CONTENT = '[학생지원시스템 QNA 답변 등록 알림]\n\n'+ title_str +' 작성 글에 답변이 등록되었습니다.\n\nhttps://one.pusan.ac.kr'+ fn_getBbsUrl();
				
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
				rcv_user_info.RCV_TEL_NO = data[0].STDT_CELLULAR_NO;
				rcv_user_info.RCV_CONTENT = "";
				rcv_user_info.SESSION_SYSTEM_GCD = '0002';
				rcv_user_info.SESSION_MENU_CD = scwin.menuCd;
				rcv_user_info.SESSION_USER_ID = scwin.loginUser.userId;
				rcv_user_info.SESSION_USER_IP = scwin.loginUser.userIp;
				
				gfn_ums_sendMsg(dma_01, [rcv_user_info], 'fn_getMsgKey');
			}
		});
	}
     
	var fn_getMsgKey = function(data, responseData) {
		if(gfn_str_parseNull(data.MSG_SEND_SEQ_NO) != ''){
		    alert("답변 저장 및 메시지 발송이 완료되었습니다.", fn_refresh);
		}else{
		    alert("답변 저장은 완료되었으나 메시지 발송이 실패하였습니다.", fn_refresh);
		}
	}
	
	var fn_getBbsUrl = function() {
		return "/page?menuCD="+scwin.menuCd+"&mode=DETAIL&seq="+NEW_BBS_POSTING_SEQ_NO;
	};
	
	var fn_refresh = function() {
		location.href = fn_getBbsUrl();
	};
</script>