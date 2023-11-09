/* 
   [listView 공통] - 조회결과 tbody에 바인딩
- dataSource : JSON타입의 데이터
- dataBound : listView실행이 끝난 후 처리해야 할 작업을 정의
- template : dataSource의 map내용을 화면에 그려 줄 엘리먼트가 정의 되어 있는 템플릿의 아이디
- totalCnt : 리스트 상단에 표시 될 전체 건수
- paging : 페이징 관련 변수
- excel : 해당 항목을 정의 한 경우 엑셀다운로드 버튼이 자동으로 활성화 되고, 클릭하면 정의 된 내용 내용의 function이 실행 되어짐
*/
var pageChgChk = "N";
$.fn.listView = function(params) {
    
	var objTag = $(this);
    var obj = {};
    var objId = ""; 

    if(gfn_com_isEmptyObject(objTag) || objTag.length == 0){
    	console.log("바인딩 할 Table이 없습니다.");
    	return;
    }

    var conditionStr = "";
    var conditionMatch = "";
    var conditionStartIdx = 0;
    var conditionFlg = false;     
    
    switch ($(objTag).prop("tagName").toUpperCase()) {
	    case "TABLE":
	        obj = $(objTag).find("tbody");
	        objId = $(objTag).attr("id") + "_tbody";
	        $(obj).attr("id", objId);
	        break;
	    case "TBODY":
	        obj = objTag;
	        objId = $(objTag).attr("id");
	        break;
	    default:
	        break;
	}

    $(obj).find("tr").remove();

    if ((gfn_com_isEmptyObject(params.dataSource) || params.dataSource.length == 0)) {
    	$(obj).append("<tr><td colspan='"+$(obj).closest("table").find("thead th").length+"' class='text-center'>"+((params.emptyComment)?params.emptyComment:"조회된 데이터가 없습니다.")+"</td></tr>");
		$("#"+objId).closest("table").attr("data-height","350");
		$("#"+objId).closest("table").find("colgroup").html("");
		setTimeout(function(){
			$("#"+objId).parent().bootstrapTable('resetView');
		},200);
	} else {
		$.each(params.dataSource,function(index, item){
	        var templateArr = $(params.template).html().split("#");
	        for(var idx = 0 ; idx < templateArr.length ; idx++) {
				if(templateArr[idx] != null && (templateArr[idx].replace(/(\s*)/g,"")).indexOf("popup") == 0) { 
					templateArr[idx] = "#"+templateArr[idx];
				}
	            if(templateArr[idx] != null && templateArr[idx].trim().indexOf(":") == 0) {
	                if(item[templateArr[idx].trim().substr(1)] != null && (item[templateArr[idx].trim().substr(1)]+'').length > 0) {
	                    templateArr[idx] = gfn_str_parseNull(item[templateArr[idx].trim().substr(1)]);
	                } else if (templateArr[idx].trim() == ":auto") {                	
	                	templateArr[idx] = String(index+1);
	            	} else {
	                    templateArr[idx] = "";
	                }	                
	            } else if(templateArr[idx] != null && templateArr[idx].trim().indexOf("if") == 0) {
	                conditionStr = (templateArr[idx].replace(/(\s*)/g,""));
	                conditionMatch = conditionStr.match(/:([a-zA-Z0-9_])+/g);
	                for(var idx_ = 0 ; idx_ < conditionMatch.length ; idx_++) {
	                    conditionStr = gfn_str_replaceAll(conditionStr,conditionMatch[idx_],'"'+item[conditionMatch[idx_].substr(1)]+'"');
	                }
	                conditionStartIdx = (idx+1);
	                conditionFlg = ( new Function( 'return ' + conditionStr.substring(3,conditionStr.length-2) ))() ;
	            } else if(templateArr[idx] != null && (templateArr[idx].replace(/(\s*)/g,"")).indexOf("}elseif") == 0) { 
	            	if(!conditionFlg) {
	            		templateArr[conditionStartIdx-1] = "";
	                	templateArr[conditionStartIdx] = "";
	            		conditionStr = (templateArr[idx].replace(/(\s*)/g,""));
		                conditionMatch = conditionStr.match(/:([a-zA-Z0-9_])+/g);
		                for(var idx_ = 0 ; idx_ < conditionMatch.length ; idx_++) {
		                    conditionStr = gfn_str_replaceAll(conditionStr,conditionMatch[idx_],'"'+item[conditionMatch[idx_].substr(1)]+'"');
		                }
		                conditionStartIdx = (idx+1);
		                conditionFlg = ( new Function( 'return ' + conditionStr.substring(8,conditionStr.length-2) ))() ;
	            	} else {
	            		templateArr[conditionStartIdx-1] = "";
	                	templateArr[idx] = "";
	                	templateArr[idx+1] = "";
	            	}
	            } else if(templateArr[idx] != null && (templateArr[idx].replace(/(\s*)/g,"")).indexOf("}else{") == 0) { 
	            	if(!conditionFlg) {
	            		templateArr[conditionStartIdx-1] = "";
	                	templateArr[conditionStartIdx] = "";
	                	templateArr[idx] = "";
	                	conditionFlg = true;
	            	} else {
	                	templateArr[idx] = "";		
	                	templateArr[idx+1] = "";
	            	}
	            } else if(templateArr[idx] != null && templateArr[idx].trim().indexOf("}") == 0) {
	                if(!conditionFlg) {
	                    for(var idx__ = conditionStartIdx-1 ; idx__ <= idx ; idx__++) {
	                        templateArr[idx__] = "";
	                    }
	                } else {
	                	templateArr[conditionStartIdx-1] = "";
	                	templateArr[idx] = "";
	                }
	            } else if (idx > 0 && templateArr[idx-1] != null && templateArr[idx-1].substr(templateArr[idx-1].length-2) == "__") {
	                templateArr[idx-1] = templateArr[idx-1].substr(0,templateArr[idx-1].length-2) + "#";
	            }
	        }
	        $(obj).append($(templateArr.join('')).data(item));
	    });	
		//if($(obj).closest(".popup").length == 0) { //팝업에서도 그리드 사용
			if($("#"+objId).closest("table").innerHeight() > 500 ){
				$("#"+objId).closest(".fixed-table-body").css("height","500px");
			}
			setTimeout(function(){
				
				$("#"+objId).parent().bootstrapTable('resetView');	
				
				setTimeout(function(){
					if ($("#"+objId).hasVerticalScrollBar()) { 
						$("#"+objId).attr("tabindex",0);
					}
					if ($("#"+objId).hasHorizontalScrollBar()) { 
						$("#"+objId).attr("tabindex",0);
					}
					
					
					//비어 있는 table 태그 제거
					if($(".fixed-table-header table").html() ==""){
		   				$(".fixed-table-header table").remove();
		   			}
					/*
					$(obj).closest(".fixed-table-container").css('height',"");
					$(obj).closest(".fixed-table-container").css('padding-bottom',"");
					var theader_cell = $("#"+objId).closest(".fixed-table-container").find(".fixed-table-header").find(".fht-cell");
					var last_index = $("#"+objId).find("tr").eq(0).find("td").length-1;
					$("#"+objId).find("tr").eq(0).find("td").each(
							function(i, o) {
								if(last_index == i){
									theader_cell.eq(i).css("width",$(this).css("width")-1);	
								}else{
									theader_cell.eq(i).css("width",$(this).css("width"));
								}
								
								
							});
							
					if ($("#"+objId).hasVerticalScrollBar()) { 
						theader_cell.filter(":last").css("width",parseInt(gfn_com_parseNull(theader_cell.filter(":last").css("width")).replace('px', '')) + 15);
					} else {
						//$("#"+objId).closest(".fixed-table-container").find(".fixed-table-header").css("margin-right", "");
					}
					*/
					//$("#"+objId).closest(".fixed-table-container").find(".fixed-table-header").find(".fht-cell").css("width","");
				}, 200);	
				//$(obj).closest(".fixed-table-container").css('height',"");
			},200);
		//}
	}
	
	//선택 row 영역 active 표시
	$("#"+objId+" tr").bind("click", function(e) {
		$(this).closest("tbody").find("td").each(function(i){
			$(this).removeClass("active");
		});
		$(this).find("td").each(function(i){
			$(this).addClass("active");
		});
	});
	if(pageChgChk =="N"){
    	$("#"+objId).closest(".table-body").parent().find(".table-header").remove();
    }
    var headerInfoStr = '';
    headerInfoStr += '<div class="table-header">';
    headerInfoStr += '	<div class="header-item">';
	if(params.totalViewYn != "N") {
	    headerInfoStr += '		<span class="mr-2">';
	    if(params.paging) {
	    	headerInfoStr += '			Total <span class="text-total">'+gfn_com_cashReturn(params.paging.pageInfo.totCnt)+'</span> 건';
	    } else {
	    	headerInfoStr += '			Total <span class="text-total">'+gfn_com_cashReturn(params.totalCnt)+'</span> 건';
	    }
	    headerInfoStr += '		</span>'; 
	}
    if(params.paging) {
    	headerInfoStr += '	<select class="form-control" title="페이지개수선택">';
    	headerInfoStr += '		<option value="10" '+ (params.paging.pageInfo.pageSize == 10 ? 'checked' : '') +'>10개씩보기</option>';
    	headerInfoStr += '		<option value="20" '+ (params.paging.pageInfo.pageSize == 20 ? 'checked' : '') +'>20개씩보기</option>';
    	headerInfoStr += '		<option value="50" '+ (params.paging.pageInfo.pageSize == 50 ? 'checked' : '') +'>50개씩보기</option>';
    	headerInfoStr += '		<option value="100" '+ (params.paging.pageInfo.pageSize == 100 ? 'checked' : '') +'>100개씩보기</option>';
    	headerInfoStr += '	</select>';
    }
    headerInfoStr += '	</div>';
    if(params.excel) {
    	headerInfoStr += '<div class="header-item">';
    	headerInfoStr += '	<button class="btn btn-outline-success" type="button">';
    	headerInfoStr += '		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-excel-fill" viewBox="0 0 16 16">';
    	headerInfoStr += '			<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM5.884 6.68 8 9.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 10l2.233 2.68a.5.5 0 0 1-.768.64L8 10.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 10 5.116 7.32a.5.5 0 1 1 .768-.64z"/>';
    	headerInfoStr += '		</svg>';
    	headerInfoStr += '		Excel';
    	headerInfoStr += '		</button>';
    	headerInfoStr += '	</div>';
    } else {
    	if(params.headerText) {
    		headerInfoStr += '<div class="header-item">';
        	headerInfoStr += '	<p class="text-danger info-text info-text-style-1">';
        	headerInfoStr += 		params.headerText;
        	headerInfoStr += '	</p>';
        	headerInfoStr += '</div>';
    		
    	}
    }

	if(params.excel_upload) {
    	headerInfoStr += '<div class="header-item">';
    	headerInfoStr += '	<button class="btn btn-outline-success" id="exlBtn" type="button">';
    	headerInfoStr += '		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-excel-fill" viewBox="0 0 16 16">';
    	headerInfoStr += '			<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM5.884 6.68 8 9.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 10l2.233 2.68a.5.5 0 0 1-.768.64L8 10.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 10 5.116 7.32a.5.5 0 1 1 .768-.64z"/>';
    	headerInfoStr += '		</svg>';
    	headerInfoStr += '		Excel 업로드';
    	headerInfoStr += '		</button>';
		headerInfoStr += '<input type="file" id="file" onchange="fn_excelUpload()" style="display: none;" />';
    	headerInfoStr += '	</div>';
    }
	
    headerInfoStr += '</div>';
    if(pageChgChk =="N"){
    	$("#"+objId).closest(".table-body").before(headerInfoStr);
	}else{
		var __totalCnt = '';
	    if(params.paging) {
	    	__totalCnt = gfn_com_cashReturn(params.paging.pageInfo.totCnt);
	    } else {
	    	__totalCnt = gfn_com_cashReturn(params.totalCnt);
	    }
		$("#"+objId).closest(".table-box").find(".text-total").text(__totalCnt);
	}
    if(params.paging) {
    	$("#"+objId).closest(".table-box").find(".header-item select").val(params.paging.pageInfo.pageSize);    	
    	$("#"+objId).closest(".table-box").find(".header-item select").on("change",function(){
    		scwin.pageInfo = {"totPage" : 1, "totCnt" : 0, "pageSize" : $(this).val(), "pageIndex" : 0, "pageGrp" : 1};
    		if (gfn_str_parseNull(params.paging.func) != "") {
				pageChgChk="Y";
                window[params.paging.func]();
            }
    	});
    	if(!gfn_com_isEmptyObject(params.paging.func)){
    		gfn_table_setPageList(objId, params.paging.pageInfo, params.paging.reqData, params.paging.func);	
        }
    }
    if(params.excel) {
    	$("#"+objId).closest(".table-box").find(".header-item button").on("click",function(){
    		if(typeof params.excel == "function"){
                params.excel();   
            }else if (typeof params.excel == "string"){
                window[params.excel]();
            }
    	});
    }

	if(params.excel_upload) {
    	$("#"+objId).closest(".table-box").find(".header-item #exlBtn").on("click",function(){
    		if(typeof params.excel_upload == "function"){
                params.excel_upload();   
            }else if (typeof params.excel_upload == "string"){
				window[params.excel_upload]();
            }
    	});
    }
	loadAccessibility();
    if(typeof params.dataBound == "function"){
        params.dataBound();   
    }else if (typeof params.dataBound == "string"){
        window[params.dataBound]();
    }
    return this;
}

