<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title"></h2>
				</div>
				<div class="header-item"></div>
			</header>
			<div class="sec-body">
			<!-- 바디영역 -->
			<div class="search-box">
				<input type="hidden" id="STDT_NO" class="form-control" />
			</div>
			
				<!-- 검색 영역 -->
				<div class="b-table-box flex-col-4" role="table" aria-label="조회">
					<div class="b-row-box" role="row">						
                           <div class="b-row-item">
                               <div class="b-title-box" role="rowheader">
                                   <label data-lang>대학(원)</label>
                               </div>
                        		<div class="b-con-box" role="cell">
								<div id="COLL_CD" data-lang></div>
							</div>
                               
                           </div>
                           <div class="b-row-item">
                               <div class="b-title-box" role="rowheader">
                                   <label data-lang>학과(부)</label>
                               </div>
                               <div class="b-con-box" role="cell">
                                   <div id="DEPT_CD" data-lang></div>
                               </div>
                           </div>
                           <div class="b-row-item">
                               <div class="b-title-box" role="rowheader">
                                   <label data-lang>학번</label>
                               </div>
                               <div class="b-con-box" role="cell">
                               	<div id="STDT_NUM" data-lang></div>
                               </div>
                       </div>
                           <div class="b-row-item">
                               <div class="b-title-box" role="rowheader">
                                   <label data-lang>성명</label>
                               </div>
                               <div class="b-con-box" role="cell">
                               	<div id="STDT_KOR_NM" data-lang></div>
                               </div>
                           </div>
					</div>
				</div>
				<!-- /END 검색 영역 -->				

				<!-- 테이블 리스트 - 헤더 고정 -->
				<div class="table-box table-list">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>합격정보내역</caption>
							<colgroup>
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">합격여부</th>
									<th scope="col">파견구분</th>
									<th scope="col">파견년도</th>
									<th scope="col">파견학기</th>
									<th scope="col">파견대학</th>
									<th scope="col">파견기간</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
						</table>
					</div>
				</div>
				<!-- /END 테이블 -->
			
			<!-- 바디영역 -->
			</div>
		</section>
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td>#:PASS_GCD#</td>
	    <td>#:EXCHG_DETAIL_GCD#</td>
	    <td>#:SYEAR#</td>
	    <td>#:TERM_GCD#</td>
	    <td>#:EXUNIV_NM#</td>
	    <td>#:DISPATCH_SUPPOSE_PERIOD_GCD#</td>
	    <td>#:REMARK#</td>
	</tr>
</script>
<script type="text/javascript">

	var totalCnt = 0;
	var _autoComplete;
	var _multi;

	function fn_initScreen() {
		fn_SchStdtInfo();
	}

/***************************************************************************
 * 해외파견 자비 신청자정보 조회
 **************************************************************************/		
	function fn_SchStdtInfo() {
	
		data = gfn_com_inputdata($(".search-box"));
	
		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/passinfosearch/selectStdtInfo",
			reqData : data,
			success : function(data, responseData) {
				
				if (!gfn_com_isEmptyObject(data)) {
					$("#COLL_CD").text(data[0].COLL_CD);
					$("#DEPT_CD").text(data[0].DEPT_CD);
					$("#STDT_NUM").text(data[0].STDT_NO);
					$("#STDT_KOR_NM").text(data[0].STDT_KOR_NM);
					
					fn_schCallBack();
				}
		       	   
			}
		});	
		
	}

/***************************************************************************
 * 합격정보조회 - 목록
 **************************************************************************/
	function fn_schCallBack(data) {
		
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
	
		/* ajax처리 */
		gfn_ajax_request({
			url : "/ost/sep/overseasdispatch/passinfosearch/selectPassInfo",
			reqData : data,
			success : function(data, responseData) {
				
				$("#resultTbody").listView({
					dataSource : data,
					dataBound : function(e) {
						totalCnt = responseData.totalCnt;
						currentData = data;
					},
					template : $("#resultTemplate"),
					totalCnt : responseData.totalCnt,
					paging : null,
					excel : null
				});
				
			}
		});
	}

</script>
	