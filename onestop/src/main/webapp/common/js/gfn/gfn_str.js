/**
 * 기능 : String으로 변경 없을 시 "" 리턴
 * @param object : String으로 변경할 거
 * @returns String
 */
function gfn_str_parseNull(object) {
	if (object == window) return "";
	sResult = "";
	if (object !== null) {
		try {
			sResult = object + "";
		} catch (e) {
			sResult = "";
		}
	} else {
		sResult = "";
	}
	if (sResult === "null" || sResult === "undefined") {
		sResult = "";
	}
	return sResult;
}

/**
 * 기능 : String으로 변경 없을 시 "" 리턴 & 값이 있는경우 단위를 붙여서 리턴
 * @param object : String으로 변경할 거, unit : 단위
 * @returns String
 */
function gfn_str_parseNullUnit(object, unit) {
	if (object == window) return "";
	sResult = "";
	if (object !== null) {
		try {
			sResult = object + " " + unit;
		} catch (e) {
			sResult = "";
		}
	} else {
		sResult = "";
	}
	if (sResult === "null" || sResult === "undefined") {
		sResult = "";
	}
	return sResult;
}

/**
 * 기능 : String으로 변경 없을 시 "0" 리턴
 * @param object : String으로 변경할 거
 * @returns String
 */
function gfn_str_parseNullZero(object) {
	if (object == window) return "";
	sResult = "";
	if (object !== null) {
		try {
			sResult = object + "";
		} catch (e) {
			sResult = "";
		}
	} else {
		sResult = "";
	}
	if (sResult === "null" || sResult === "undefined") {
		sResult = "";
	}
	if (sResult == "") {
		sResult = "0";
	}
	return sResult;
}

/**
 * 기능 : String으로 변경 없을 시 default value값을 리턴
 * @param object : String으로 변경할 거
 * @returns String
 */
function gfn_str_parseNullDefault(object, val) {
	if (object == window) return "";
	sResult = "";
	if (object !== null) {
		try {
			sResult = object + "";
		} catch (e) {
			sResult = "";
		}
	} else {
		sResult = "";
	}
	if (sResult === "null" || sResult === "undefined") {
		sResult = "";
	}
	if (sResult == "") {
		sResult = val;
	}
	return sResult;
}

/**
 * XML, JSON Object 를 serialize/stringify 한다.
 * @param <Object> Object
 * @returns serialize/stringify String
 */
function gfn_str_serialize(object) {
	if (object == window) return "";
	if (typeof object == 'string') {
		return object;
	} else if (gfn_json_isJSON(object)) {
		return JSON.stringify(object);
	} else if (gfn_xml_isXmlCoc(object)) {
		return WebSquare.xml.serialize(object);
	} else {
		return object;
	}
}

function gfn_str_isKoreanWord(str) {
	var test = /[ㄱ-힣]/;
	return test.test(str);
}

function gfn_str_getByteLength(s) {
	var b;
	var i;
	var c;

	for (b = i = 0; c = s.charCodeAt(i++); b += c >> 11 ? 3 : c >> 7 ? 2 : 1)
		;
	return b;
}

/*
 * 사업자번호 체크
 * 
 */
function fn_isBizRegNumber(bizNumber) {
	var pattern = /^([0-9]{3})+\-([0-9]{2})+\-([0-9]{5})$/;
	if (!pattern.test(bizNumber)) {
		return false;
	}

	var bizNo = bizNumber.replace(/-/gi, "");
	var checkSum = 0;
	var checkDigit = [ 1, 3, 7, 1, 3, 7, 1, 3, 5 ];

	for (var i = 0; i < 9; i++) {
		checkSum += (Number(bizNo.substring(i, i + 1)) * Number(checkDigit[i]));
	}

	checkSum += parseInt((Number(bizNo.substring(8, 9)) * 5) / 10); // 소수점 버린다..

	if ((10 - Number(Number(checkSum) % 10)) % 10 == Number(bizNo.substring(9, 10)))
		return true;
	else
		return false;
}

/*
 * 법인등록번호 체크
 * 
 */
function fn_isRcoNumber(rcoNumber) {
	var re = /-/g;
	rcoNumber = rcoNumber.replace('-', '');
	if (rcoNumber.length != 13) {
		return false;
	}
	var arr_regno = rcoNumber.split("");
	var arr_wt = new Array(1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2);
	var iSum_regno = 0;
	var iCheck_digit = 0;
	
	for (i = 0; i < 12; i++) {
		iSum_regno += (arr_regno[i]) * (arr_wt[i]);
	}
	iCheck_digit = 10 - (iSum_regno % 10);
	iCheck_digit = iCheck_digit % 10;
	
	if (iCheck_digit != arr_regno[12]) {
		return false;
	}
	return true;
}

