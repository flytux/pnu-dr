var gva_NODATA_ALERT_MODIFY_MSG = "변경된 정보가 없습니다.";
var gva_NODATA_ALERT_DELETE_MSG = "삭제 할 자료가 없습니다.";
var gva_NODATA_ALERT_EXCEL_MSG  = "엑셀파일로 내려 받을 자료가 없습니다.";
var gva_NODATA_ALERT_SMS_MSG    = "SMS를 발송 할 데이터가 없습니다.";
var gva_NODATA_ALERT_TRANS_MSG  = "이관 데이터가 존재하지 않습니다.";
var gva_NODATA_ALERT_ETC_MSG    = "처리할 데이터가 존재하지 않습니다.";

var gva_DUPDATA_ALERT_ETC_MSG   = "이미 등록되어 있는 자료가 존재합니다.";
var gva_MODIFY_ALERT_SAVE_MSG   = "변경된 내용이 있습니다. 저장 후 작업하시기 바랍니다.";

var gva_VAL_YY_MSG              = "정확한 년도를 입력하여 주십시오.";
var gva_VAL_MM_MSG              = "정확한 개월을 입력하여 주십시오.";
var gva_VAL_DATE_MSG            = "정확한 일자를 입력하여 주십시오.";
var gva_VAL_DATETIME_MSG        = "정확한 일시를 입력하여 주십시오.";
var gva_VAL_SHYR_MSG            = "정확한 학년을 입력하여 주십시오.";

var gva_CANCEL_ALERT_MSG        = "작업이 취소되었습니다.";


// Confirm 메세지
var gva_SAVE_CONFIRM_MSG         = "변경된 정보를 저장하시겠습니까?";
var gva_MODIFY_CONFIRM_SAVE_MSG  = "변경된 데이터가 있습니다. 저장하시겠습니까?";
var gva_MODIFY_CONFIRM_FIND_MSG  = "변경된 데이터가 있습니다. 조회하시겠습니까?";
var gva_MODIFY_CONFIRM_EXCEL_MSG = "변경된 데이터가 있습니다. 엑셀을 다운로드 하시겠습니까?";
var gva_MODIFY_CONFIRM_ETC_MSG   = "변경된 데이터가 있습니다. 작업을 진행 하시겠습니까?";
var gva_MODIFY_CONFIRM_CONDITION_MSG  =  "수정된 데이터가 있습니다. 계속하시겠습니까?";

var gva_SCH_MSG  = "조회 중입니다.";
var gva_READ_MSG = "확인 중입니다.";
var gva_SAVE_MSG = "저장 중입니다.";
var gva_DEL_MSG  = "삭제 중입니다.";
var gva_ETC_MSG  = "처리 중입니다.";

// BackGround Color
var gva_BACKGROUND_COLOR = "#ff0000";

var gva_GENERAL_MODIFY_CONFIRM_MSG      = '수정된 데이터가 있습니다. 계속하시겠습니까?';
var gva_SAVE_CONFIRM_MSG                = '저장 하시겠습니까?';
var gva_TEMP_SAVE_CONFIRM_MSG                = '임시 저장 하시겠습니까?';
var gva_DELETE_CONFIRM_MSG                = '삭제 하시겠습니까?';

/**
 * 입력된 데이터에 대해서 유효성을 검증한다.
 * 
 * @param dataMap 데이터 맵
 * @param dataInfo 데이터 유효성 검증 옵션 JSON 객체 ([{id : [columnId], mandatory : [boolean], minlength = [number], maxlength = [number], hangul : [boolean], valFunc : [userFunc]}]) 또는 group 컴포넌트 or table
 * @returns <Boolean> 유효성검사 결과
 * @example 
 * var valInfo = [ {id : "grp_cd", mandatory : true, minlength : 5, hangul : false}, {id : "grp_nm", mandatory : true, hangul : true} ];
 * var modifiedData = $w.data.get("JSON", [{"id":"dlt_CodeGrp", "key" : "data", action : "modified"}]); 
 * if (gfn_val_validateGridView(grd_CodeGrp, valInfo)) {
 *     gfn_ajax_getAjaxRequest({action : "serviceId=CD0001&action=U", reqData : modifiedData, success : "scwin.saveCodeGrpCallback"}); 
 * }
 * @description
 * 입력 허용 문자, 입력 허용 불가 문자, 최대 입력 문자수 설정은 GridView의 Column의 속성에서 설정한다. 
 * - allowChar : 입력 허용 문자 
 * - ignoreChar : 입력 허용 불가 문자 
 * - maxLength : 최대 입력 문자수
 */