function gfn_table_setPageList(id, pageInfo, reqData, func) {

	var objTable = $("#"+id).closest(".table");
    if (gfn_com_isEmptyObject(objTable)) {
        return;
    }

    var info = pageInfo;

    if (gfn_com_isEmptyObject(info)) {
        info = {
            "totPage": 1,
            "totCnt": 0,
            "pageSize": 10,
            "pageIndex": 0,
            "pageGrp": 1
        };
    }

    var totPage = info.totPage;
    var totCnt = info.totCnt;
    var pageSize = info.pageSize;
    var pageIndex = info.pageIndex;
    var pageGrp = info.pageGrp;

    var startIdx = (pageGrp - 1) * 10;
    var endIdx = (pageGrp * 10) - 1;

    var bindData = {};
    $.each(reqData,function(k,v){
    	bindData[k] = v;
    });
    $.each(info,function(k,v){
    	bindData[k] = v;
    });

    var funcSch = func;
    if (endIdx >= (totPage - 1)) endIdx = totPage - 1;

    //초기화
    var ulTag = $("<ul>").addClass("pagination");
    $(ulTag).data(bindData);
    
    var aFirst = $('<a id="' + id + "_first" + '" class="page-link" href="#none" onkeypress="this.onclick"><span class="sr-only">처음</span></a>');
    $(aFirst).click(function(e) {
        var id = this.id;
        var comp = $("#" + id);
        var data = $(comp).closest("ul").data();

        if (data.pageIndex < 1) return;
        data.pageGrp = 0;
        data.pageIndex = 0;

        if (gfn_str_parseNull(funcSch) != "") {
            window[funcSch](data);
        }
    });
    ulTag.append($('<li class="page-item first">').append(aFirst));
    
    var aPrev = $('<a id="' + id + "_prev" + '" class="page-link" href="#none" onkeypress="this.onclick"><span class="sr-only">이전</span></a>');
    $(aPrev).click(function(e) {
        var id = this.id;
        var comp = $("#" + id);
        var data = $(comp).closest("ul").data();

        if (data.pageIndex < 1) return;
        data.pageIndex = data.pageIndex - 1;

        if (gfn_str_parseNull(funcSch) != "") {
            window[funcSch](data);
        }
    });
    ulTag.append($('<li class="page-item prev">').append(aPrev));

    for (var i = startIdx; i <= endIdx; i++) {
        var a = $('<a id="' + id + "_pageNo_" + i + '" class="page-link" href="#none" pageIndex="' + i + '" onkeypress="this.onclick">').text((i + 1));
        $(a).click(function(e) {
            var id = this.id;
            var comp = $("#" + id);
            var pageIdx = (comp.attr("pageIndex") * 1);
            var data = $(comp).closest("ul").data();
            
            if (pageIdx == data.pageIndex) {
                return;
            }
            data.pageIndex = pageIdx;
            if (gfn_str_parseNull(funcSch) != "") {
                window[funcSch](data);
            }
        });
        var li = $('<li class="page-item">');
        ulTag.append($(li).append(a));
    }

    var aNext = $('<a id="' + id + "_Next" + '" class="page-link" href="#none"  onkeypress="this.onclick"><span class="sr-only">다음</span></a>').data(bindData);
    $(aNext).click(function(e) {
        var id = this.id;
        var comp = $("#" + id);
        var data = $(comp).closest("ul").data();

        if (data.pageIndex == (data.totPage - 1)) return;
        data.pageIndex = data.pageIndex + 1;

        if (gfn_str_parseNull(funcSch) != "") {
            window[funcSch](data);
        }
    });
    ulTag.append($('<li class="page-item next">').append(aNext));
    
    var aLast = $('<a id="' + id + "_Last" + '" class="page-link" href="#none" onkeypress="this.onclick"><span class="sr-only">마지막</span></a>').data(bindData);
    $(aLast).click(function(e) {
        var id = this.id;
        var comp = $("#" + id);
        var data = $(comp).closest("ul").data();

        if (data.pageIndex == (data.totPage - 1)) return;
        data.pageIndex = (data.totPage - 1);

        if (gfn_str_parseNull(funcSch) != "") {
            window[funcSch](data);
        }
    });
    ulTag.append($('<li class="page-item last">').append(aLast));

    // 페이징 노드
    var pageComp = $("#" + id + "_page");
    var pageCompNav = $('<nav aria-label="대표코드 페이지 링크">').addClass("pagination-box");
    
    if (pageComp.length == 0) {
    	pageComp = ($("<div>").attr("id", id + "_page").addClass("table-footer"));    	
    	$(objTable).parent().parent().after(pageComp);
    }
    pageComp.children().remove();
    pageComp.append($(pageCompNav));
    pageComp.find(".pagination-box").children().remove();

    pageComp.find(".pagination-box:eq(0)").append(ulTag);    
    $(pageComp.find(".pagination-box:eq(0)")).find("a[pageIndex='"+pageIndex+"']").closest("li").addClass("active");   
	$(pageComp.find(".pagination-box:eq(0)")).find("a[pageIndex='"+pageIndex+"']").attr("title","현재페이지");
}