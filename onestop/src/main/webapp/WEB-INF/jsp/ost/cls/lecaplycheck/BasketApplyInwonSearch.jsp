<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
	                <h2 class="sec-title"></h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<!-- /END CONTENT HEADER -->		
			
			<!-- CONTENT BODY -->		
			<div class="sec-body">
				<div class="search-box">
					<div class="b-table-box flex-col-1" role="table" aria-label="조회">
						<!-- 1Row START-->
						<div class="b-row-box" role="row">
							<div class="b-row-item ">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>학년도</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="b-con-box" role="cell">
									<div class="" style="">
										<select id="SCH_SYEAR" class="form-control" title="학년도선택"></select>
									</div>
									<div class="" style="; margin-left: 3px;">
										<select id="SCH_TERM_GCD" class="form-control" title="학기선택"></select>
									</div>
								</div>
								</div>
							</div>
						</div>
						<!-- 1Row END-->
					</div>
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
							</div>
						</div>
					</div>
				</div>
				<div class="table-box" id=grid01>
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>희망과목신청인원</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 200px;">
								<col style="min-width: 70px;">
								<col style="min-width: 100px;">
								<col style="min-width: 70px;">
								<col style="min-width: 70px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">분반</th>
									<th scope="col">학점</th>
									<th scope="col">신청인원/대상인원</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn-box mt-4">
					<div class="form-row " style="justify-content: center;">
						<div class="col-auto">
							<button class="btn btn-outline-primary detail-btn" type="button" onclick="fn_openPopup('1')">상세보기</button>
							<button class="btn btn-outline-primary detail-btn" type="button" onclick="fn_openPopup('2')">전체보기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:ROWNUM#</td>
		<td class="text-left">#:SUBJ_NM#</td>
		<td>#:SUBJ_NO#</td>
		<td>#:CLASS_NO#</td>
		<td>#:CRDT#</td>
		<td class="text-right">#:APLY_CNT#</td>
	</tr>
</script>
<script type="text/javascript">
	const ajaxPath = '/ost/cls/lecaplycheck/BasketApplyInwonSearch';
	function fn_initScreen() {
		let date = new Date();
		let termInfo;
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : date.getFullYear()-1,
				"ENDYEAR" : date.getFullYear(),
			},
			success : function(data, responseData) {
				$("#SCH_SYEAR").dropDownList({
					dataSource : data,
					commonCode : "",
					dataTextField : "LABEL",
					dataValueField : "CODE",
					optionLabel : "",
					optionValue : "",
					defaultValue : "",
					expnCondition : "",
					dataBound : function(e) {
						termInfo = responseData.termInfo;
						$("#SCH_SYEAR").val(responseData.termInfo.SYEAR);
					}
				});
				$("#SCH_TERM_GCD").dropDownList({
					dataSource : null,
					commonCode : "0001_TERM_GCD",
					dataTextField : "COMMON_DETAIL_CD_KOR_NM",
					dataValueField : "COMMON_DETAIL_CD",
					optionLabel : "",
					optionValue : "",
					defaultValue : "",
					expnCondition : "AND CHAR_1_CONTENT LIKE '%B%' ",
					dataBound : function(e) {
						$("#SCH_TERM_GCD").val(termInfo.TERM_GCD);
					}
				});
			}
		});
	}
	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
			data = gfn_com_searchData($(".search-box"));
		}
		
		/* 필수체크 */
		if (!gfn_val_validateDataMap(data, [ {
			"id" : "SCH_SYEAR",
			"name" : "학년도",
			"notNull" : true
		}, {
			"id" : "SCH_TERM_GCD",
			"name" : "학기",
			"notNull" : true
		} ]))return false;
		
		data.COLL_GRAD_GCD = scwin.loginUser.collGradGcd
		data.GBN = '1'
		
		/* ajax처리 */
		gfn_ajax_request({
			url : ajaxPath + '/selectQuerySearch',
			reqData : data,
			success : function(data, responseData) {
				$("#resultTbody").listView({
					dataSource : data,
					dataBound : function(e) {
						emptyComment:'등록된 신청인원확인 목록이 없습니다.',
						totalCnt = responseData.pageInfo.totCnt;
						currentData = data;
					},
					template : $("#resultTemplate"),
					totalCnt :responseData.pageInfo.totCnt,
					paging : {
						pageInfo : responseData.pageInfo,
						reqData : responseData.reqData,
						func : "fn_sch"
					},
					excel : "fn_excelDownload"
				});
				
				
				/* $("#resultTbody").listView({
					dataSource : data,
					emptyComment:'등록된 신청인원확인 목록이 없습니다.',
					dataBound : function(e) {
						totalCnt = responseData.totalCnt;
						currentData = data;
					},
					template : $("#resultTemplate"),
					totalCnt : responseData.totalCnt,
					excel : "fn_excelDownload"
				}); */
			}
		});
	}
	function fn_openPopup(gbn){

		let title;
		if (gbn === '1'){
			title = '상세 희망과목담기 신청인원확인' 
		}if (gbn === '2'){
			title = '전체 희망과목 신청인원확인'
		}
		
		data = gfn_com_searchData($(".search-box"));
		data.COLL_GRAD_GCD = scwin.loginUser.collGradGcd
		data.USER_ID = scwin.loginUser.userId
		data.GBN = gbn
		scwin.detailObj.popupParam = data; 			
		
		gfn_com_modalPopup({
			width : 1500,
			height : 800,
			index : 1,
			target : null,
			title : title,
			include : "/html/ost/cls/lecaplycheck/BasketApplyInwonSearchPop.html",
			data:data,
		});
	}
	
	function fn_excelDownload() {

		data = gfn_com_searchData($(".search-box"));
		data.COLL_GRAD_GCD =  scwin.loginUser.collGradGcd;
		data.GBN = '1'
			
		
		
		data.pageSize = totalCnt; //전체데이터를 가지고 오기 위해서 pageSize를 전체건수로 세팅
		gfn_ajax_request({
			url : "/ost/cls/lecaplycheck/BasketApplyInwonSearch/selectQuerySearch",
			reqData : data,
			success : function(data, responseData) {
				if (data.length > 0) {
					/* [엑셀다운로드 공통] */
					gfn_com_excelDownloadFile([ {
						key : "ROWNUM",
						name : "NO"
					},{
						key : "SUBJ_NM",
						name : "교과목명"
					}, {
						key : "SUBJ_NO",
						name : "교과목번호"
					}, {
						key : "CLASS_NO",
						name : "분반"
					}, {
						key : "CRDT",
						name : "학점"
					}, {
						key : "APLY_CNT",
						name : "신청인원대상인원"
					}], /* 엑셀에 표시할 컬럼 및 명칭 */
					data, /* 엑셀로 다운로드 할 데이터 */
					"희망과목담기신청인원확인" /* 엑셀로 다운로드 할 파일명 (확장자제외) */
					);
				} else {
					alert("엑셀로 다운로드할 데이터가 없습니다.");
					return false;
				}
			}
		});
	}
	

</script>