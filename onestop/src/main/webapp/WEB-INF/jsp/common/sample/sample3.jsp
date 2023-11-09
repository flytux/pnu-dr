<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
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
					<div class="b-table-box flex-col-1" role="table" aria-label="조회">
                        <div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label>주소검색</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="row">
										<div class="col-xl-2">
											<input type="text" id="ZIP_CD" class="form-control" />
										</div>
										<div class="col-auto">
											<button class="btn btn-primary" onclick="fn_jusoPop()" type="button">찾기</button>
										</div>
										<div class="col-xl-4">
											<input type="text" id="ADDR1" class="form-control" />
										</div>
										<div class="col-xl-4">
											<input type="text" id="ADDR2" class="form-control" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="b-table-box flex-col-1" role="table" aria-label="조회">
                        <div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label>이메일</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="row">
										<div class="col-xl-15">
											<input type="text" id="EMAIL" class="form-control" value=""/>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="b-table-box flex-col-1" role="table" aria-label="조회">
                        <div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label>전화번호</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="row">
										<div class="col-xl-15">
											<input type="text" id="TEL_NO_TXT" class="form-control" value=""/>
										</div>
										<div class="col-auto ">
											<div class=" text-center py-1 text-primary w2spinner">:화면에 보여주는 값&nbsp;</div>
										</div>
										<div class="col-xl-15">
											<input type="text" id="TEL_NO" class="form-control" value="+82" />
										</div>
										<div class="col-auto">
											<div class="text-center py-1 text-danger w2spinner">:DB에 입력 될 실제 값</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> 
				<!-- /END 검색 영역 -->
			
			</div>
		</section>      
	</main>
</div>
<!-- <script type="text/javascript" src="/common/js/DaumPostcode.v2/DaumPostcode.v2.js"></script> -->


<!-- <script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script> -->

<!-- <script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>-->



<script type="text/javascript">
	function fn_jusoPop() {
		if(false){ //scwin.server == "local"
			alert("local");
		}else{
				/* 
				var options = {
				        id:"addrPop", 
				        title : "주소검색",
				        modal : true, // modal 여부
				        width : 591,
				        height : 680,
				        callBackFunc : callBackFunc
				};
				 common.openPopup("/html/core/popup/addresspopup.xml", options, '', grdRowIdx);
				 */
				 fn_openSample3Popup({
					filename : 'addressPop',
					headertitle : '주소찾기',
					width : 800,
		        	height : 600
				});
		 
		}
	}

	function fn_openSample3Popup(_option) {
		gfn_com_modalPopup({
			width : _option.width,
			height : _option.height,
			index : 1,
			position : {
				top : 50,
				left : 600
			},
			target : null,
			title : _option.headertitle,
			scrolling : "on",
			scroll : "off",
			move : "on",
			include : "/html/ost/core/popup/" + _option.filename + ".html"
		});
	}

	
	
	$('#EMAIL').bind("click", function(e){
    	scwin.InputId = $(this);   
    	fn_openSample3Popup({
        	filename : 'emailPop',
        	headertitle : '이메일 편집',
        	width : 700,
        	height : 300
        });
    });
	

	$('#TEL_NO_TXT').bind("click", function(e){
    	scwin.InputId = $("#TEL_NO");   
    	scwin.TxtinputId = $("#TEL_NO_TXT");   
    	fn_openSample3Popup({
        	filename : 'telNoPop',
        	headertitle : '전화번호 편집',
        	width : 800,
        	height : 290
        });
    });
	


</script>