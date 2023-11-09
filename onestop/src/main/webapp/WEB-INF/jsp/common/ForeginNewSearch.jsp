<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="ko">
    <jsp:include page="inc/incCommonCss.jsp" flush="false" />
	<body>
	  <script src="/common/js/jquery-3.6.0.min.js"></script>
	  <script src="/common/js/gfn/gfn_table.js"></script>
	   <div id="root">	
	       
	       <div class="container container-sub">
	          
               <div class="viewpage" id="viewpage" >
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
	                <h2 class="sec-title"></h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<div class="sec-body">		
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">
						<div class="b-row-box" role="row">						
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_EXAM_NO" data-lang>Application Number</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_EXAM_NO" class="form-control" title="수험번호"/>
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_PWD" data-lang>Password</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_PWD" class="form-control" />
                                </div>
                            </div>    
                            <div class="btn-box">
								<div class="b-con-box">
									<div class="col-auto">
		                                <button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>Search</button>
									</div>
								</div>
							</div>                       
						</div>
					</div>
					<!-- 
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
                                <button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
							</div>
						</div>
					</div>
					-->
				</div>
				<!-- /END 검색 영역 -->
				<div class="message-box mb-3">
					<div class="message-box-inner">
						<div class="message-body">
							※ Please enter the password used in onestop.
							<br/>
							※ Student number confirmation is available only for a month.(Spring semester : End of February ~ March, Fall Semester : End of August ~ September)
						</div>
					</div>
				</div>				
				<!-- 테이블 -->                
				<div class="table-box" id=grid01>
					<div class="table-body">                    
						<table class="table table-hover" data-toggle="table"  data-show-column="true">
							<caption>학생별 적용 교육과정 정보</caption>
							<colgroup>
								<col style="min-width: 500px;">
							</colgroup>
							<tbody id="resultTbody">
								<tr style="cursor:pointer;">
									<td><strong class="text-primary">Please click "Search" button after entering the student classification, application number, password.</strong></td>
								</tr>
							</tbody>
						</table>
					</div>					
				</div>
				<!-- /END 테이블 -->				
			</div>
		</section>      
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td><strong class="text-primary">The student number "#:성명#" requested, is "#:학번#".</strong></td>
	</tr>
</script>

<script type="text/javascript">

	$(document).ready(function() {
			document.location.href = "https://onestop.pusan.ac.kr/page?menuCD=000000000000417";
	
	});
	function fn_sch() {
		/* 검색조건데이터 가져오기 */
		/*
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".search-box"));
			data.EXAM_NO = SCH_EXAM_NO;
			data.PWD = SCH_PWD;
        }
		*/
		
		data = {"SCH_EXAM_NO" : $("#SCH_EXAM_NO").val(),
                "SCH_PWD" : $("#SCH_PWD").val()
               };
		
		/* ajax처리 */	
			$.ajax({
		        url : "/ost/foregin/ForeginNewSearch/fnsList",
		        type: "POST",
		        dataType : "json",
		        data : data,  
		        async: false,
		        requestHeader : {},
		        beforeSend:function(request){
		            request.setRequestHeader("AJAX", "true");
		        },
		        success : function(data){
		        	
		            var size = data.length;
		            var html = "";
		            if (size > 0) {
		                if (datas[0].조회여부 == 'Y') {
		                    if (datas[0].조회결과 == 'S') {
		                        msg = 'The student number <span class=\"maroon\">"' + data[0].성명 + '"</span> requested, is <span class=\"purple\">"' + data[0].학번 + '"</span>.';      
		                    } else {
		                        msg = '<span class=\"color_b\">There is no student number that matches the application number and password entered. Please try again.</span>';
		                    }
		                } else {
		                    msg = '<span class=\"color_b\">Student number confirmation is not in service now.</span>';
		                }               
		            } else {
		                msg = '<span class=\"color_b\">Student number confirmation is not in service now.</span>';
		            }
		            html += '<tr>';
		            html += '<td class="table_m" height="150"><strong>' + msg +'</strong></td>';
		            html += '</tr>';            
		            $("#resultTbody").html(html);
                    
		        },
		        error : function(data, status, er) {
		        	console.log(data)
		            alert("error: " + data + " status: " + status + " er:" + er);
		        }
	        });
		}	
	
</script>

</div>
	       </div>
	   </div>     
    </body>
