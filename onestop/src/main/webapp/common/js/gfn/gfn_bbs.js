/* 
   [bbsListView ] - 조회결과 tbody에 바인딩
- bbsDataList : JSON타입의 게시글 데이터
- dataBound : listView실행이 끝난 후 처리해야 할 작업을 정의
- totalCnt : 리스트 상단에 표시 될 전체 건수
- paging : 페이징 관련 변수
- excel : 해당 항목을 정의 한 경우 엑셀다운로드 버튼이 자동으로 활성화 되고, 클릭하면 정의 된 내용 내용의 function이 실행 되어짐
*/
var pageChgChk = "N";
$.fn.bbsListView = function(params) {

	var objTag = $(this);
	var obj = {};
	var objId = $(objTag).attr("id");
	
	if (gfn_com_isEmptyObject(objTag) || objTag.length == 0) {
		console.log("바인딩 할 Table이 없습니다.");
		return;
	}

	var conditionStr = "";
	var conditionMatch = "";
	var conditionStartIdx = 0;
	var conditionFlg = false;
	var if_conditionFlg = false;
	var noticeCnt = 0;
	switch (objId) {
		case "board-default":
			obj = objTag;
			objId = $(objTag).attr("id");
			$(obj).find("tr").remove();
			break;

		case "board-webzine":
			obj = objTag;
			objId = $(objTag).attr("id");
			$(obj).find("li").remove();
			break;

		case "board-gallery":
			obj = objTag;
			objId = $(objTag).attr("id");
			$(obj).find("div").remove();
			break;

		case "board-faq":
			obj = objTag;
			objId = $(objTag).attr("id");
			$(obj).find("li").remove();
			break;
		default:
			break;
	}



	if ((gfn_com_isEmptyObject(params.bbsDataList) || params.bbsDataList.length == 0)) {
		switch (objId) {
			case "TABLE":
				$(obj).append("<tr><td colspan='" + $(obj).closest("table").find("thead th").length + "' class='text-center'>" + ((params.emptyComment) ? params.emptyComment : "조회된 데이터가 없습니다.") + "</td></tr>");
				break;
			case "board-default":
				$(obj).append("<tr><td colspan='" + $(obj).closest("table").find("thead th").length + "' class='text-center'>" + ((params.emptyComment) ? params.emptyComment : "조회된 데이터가 없습니다.") + "</td></tr>");
				break;

			case "board-webzine":
				$(obj).addClass("non-page table-board");
				$(obj).html("<li><h3 style='padding: 0px;'>" + ((params.emptyComment) ? params.emptyComment : "조회된 데이터가 없습니다.") + "</h3></li>");
				break;

			case "board-gallery":
				//$(obj).addClass("non-page table-board");
				$(obj).removeClass("row");
				$(obj).html("<div class='non-page table-board'><h3 style='padding: 0px;'>" + ((params.emptyComment) ? params.emptyComment : "조회된 데이터가 없습니다.") + "</h3><div>");
				break;

			case "board-faq":
				$(obj).removeClass("row");
				$(obj).html("<div class='non-page table-board'><h3 style='padding: 0px;'>" + ((params.emptyComment) ? params.emptyComment : "조회된 데이터가 없습니다.") + "</h3><div>");
				break;
			default:
				break;
		}



	} else {

		switch (objId) {
			case "board-default":
				$(obj).find("tr").remove();
				break;

			case "board-webzine":
				$(obj).find("li").remove();
				break;

			case "board-gallery":
				$(obj).find("div").remove();
				$(obj).addClass("row");
				break;

			case "board-faq":
				$(obj).find("div").remove();
				break;
			default:
				break;
		}

		$.each(params.bbsDataList, function(index, item) {
			var data = ""
			var pCount = 0;
			var totalCnt = parseInt(params.paging.pageInfo.totCnt);
			var pageIndex = parseInt(params.paging.pageInfo.pageIndex);
			var pageSize = parseInt(params.paging.pageInfo.pageSize);

			pCount = totalCnt - (pageIndex * pageSize);
			/* START: 게시글 목록 데이터 만들기 */

			switch (objId) {
				case "board-default":
					data += "<tr >     ";
					data += "	<th scope='row'>             ";

					/* 공지사용여부 */
					if (params.bbsMgr.NOTICE_USE_FG == "Y") {
						params.paging.pageInfo.totPage = Math.ceil((totalCnt + item.NOTICE_CNT) / pageSize);
						if (item.NOTICE_FG == "Y" && parseInt(item.RN) == 0) {
							data += '<span class="badge badge-secondary" data-lang>공지</span>';
							noticeCnt++;
						} else {
							data += (totalCnt - parseInt(item.RN) + 1);
						}
					} else {
						data += (totalCnt - parseInt(item.RN) + 1);
					}
					data += "	</th>                        ";

					if (item.LEVEL == 0) {
						data += "	<td class='text-left'>";
						data += '<a href="#popup" onkeypress="this.onclick" ' + ((item.TEMP_SAVE_FG == "Y") ? 'style="color:#b5b2b2"' : "") + '>';
						if (item.TEMP_SAVE_FG == "Y") {
							data += "[임시글] ";
						}
						if (item.CATE_TYPE_NM != "") {
							data += "[" + item.CATE_TYPE_NM + "] ";
						}

						data += item.TITLE_CONTENT;
						data += '</a>';
						if (item.ATTACH_FILE_GRP_CD != "") {
							if (item.ATTACH_FILE_GRP_CD != "" && params.bbsMgr.ATTACH_FILE_USE_FG == "Y") {
								data += ' <img src="/common/images_ses/icon-file.gif" alt="첨부파일 있음"/>';
							}
						}
					} else {
						data += "	<td class='text-left' style='padding-left: " + (item.LEVEL * 2) + "0px;'>";
						data += '<a href="#popup" onkeypress="this.onclick" ' + ((item.TEMP_SAVE_FG == "Y") ? 'style="color:#b5b2b2"' : "") + '>';
						data += "<strong class='text-info'>┗ Re : </strong>";
						if (item.TEMP_SAVE_FG == "Y") {
							data += "[임시글] ";
						}
						if (item.CATE_TYPE_NM != "") {
							data += "[" + item.CATE_TYPE_NM + "] ";
						}
						data += item.TITLE_CONTENT;
						data += '</a>';
						if (item.ATTACH_FILE_GRP_CD != "" && params.bbsMgr.ATTACH_FILE_USE_FG == "Y") {
							data += ' <img src="/common/images_ses/icon-file.gif" alt="첨부파일 있음"/>';
						}
					}
					if (item.SECRET_FG == "Y") {
						data += ' <i class="bi bi-lock"><span class="sr-only">비밀글</span></i>';
					}
					if (item.DATE_CNT < 3) {
						data += ' <img src="/common/images_ses/icon-new.gif" alt="새글"/>';
					}
					data += "	</td>";

					data += "	<td>" + item.WRITEOUT_USER_NM + "</td> ";

					data += "	<td>" + item.INS_DT.substring(0, 10) + "</td>                    ";
					data += "	<td>" + item.SEARCH_TIMESNO + "</td>                    ";
					data += "</tr>                            ";

					break;
				case "board-webzine":

					$(obj).removeClass("non-page table-board");
					data += "<li>     ";
					data += "	<a href='#popup' onkeypress='this.onclick'>             ";

					data += "<div class='thum-box'><div class='thum'>";
					if (item.ATTACH_FILE_GRP_CD != '') {
						data += "<img src='/file/download.do?" + item.PARAM_CODE + "' alt='" + item.FILE_TAG_CONTENT + "'/>";
					}

					data += "</div></div>";
					data += "		<div class='txt-box'>";
					data += "			<h4 class='tit'>";
					/* 공지사용여부 */
					if (params.bbsMgr.NOTICE_USE_FG == "Y") {
						if (item.NOTICE_FG == "Y" && parseInt(item.RN) == 0) {
							data += '[공지] '; //<span class="badge badge-secondary">공지</span>

							if (item.CATE_TYPE_NM != "") {
								data += "[" + item.CATE_TYPE_NM + "] ";
							}
							data += item.TITLE_CONTENT;
							noticeCnt++;
						} else {
							if (item.TEMP_SAVE_FG == "Y") {
								data += "[임시글] ";
							}
							if (item.CATE_TYPE_NM != "") {
								data += "[" + item.CATE_TYPE_NM + "] ";
							}
							data += item.TITLE_CONTENT;
						}
					} else {
						if (item.TEMP_SAVE_FG == "Y") {
							data += "[임시글] ";
						}
						if (item.CATE_TYPE_NM != "") {
							data += "[" + item.CATE_TYPE_NM + "] ";
						}
						data += item.TITLE_CONTENT;
					}

					if (item.SECRET_FG == "Y") {
						data += ' <i class="bi bi-lock"><span class="sr-only">비밀글</span></i>';
					}

					if (item.DATE_CNT < 3) {
						data += ' <img src="/common/images_ses/icon-new.gif" alt="새글"/>';
					}

					data += "</h4>";
					data += "			<p class='txt'>" + item.SUB_TITLE_CONTENT + "</p>";
					data += "			<span class='date'>" + item.INS_DT.substring(0, 10) + "</span>";
					data += "		</div>";
					break;
				case "board-gallery":

					data += "<div class='col-lg-6 col-xl-4 mb-4'>";
					data += "	<a href='#popup' onkeypress='this.onclick'>   ";
					data += "		<div class='thum'>";
					if (item.ATTACH_FILE_GRP_CD != '') {
						data += "<img src='/file/download.do?" + item.PARAM_CODE + "' alt='" + item.FILE_TAG_CONTENT + "'/>";
					}
					data += "		</div>";
					data += "		<div class='txt-box'>";
					/* 공지사용여부 */
					if (params.bbsMgr.NOTICE_USE_FG == "Y") {
						if (item.NOTICE_FG == "Y" && parseInt(item.RN) == 0) {
							data += '[공지] '; //<span class="badge badge-secondary">공지</span>
							if (item.CATE_TYPE_NM != "") {
								data += "[" + item.CATE_TYPE_NM + "] ";
							}
							data += item.TITLE_CONTENT;
							noticeCnt++;
						} else {
							if (item.CATE_TYPE_NM != "") {
								data += "[" + item.CATE_TYPE_NM + "] ";
							}
							data += item.TITLE_CONTENT;
						}
					} else {
						if (item.CATE_TYPE_NM != "") {
							data += "[" + item.CATE_TYPE_NM + "] ";
						}
						data += item.TITLE_CONTENT;
					}

					if (item.SECRET_FG == "Y") {
						data += ' <i class="bi bi-lock"><span class="sr-only">비밀글</span></i>';
					}

					data += "			<span class='date'>" + item.INS_DT.substring(0, 10) + "</span>";
					data += "		</div>";
					data += "	</a>";
					data += "</div>";
					break;

				case "board-faq":

					data += "<div class='card'>";
					data += "	<div class='card-header' id='heading" + index + "'>";
					data += "		<button class='btn btn-block text-left " + (index != 0 ? "collapsed" : "") + "' type='button' data-toggle='collapse' data-target='#collapse" + index + "' data-expanded='" + (index == 0 ? "true" : "false") + "' data-controls='collapse" + index + "'><span class=\"sr-only\">Q</span>" + item.TITLE_CONTENT + "</button>";
					data += "	</div>";
					data += "	<div id='collapse" + index + "' class='collapse " + (index == 0 ? "show" : "") + "' aria-labelledby='heading" + index + "'>";
					data += "		<div class='card-body'>";
					data += "<span class=\"sr-only\">A</span>";


					if (item.ATTACH_FILE_GRP_CD != "") {
						data += '<div class="message-box ">	';
						data += '	<div class="message-body message-box-inner" style="padding: 8px;">                                                  ';
						$.each(item.bbsFileList, function(index2, item2) {
							data += '		<div class="my-2">' + item2.ORIGIN_FILE_NM;
							data += '			<a class="btn btn-sm btn-primary" href="javascript:void(0);" onclick="fn_popupMultiFileViewr(&quot;/file/download.do?' + item2.PARAM_CODE + '&quot;,this);return false;" onkeypress="this.onclick">뷰어<i class="bi bi-eye" aria-hidden="true"></i></a> ';
							data += '			<a class="btn btn-sm btn-primary" href="/file/download.do?' + item2.PARAM_CODE + '">다운로드<i class="bi bi-download" aria-hidden="true"></i></a> ';
							data += '		</div>                                                                  ';
						});
						data += '	</div>                                                                      ';
						data += '</div>';
					}

					data += "			<p class='mb-0'>";
					data += item.CONTENT;
					data += "			</p>";


					data += "		</div>";
					data += "	</div>";
					data += "</div>";
					break;
				default:
					break;
			}



			$(obj).append(data);

			/* END: 게시글 목록 데이터 만들기 */

		});
		//$("#"+objId).parent().bootstrapTable('resetView');		
		//$(obj).closest(".fixed-table-container").css('height',($(obj).closest("table").height()+5)<363?363:($(obj).closest("table").height()+5));
	}
	if(pageChgChk =="N"){
		$("#" + objId).closest(".table-body").parent().find(".table-header").remove();
	}
	var headerInfoStr = '';
	headerInfoStr += '<div class="table-header">';
	if (params.excel) {
		headerInfoStr += '<div class="header-item text-right mb-2">';
		headerInfoStr += '	<button class="btn btn-outline-success" type="button">';
		headerInfoStr += '		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-excel-fill" viewBox="0 0 16 16">';
		headerInfoStr += '			<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM5.884 6.68 8 9.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 10l2.233 2.68a.5.5 0 0 1-.768.64L8 10.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 10 5.116 7.32a.5.5 0 1 1 .768-.64z"/>';
		headerInfoStr += '		</svg>';
		headerInfoStr += '		Excel';
		headerInfoStr += '		</button>';
		headerInfoStr += '	</div>';
	}

	headerInfoStr += '	<div class="header-item">';
	headerInfoStr += '		<span class="mr-2">';
	if (params.paging) {
		headerInfoStr += '			Total <span class="text-total">' + gfn_com_cashReturn(params.paging.pageInfo.totCnt) + '</span> 건';
	} else {
		headerInfoStr += '			Total <span class="text-total">' + gfn_com_cashReturn(params.totalCnt) + '</span> 건';
	}
	headerInfoStr += '		</span>';
	
	if (params.paging) {
		headerInfoStr += '	<select class="form-control" id="pageSel" title="페이지개수선택">';
		headerInfoStr += '		<option value="10" ' + (params.paging.pageInfo.pageSize == 10 ? 'checked' : '') + ' data-lang>10개씩보기</option>';
		headerInfoStr += '		<option value="20" ' + (params.paging.pageInfo.pageSize == 20 ? 'checked' : '') + ' data-lang>20개씩보기</option>';
		headerInfoStr += '		<option value="50" ' + (params.paging.pageInfo.pageSize == 50 ? 'checked' : '') + ' data-lang>50개씩보기</option>';
		headerInfoStr += '		<option value="100" ' + (params.paging.pageInfo.pageSize == 100 ? 'checked' : '') + ' data-lang>100개씩보기</option>';
		headerInfoStr += '	</select>';
	}
	headerInfoStr += '	</div>';
	if (params.excel) {
		/*headerInfoStr += '<div class="header-item">';
		headerInfoStr += '	<button class="btn btn-outline-success" type="button">';
		headerInfoStr += '		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-excel-fill" viewBox="0 0 16 16">';
		headerInfoStr += '			<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM5.884 6.68 8 9.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 10l2.233 2.68a.5.5 0 0 1-.768.64L8 10.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 10 5.116 7.32a.5.5 0 1 1 .768-.64z"/>';
		headerInfoStr += '		</svg>';
		headerInfoStr += '		Excel';
		headerInfoStr += '		</button>';
		headerInfoStr += '	</div>';*/
	} else {
		if (params.headerText) {
			headerInfoStr += '<div class="header-item">';
			headerInfoStr += '	<p class="text-danger info-text info-text-style-1">';
			headerInfoStr += params.headerText;
			headerInfoStr += '	</p>';
			headerInfoStr += '</div>';

		}
	}

	if (params.searchData) {
		headerInfoStr += '<div class="header-item search-box2">';
		headerInfoStr += '<div class="form-inline">';

		if (params.bbsMgr.CATE_FG == "Y" && params.bbsCateList != null && params.bbsCateList.length > 0) {
			headerInfoStr += '<select id="CATE_TYPE_SEQ_NO" class="form-control mr-1" title="카테고리선택">';
			headerInfoStr += '		<option value="" data-lang>선택</option>';
			$.each(params.bbsCateList, function(index2, item2) {
				headerInfoStr += '		<option value="' + item2.CATE_TYPE_SEQ_NO + '" data-lang>' + item2.CATE_TYPE_NM + '</option>';
			});
			headerInfoStr += '</select>';
		}
		headerInfoStr += '<select id="SCH_GUBUN" class="form-control mr-1" title="검색구분선택">';
		headerInfoStr += '		<option value="" data-lang>선택</option>';
		headerInfoStr += '		<option value="TITLE" data-lang>제목</option>';
		headerInfoStr += '		<option value="CONTENT" data-lang>내용</option>';
		headerInfoStr += '		<option value="WRITER" data-lang>작성자</option>';
		/*headerInfoStr += '		<option value="" '+ ( gfn_com_parseNull(params.searchData.SCH_GUBUN) == "" ? 'selected' : '') +'>선택</option>';
		headerInfoStr += '		<option value="TITLE" '+ (params.searchData.SCH_GUBUN == "TITLE" ? 'checked' : '') +'>제목</option>';
		headerInfoStr += '		<option value="CONTENT" '+ (params.searchData.SCH_GUBUN == "CONTENT" ? 'checked' : '') +'>내용</option>';
		headerInfoStr += '		<option value="WRITER" '+ (params.searchData.SCH_GUBUN == "WRITER" ? 'checked' : '') +'>작성자</option>';*/
		headerInfoStr += '</select>';
		headerInfoStr += '<div class="input-group">';
		headerInfoStr += '			<input class="form-control" id="SCH_CONTENT" type="text" title="검색내용" value="' + gfn_com_parseNull(params.searchData.SCH_CONTENT) + '">';
		headerInfoStr += '			<div class="input-group-append">';
		headerInfoStr += '					<button type="button" onclick="fn_sch();return false;" class="btn btn-search form-control" data-lang>검색</button>';
		headerInfoStr += '			</div>';
		headerInfoStr += '	</div>';
		headerInfoStr += '	</div>';
		headerInfoStr += '</div>';
	}
	headerInfoStr += '</div>';
	if(pageChgChk =="N"){
		$("#" + objId).closest(".table-body").before(headerInfoStr);	
	}
	
	if (params.searchData) {
		$("#" + objId).closest(".table-box").find(".header-item #SCH_GUBUN").val(params.searchData.SCH_GUBUN);

		$("#" + objId).closest(".table-box").find(".header-item #CATE_TYPE_SEQ_NO").val(params.searchData.CATE_TYPE_SEQ_NO);
	}
	if (params.paging) {
		$("#" + objId).closest(".table-box").find(".header-item #pageSel").val(params.paging.pageInfo.pageSize);
		$("#" + objId).closest(".table-box").find(".header-item #pageSel").on("change", function() {
			scwin.pageInfo = { "totPage": 1, "totCnt": 0, "pageSize": $(this).val(), "pageIndex": 0, "pageGrp": 1 };
			if (gfn_str_parseNull(params.paging.func) != "") {
				pageChgChk="Y";
				window[params.paging.func]();
				
			}
		});
		if (!gfn_com_isEmptyObject(params.paging.func)) {
			
			gfn_bbs_setPageList(objId, params.paging.pageInfo, params.paging.reqData, params.paging.func);
			
		}
	}
	if (params.excel) {
		$("#" + objId).closest(".table-box").find(".header-item button").on("click", function() {
			if (typeof params.excel == "function") {
				params.excel();
			} else if (typeof params.excel == "string") {
				window[params.excel]();
			}
		});
	}

	$("#" + objId).closest(".sec-body").find(".btn-box").html("");
	if (params.bbsMgrAuth.WRITEOUT_AUTH_FG == "Y") {
		var btnBoxStr = '';
		btnBoxStr += '<div class="col-md text-right">';
		btnBoxStr += '	<button class="btn btn-new " onclick="fn_writePopup();return false;" data-lang>등록</button>';
		btnBoxStr += '</div>';
		$("#" + objId).closest(".sec-body").find(".btn-box").append(btnBoxStr);
	}

	loadLangInfo("viewpage");

	//선택 row 영역 active 표시
	$("#" + objId + " tr").bind("click", function(e) {
		$(this).closest("tbody").find("tr").each(function(i) {
			$(this).removeClass("active");
		});
		$(this).closest("tr").addClass("active");
	});
	loadAccessibility();
	if (typeof params.dataBound == "function") {
		params.dataBound();
	} else if (typeof params.dataBound == "string") {
		window[params.dataBound]();
	}
	return this;
}



