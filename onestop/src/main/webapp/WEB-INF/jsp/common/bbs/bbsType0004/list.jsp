<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!-- 0004	FAQ형 -->
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title"></h2>
				</div>
				<div class="header-item"></div>
			</header>
			<div class="sec-body container-sub">
				<!-- 테이블 리스트 - 헤더 고정 -->
				<section class="sec-1">
					<div class="sec-body">
						<div class="table-box">
							<div class="table-body">
								<div class="board-faq">
								<div class="accordion" id="board-faq">
									
								</div>
								</div>
							</div>
						</div>

						<div class="btn-box"></div>
					</div>

				</section>

				<!-- /END 테이블 -->

			</div>
		</section>
	</main>
</div>
<script src="/common/js/gfn/gfn_bbs.js?1118"></script>


<script>

	$(document).ready(function() {
	    $("table > caption").text(scwin.menuInfo.MENU_KOR_NM+" 게시판");
		fn_sch();
	});
	function fn_sch(data) {

		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box2"));
			
			if(data.SCH_CONTENT != "" && data.SCH_GUBUN == ""){
				alert("카테고리를 선택하세요.",$("#SCH_GUBUN"));
				return false;
			}
			
			if(data.SCH_GUBUN != "" && data.SCH_CONTENT == ""){
				alert("검색할 내용을 입력하세요.",$("#SCH_CONTENT"));
				return false;
			}
		}

		/* ajax처리 */
		gfn_ajax_request({
			url : "/bbs/selectList",
			reqData : data,
			success : function(data, responseData) {
				var bbsData = "";
				var bbsMgr = responseData.bbsMgr;
				var bbsMgrAuth = responseData.bbsMgrAuth;
				var bbsCateList = responseData.bbsCateList;
				$("#board-faq")
						.bbsListView(
								{
									bbsDataList : data,
									bbsMgr : bbsMgr,
									bbsMgrAuth : bbsMgrAuth,
									bbsCateList : bbsCateList,
									dataBound : function(e) {
										initAccordion();

									},
									totalCnt : responseData.totalCnt,
									searchData : {
										SCH_GUBUN : responseData.params.SCH_GUBUN,
										SCH_CONTENT : responseData.params.SCH_CONTENT,
										CATE_TYPE_SEQ_NO: responseData.params.CATE_TYPE_SEQ_NO
									}, //검색박스 사용시
									paging : {
										pageInfo : responseData.pageInfo,
										reqData : responseData.reqData,
										func : "fn_sch"
									},
								//excel : "fn_excelDownload"   //엑셀 사용시 
								});
			}
		});

	}

	//등록팝업페이지 열기
	function fn_writePopup() {
		fn_openPopup({
			width : 1000,
			height : 650,
			index : 5,
			url : '/bbs/writePop.do',
			headertitle : '등록',
			reqData : {
				mode : "WRITE",
				BBS_TYPE_GCD : "${BBS_TYPE_GCD}",
				BBS_TYPE_SEQ_NO : "${BBS_TYPE_SEQ_NO}"
			}
		});
	}

	//팝업띄우기
	function fn_openPopup(_option) {
		gfn_bbs_modalPopup({
			width : _option.width,
			height : _option.height,
			index : _option.index,
			target : null,
			overflow_y : _option.overflow_y,
			title : "게시글 " + _option.headertitle,
			include : _option.url,
			reqData : _option.reqData
		});
	}

	function fn_openChangePopup(_option) {
		gfn_bbs_changeModalPopup({
			width : 1000,
			height : 600,
			index : _option.index,
			target : null,
			title : "게시글 " + _option.headertitle,
			include : _option.url,
			reqData : _option.reqData,
			dataBound : _option.dataBound
		});

	}
	
	if (gfn_str_parseNull('${_msg}') != "") {
		alert('${_msg}');
		<c:remove var="_msg" scope="session" />
	}
</script>