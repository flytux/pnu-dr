var fn_ajax_enc_param = function(str) {
	/* 부하테스트용 암호화제거 START */
	//return str;
	/* 부하테스트용 암호화제거 END */
    if(gfn_str_getByteLength(str) > 245) {
        var strLength = 0;
        var plainStr = "";
        var encStr = "";
        
        for(i = 0; i < str.length; i++) {
            var code = parseInt(str.charCodeAt(i));
            var ch = str.substr(i,1).toUpperCase();
            
            if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
                strLength += 3;
            }else{
                strLength += 1;
            }
            plainStr += str.substr(i,1);
            
            if(strLength > 200 || i == (str.length-1)) {
                encStr += (","+_rsa.encrypt(plainStr));
                plainStr = "";
                strLength = 0;
            }
        }
        return encStr.substr(1,encStr.length);
    } else {
        return _rsa.encrypt(str);
    }
}

function gfn_ajax_request(options){
	var contentType = "application/json";
	contentType = options.contentType ? options.contentType : contentType;
	
	var reqData = options.reqData;
	
	if(reqData == null) reqData = {};

	if(contentType == "application/json" && reqData){
		reqData.locale = gfn_str_parseNull(scwin.i18n.locale);
		/* 부하테스트용 주석 */
		reqData = {_data : JSON.stringify(reqData), AUTH_STR: scwin.menuInfo.AUTH_STR};
		reqData = {_data : fn_ajax_enc_param(JSON.stringify(reqData))};
		
		
		/* 부하테스트용 암호화제거 START */
        //reqData = {_data: fn_ajax_enc_param(reqData), AUTH_STR: scwin.menuInfo.AUTH_STR};
        /* 부하테스트용 암호화제거 END */

		reqData = JSON.stringify(reqData);
	}

	var async   = options.async = gfn_str_parseNull(options.async) == '' ? true : options.async;
	
	var cache   = options.cache;
	if(gfn_str_parseNull(cache) == "") cache = false;

	var crossDomain = options.crossDomain;
	if(gfn_str_parseNull(crossDomain) == "") crossDomain = false;
	
	if(!options.url) options.url = '';

	var timestamp = + new Date();
	options.timestampId = timestamp; 
	
	options.loadingMsg = gfn_str_parseNull(options.loadingMsg);
	if (!gfn_com_isEmptyObject(scwin.loginUser)) {
		loginCountDown(); //세션시간갱신
	}
	$.ajax({
		url : options.url,
		type: options.type||"post",
		dataType : options.dataType||"json",
		contentType : contentType||"application/json",
		requestHeader : options.requestHeader||{},
		data : reqData,                   
		async: async,
		cache : cache,
		beforeSend:function(request){
			if(options.loading == undefined) {
				gfn_ajax_showLoadingImg(true, gfn_str_parseNull(options.loadingMsg), gfn_str_parseNull(options.timestampId));
			}
			request.setRequestHeader("AJAX", "true");
			request.setRequestHeader(scwin.tokenHeaderNm, scwin.token);
		},
		complete:function(a,b,c){
			if(options.loading == undefined) {
				gfn_ajax_showLoadingImg(false,"", gfn_str_parseNull(options.timestampId));
			}
		},
		success : function(responseData){
			
			if(!responseData) responseData = {};
            var statusCode = responseData ? responseData.statusCode : '901';
            var msg = '';
            // 세션만료
            if(statusCode == '440'){
                msg = responseData.msg;
                if(!msg) msg = '세션정보가 변경 되었습니다.<br/>로그인 페이지로 이동합니다.';
                alert(msg,function(){
					location.href = '/';
				});
                return;
            }
            
            // tocken 만료 및 missing
            if(statusCode == '401'){
                msg = responseData.msg;
                if(!msg) msg = 'Tocken is missing or expired.';
                alert(msg);
                location.href = '/';
                return;
            }
            
            // 접근 권한 없음.
            if(statusCode == '403'){
                msg = responseData.msg;
                if(!msg) msg = 'Access Denied.';
                alert(msg);
                return;
            }
            // 결과값 없음.
            if(statusCode == '901'){
                msg = '결과값이 없습니다.';
                alert(msg);
                return;
            }
			var data = responseData.data;
			var pageInfo = responseData.pageInfo;
			
			if(!gfn_com_isEmptyObject(pageInfo)){
				responseData.reqData =options.reqData;  
			}

			if(typeof options.success == "string"){
				options.success(data, responseData);
			} else if(typeof options.success == "function"){
				options.success(data, responseData);
			}
			accordionLabelChg();
		},
		error : function(jqXhr, textStatus, errorThrown){
			
			var errCode = null;
            var errType = null;
            var message = jqXhr.responseText;
            var data    = null;
            var errorData = jqXhr.responseJSON;

			if(jqXhr.status == "401" && jqXhr.responseText.indexOf("로그인 페이지") > 0){        		
        		alert(gfn_str_replaceAll(jqXhr.responseText, '<br />', '\n'),function(){
					window.location.reload();
				}); 
        	} else if(jqXhr.status == "0" && jqXhr.statusText == "error"){        		
        		alert("학생지원시스템이 업데이트 되었습니다.\n재접속 후 사용하시기 바랍니다.\n\n문의 : 510-7469",function(){
					window.location.reload();
				});        		
        	} else {
				/* 공통관리> DB관리> DB프로시저정보조회 메뉴에서 보여 줄 sql exception 오류정보 */
	            if(errorData != undefined && errorData.ex != undefined && errorData.ex.cause != null && errorData.ex.cause.sqlserverError) {
	                
	                console.log('SQL Error Code : '+errorData.ex.cause.sqlserverError.errorNumber);
	                console.log('SQL Error : '+errorData.ex.cause.message);
	                message = '관련 정보를 가지고 올수 없는 SP입니다.';
	                
	                if(errorData.ex.cause.sqlserverError.errorNumber == 515) {
	                    message += '<br />(필수값 중 빈 값이 있습니다.)';
	                } else if(errorData.ex.cause.sqlserverError.errorNumber == 2627) {
	                    message += '<br />(중복되는 데이터가 존재 합니다.)';
	                } else if(errorData.ex.cause.sqlserverError.errorNumber == 7357) {
	                    message += '<br />(출력 컬럼이 지원되지 않는 프로시저 입니다.<br />(출력 컬럼 없음))';
	                } else if(errorData.ex.cause.sqlserverError.errorNumber == 11512) {
	                    message += '<br />(출력 컬럼이 지원되지 않는 프로시저 입니다.<br />(IF문 사용))';
	                } else if(errorData.ex.cause.sqlserverError.errorNumber == 492) {
	                    message += '<br />(출력 컬럼이 지원되지 않는 프로시저 입니다.<br />(열, 컬럼 이름 중복))';
	                } else if(errorData.ex.cause.sqlserverError.errorNumber == 11514) {
	                    message += '<br />(출력 컬럼이 지원되지 않는 프로시저 입니다.<br />(동적SQL))';
	                } else if(errorData.ex.cause.sqlserverError.errorNumber == 11526) {
	                    message += '<br />(출력 컬럼이 지원되지 않는 프로시저 입니다.<br />(임시테이블사용))';
	                } else if(errorData.ex.cause.sqlserverError.errorNumber == 11529) {
	                    message += '<br />(출력 컬럼이 지원되지 않는 프로시저 입니다.<br />(테이블 경로 부정확))';
	                } else if(errorData.ex.cause.sqlserverError.errorNumber == 11520) {
	                    message += '<br />(출력 컬럼이 지원되지 않는 프로시저 입니다.<br />(저장 프로시저를 호출))';
	                }
	            } 
			}
			gfn_ajax_defaultAjaxError(jqXhr, textStatus, errorThrown, options.failCallBack);
		}
	});
}