function gfn_bbs_modalPopup(params, callback) {
	if (params.include) {
		var suffixStr = "";
		var zindex = 5;
		var bannerSize = 0;
		var _width = 0;
		var _height = 0;
		if (params.index == undefined) {
			params.index = 1;
		}
		//if(!params.index) {
		params.index = $("div[id^='popupWrap']").length + 1;
		//}
		for (var idx = 1; idx < params.index; idx++) {
			suffixStr += "_";
			zindex++;
		}

		if (gfn_str_parseNull(params.position) == "") {
			params.position = {
				top: (($(window).height() - params.height) / 2 + $('html, body').scrollTop()),
				left: ($(window).width() < params.width) ? 30 : (($(window).width() - params.width) / 2),
				center: true
			}
		} else {
			params.position.center = false;
		}

		var divWallTag = $("<div id='modalWall" + suffixStr + "' popupdiv='popupWrap" + suffixStr + "' class='modal-wall-none' ></div>").css({ "z-index": gfn_com_maxZindex(0) + zindex });
		var divPopWrapTag = $("<div id='popupWrap" + suffixStr + "' class='popup-wrap' tabindex='0'></div>").css({ "z-index": gfn_com_maxZindex(1) + zindex });
		var divPopTag = $("<div id='popup' class='popup' idx='" + params.index + "'>");
		if (params.title) {
			if (params.move && params.move == "off") {
				$(divPopTag).append($("<nav class='_navbar _navbar-default'><div class='_container'><h1 class='_navbar-brand'><span data-lang >" + params.title + "</span></h1></div><a href='#' class='pop_close' tabindex='0' onkeypress='this.onclick'><img src='/common/images/icon_pop_close.png' alt='레이어팝업닫기'/></a></nav>"));
			} else {
				$(divPopTag).append($("<nav class='_navbar _navbar-default' onmousedown='fn_startDrag(event, this)'><div class='_container'><h1 class='_navbar-brand'><span data-lang >" + params.title + "</span></h1></div><a href='#' class='pop_close' tabindex='0' onkeypress='this.onclick'><img src='/common/images/icon_pop_close.png' alt='레이어팝업닫기'/></a></nav>"));
			}
			if (params.scrolling && params.scrolling == "on") {
				$(divPopTag).append($("<div class='_container' style='height:" + ($(window).height() < (parseInt(gfn_str_parseNullDefault(params.height, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30) + bannerSize) ? ($(window).height() - (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 100 + bannerSize)) - 45 : (parseInt(gfn_str_parseNullDefault(params.height - 50, "450"))) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			} else {
				$(divPopTag).append($("<div class='_container' style='height:" + (parseInt(params.height) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			}
		} else {
			if (params.scrolling && params.scrolling == "on") {
				$(divPopTag).append($("<div class='_container' style='height:" + ($(window).height() < (parseInt(gfn_str_parseNullDefault(params.height, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30) + bannerSize) ? ($(window).height() - (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 100 + bannerSize)) - 45 : (parseInt(gfn_str_parseNullDefault(params.height, "500"))) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			} else {
				$("#popupWrap" + suffixStr).css("height", params.height);
				$(divPopTag).append($("<div class='_container' style='height:" + (parseInt(params.height) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			}

		}
		divPopWrapTag.append($(divPopTag));
		divPopWrapTag.append("<i class='linkEndAppend' tabindex='0' aria-hidden='true'></i>");
		$(".mask").after(divPopWrapTag);
		$(".mask").after(divWallTag);
		if (params.scrolling && params.scrolling == "on") {
			$('html, body').animate({ scrollTop: $("#header").offset().top }, 500);
		} else {

		}
		if (params.scroll && params.scroll == "off") {
			/*if(params.scrolling && params.scrolling == "on") {
				$("html,body").css("overflow-y","hidden");
			} else {
				$("html,body").css("overflow-y","auto");
			}*/
			$("html,body").css("overflow-y", "hidden");
		} else {
			$("html,body").css("overflow-y", "auto");
		}
		$("#popupWrap" + suffixStr + " ._subcont").html("");
		if (params.modal && params.modal == "off") {

		} else {
			$("#modalWall" + suffixStr).attr("class", "modal-wall");
		}


		if (params.overflow_y && params.overflow_y == "off") {
			$("#popupWrap" + suffixStr + " ._container").css("overflow-y", "hidden");
		}

		gfn_ajax_request({	
			url : params.include,
			reqData : params.reqData,
			dataType : "text",
			success : function(data, responseData) {    

				$("#popupWrap" + suffixStr + " ._subcont").html(responseData);
				if(gfn_str_parseNull(params.reqDataUse) == 'Y'){
					for(var i in params.reqData) {
						$("<input type='hidden' id='req_"+ i +"' value='"+ params.reqData[i] +"' />").appendTo("#popupWrap" + suffixStr + " ._subcont");
					}
				}
				$("#popupWrap" + suffixStr).css("width", ($(window).width() < (parseInt(gfn_str_parseNullDefault(params.width, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.left, "25")) + 30)) ? ($(window).width() - (parseInt(gfn_str_parseNullDefault(params.position.left, "25")) + 25)) : (parseInt(gfn_str_parseNullDefault(params.width, "500")))) + "px");
				if (params.scrolling && params.scrolling == "on") {
					$("#popupWrap" + suffixStr).css("height", $(window).height() < (parseInt(gfn_str_parseNullDefault(params.height, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30)) ? ($(window).height() - (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 55)) : (parseInt(gfn_str_parseNullDefault(params.height, "500"))) + "px");
					$("#popupWrap" + suffixStr).css("top", gfn_str_parseNullDefault(params.position.top + bannerSize, "30") + "px");
				} else {
					$("#popupWrap" + suffixStr).css("height", params.height + 50);
					if (params.target) {
						$("#popupWrap" + suffixStr).css("top", gfn_str_parseNullDefault(($(params.target).offset().top - params.height), "30") + "px");
					} else {
						$("#popupWrap" + suffixStr).css("top", gfn_str_parseNullDefault(params.position.top + bannerSize, "30") + "px");
					}
				}
				$("#popupWrap" + suffixStr).css("left", gfn_str_parseNullDefault(params.position.left, "30") + "px");
				$('#popupWrap' + suffixStr).css('opacity', 0);
				$('#popupWrap' + suffixStr).show();
				$('#popupWrap' + suffixStr).animate({ opacity: 1 }, { queue: false, duration: 'slow' });
				if (params.scrolling && params.scrolling == "on") {
					$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(params.position.top + (($("#top-banner").css("display") == "block") ? 110 : 0), "25")) + 30) + "px" }, 'slow');
				} else {
					if (params.target) {
						if (params.manual) {
							$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30) + "px" }, 'slow');
						} else {
							$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(($(params.target).offset().top - params.height), "25")) + 30) + "px" }, 'slow');
						}
					} else {
						$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(params.position.top + bannerSize, "25")) + 30) + "px" }, 'slow');
					}
				}

				$("#popupWrap" + suffixStr).attr("tabindex","0");
				$("#popupWrap" + suffixStr).find("nav").next("._container").attr("tabindex","0");
				$("#popupWrap" + suffixStr).find("nav").next("._container").focus();
				
				$("#popupWrap" + suffixStr).find(".linkEndAppend").focus(function(){
					$("#popupWrap" + suffixStr).find(".pop_close").focus();
				});
				
				$("#popupWrap" + suffixStr).find("nav").next("._container").focus(function(){
					$("#popupWrap" + suffixStr).find("nav").next("._container").removeAttr("tabindex");
					$("#popupWrap" + suffixStr).find(".pop_close").focus();
				});
				$("#popupWrap" + suffixStr).focus(function(){
						$("#popupWrap" + suffixStr).find(".pop_close").focus();
	    		});



				$.each($("#popupWrap" + suffixStr + " .datepicker"), function(idx) {
					var obj = $("#popupWrap" + suffixStr + " .datepicker")[idx];
					if (!$(obj).is("[readonly]")) {
						if (!gfn_com_isEmptyObject($(obj).attr("id"))) {
							gfn_com_createDateComp($(obj).attr("id"));
						}
					}
				});

				if (params.scrolling && params.scrolling == "on") {

				} else {
					if (params.target) {
						$('html, body').animate({ scrollTop: gfn_str_parseNullDefault(($(params.target).offset().top - params.height), "30") }, 500);
					}
				}

				if (params.target) {
					$(params.target).hide();
					$("#popupWrap" + suffixStr).bind('hide', function() {
						$(params.target).show();
					});
				}
				if (params.positioning) {
					$("#popupWrap" + suffixStr).css("position", params.positioning)
				}
				if (typeof callback == "function") {
					callback();
				}
				$("#popupWrap" + suffixStr + " .pop_close").bind("click", function() {
					gfn_com_closeModalWall(params.index, (params.closeEvent ? params.closeEvent : null));
				});

				var _width = ($("#popupWrap" + suffixStr).width() < params.width) ? params.width : $("#popupWrap" + suffixStr).width();
				var _height = ($("#popupWrap" + suffixStr).height() < params.height) ? params.height : $("#popupWrap" + suffixStr).height();
				params.width = _width;
				params.height = _height;
				var _left = 0;
				var _top = 0;

				if (params.position.center) {
					/*pop_resizing(_width,suffixStr,params,_height,_top,_left);*/
				}

				$(window).resize(function(e) {
					pop_resizing(_width, suffixStr, params, _height, _top, _left);
				});
				loadscript($(divPopWrapTag), "/common/bootstrap-table-master/dist/bootstrap-table.min.js");
				$(".numeric").numeric();
				
				setTimeout(function() {
					loadAccessibility();
					if ($("#popupWrap" + suffixStr).find("#popup").find("nav").next("div._container").hasVerticalScrollBar()) {
							$("#popupWrap" + suffixStr).find("#popup").find("nav").next("div._container").attr("tabindex",0);
					}
				}, 500);
				if (typeof params.dataBound == "function") {
					params.dataBound();
				} else if (typeof params.dataBound == "string") {
					window[params.dataBound]();
				}
			}
		});
	}
}