/*
 * 주민등록번호 체크 (+ 외국인등록번호 추가)
 * 
 */
function fn_isRrnum(rrNumber) {		
	var rn = rrNumber.replace('-', '');	
	
	//13자리 숫자 확인
	if(rn.length !== 13) return false;
	
	// 검증값 합계
    var checkSum = 0;
    for(var i=0; i<12; i++) checkSum += ((rn.substr(i,1)>>0)*((i%8)+2));
 
    // 검증
    var modCheckSum = checkSum%11;   							// 검증값 합계의 11의 나머지수
    var rrnMatch = (11-(modCheckSum))%10 == rn.substr(12,1);    // 주민번호 검증
    var frnMatch = (13-(modCheckSum))%10 == rn.substr(12,1);    // 외국인번호 검증

    return rrnMatch || frnMatch;
}

/*
 * 이메일 체크
 * 
 */
function fn_isEmail(email) {
	var pattern = /^[_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;
	return pattern.test(email);
}
/*
 * 휴대전화번호 체크
 * 
 */
function fn_isCellPhoneNumber(cellPhoneNumber) {
	var pattern = /^(01(0|1|6|7|8|9))+\-([0-9]{3,4})+\-([0-9]{4})$/;
	return pattern.test(cellPhoneNumber);
}
/*
 * 전화번호 체크
 * 
 */
function fn_isTelephoneNumber(telephoneNumber) {
	var pattern = /^([0-9]{2,4})+\-([0-9]{3,4})+\-([0-9]{4})$/;
	return pattern.test(telephoneNumber);
}

/*
 * 이메일 체크
 * 
 */
function gfn_str_isEmail(email) {
	var pattern = /^[_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;
	return pattern.test(email);
}
;
/*
 * 휴대전화번호 체크
 * 
 */
function gfn_str_isCellPhoneNumber(cellPhoneNumber) {
	var pattern = /^(01(0|1|6|7|8|9))+\-([0-9]{3,4})+\-([0-9]{4})$/;
	cellPhoneNumber = gfn_str_maskTelFormat(cellPhoneNumber);
	return pattern.test(cellPhoneNumber);
}
;
/*
 * 전화번호 체크
 * 
 */
function gfn_str_isTelephoneNumber(telephoneNumber) {
	var pattern = /^([0-9]{2,4})+\-([0-9]{3,4})+\-([0-9]{4})$/;
	telephoneNumber = gfn_str_maskTelFormat(telephoneNumber);
	return pattern.test(telephoneNumber);
}

/**
 * 
 * @param source (String) 원 문자열
 * @param format (String) 포맷 문자열
 * 값이 들어갈 자리에 '#'을 사용한다. ex) '####-##-##'
 * @returns {String}
 */
function gfn_str_getFormatStr(source, format) {
	var idx = 0;
	var rStr = "";
	source = gfn_str_parseNull(source);
	if (source == "") return "";
	for (var i = 0; i < format.length; i++) {
		var chr = format.substr(i, 1);
		if (chr == "#") {
			chr = source.substr(idx, 1);
			idx += 1;
		}
		rStr += chr;
	}
	return rStr;
}

function gfn_str_fixedStr(source, num) {
	var rStr = "";
	if(!isNaN(source) && !isNaN(num)) {
		rStr = Number(source).toFixed(Number(num));
	} else {
		rStr = source;
	}
	return rStr;
}

/**
 * 문자열의 오른쪽을 특정 길이 만큼 특정 문자로 채운다.
 * @param source (String) 문자열
 * @param length (int) 채울 길이
 * @param char (String) 채울 문자열 (1자리)
 * @returns {String}
 */
function gfn_str_fillChar(source, length, char) {
	source = gfn_str_parseNull(source);
	var sLength = source.length;
	var preChar = "";
	length = length * 1;
	if (sLength < length) {
		for (var i = 0; i < length - sLength; i++) {
			preChar += char;
		}
		source = preChar + source;
	}
	return source;
}

/**
 * 주민등록번호에 "-"가 없는 경우 "-"를 추가한다.
 * 
 * @param value : 주민등록번호
 * @return 990101-2123456
 * @example gfn_str_maskSSNFormat("9901012123456");
 */
function gfn_str_maskSSNFormat(value) {
	if (typeof value == "number") {
		value = value + "";
	}
	var pos = -1;

	pos = value.indexOf("-");
	if (pos > -1 && (pos != 6 || value.length <= 7)) {
		value = value.slice(0, pos) + value.slice(pos + 1, value.length);
	}

	pos = value.indexOf("-");
	if (pos == -1 && value.length >= 7) {
		value = value.slice(0, 6) + "-" + value.slice(6, value.length);
	}

	if (value.length > 14) {
		value = value.slice(0, 14);
	}
	return value;
}


/**
 * 주민등록번호에 "-"가 없는 경우 "-"를 추가하며 뒤에 6자리를 *로 처리한다.
 * 
 * @param value : 주민등록번호
 * @return 990101-2******
 * @example gfn_str_maskSSNFormat2("9901012123456");
 */
function gfn_str_maskSSNFormat2(value) {
	if (typeof value == "number") {
		value = value + "";
	}
	if (value.indexOf("-") >= 0) {
		var pos = value.indexOf("-");
		retValue = value.substring(0, pos) + value.substring(pos + 1);
	} else {
		retValue = value;
	}
	if (retValue.length > 7) {
		retValue = retValue.substring(0, 6) + "-" + retValue.substring(6, 7) + "*******".substring(0, retValue.length - 7);
	} else if (retValue.length > 6) {
		retValue = retValue.substring(0, 6) + "-" + retValue.substring(6);
	}
	return retValue;
}


/**
 * 사업자번호의 "-"가 없는 경우 "-"를 추가하여 표시한다.
 * 
 * @param value : 사업자번호
 * @return 123-45-67890
 * @example gfn_str_maskCorpFormat("1234567890");
 */
function gfn_str_maskCorpFormat(value) {
	return value.replace(/-/g, '').replace(/(\d{3})(\d{2})(\d{5})/g, '$1-$2-$3');
}


/**
 * 주민번호, 사업자번호 체크하여 포맷에 맞게 "-" 추가한다.
 * 
 * @param value : 사업자번호
 * @return 123-45-67890(사업자번호), 123456-1234567(주민등록번호)
 * @example gfn_str_maskSSNCorpFormat("1234567890");
 */
function gfn_str_maskSSNCorpFormat(obj, value) {
	if (typeof value == "number") {
		value = value + "";
	}
	// 1. test pos value
	var pos = value.indexOf("-");
	var lastPos = value.lastIndexOf("-");
	if (lastPos == 6 && value.length <= 7) {
		value = value.slice(0, lastPos) + value.slice(lastPos + 1, value.length);
	}
	if (lastPos == 3 && value.length <= 4) {
		value = value.slice(0, lastPos) + value.slice(lastPos + 1, value.length);
	}
	// 2. add "-"
	pos = value.indexOf("-");
	if (pos == -1 && value.length >= 4) {
		value = value.slice(0, 3) + "-" + value.slice(3, value.length);
	}
	pos = value.indexOf("-");
	var lastPos = value.lastIndexOf("-");
	if (pos == 3 && value.length >= 7 && lastPos == pos) {
		value = value.slice(0, 6) + "-" + value.slice(6, value.length);
	}

	var sregExp = /-/g;

	// 3. check max length
	if (value.length > 12) {
		if(obj != null && $(obj).attr("maxlength") > 12) {
			value = value.replace(sregExp, "");
			value = value.slice(0, 6) + "-" + value.slice(6, value.length);
		} else {
			value = (value.replace(sregExp, "")).slice(0, 10);
			value = value.slice(0, 3) + "-" + value.slice(3, 5) + "-" + value.slice(5, value.length);
		}
	}
	if (value.length > 14) {
		value = value.slice(0, 14);
	}
	return value;
}


/**
 * 전화번호의 "-"가 없는 경우 "-"를 추가하여 표시한다.
 * 
 * @param value : 전화번호
 * @return 02-2663-1234
 * @example gfn_str_maskTelFormat("0226631234");
 */
function gfn_str_maskTelFormat(value) {
	if (typeof value == "number") {
		value = value + "";
	}

	var delimeter1 = "-";
	var delimeter2 = "-";

	var firstDelimeterPos = 3;
	var maxLength = 11 + delimeter1.length + delimeter2.length;

	if (value.indexOf("02") == 0) {
		firstDelimeterPos -= 1;
		maxLength -= 1;
	}

	// limit max length
	if (value.length > maxLength) {
		value = value.substr(0, maxLength);
	}

	// remove delimeter
	var regExp = new RegExp("[0-9]*", 'g');
	var result = (value + "").match(regExp);
	value = result.join("");

	// 1st delimeter
	if (value.length > firstDelimeterPos) {
		value = value.substr(0, firstDelimeterPos) + delimeter1 + value.substr(firstDelimeterPos, value.length);
	}
	// 2nd delimeter
	if (value.length > firstDelimeterPos + delimeter1.length + 4) {
		value = value.substr(0, value.length - 4) + delimeter2 + value.substr(value.length - 4, value.length);
	}
	return value;
}

function gfn_str_replaceAll(str, fromdelimiterStr, todelimiterStr) {
	if ((gfn_str_parseNull(str)).length == 0) return "";
	if (fromdelimiterStr == "" || fromdelimiterStr == todelimiterStr) {
		return str;
	}
	while (str.indexOf(fromdelimiterStr) != -1) {
		str = str.replace(fromdelimiterStr, todelimiterStr);
	}
	return str;
}

function gfn_str_IgnoreReplaceAll(str, fromdelimiterStr, todelimiterStr) {
	if ((gfn_str_parseNull(str)).length == 0) return "";
	if (fromdelimiterStr == "" || fromdelimiterStr == todelimiterStr) {
		return str;
	}
	str = str.replace(fromdelimiterStr, todelimiterStr);
	return str;
}

function gfn_str_numberFilter(str_value) {
	var returnStr = "";
	returnStr = str_value.replace(/[^0-9]/gi, "");
	if (returnStr.length > 1 && returnStr.substr(0, 1) == "0") {
		returnStr = returnStr.substr(1);
	}
	return returnStr;
}

// 입력시 자동으로 ,(콤마) 처리 (예: 1,531,531) //
function gfn_str_numberWithCommas(value) {
    var string = "" + value;
    
    string = string.replace(/[^-+\.\d]/g, "") 
    var regExp = /^([-+]?\d+)(\d{3})(\.\d+)?/; 
    while (regExp.test(string)) string = string.replace(regExp, "$1" + "," + "$2" + "$3");
    
    return string;
}

// 입력시 날짜형식처럼 자동으로 .(점) 포함 (예:2017.01.01) //
function gfn_str_AutoPointDate(obj) {
	var str = $(obj).val().replace(/[^0-9]/g, '');
	var tmp = '';
	if (str.length < 5) {
		$(obj).val(str);
	} else if (str.length < 6) {
		tmp += str.substr(0, 4);
		tmp += '.';
		tmp += str.substr(4);
		$(obj).val(tmp);
	} else if (str.length == 6) {
		tmp += str.substr(0, 4);
		tmp += '.';
		tmp += str.substr(4, 2);
		$(obj).val(tmp);
	} else {
		tmp += str.substr(0, 4);
		tmp += '.';
		tmp += str.substr(4, 2);
		tmp += '.';
		tmp += str.substr(6, 2);
		$(obj).val(tmp);
	}
}

// 입력시 날짜형식처럼 자동으로 -(하이폰) 포함 (예:2017-01-01) //
function gfn_str_AutoHyphenDate(obj) {
	var str = $(obj).val().replace(/[^0-9]/g, '');
	var tmp = '';
	if (str.length < 5) {
		$(obj).val(str);
	} else if (str.length < 6) {
		tmp += str.substr(0, 4);
		tmp += '-';
		tmp += str.substr(4);
		$(obj).val(tmp);
	} else if (str.length == 6) {
		tmp += str.substr(0, 4);
		tmp += '-';
		tmp += str.substr(4, 2);
		$(obj).val(tmp);
	} else {
		tmp += str.substr(0, 4);
		tmp += '-';
		tmp += str.substr(4, 2);
		tmp += '-';
		tmp += str.substr(6, 2);
		$(obj).val(tmp);
	}
}

/**
 * 패스워드 정합성 체크
 */
function gfn_str_isValidPasswd(str) {
	function checkSpace(str) {
		if (str.search(/\s/) != -1) {
			return true;
		} else {
			return false;
		}
	}

	var cnt = 0;
	if (str == "") {
		return false;
	}

	var retVal = checkSpace(str);
	if (retVal) {
		return false;
	}
	if (str.length < 6) {
		return false;
	}
	for (var i = 0; i < str.length; ++i) {
		if (str.charAt(0) == str.substring(i, i + 1))
			++cnt;
	}
	if (cnt == str.length) {
		return false;
	}
	var isPW_a = /[A-Za-z]/;
	if (!isPW_a.test(str)) {
		return false;
	} 
	var isPW_b = /[0-9]/;
	if (!isPW_b.test(str)) {
		return false;
	} 
	var isPW_c = /[`\-=\\\[\];',\./~!@#$%\^&\*\(\)_\+|\{\}:"<>\?]/;
	if (!isPW_c.test(str)) {
		return false;
	}
	var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#$%\^&\*\(\)_\+|\{\}:"<>\?]{9,15}$/;
	if (!isPW.test(str)) {
		return false;
	}

	return true;
}

function gfn_str_getAmountKorean(id, amt) {
    var rslt = '';
    var minusGb = amt.substr(0,1) == "-" ? "(-)" : "";
    
	if(amt == "0"){
		rslt = "-";
	} else {
		var args = arguments;
	    var arrDigit1 = Array('', '일', '이', '삼', '사', '오', '육', '칠', '팔', '구');
	    var arrDigit3 = Array('', '십', '백', '천');
	    var arrDigit4 = Array('', '만', '억', '조', '경', '해', '자', '양', '구', '간', '정', '재', '극');
	    var digitIdx = 0; // 자릿수
	    var digit4Idx = 0; // arrDigit4의 index
	    var digit4Rest = 0; // 4로 나눈 나머지
	    var digit4Used = false; // arrDigit4 사용여부

	    amt = args[1];
	    amt += "000000"; // 백만단위 처리
	    amt = amt.toString().replace(/[^\d\.]/g, '').replace(/\.\d+$/g, '');     

	    for (var idx = amt.length - 1; idx >= 0; idx--) {
	        digit4Rest = digitIdx % 4;

	        if (digitIdx && !digit4Rest) {
	            digit4Idx++;
	            digit4Used = false;
	        }

	        if (amt[idx] > 0) {
	            if (!digit4Used) {
	                rslt = arrDigit4[digit4Idx] + rslt;
	                digit4Used = true;
	            }
	            rslt = arrDigit3[digit4Rest] + rslt;
	            rslt = arrDigit1[amt[idx]] + rslt;
	        }
	        digitIdx++;
	    }
	}
    
    if(!gfn_com_isEmptyObject(rslt)){    	
        $('#' + id[0].id + 'Han').text(minusGb+"금 "+rslt+"원");   
    } else {
        $('#' + id[0].id + 'Han').text("올바른 금액 형식이 아닙니다");
    }
}

function gfn_str_getAmountKoreanNotMillion(id, amt) {
    var rslt = '';
    var minusGb = amt.substr(0,1) == "-" ? "(-)" : "";
    
	if(amt == "0"){
		rslt = "-";
	} else {
		var args = arguments;
	    var arrDigit1 = Array('', '일', '이', '삼', '사', '오', '육', '칠', '팔', '구');
	    var arrDigit3 = Array('', '십', '백', '천');
	    var arrDigit4 = Array('', '만', '억', '조', '경', '해', '자', '양', '구', '간', '정', '재', '극');
	    var digitIdx = 0; // 자릿수
	    var digit4Idx = 0; // arrDigit4의 index
	    var digit4Rest = 0; // 4로 나눈 나머지
	    var digit4Used = false; // arrDigit4 사용여부

	    amt = args[1];
	    amt = amt.toString().replace(/[^\d\.]/g, '').replace(/\.\d+$/g, '');     

	    for (var idx = amt.length - 1; idx >= 0; idx--) {
	        digit4Rest = digitIdx % 4;

	        if (digitIdx && !digit4Rest) {
	            digit4Idx++;
	            digit4Used = false;
	        }

	        if (amt[idx] > 0) {
	            if (!digit4Used) {
	                rslt = arrDigit4[digit4Idx] + rslt;
	                digit4Used = true;
	            }
	            rslt = arrDigit3[digit4Rest] + rslt;
	            rslt = arrDigit1[amt[idx]] + rslt;
	        }
	        digitIdx++;
	    }
	}
    
    if(!gfn_com_isEmptyObject(rslt)){    	
        $('#' + id[0].id + 'Han').text(minusGb+"금 "+rslt+"원");   
        
        var originalValue = $('#' + id[0].id).val();
        var string = "" + originalValue;
        
        string = string.replace(/[^-+\.\d]/g, "") 
        var regExp = /^([-+]?\d+)(\d{3})(\.\d+)?/; 
        while (regExp.test(string)) string = string.replace(regExp, "$1" + "," + "$2" + "$3");
        
        $('#' + id[0].id).val(string);
    } else {
        $('#' + id[0].id + 'Han').text("올바른 금액 형식이 아닙니다");
    }
}

function gfn_str_trim(str) {
	str = gfn_str_parseNull(str);
    return str.replace(/^\s\s*/, "").replace(/\s\s*$/, "");
};