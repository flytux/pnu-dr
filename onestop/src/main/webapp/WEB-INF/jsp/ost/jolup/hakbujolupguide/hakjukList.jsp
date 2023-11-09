<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="table-box" >
<div class="table-body">
	<table class="table table-hover" data-toggle="table" data-show-column="true">
		<caption>주전공 및 학적신청 ( 부전공, 복수전공, 연합전공) 정보</caption>
		<colgroup>

		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col" data-lang>학적신청구분</th>
				<th scope="col" data-lang>신청학과</th>
				<th scope="col" data-lang>이수여부</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody id="hakjukList">
			<c:forEach var="data" items="${dataList}" varStatus="status">
				<tr >
					<td>${status.index+1 }</td>
					<td>${data.EVALTN_GCD_NM }</td>
					<td>${data.APPLY_DEPT_CD_NM }</td>
					<td>${data.PASS_FG }</td>
					<td><button class="btn btn-primary" type="button" onclick="chgHakjuk(this,'${data.EVALTN_GCD }','${data.APPLY_DEPT_CD }')">선택</button></td>
				</tr>							
			</c:forEach>	
		</tbody>
	</table>
</div>
</div>
<script src="/common/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script>
	$(document).ready(function(){
		/* 첫번째 학적구분으로 첫번째탭메뉴 교과목 이수구분 탭 정보 출력 */
		var reqData = gfn_com_searchData($(".search-box"));
		
		reqData.EVALTN_GCD = "${dataList[0].EVALTN_GCD}";
		reqData.APPLY_DEPT_CD = "${dataList[0].APPLY_DEPT_CD}";
		
		fn_setRowTable(reqData);
	});
	
	function chgHakjuk(_this, EVALTN_GCD, APPLY_DEPT_CD){
		var reqData = gfn_com_searchData($(".search-box"));
		reqData.EVALTN_GCD = EVALTN_GCD;
		reqData.APPLY_DEPT_CD = APPLY_DEPT_CD;
		fn_setRowTable(reqData);
	}
</script>