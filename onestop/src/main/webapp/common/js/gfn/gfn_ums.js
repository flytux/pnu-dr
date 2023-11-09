scwin.PAYMNT_ID ='';
var gfn_ums_sendMsg = function(msg_info,rcv_user_list, func) {
	if (msg_info.MSG_SEND_SEQ_NO == '') {
		msg_info.MSG_SEND_SEQ_NO = 0;
	}
	if (msg_info.SEND_USER_ID == '') {
		msg_info.SEND_USER_ID = scwin.loginUser.userId;
	}
	if (msg_info.DIVISION_CD == '') {
		msg_info.DIVISION_CD = scwin.loginUser.deptCd;
	}

	msg_info.SESSION_SYSTEM_GCD = '0001';//common.getSystemGcd();
	msg_info.SESSION_MENU_CD = '000000000000000';//common.getMenuCd();
	msg_info.SESSION_USER_ID = scwin.loginUser.userId;
	msg_info.SESSION_USER_IP = scwin.loginUser.userIp;
	msg_info.SESSION_USER_DEPT_CD = scwin.loginUser.deptCd;
	msg_info.SESSION_SEARCH_SCOPE_GCD = '0001';//common.getSearchScopeGcd();

	var options = {
		async : false
	};
	options.url = '/ums/api/gfnUmsSendMsg';

	options.reqData = {
		msg_info : msg_info,
		rcv_user_list : rcv_user_list
	};
	options.success = function(data, responseData) {
		if (typeof func == "function") {
			func(data, responseData);
		} else if (typeof func == "string") {
			window[func](data, responseData);
		}  
	};
	gfn_ajax_request(options);

}


var gfn_ums_getPaymntId = function(divisionCd, func_name) {

	var options = {};
	options.url = '/ums/api/gfnUmsGetPaymntId';
	options.reqData = {
		DIVISION_CD : divisionCd
	};
	options.success = function(data, responseData) {
		var paymntId = data[0].PAYMNT_ID;

		// 반환된 결재아이디가 없으면
		if (paymntId == 'ISNULL') {
			alert("답변 저장은 완료되었으나 \n해당 부서에서 사용할 수 있는 메시지 발송 과금아이디가 없습니다. \n 부서별 과금아이디 신청바랍니다.");
		}
		// 반환된 결재아이디가 다수이면
		else if (paymntId == 'TWOMORE') {
			// 팝업호출
			setTimeout(function(){
			gfn_bbs_modalPopup({
	        	width : 1100,
	            height : 280,
	            index : 1,
	            target : null,            
	            title : "과금아이디 선택",
	            include : "/bbs/PaymentIdSelectPop", 
	            reqData : {
					DIVISION_CD : divisionCd,
				}
	        });
			}, 1000);	
		}
		// 반환된 결재아이디가 하나면
		else {
				scwin.PAYMNT_ID = paymntId;
				if (typeof func_name == "function") {
					func_name();
				} else if (typeof func_name == "string") {
					window[func_name]();
				}  
		}
	};
	gfn_ajax_request(options);

}

var _divisionCd = '';
var _func_name = '';

var gfn_ums_getPaymntId2 = function(divisionCd, func_name) {

	var options = {};
	options.url = '/ums/api/gfnUmsGetPaymntId';
	options.reqData = {
		DIVISION_CD : divisionCd
	};
	options.success = function(data, responseData) {
		var paymntId = data[0].PAYMNT_ID;
		
		// 반환된 결재아이디가 다수이면
		if (paymntId == 'TWOMORE') {
			_divisionCd = divisionCd;
			_func_name = func_name;
			alert("답변이 저장되었습니다.\n메시지 발송에 사용할 과금아이디를 선택해 주시기 바랍니다.", fn_openGetPaymentIdPop);
		}
		else {
			if (typeof func_name == "function") {
				func_name(paymntId);
			} else if (typeof func_name == "string") {
				window[func_name](paymntId);
			}  
		}
	};
	gfn_ajax_request(options);
}

function fn_openGetPaymentIdPop() {
	// 과금아이디 선택 팝업 호출
	gfn_bbs_modalPopup({
    	width : 1100,
        height : 300,
        index : 1,
        target : null,            
        title : "과금아이디 선택",
        include : "/bbs/PaymentIdSelectPop", 
		reqDataUse : "Y",
        reqData : {
			DIVISION_CD : _divisionCd,
			FUNC_NAME : _func_name
		}
    });	
}