<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="sec-3">
	<div class="table-box" >
		<div class="table-body">
			<table class="table table-hover" data-toggle="table" data-show-column="true">
				<caption>교과목구분별 이수구분정보</caption>
				<colgroup>
				</colgroup>
				<thead>
					<tr>
						<th scope="col" rowspan="2">No</th>
						<th scope="col" colspan="3">졸업기준</th>
						<th scope="col" colspan="5">학생이수정보</th>
					</tr>
					<tr>
						<th scope="col">학적신청구분</th>
						<th scope="col">사정구분</th>
						<th scope="col">기준학점</th>
						
						<th scope="col">취득학점</th>
						<th scope="col">수강신청학점</th>
						<th scope="col">취득예정학점</th>
						<th scope="col">이수여부</th>
						<th scope="col">졸업불가사유</th>
					</tr>
				</thead>
				<tbody id="resultTbody">
					<c:forEach var="data" items="${dataList}" varStatus="status">
						<c:if test="${data != '' && data != null  }" >
						<tr>
							<td>${status.index+1 }</td>
							<td>${data.EVALTN_GCD_NM }</td>
							<td>${data.HEV_CRITERIA_GCD_NM }</td>
							<td>${data.MIN_CRDT }</td>
							<td>${data.CMPL_CRDT }</td>
							<td>${data.LECAPPLY_CRDT }</td>
							<td>${data.CMPL_PSBL_CRDT }</td>
							<td><c:if test="${data.PASS_FG == 'Y'}">이수</c:if></td>
							<td>${data.NONPSBL_REASON_COMMENT }</td>
						</tr>			
						</c:if>				
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>
<script src="/common/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script>
</script>