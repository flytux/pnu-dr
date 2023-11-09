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
			<div>
				<div id="download_target"></div>
				<div class="sec-body" id="uploader_target1"></div>
				<div class='text-center mb-4'>                                                          
					<div class='form-group'>                                                            
						<button class='btn btn-primary btn-lg' onclick="fn_save('uploader_target1')" type='button'>완료처리</button>
					</div>                                                                              
				</div>                                                                                  
			</div>
			
			<div class="sec-body" id="uploader_target2"></div>
			
			<div>
				<div class="sec-body" id="uploader_target3"></div>
				<div class='text-center mb-4'>                                                          
					<div class='form-group'>                                                            
						<button class='btn btn-primary btn-lg' onclick="fn_save('uploader_target3')" type='button'>완료처리</button>
					</div>                                                                              
				</div>                                                                                  
			</div>
			<div id="download_target2"></div>
		</section>      
	</main>
</div>
<script type="text/javascript">
$(document).ready(function() {
	
	var uploader_target1 = $("#uploader_target1").formuploader({
		SYSTEM_GCD : "0002",  //시스템코드
		ATTACH_FILE_GCD : "9999", // 첨부파일 종류 코드 
		ATTACH_FILE_GRP_CD : "35599114-1dbe-6826-ef50-251c69dd9a01",  // 첨부파일 그룹 코드 
		ACCEPT_EXT : "JPG,pdf",  // 허용확장자 ( 메뉴설정에서 들고 오거나 지정한 확장자가 없으면 기본 확장자로 사용. )
		UPLOAD_SIZE : "", // 최대 파일용량 (mb) (메뉴설정에서 들고 오거나 지정한 용량 없으면 기본 20mb )
		FILE_ADD_YN : "Y",  //신규추가가능여부
		FILE_DEL_YN : "Y",   //삭제가능여부
        FILE_DWN_YN : "Y",  //다운로드가능여부
       	FILE_INFO_YN : "Y", /* 확장자와 제한용량 정보표시 여부*/
       	FILE_AREA_WIDTH_PER : 70, /* 첨부파일영역의 %값 */
       	FILE_COMMENT : "첨부파일 <strong>안내문구</strong> 영역 입니다.",
       	FILE_VIEWER_YN : "Y", /* 첨부파일뷰어 표시 여부 */
       	FILE_TAG_CONTENT_YN : "N", /* 첨부파일 대체텍스트 표시 여부 */
       	dataBound : function(e,_target) { /* 업로드 완료후 처리 함수*/
			alert("업로드 완료",_target);
        }
       	
	});	
	
	var uploader_target2 = $("#uploader_target2").formuploader({
		SYSTEM_GCD : "0002",
		ATTACH_FILE_GCD : "9999",
		ACCEPT_EXT : 'jpg,png',
		UPLOAD_SIZE : selMenu[0].FILE_SIZE / 1024 / 1024,
		FILE_ADD_YN : "N", 
		
	});	
	
	var uploader_target3 = $("#uploader_target3").formuploader({
		SYSTEM_GCD : "0002",
		ATTACH_FILE_GCD : "9999",
		ATTACH_FILE_GRP_CD : "2022021713",  // 첨부파일 그룹 코드 
		ACCEPT_EXT : selMenu[0].FILE_EXTENSION_CONTENT,
		UPLOAD_SIZE : selMenu[0].FILE_SIZE / 1024 / 1024,
		FILE_TAG_CONTENT_YN : "N", /* 첨부파일 대체텍스트 표시 여부 */
		dataBound : function(e) {
			
        }
		
	});	
	
	var options = {};
	options.url = '/file/selectList';
	options.reqData = {
		SYSTEM_GCD:  "0002",
		ATTACH_FILE_GCD: "9999",
		ATTACH_FILE_GRP_CD: "2022021713"
	};
	options.success = function(data, responseData) {
		var download_target_html = "";
		download_target_html += "<div class='message-box message-box-style-2'>";
		download_target_html += "<div class='message-box-inner'>";
		download_target_html += "	<div class='message-header'>";
		download_target_html += "		<img src='/common/images/message_box_icon_01.svg' alt=''>";
		download_target_html += "	</div>";
		download_target_html += "	<div class='message-body'>";

		$.each(data,function(idx,file){
			download_target_html += "<div class='my-2'>";
			download_target_html += file.ORIGIN_FILE_NM;
			download_target_html += " <a class='btn btn-sm btn-primary' href='javascript:void(0);'  onclick='fn_popupMultiFileViewr(\"/file/download.do?"+file.PARAM_CODE+"\",this)' onkeypress='this.onclick' >뷰어<i class='bi bi-eye' aria-hidden='true'></i></a>";
			download_target_html += " <a class='btn btn-sm btn-primary' href='/file/download.do?"+file.PARAM_CODE+"'>다운로드<i class='bi bi-download' aria-hidden='true'></i></a>";
			download_target_html += "	</div>";
		});

		download_target_html += "	</div>";
		download_target_html += "</div>";
		download_target_html += "</div>";
		
		$("#download_target2").html(download_target_html);
	};

	gfn_ajax_request(options);
	
	
	
});

function fn_save(target){
	//첨부파일 완료 처리후(fn_fileComplete) -> 데이터 저장 처리 필요
	var attach_file_grp_cd = $("#"+target).find("input[name=attach_file_grp_cd]").val();
	
	var file_list = [];
	$.each($("#"+target).find(".attach-list li"),function(e){
		file_list.push($(this).attr("attach_file_seq_no") +"^"+$(this).find("#FILE_TAG_CONTENT").val());
	});

	var reqData ={};
	reqData.ATTACH_FILE_GRP_CD = attach_file_grp_cd;
	reqData.file_list = file_list;
	
	fn_fileComplete2(reqData);
	
	
	
}

</script>