function gfn_val_validateDataMap(dataMap, dataInfo) {	
    var result = {
        isValid : true,
        columnId : "",
        rowIdx : 0,
        msg : ""
    };

    try {
        
    	var valInfo = [];

    	valInfo = dataInfo;

            for ( var valIdx = 0; valIdx < valInfo.length; valIdx++) {
                if (result.isValid === false) {
                    break;
                }
                if (gfn_str_parseNull(valInfo[valIdx].id) !== "") {
    
                    var value = gfn_str_parseNull(dataMap[valInfo[valIdx].id]);
    
                    if ((typeof valInfo[valIdx].notNull !== "undefined") && (valInfo[valIdx].notNull === true || valInfo[valIdx].notNull === "N") && (value.length === 0)) {
                        setResult(result, valInfo[valIdx].id, valInfo[valIdx].name, valInfo[valIdx].name + "은(는) 필수 입력 항목 입니다.");
                    } else if ((typeof valInfo[valIdx].minlength !== "undefined") && (valInfo[valIdx].minlength > 0) && (gfn_str_getByteLength(value) < valInfo[valIdx].minlength)  && (value.length > 0)) {
                        setResult(result, valInfo[valIdx].id, valInfo[valIdx].name, valInfo[valIdx].name + "은(는) 최소 길이 " + valInfo[valIdx].minlength + "Byte 이상으로 입력해야 합니다.(" + gfn_str_getByteLength(value) + " Byte)");
                    } else if ((typeof valInfo[valIdx].maxlength !== "undefined") && (valInfo[valIdx].maxlength > 0) && (gfn_str_getByteLength(value) > valInfo[valIdx].maxlength)) {
                        setResult(result, valInfo[valIdx].id, valInfo[valIdx].name, valInfo[valIdx].name + "은(는) 최대 길이 " + valInfo[valIdx].maxlength + "Byte 이하로 입력해야 합니다.(" + gfn_str_getByteLength(value) + " Byte)");
                    } else if ((typeof valInfo[valIdx].hangul !== "undefined") && (valInfo[valIdx].hangul === false) && (gfn_str_isKoreanWord(value) === true)) {
                        setResult(result, valInfo[valIdx].id, valInfo[valIdx].name, valInfo[valIdx].name + "은(는) 한글을 입력해서는 안됩니다.");
                    } else if ((typeof valInfo[valIdx].onlyNum !== "undefined") && (valInfo[valIdx].onlyNum === true) && (gfn_val_isNumberOnly(value) === false)) {
                        setResult(result, valInfo[valIdx].id, valInfo[valIdx].name, valInfo[valIdx].name + "은(는) 숫자만 입력하여 주십시오.");
                    } else if (typeof valInfo[valIdx].valFunc === "function") {
                    	var rstMsg = valInfo[valIdx].valFunc(value);
                        if ( rstMsg !== "") {
                        	setResult(result, valInfo[valIdx].id, valInfo[valIdx].name, rstMsg);
                        }
                    }
                }
            }
    
        return result.isValid;
    
        function setResult(result, id, name, msg) {            

            var ctlObj     = document.getElementById("FRM_"+id.substr(0, 1).toUpperCase() + id.substr(1));                
            result.isValid = false;
            result.columnId = id;
            result.msg = msg;
                
            if(msg !== "" && msg !== null){
            	alert(result.msg, $("#"+id));
            }
        }
    } catch(e) { 
        console.log("[setResult] Exception :: " + e.message);
    } finally {
    }
}

function gfn_val_isNumberOnly(str){
	var test = /[^0-9]/;
	var bRtn = test.test(str);
	if(bRtn){
		bRtn = false;
	} else {
		bRtn = true;
	}
	return bRtn;
}

function gfn_val_isEmail(str) {

    var i;
    var check = 0;
    var dot = 0;
    var before = "";
    var after = "";
    var strGubun = "@";
    var atidx = str.indexOf('@');
    if(atidx < 0){
    	atidx = str.indexOf('#');
    	strGubun = "#";
    }
    
    
    str = gfn_str_trim(str);

    if (str.length == 0)
        return false;
    for (i = 0; i < str.length; i++) {
        if (str.charAt(i) == strGubun) {
            check = check + 1;
        } else if (check == 0) {
            before = before + str.charAt(i);
        } else if (check == 1) {
            after = after + str.charAt(i);
        }
    }
    if (check >= 2 || check == 0) {
        return false;
    }
    for (i = 0; i < before.length; i++) {
        if (!((before.charAt(i) >= 'A' && before.charAt(i) <= 'z') || (before.charAt(i) >= '0' && before.charAt(i) <= '9') || (before.charAt(i) == '_')
                || (before.charAt(i) == '.') || (before.charAt(i) == '-'))) {
            return false;
        }
    }
    for (i = 0; i < after.length; i++) {
        if (!((after.charAt(i) >= 'A' && after.charAt(i) <= 'z') || (after.charAt(i) >= '0' && after.charAt(i) <= '9') || (after.charAt(i) == '_')
                || (after.charAt(i) == '.') || (after.charAt(i) == '-'))) {
            return false;
        }
    }
    for (i = 0; i < after.length; i++) {
        if (after.charAt(i) == '.') {
            dot = dot + 1;
        }
    }
    if (dot < 1) {
        return false;
    }
    var endchar = str.substring(atidx + 1);
    if (endchar == "" || endchar == "co.kr" || endchar == "or.kr" || endchar == "ac.kr" || endchar == "pe.kr" || endchar == "ne.kr" || endchar == "com"
            || endchar == "org" || endchar == "net" || endchar == "gov") {
        return false;
    } else {
        var compobj = endchar.substring(0, endchar.indexOf("."));
        var exeobj = endchar.substring(endchar.indexOf(".") + 1);
        if (((compobj == "hanmail" || compobj == "chollian") && exeobj != "net")) {
            return false;
        } else if ((compobj == "dreamwiz" || compobj == "freechal" || compobj == "hotmail" || compobj == "naver" || compobj == "chol") && exeobj != "com") {
            return false;
        }
    }

    return true;
};