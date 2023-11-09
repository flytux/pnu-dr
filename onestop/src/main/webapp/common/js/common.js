var common = {};

common.getMatchedJSON = function(map, key, value) {	
	var json = new Array();
	
	for ( var prop in map) {
		if (map[prop][key] == value)
			json.push(map[prop]);
	}
	return json;
};

common.accountChk = function(bankcd, acctno, func) {
	gfn_ajax_request({
        url : "/core/function/accountchk/api",
        reqData : {
	        bankcd : bankcd,
	        accntno : acctno
	    },
        success : function(data, responseData) {            	
			if(typeof func == "function"){
	            func(data);
	        } else if (typeof func == "string"){
	            scwin[func](data);
	        }
        }
    });
}
common.accountUserChk = function(bankcd, acctno, userid, func) {
	gfn_ajax_request({
        url : "/core/function/accountchk/api",
        reqData : {
	        bankcd : bankcd,
	        accntno : acctno,
        	USER_ID : userid
	    },
        success : function(data, responseData) {            	
			if(typeof func == "function"){
	            func(data);
	        } else if (typeof func == "string"){
	            scwin[func](data);
	        }
        }
    });
}
//현재 년도 함수
function fn_nowYear() {
	var Nowyear = new Date().getFullYear();
	return Nowyear;
}
//현재 월 함수
function fn_nowMonth() {
	var Nowmonth = new Date().getMonth()+1;
	return Nowmonth;
}
//학년도 구하기(1월은 전년도 겨울계절학기 이므로 1년 마이너스)
function get_year() {
	var fn_year = fn_nowYear();
	var month = fn_nowMonth();
	if(month == '1'){
		fn_year = fn_year-1;	
	} 
	return fn_year;
}
//계절학기 미포함 학기 (1~6월 : 1학기, 7~12월 : 2학기) 
function get_hakgi() {
	var fn_term;
	var month = fn_nowMonth();
	if (month > 6) {
		fn_term = '0020';
	} else {
		fn_term = '0010';
	}
	return fn_term;
}
//계절학기 포함 학기 (2~6월 : 1학기, 7월 : 여름계절, 8~12월 : 2학기, 1월 : 겨울계절)
function get_semester_hakgi(){
	var fn_term;
	var month = fn_nowMonth();
	//var month = 7;
	if(month >=2 && month <= 6){
		fn_term = '0010';
	}else if(month == 7){
		fn_term = '0011';
	}else if(month >= 8 && month <= 12){
		fn_term = '0020';
	}else if(month == 1){
		fn_term = '0021';
	}else{
		fn_term = '0020';
	}
	return fn_term
}
//학기한글명
function get_termNm(term) {
	term = term;
	var termNm = "";
	if ("0010" == term) {
		termNm = "1학기";
	} else if ("0011" == term) {
		termNm = "여름계절수업";
	} else if ("0020" == term) {
		termNm = "2학기";
	} else if ("0021" == term) {
		termNm = "겨울계절수업";
	}
	return termNm;
}
