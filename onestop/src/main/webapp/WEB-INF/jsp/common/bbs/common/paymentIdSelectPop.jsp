<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/common/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet">
<script src="/common/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<div id="popups">
<section class="sec-2">
	<div class="sec-body">
		<div class="table-box">
			<div class="table-body">
				<table class="table table-hover schTable"  data-toggle="table" data-show-column="true">
					<caption>과금아이디선택</caption>
					<colgroup>
						<col style="min-width:45px">
						<col style="min-width:80px">
						<col style="min-width:100px">
						<col style="min-width:80px">
						<col style="min-width:95px">
						<col style="min-width:185px">
						<col style="min-width:80px">
						<col style="min-width:130px">
						<!--<col style="min-width:100px">
						<col style="min-width:80px"> -->
						<col style="min-width:200px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">선택</th>
							<th scope="col">과금아이디</th>
							<th scope="col">내선번호</th>
							<th scope="col">정산담당자</th>
							<th scope="col">고지서수신메일</th>
							<th scope="col">납부방식</th>
							<th scope="col">외부사용자 목록</th>
							<!-- <th scope="col">개인사용여부</th>
							<th scope="col">사용여부</th> -->
							<th scope="col">비고</th>
						</tr>
					</thead>
					<tbody id="resultTbody">

						<c:forEach var="item" items="${dataList}" varStatus="status">							
							<tr>
								<td>${status.index+1}</td>
								<td><button class="btn btn-new " onclick="fn_selId('${item.PAYMNT_ID }');return false;" data-lang>선택</button></td>
								<td>${item.PAYMNT_ID }</td>
								<td>${item.EXTS_NO }</td>
								<td>${item.ADJ_CHARGE_USER_ID_TEXT }</td>
								<td>${item.GOJI_DOCU_RCV_EMAIL }</td>
								<td>${item.PAY_MEANS_CONTENT }</td>
								<td>${item.EXT_USER_CONTENT }</td>
								<!-- <td>${item.PERSON_USE_FG }</td>
								<td>${item.USE_FG }</td> -->
								<td>${item.REMARK }</td>
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
$(document).ready(function() {
	loadLangInfo("popup");
});

function fn_selId(selId){
    confirm("선택하신 "+selId+" 아이디로 메시지 발송을 진행하시겠습니까?",function(_flag){
   		if(_flag) {
    		//scwin.PAYMNT_ID = selId;
    		
    		var req_func_name = $('#req_FUNC_NAME').val();	// 콜백 펑션명
    		
    		if (typeof req_func_name == "function") {
    			req_func_name(selId);
			} else if (typeof req_func_name == "string") {
				window[req_func_name](selId);
			}
    		
    		gfn_com_closeModalWall(1);
   		}
   	});
}
</script>
