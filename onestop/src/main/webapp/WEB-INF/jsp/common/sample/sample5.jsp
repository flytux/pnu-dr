<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
					<h2 class="sec-title"></h2>
				</div>
				<div class="header-item"></div>
			</header>
			<!-- /END CONTENT HEADER -->

			<!-- CONTENT BODY -->
			<div class="sec-body">
				<div class="table-box">
					
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-height="350" data-show-column="true">
							<caption>Sample Table</caption>
							<colgroup>
								<col style="min-width: 40px;">
								<col style="min-width: 140px;">
								<col style="min-width: 140px;">
								<col style="min-width: 160px;">
								<col style="min-width: 140px;">
								<col style="min-width: 100px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">시스템구분</th>
									<th scope="col">공통코드</th>
									<th scope="col">공통코드명</th>
									<th scope="col">업무구분</th>
									<th scope="col">사용여부</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- /END CONTENT  BODY-->
		</section>
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td>#:data_0#</td>
	    <td class="table-secondary" scope="row">#:data_1#</td>
	    <td class="text-left">#:data_2#</td>
	    <td class="text-left">#:data_3#</td>
	    <td>#:data_4#</td>
	    <td>#:data_5#</td>
	</tr>
</script>
<script type="text/javascript">
	function fn_initScreen() {
		
		$("#resultTbody").listView({
			template : $("#resultTemplate"),
			totalCnt : 0,
			excel_upload : "fn_exlBtn" //엑셀업로드 버튼 활성화
		});
		
		fn_exlBtn = function(){
			fn_openPopup({
	        	filename : 'excelUploadPop',
	        	headertitle : 'excel 업로드'
	        });
		}
	}
	function fn_openPopup(_option) {
		gfn_com_modalPopup({
        	width : 400,
            height : 500,
            index : 1,
            target : null,                                
            title : _option.headertitle,
            include : "/html/ost/core/popup/"+_option.filename+".html",
            dataBound : function(e) {
            	$("#uploadBtn").on("click",function(){
            		fn_excelUpload({
            			dataBound: function(responseData) { //업로드 성공후
            				$("#resultTbody").listView({
            					dataSource : responseData,
            					dataBound : function(e) { //그리드 출력 성공후
									alert("성공");
            					},
            					template : $("#resultTemplate"),
            					totalCnt : responseData.length,
            					excel_upload : "fn_exlBtn" //엑셀업로드 버튼 활성화
            				});
            			}
            		});
            		
            	});
            }
        });
	}

	
</script>