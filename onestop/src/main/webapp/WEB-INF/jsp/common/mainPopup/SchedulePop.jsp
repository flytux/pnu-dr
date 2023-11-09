<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/common/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet">
<script src="/common/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<div id="popups">
<section class="sec-2">
	<div class="sec-body">
		<!-- 검색영역 -->
		<div class="search-box">
			<div class="b-table-box flex-col-1" role="table" aria-label="조회">
				<div class="b-row-box" role="row">
					<div class="b-row-item">
						<div class="b-title-box" role="rowheader">
							<label class="req" data-lang>학년도/학기</label>
						</div>
						<div class="b-con-box" role="cell">
							<div class="row">
								<div class="col-xl-4">
									<input id="SCH_SYEAR" class="form-control" type="number" maxlength="4" oninput="maxLengthCheck(this)" title="학년도입력">
								</div>
								<div class="col-xl-4">
									<select id="SCH_TERM_GCD" class="form-control" title="학기선택"></select>
								</div>
								<div class="col-xl-4">
									<div class="btn-box">
										<div class="form-row">
											<div class="col-auto">
												<button class="btn search-btn" type="button" onclick="javascript:return fn_openChangeSchPopup();" data-lang="">조회</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- <div class="b-con-box" role="cell">
									<input id="SCH_COMMON_CD" class="form-control" onkeyup="gfn_com_enterFunc(event,fn_sch);">
								</div> -->
					</div>
				</div>
			</div>
			<!-- <div class="btn-box">
				<div class="form-row">
					<div class="col-auto">
						<button class="btn search-btn" type="button" onclick="javascript:return fn_openChangeSchPopup();" data-lang="">조회</button>
					</div>
				</div>
			</div> -->
		</div>
		<!-- /END 검색영역 -->


		<div class="table-box">
			<div class="table-header">
				<div class="header-item">
					<span class="mr-2"> Total <span class="text-total">${pageInfo.totCnt }</span> 건
					</span>
				</div>

			</div>
			<div class="table-body">
				<table class="table table-hover schTable"  data-toggle="table" data-show-column="true">
					<!--data-height="400"  -->
					<caption>학사일정정보</caption>
					<colgroup>
						<col style="width:10%">
						<col style="width:45%">
						<col style="width:45%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">일정</th>
							<th scope="col">내용</th>

						</tr>
					</thead>
					<tbody id="resultTbody">

						<c:forEach var="item" items="${scheduleList}" varStatus="status">
							<fmt:parseDate var="startDtFmt" pattern="yyyyMMddHHmmss" value="${item.SCHD_START_DT }" />
							<fmt:parseDate var="closeDtFmt" pattern="yyyyMMddHHmmss" value="${item.SCHD_CLOSE_DT }" />
							
							<fmt:formatDate var="startDt_ym" pattern="yyyy-MM" value="${startDtFmt }" />
							<fmt:formatDate var="startDt" pattern="yyyy-MM-dd (E) HH:mm" value="${startDtFmt }" />
							<c:if test="${fn:substring(item.SCHD_CLOSE_DT,8,10) == '00' }" >
								<fmt:formatDate var="closeDt" pattern="yyyy-MM-dd (E) HH:mm" value="${closeDtFmt }" />
							</c:if>
							<c:if test="${fn:substring(item.SCHD_CLOSE_DT,8,10) != '00' }" >
								<fmt:formatDate var="closeDt" pattern="yyyy-MM-dd (E) HH:mm" value="${closeDtFmt }" />
							</c:if>
							
							<tr>
								<td>${item.RN}</td>
								<td>${startDt}<br/> ~ ${closeDt}</td>
								<td><c:if test="${item.TERM_GCD_NM != '전학기'}">${item.TERM_GCD_NM} </c:if>${item.SCHD_GCD_NM}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
</div>

<script>
	$(document).ready(
			function() {
				loadLangInfo("popup");
				/*학기 공통코드 바인드*/
				$("#SCH_TERM_GCD").dropDownList({
					dataSource : null,
					commonCode : "0001_TERM_GCD",
					dataTextField : "COMMON_DETAIL_CD_KOR_NM",
					dataValueField : "COMMON_DETAIL_CD",
					optionLabel : "",
					optionValue : "",
					defaultValue : "",
					expnCondition : "AND CHAR_1_CONTENT LIKE '%A%' ",
					dataBound : function(e) {
						$("#SCH_SYEAR").val("${params.P_SYEAR}");
						$("#SCH_TERM_GCD").val("${params.P_TERM_GCD}");
					}
				});

				setTimeout(function() {
					var theader_cell = $("#resultTbody").closest(".fixed-table-container").find(".fixed-table-header").find(".fht-cell");
					if ($("#resultTbody").find("tr").eq(0).attr("class") != "no-records-found") {
							$("#resultTbody").find("tr").eq(0).find("td").each(function(i, o) {
									theader_cell.eq(i).css("width",$(this).css("width"));
							});
					}
					if ($("#resultTbody").closest(".fixed-table-body").hasVerticalScrollBar()) {
						theader_cell.filter(":last").css("width",parseInt(theader_cell.filter(":last").css("width").replace('px', '')) + 15);
						$("#resultTbody").attr("tabindex",0);
					} else {
						$("#resultTbody").closest(".fixed-table-container").find(".fixed-table-header").css("margin-right", "");
					}
				}, 500);
			});

	function fn_openChangeSchPopup() {
		var reqData = {};
		reqData.SCH_SYEAR = $("#SCH_SYEAR").val();
		reqData.SCH_TERM_GCD = $("#SCH_TERM_GCD").val();
		gfn_bbs_changeModalPopup({
			width : 600,
			height : 650,
			index : 5,
			target : null,
			title : "학사일정 ",
			include : '/core/main/selectScheduleListPop.do',
			reqData : reqData,
			dataBound : function(e) {
			}
		});

	}
</script>