function gfn_bbs_changeModalPopup(params, callback) {
	if (params.include) {
		var suffixStr = "";
		var zindex = 1;
		var bannerSize = 0;
		var _width = 0;
		var _height = 0;
		if (params.index == undefined) {
			params.index = 1;
		}
		//if(!params.index) {
		params.index = $("div[id^='popupWrap']").length
		//}

		for (var idx = 1; idx < params.index; idx++) {
			suffixStr += "_";
			zindex++;
		}

		gfn_ajax_request({	
			url : params.include,
			reqData : params.reqData,
			dataType : "text",
			success : function(data, responseData) {    
				$("#popupWrap" + suffixStr + " ._subcont").html("");
				$("#popupWrap" + suffixStr + " ._subcont").html(responseData);
				//if ($("#resultTbody").hasVerticalScrollBar()) { 
				//		$("#resultTbody").closest(".fixed-table-container").find(".fixed-table-body").find("table").attr("tabindex",0);
				//}
				$("#popupWrap" + suffixStr + " ._container ._navbar-brand span").html(params.title);
				
				setTimeout(function() {
					loadAccessibility();
					if ($("#popupWrap" + suffixStr).find("#popup").find("nav").next("div._container").hasVerticalScrollBar()) {
							$("#popupWrap" + suffixStr).find("#popup").find("nav").next("div._container").attr("tabindex",0);
					}
				}, 500);

				if (typeof params.dataBound == "function") {
					params.dataBound();
				} else if (typeof params.dataBound == "string") {
					window[params.dataBound]();
				}
			}
		});
	}
}

