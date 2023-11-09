function openReport(options){
		var divObj        = $('#' + options.div);         // 넘겨받은 report 객체 
		
		var grpHeadComp   = $("#grp_head"); 
	    var objHeight     = divObj[0].clientHeight;     

	    var grpHeadHeight = 0;
	    if(grpHeadComp != undefined) {
	        grpHeadHeight = grpHeadComp[0].clientHeight;
	    }
	    

	    var autoHeight    = 610 - parseInt(grpHeadHeight) + 9;
	    if(objHeight == 24) divObj.height(autoHeight);
		
	    var data = options.data;
	    if(!data) data = {};
		data.MENU_CD = gfn_str_parseNull(scwin.menuCd);
	    data.MENU_NM = gfn_str_parseNull(scwin.menuInfo.MENU_KOR_NM);
	    data.USER_ID = gfn_str_parseNull(scwin.loginUser.userId);
	    data.USER_NM = gfn_str_parseNull(scwin.loginUser.nm);
	    
	    data.DEPT_CD = gfn_str_parseNull(scwin.loginUser.deptCd);
	    data.SYSTEM_GCD = gfn_str_parseNull(scwin.menuInfo.SYSTEM_GCD);
	    data.SEARCH_SCOPE_GCD = gfn_str_parseNull(scwin.menuInfo.SEARCH_SCOPE_GCD);
		if(data.MENU_CD && data.MENU_NM) data.MENU_INFO = data.MENU_NM + '(' + data.MENU_CD + ')';
    	if(data.USER_ID && data.USER_NM) data.USER_INFO = data.USER_NM + '(' + data.USER_ID + ')';

		
    	//data.SYS_SE_CODE = gfn_str_parseNull(scwin.frameMenuData.SYS_SE_CODE);
		data.POPUP_YN = ((gfn_str_parseNull(options.div) == "pop_grp_report") ? 'Y' : 'N');

	    //var reportOption = options.reportOption;
	    //if(!reportOption) reportOption = {};
	    if(divObj && divObj.length > 0){
			
			$.each(options.data.bind, function(idx, obj){
        		if(obj.params != undefined && obj.params.length > 0) {
        			data["PROC"+(idx+1)] = "'"+obj.db+"','"+obj.proc+"','"+ makeReportParams(obj.params) + "'";
        		} else {
        			data["PROC"+(idx+1)] = "'"+obj.db+"','"+obj.proc+"',''''";
        		}
        	});

			gfn_ajax_request({
				url : '/core/function/encData',
				reqData : {        		
		    		_rptName : options.rptName,
		    		_conName : 'ncom',
		    		_data : JSON.stringify(data),
		    		_reportOption : JSON.stringify(options.reportOption)
		    	},
				success : function(_data,_responseData){
					var frameNm = divObj.prop('id') + '_clip_iframe';
			        divObj.empty();
					divObj.append('<span class="sr-only">다운로드 버튼으로 엑셀 다운로드 후 확인 가능합니다.</span> ');
			        divObj.append('<iframe name="' + frameNm +  '" id="' + frameNm + '" style="width:100%;height:100%;border:none;">');
			        var formObject = $('<form>');
			        formObject.prop('id', 'clipReqForm');
			        formObject.prop('name', 'clipReqForm');
			        formObject.prop('method', 'post');
			        formObject.prop('target', frameNm);
			        if(scwin.loginUser.userIp== "127.0.0.1" || scwin.loginUser.userIp == "0:0:0:0:0:0:0:1") { //로컬테스트용
			            formObject.prop('action', '/clip/report.do');
			        } else { //레포트서버 ( 레포트파일 경로 : /var/lib/tomcat9/webapps/clipreport/WEB-INF/clipreport5/crf/~ )
			            formObject.prop('action', 'https://rpt.pusan.ac.kr/clipreport/report.jsp');
			        }       
			        
			        var rptNameInput = $('<input>');
			        rptNameInput.prop('type', 'hidden');
			        rptNameInput.prop('id', 'rptName');
			        rptNameInput.prop('name', 'rptName');
			        rptNameInput.val(_responseData.enc_rptName);
			        formObject.append(rptNameInput);
			        
			        var conNameInput = $('<input>');
			        conNameInput.prop('type', 'hidden');
			        conNameInput.prop('id', 'conName');
			        conNameInput.prop('name', 'conName');
			        conNameInput.val(_responseData.enc_conName);
			        formObject.append(conNameInput);
			        
			        var csrfInput = $('<input>');
			        csrfInput.prop('type', 'hidden');
			        csrfInput.prop('id',scwin.tokenParameterNm);
			        csrfInput.prop('name', scwin.tokenParameterNm);
			        csrfInput.val(scwin.token);
			        formObject.append(csrfInput);
			        
			        var dataInput = $('<input>');
			        dataInput.prop('type', 'hidden');
			        dataInput.prop('id', 'data');
			        dataInput.prop('name', 'data');
			        dataInput.val(_responseData.enc_data);
			        formObject.append(dataInput);

					var reportOptionInput = $('<input>');
		            reportOptionInput.prop('type', 'hidden');
		            reportOptionInput.prop('id', 'reportOption');
		            reportOptionInput.prop('name', 'reportOption');
		            reportOptionInput.val(_responseData.enc_reportOption);
		            formObject.append(reportOptionInput);
		
			        divObj.append(formObject);
		
			        formObject.submit(function(e){
			            var _options = {};
			            _options.url = '/core/function/infoSearchInsert';
			            _options.reqData = {
			                "INFO_SEARCH_GCD" : "0003",
			                "SEARCH_REASON_GCD" : "9999",
			                "FILE_NM" : options.rptName,
			                "SEARCH_CONDTN_CONTENT" : "검색조건 : " + JSON.stringify(data),
			                "PERSON_INFO_INCLUDE_FG" : ((gfn_str_parseNull(options.personInfoIncludeFg) == "")?"N":options.personInfoIncludeFg),
			                "REMARK" : "."
			            };
			            _options.success = function(data, responseData){
			
			            };
			            gfn_ajax_request(_options);
			        }).submit();
					/*
					setTimeout(function() {
					var iframeEle = $("#pop_grp_report_clip_iframe");
					var framebody = $(iframeEle).contents().find(".report_body_div");
					$(framebody).attr("tabindex","0");
					}, 2500);
					*/
					
					$("#"+frameNm).attr("title",$("#popup nav h1 span").html()+"입니다. 엑셀 다운로드 후 상세한내용을 확인하실 수 있습니다.");
				}
			});
		
	        
	    } 

	}
	
	
function makeReportParams(params){
	var str = "";
	$.each(params, function(idx, _obj){
		str += ((idx > 0)?",":"") + "&apos;&apos;" + _obj + "&apos;&apos;";
	});
	return str;
}