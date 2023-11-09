<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부산대학교 - 학생지원시스템</title>
<link rel="shortcut icon" href="/common/images_ses/logo.ico" type="image/x-icon">
<link href="/common/bootstrap-4.6.1/css/bootstrap.min.css" rel="stylesheet">
<link href="/common/css/common.css" rel="stylesheet">
<link href="/common/css/common_dev.css" rel="stylesheet">
<link href="/common/css/owl.carousel.min.css" type="text/css" rel="stylesheet">
<link href="/common/css/style.css" rel="stylesheet">
<link href="/common/css/popup.css" rel="stylesheet">
<link href="/common/css/layer-popup.css" rel="stylesheet">
<link href="/common/css/loading.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="inc/incCommonJs.jsp" flush="false" />
	<div id="root">
		<jsp:include page="inc/incHeader.jsp" flush="false" />
		<div class="container container-search">
			<div class="message-box mb-3">
					<form onsubmit="onSubmit();return false;">
					<div class="message-box-inner">
							<div class="message-body">
								<div class="input-group">
										
										<input type="text" class="form-control" id="sch_keyword" value="${keyword }" title="검색어입력">
										<div class="input-group-append">
												<button type="submit" class="btn btn-primary" >검색 <i class="bi bi-search"><span class="sr-only">검색</span></i></button>
										</div>
										
								</div>
							</div>
					</div>
					</form>
			</div>
			<div class="search-ment"><strong id="search_keyword">""</strong>에 대한 전체 <strong class="text-danger" id="total_search_cnt">0</strong>개의 결과를 찾았습니다.</div>
			<div class="message-box message-box-style-1">
					<div class="message-box-inner">
							<div class="message-header"><span class="deco-icon"><i class="bi bi-search"><span class="sr-only">검색</span></i></span> 검색결과</div>
							<div class="message-body">
									<ul class="list list-style-1 row" id="section_list">
									</ul>
							</div>
					</div>
			</div>
			
			<section class="sec-3" id="CONT_INFO">
				<header>
					<h4 class="sec-title">웹문서</h4>
					<div class="header-item">총 <span class="text-total">0</span>건이 검색되었습니다.</div>
				</header>
				<div class="sec-body">
					<ul class="search-list">
						
					</ul>
				
				</div>
				<hr class="hr-line">
			</section>
			
			<section class="sec-3" id="MENU_INFO">
				<header>
					<h4 class="sec-title">메뉴</h4>
					<div class="header-item">총 <span class="text-total">0</span>건이 검색되었습니다.</div>
				</header>
				<div class="sec-body">
					<ul class="search-list">
						
					</ul>

				</div>
				<hr class="hr-line">
			</section>
			
			<section class="sec-3" id="BBS_INFO">
				<header>
					<h4 class="sec-title">게시판</h4>
					<div class="header-item">총 <span class="text-total">0</span>건이 검색되었습니다.</div>
				</header>
				<div class="sec-body">
					<ul class="search-list">
						
					</ul>
				</div>
			</section>
		</div>
		<jsp:include page="inc/incFooter.jsp" flush="false" />
	</div>

	<!-- Scripts -->

	
	
	<script>
	
	function fn_initScreen() {		
		fn_selSection("","${keyword}");
	}
	
	
	function onSubmit(){
		if($('#sch_keyword').val() != ""){
			var form = $('<form method="POST" action="/totalSearch">');
			form
					.append('<input type="hidden" name="' + scwin.tokenHeaderNm + '" value="' + scwin.token + '" />');
			form
					.append('<input type="hidden" name="' + scwin.tokenParameterNm + '" value="' + scwin.token + '" />');
			form.append('<input type="hidden" name="keyword" value="'
					+ $('#sch_keyword').val() + '" />');
			
			$('body').append(form);
			form.submit().remove();
		}else{
			alert("검색어를 입력해주세요.",$('#sch_keyword'));
			return false;
		}
		
	}
	
	function fn_selSection(section,keyword){
		
		if(keyword ==""){
			alert("검색어를 입력해주세요.",$('#sch_keyword'));
			return false;
		}
		
		var param = {};
		param.tab_code = section;
		param.keyword = keyword;
		fn_sch(param);
	}
	
	function fn_sch(param){
	var section = param.tab_code;
	$("#section_list a").removeClass("active");
	if(section == "CONT_INFO" ){
		$("#MENU_INFO").hide(); 
		$("#BBS_INFO").hide();
		$("#CONT_INFO").show();
		$("#section_list .CONT_INFO").addClass("active");
		//$("#section_list .CONT_INFO").css("font-weight", "500");
	}else if(section == "MENU_INFO" ){
		$("#CONT_INFO").hide();
		$("#BBS_INFO").hide();
		$("#MENU_INFO").show();
		$("#section_list .MENU_INFO").addClass("active");
		//$("#section_list .MENU_INFO").css("color", "#033975");
		//$("#section_list .MENU_INFO").css("font-weight", "500");
	}else if(section == "BBS_INFO" ){
		$("#CONT_INFO").hide();
		$("#MENU_INFO").hide();
		$("#BBS_INFO").show();
		$("#section_list .BBS_INFO").addClass("active");
	}
	
	
	$(".container-search .more").remove();
	gfn_ajax_request({
		url: "/TotalSearch/search",
		reqData: param,
		success: function(data, responseData) {
			
			if(section == "" ){ // 첫화면 진입시 컨텐츠 상단 영역 출력
				$("#search_keyword").html("\""+param.keyword+"\"");
				$("#total_search_cnt").html(responseData.total_search_cnt);
				var section_list_html = "";
				var tab_nm = "";
				$.each(responseData.search_rs_root.section,function(i,e){
					if(e.name =="CONT_INFO"){
						tab_nm = "웹문서";
					}else if(e.name =="MENU_INFO"){
						tab_nm = "메뉴";
					}else if(e.name =="BBS_INFO"){
						tab_nm = "게시판";
					}
					if(parseInt(e.totcnt) > 4){
						$("#"+e.name+" .search-list").after('<div class="more text-right" ><a class="link link-style-2" href="#'+e.name+'" onclick="fn_selSection(\''+e.name+'\',\''+param.keyword+'\');" onkeypress="this.onclick">결과 더보기</a></div>');	
					}
					section_list_html += '<li class="col-md-6 col-lg-4"><a href="#'+e.name+'" class="'+e.name+'" onclick="fn_selSection(\''+e.name+'\',\''+param.keyword+'\');" onkeypress="this.onclick" >'+tab_nm+' <span>('+e.totcnt+')</span></a></li>';
				});
				$("#section_list").html(section_list_html);
			}
			
			$.each(responseData.search_rs_root.section,function(i,e){  //section1,2
				var doc_html = "";
					$.each(e.doc,function(i,doc){  //doc1,2
						let menu_nm = "";
						let contents = "";
						let menu_url = "";
						let title = "";
						$.each(doc.att,function(i,att){  //att1,2
							if(att.name == "^MENU_NM:"){
								menu_nm = att.att;
							}
							if(att.name == "^CONTENTS:"){
								contents = att.att;
							}
							if(att.name == "^MENU_URL:"){
								menu_url = att.att;
							}
							if(att.name == "^TITLE:"){
								title = att.att;
							}
						});
						menu_url = menu_url.replace("https://dses2.pusan.ac.kr","");
						doc_html+= '<li>';
						//doc_html+= '<h4 '+((menu_url != "")?'':'style="text-decoration:none"')+'>';
						doc_html+= '<h4>';
						if(menu_url != ""){
							doc_html+= '<a href="'+menu_url+'" target="_blank" title="새창바로가기">';
						}
						doc_html+= ((e.name=="BBS_INFO")?title:menu_nm);
						if(menu_url != ""){
							doc_html+= '</a>';
						}
						doc_html+= '</h4>';
						doc_html+= '<p>'+contents+'</p>';
						if(menu_url != ""){
							doc_html+= '<a href="'+menu_url+'" target="_blank" class="search-link" title="새창바로가기"><i class="bi bi-box-arrow-up-right" aria-hidden="true"></i> '+menu_url+'</a>';
						}
						doc_html+= '</li>';
					});
					$("#"+e.name+" .search-list").html(doc_html);
					$("#"+e.name+" .text-total").html(e.totcnt);
					if(section != "" ){
						var pageSize = (gfn_str_parseNull(param.pageSize) =="")? 10:param.pageSize;
						var pageGrp = (gfn_str_parseNull(param.pageGrp) =="")? 1:param.pageGrp;
						var pageIndex = (gfn_str_parseNull(param.pageIndex) =="")? 0:param.pageIndex;
						if(pageIndex > 0){
							pageGrp = Math.ceil((parseInt(pageIndex) +1)/10 );
						}
						
						
						pageInfo = {
					            "totPage": Math.ceil(e.totcnt/pageSize),
					            "totCnt": (gfn_str_parseNull(e.totcnt) =="")? 0:e.totcnt,
					            "pageSize": pageSize,
					            "pageIndex": pageIndex,
					            "pageGrp": pageGrp
					        };
					if(e.totcnt >10){
						fn_totalSearch_setPageList(e.name, pageInfo, param, "fn_sch");	
					}	
					
					}
			});
		}
	});
	}
	
	
	function fn_totalSearch_setPageList(id, pageInfo, reqData, func) {
		var objTable = $("#"+id+" .search-list");
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
	    
	    var aFirst = $('<a id="' + id + "_first" + '" class="page-link" href="#' + id + "_first" + '" onkeypress="this.onclick"><span class="sr-only">처음</span></a>');
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
	    
	    var aPrev = $('<a id="' + id + "_prev" + '" class="page-link" href="#' + id + "_prev" + '" onkeypress="this.onclick"><span class="sr-only">이전</span></a>');
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
	        var a = $('<a id="' + id + "_pageNo_" + i + '" class="page-link" href="#' + id + "_pageNo_" + i + '" pageIndex="' + i + '" onkeypress="this.onclick">').text((i + 1));
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

	    var aNext = $('<a id="' + id + "_Next" + '" class="page-link" href="#' + id + "_Next" + '"  onkeypress="this.onclick"><span class="sr-only">다음</span></a>').data(bindData);
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
	    
	    var aLast = $('<a id="' + id + "_Last" + '" class="page-link" href="#' + id + "_Last" + '" onkeypress="this.onclick"><span class="sr-only">마지막</span></a>').data(bindData);
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
	    	$(objTable).after(pageComp);
	    }
	    pageComp.children().remove();
	    pageComp.append($(pageCompNav));
	    pageComp.find(".pagination-box").children().remove();

	    pageComp.find(".pagination-box:eq(0)").append(ulTag);    
	    $(pageComp.find(".pagination-box:eq(0)")).find("a[pageIndex='"+pageIndex+"']").closest("li").addClass("active");   
	}
	</script>
	

	<!-- /END Scripts -->
</body>
</html>