function gfn_bbs_setPageList(id, pageInfo, reqData, func) {



	var objTable = $("#" + id).closest(".table");



	switch (id) {
		case "board-default":
			objTable = $("#" + id).closest(".table")
			break;

		case "board-webzine":
			objTable = $("#" + id);
			break;

		case "board-gallery":
			objTable = $("#" + id);
			break;

		case "board-faq":
			objTable = $("#" + id);
			break;

		default:
			break;
	}

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
	$.each(reqData, function(k, v) {
		bindData[k] = v;
	});
	$.each(info, function(k, v) {
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

		switch (id) {
			case "board-default":
				$(objTable).parent().parent().after(pageComp);
				break;

			case "board-webzine":
				$(objTable).parent().after(pageComp);
				break;

			case "board-gallery":
				$(objTable).parent().parent().after(pageComp);
				break;

			case "board-faq":
				$(objTable).parent().parent().after(pageComp);
				break;

			default:
				break;
		}

	}
	pageComp.children().remove();
	pageComp.append($(pageCompNav));
	pageComp.find(".pagination-box").children().remove();

	pageComp.find(".pagination-box:eq(0)").append(ulTag);
	$(pageComp.find(".pagination-box:eq(0)")).find("a[pageIndex='" + pageIndex + "']").closest("li").addClass("active");
	$(pageComp.find(".pagination-box:eq(0)")).find("a[pageIndex='" + pageIndex + "']").attr("title","현재페이지");
}


function fn_excelDownload() {

	data = gfn_com_searchData($(".search-box"));
	data.pageSize = totalCnt; //전체데이터를 가지고 오기 위해서 pageSize를 전체건수로 세팅

	gfn_ajax_request({
		url: "/bbs/selectList",
		reqData: data,
		success: function(data, responseData) {
			if (data.length > 0) {
				/* [엑셀다운로드 공통] */
				gfn_com_excelDownloadFile(
					[{
						key: "RN",
						name: "순번"
					}, {
						key: "TITLE_CONTENT",
						name: "제목"
					}, {
						key: "CONTENT",
						name: "내용"
					}, {
						key: "WRITEOUT_USER_NM",
						name: "작성자"
					}, {
						key: "INS_DT",
						name: "작성일"
					}], /* 엑셀에 표시할 컬럼 및 명칭 */
					data, /* 엑셀로 다운로드 할 데이터 */
					"게시글목록" /* 엑셀로 다운로드 할 파일명 (확장자제외) */
				);
			} else {
				alert("엑셀로 다운로드할 데이터가 없습니다.");
				return false;
			}
		}
	});
}

function loadLangInfo(viewpage) {
	if (scwin.i18n.locale != '0001') {
		var _insert = [];
		$.each($("." + viewpage + " [data-lang]"), function(i, o) {
			var _ko = $(this).text();
			var _lang = scwin.i18n.list.find(function(e) { return e.KEY == "0002_" + scwin.menuCd + "_" + _ko });
			if (_lang != undefined) {
				if (scwin.i18n.locale == '0002') {
					$(this).text(gfn_str_parseNullDefault(_lang.ENG_NM, _ko));
				} else if (scwin.i18n.locale == '0003') {
					$(this).text(gfn_str_parseNullDefault(_lang.CHN_NM, gfn_str_parseNullDefault(_lang.ENG_NM, _ko)));
				}
			} else {
				_lang = scwin.i18n.list.find(function(e) { return e.KEY == "0000_000000000000000_" + _ko });
				if (_lang != undefined) {
					if (scwin.i18n.locale == '0002') {
						$(this).text(gfn_str_parseNullDefault(_lang.ENG_NM, _ko));
					} else if (scwin.i18n.locale == '0003') {
						$(this).text(gfn_str_parseNullDefault(_lang.CHN_NM, gfn_str_parseNullDefault(_lang.ENG_NM, _ko)));
					}
				} else {
					_insert.push({
						SYSTEM_GCD: '0000',
						MENU_CD: '000000000000000',
						KOR_NM: _ko
					});
				}
			}
		});
		if (_insert.length > 0) {
			gfn_ajax_request({
				url: "/common/lang/addLangInfo",
				reqData: _insert,
				loading: false,
				success: function(data, responseData) {

				}
			});
		}
	}
}


function fn_openChangePopup(_option) {
	gfn_bbs_changeModalPopup({
		width: 1000,
		height: 600,
		index: _option.index,
		target: null,
		title: "게시글 " + _option.headertitle,
		include: _option.url,
		reqData: _option.reqData,
		dataBound: _option.dataBound
	});

}


function fn_openChangePopup2(_option) {
	gfn_bbs_modalPopup({
		width: 1000,
		height: 600,
		index: _option.index,
		target: null,
		title: "게시글 " + _option.headertitle,
		include: _option.url,
		reqData: _option.reqData,
		dataBound: _option.dataBound
	});

}