function gfn_ajax_defaultAjaxError(jqXhr, textStatus, errorThrown, userFunc){
	
	var errCode = null;
    var errType = null;
    var message = '작업 중 오류가 발생하였습니다.';
    var data    = null;
    var errorData = jqXhr.responseJSON;
    if(errorData){
        errorType = errorData.errorType;
        errCode = errorData.status;
        message = errorData.message;
        data = errorData.data;
    }
    alert(message);
    
    if(typeof userFunc == "function"){
		userFunc(jqXhr, textStatus, errorThrown);
	}
	if(typeof userFunc == "string"){
		window[userFunc](jqXhr, textStatus, errorThrown);
	}
}

function gfn_ajax_showLoadingImg(bBoolean, message, addId){
	var msg = gfn_str_parseNull(message);
	var id = gfn_str_parseNull(addId);
	if(bBoolean){
		gfn_ajax_handleHoldDiv(bBoolean,id);
		var strElem = "";
		if(msg) {
			strElem = '<div id="grp_ajax_loading_image'+id+'" findStr="grp_ajax_loading_image'+id+'"><div style="z-index:'+(gfn_com_maxZindex(0)+2)+';" class="__loader-msg"><div class="sk-folding-cube"><div class="sk-cube1 sk-cube"></div><div class="sk-cube2 sk-cube"></div><div class="sk-cube4 sk-cube"></div><div class="sk-cube3 sk-cube"></div></div><br /><br /><strong>'+msg+'</strong></div></div>';
		} else {
			strElem = '<div id="grp_ajax_loading_image'+id+'" findStr="grp_ajax_loading_image'+id+'"><div style="z-index:'+(gfn_com_maxZindex(0)+2)+';" class="__loader"><div class="sk-folding-cube"><div class="sk-cube1 sk-cube"></div><div class="sk-cube2 sk-cube"></div><div class="sk-cube4 sk-cube"></div><div class="sk-cube3 sk-cube"></div></div></div></div>';
		}
		var body = $("body");
		body.append(strElem);
	} else {
		gfn_ajax_handleHoldDiv(bBoolean,id);
		var comp = $("[findStr='grp_ajax_loading_image"+id+"']");
		if(comp.length > 0){
			comp.remove();
		}
	}
}

function gfn_ajax_handleHoldDiv(createYN, addId){
	if(createYN){
		var body = $("body");
		var divComp = $("#grp_gfn_handle_ajax_hold"+addId);
		if(divComp.length <= 0){
			body.append('<div id="grp_gfn_handle_ajax_hold'+addId+'" style="position:fixed;left:0;top:0;width:100%;height:' + $("body").css("height") + '; text-align:center; background-color:#fff;filter:alpha(opacity=50);opacity:0;z-index:'+(gfn_com_maxZindex(0)+1)+';"></div>');
		}
	} else {
		var comp = $("#grp_gfn_handle_ajax_hold"+addId);
		if(comp.length > 0){
			comp.remove();
		}
	}
}