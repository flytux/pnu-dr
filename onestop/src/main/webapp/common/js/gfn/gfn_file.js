
function FormUploader() {
	file_obj = {
		SYSTEM_GCD : "0002",
		ATTACH_FILE_GRP_CD : "",
		ATTACH_FILE_GCD : "",
		ACCEPT_EXT : "jpg,gif,png,bmp,doc,ppt,pdf,xls,xlsx,zip,alz,swf,flv,hwp,pptx,docx,pps,ppsx,tif,wmv",
		UPLOAD_SIZE : "20", //(MB) 최대 파일용량
		UPLOAD_CNT : 10,
		FILE_INDEX : 0,
		FILE_LIST : new Array(),
		FILE_SIZE_LIST : new Array(),
		FILE_ADD_YN : "Y",  //신규추가가능여부
		FILE_DEL_YN : "Y",   //삭제가능여부
        FILE_DWN_YN : "Y",  //다운로드가능여부
       	FILE_INFO_YN : "Y", /* 확장자와 제한용량 정보표시 여부*/
       	FILE_AREA_WIDTH_PER : "100", /* 첨부파일영역의 %값 */
       	FILE_COMMENT : "",  /* 안내문구 */
       	FILE_VIEWER_YN : "Y", /* 첨부파일뷰어 표시 여부 */
		FILE_TAG_CONTENT_YN : "N" /* 첨부파일 대체텍스트 표시 여부 */
	};
}

$.extend(FormUploader.prototype, {
	
	_newInst: function(target, inline) {
		var id = target[0].id.replace(/([^A-Za-z0-9_\-])/g, "\\\\$1"); // escape jQuery meta chars
	
		return {
				id: id 
				, input: target // associated target
				, inline: inline
			};
	},
	 _getInst: function( target ) {
		try {
			return $.data(target, "fileuploader");
		}
		catch (err) {
			throw "Missing instance data for this fileuploader";
		}
	},
	 _get: function(inst, name) {
		return inst.settings[name] !== undefined ? inst.settings[name] : file_obj[name];
	},
	_SetConfig : function(target, options) {
		
		
		// 옵션 셋팅
		var nodeName, inline, inst;
		nodeName = target[0].id.toLowerCase();
		inline = (nodeName === "div" || nodeName === "span");
		if (!target.id) {
			this.uuid += 1;
			target.id = "dp" + this.uuid;
		}
		inst = this._newInst($(target), inline);
		inst.settings = $.extend({}, file_obj, options || {});

		
		if(inst.settings.SYSTEM_GCD == "") inst.settings.SYSTEM_GCD = file_obj.SYSTEM_GCD;
		//사용자지정 그룹코드 없으면 랜덤키 생성
		if(inst.settings.ATTACH_FILE_GRP_CD == "") inst.settings.ATTACH_FILE_GRP_CD = $.formuploader._getRandomKey();
		
		//사용자지정 확장자 없으면 
		if(inst.settings.ACCEPT_EXT == "") inst.settings.ACCEPT_EXT = file_obj.ACCEPT_EXT;
		
		//사용자지정 최대 파일 용량 없으면
		if(inst.settings.UPLOAD_SIZE == "") inst.settings.UPLOAD_SIZE = file_obj.UPLOAD_SIZE;
		if(inst.settings.UPLOAD_CNT == "") inst.settings.UPLOAD_CNT = file_obj.UPLOAD_CNT;
		if(inst.settings.FILE_ADD_YN == "") inst.settings.FILE_ADD_YN = file_obj.FILE_ADD_YN;
		if(inst.settings.FILE_DEL_YN == "") inst.settings.FILE_DEL_YN = file_obj.FILE_DEL_YN;
		if(inst.settings.FILE_DWN_YN == "") inst.settings.FILE_DWN_YN = file_obj.FILE_DWN_YN;
		if(inst.settings.FILE_INFO_YN == "") inst.settings.FILE_INFO_YN = file_obj.FILE_INFO_YN;
		if(inst.settings.FILE_AREA_WIDTH_PER == "") inst.settings.FILE_AREA_WIDTH_PER = file_obj.FILE_AREA_WIDTH_PER;
		if(inst.settings.FILE_COMMENT == "") inst.settings.FILE_COMMENT = file_obj.FILE_COMMENT;
		if(inst.settings.FILE_VIEWER_YN == "") inst.settings.FILE_VIEWER_YN = file_obj.FILE_VIEWER_YN;
		

		$.formuploader._CreateUploadStyle(target, inst);
		
		
		if(inst.settings.FILE_ADD_YN == "Y"){
			let $this = "";
			inst.settings.target.find("#selFile").bind( "click", function(){
				$this = $(this); 
				inst.settings.target.find('input[type=file]').click();
				return false; 
			} );
			//inst.settings.target.find("#saveFile").bind( "click", function(){ $.formuploader._fn_save(inst);return false; } );
			inst.settings.target.find('input[type=file]').bind("change",function() {
				if ($.formuploader._selectFile(inst.settings.target.find('input[type=file]')[0].files,inst)) {
					$.formuploader._uploadFile(inst,$this);
				}
			});
		
			inst.settings.target.find('input[type=file]').bind("click",function() {
					// 파일 배열에서 삭제
					inst.settings.FILE_LIST = new Array();
					// 파일 사이즈 배열 삭제
					inst.settings.FILE_SIZE_LIST = new Array();
					$.formuploader._fn_fileReset(inst);
			});
			
			// 파일 드롭 다운
			$.formuploader._fileDropDown(inst); 
		}else{
			inst.settings.target.find(".attach").css("display","block");
			inst.settings.target.find("#selFile").hide();
			inst.settings.target.find("#saveFile").hide();
		}
		$.formuploader._fn_fileDetailsSearch(inst);	
	},
	_CreateUploadStyle : function(target, inst) {
		inst.settings.target = target;
		
		inst.settings.target.css("width",inst.settings.FILE_AREA_WIDTH_PER+"%");
		var cont = "";
		if(inst.settings.FILE_INFO_YN=="Y"){
			cont += "<div class='message-box mb-2'>                                                                        ";
			cont += "	<div class='message-box-inner'>                                                               ";
			cont += "		<div class='message-body'>                                                                ";
			cont += "			<ul class='list list-style-1'>                                                        ";
			cont += "				<li>                                                                              ";
			cont += "					<span class='dfn' id='extTxt'>허용확장자 :</span>                             ";
			cont += "				</li>                                                                             ";
			cont += "				<li>                                                                              ";
			cont += "					<span class='dfn' id='uSizeTxt'>최대 파일용량 :</span>                        ";
			cont += "				</li>                                                                             ";
			cont += "			</ul>                                                                                 ";
			cont += "		</div>                                                                                    ";
			cont += "	</div>                                                                                        ";
			cont += "</div>                                                                                           ";
		}
		cont += "<div class='sec-body'>                                                                           ";
		if(inst.settings.FILE_COMMENT !=""){
			cont += "<p class='info-text info-text-style-1'>";
			cont += inst.settings.FILE_COMMENT;
			cont += "</p>";
		}
		cont += "	<div class='attach '>                                                                         ";
		cont += "		<div class='drop-zone' id='dropZone'>                                                     ";
		cont += "			<p class='non-info'>Drag &amp; Drop</p>                                               ";
		cont += "		</div>                                                                                    ";
		cont += "		<div class='attach-btn'>                                                                  ";
		cont += "			<button type='button' class='btn-primary' id='selFile'>Upload Files</button>      ";
		cont += "			<input class='btn-file d-none' type='file' multiple='multiple' name='files' >         ";
		cont += "			</div>                                                                                ";
		cont += "		</div>                                                                                    ";
		cont += "		<br />                                                                                    ";
		
		cont += "	</div>                                                                                        ";
		inst.settings.target.html(cont);
		
		
		//alert("test1::"+target[0].id);
		//inst.settings.target.html(file_obj.SYSTEM_GCD);
		if(gfn_str_parseNull(inst.settings.ACCEPT_EXT)=="") {
			inst.settings.target.find("#extTxt").html("허용확장자 : 제한없음");
		}else{
			inst.settings.target.find("#extTxt").html("허용확장자 : " + inst.settings.ACCEPT_EXT );
		}
		inst.settings.target.find("#uSizeTxt").html("최대 파일용량 : " + inst.settings.UPLOAD_SIZE + " MB");
		
		
		
	},
	/*_fn_save : function(inst){		
		$.formuploader._fileComplete({
			ATTACH_FILE_GRP_CD: inst.settings.ATTACH_FILE_GRP_CD
		});
	},
	
	_fileComplete : function(params) {
		var options = {};
		options.url = '/file/fileTransComplete';
		options.reqData = params;
		options.success = function(data, responseData) {
			alert("완료처리");
		};
		gfn_ajax_request(options);
	},*/
	// 파일 드롭 다운 필수
	_fileDropDown : function(inst){
			var dropZone = inst.settings.target.find("#dropZone");
			//Drag기능 
			dropZone.on('dragenter', function(e) {
				e.stopPropagation();
				e.preventDefault();
				// 드롭다운 영역 css
				dropZone.find(".non-info").css('background-color', '#E3F2FC');
				dropZone.css('background-color', '#E3F2FC');
			});
			dropZone.on('dragleave', function(e) {
				e.stopPropagation();
				e.preventDefault();
				// 드롭다운 영역 css
				dropZone.find(".non-info").css('background-color', '#f2f3f4');
				dropZone.css('background-color', '#f2f3f4');
			});
			dropZone.on('dragover', function(e) {
				e.stopPropagation();
				e.preventDefault();
				// 드롭다운 영역 css
				dropZone.find(".non-info").css('background-color', '#E3F2FC');
				dropZone.css('background-color', '#E3F2FC');
			});
			dropZone.on('drop', function(e) {
				e.preventDefault();
				// 드롭다운 영역 css
				dropZone.find(".non-info").css('background-color', '#f2f3f4');
				dropZone.css('background-color', '#f2f3f4');
		
				var files = e.originalEvent.dataTransfer.files;
				if (files != null) {
					if (files.length < 1) {
						alert("폴더 업로드 불가");
						return;
					}
					if ($.formuploader._selectFile(files,inst)) {
						$.formuploader._uploadFile(inst);
					} else {
						// 파일 배열에서 삭제
						inst.settings.FILE_LIST = new Array();
		
						// 파일 사이즈 배열 삭제
						inst.settings.FILE_SIZE_LIST = new Array();
						$.formuploader._fn_fileReset(inst);
					}
				} else {
					alert("ERROR");
				}
			});
		},
		// 파일 선택시
		_selectFile : function(files,inst){
			var resultchk = false;
			// 다중파일 등록
			if (files != null) {
				
				
				
				for (var i = 0; i < files.length; i++) {
					// 파일 이름
					var fileName = files[i].name;
					var fileNameArr = fileName.split("\.");
					// 확장자
					var ext = fileNameArr[fileNameArr.length - 1];
					// 파일 사이즈(단위 :KB)
					var fileSize = files[i].size / 1024;
		
					if ((inst.settings.ACCEPT_EXT.toLowerCase()).indexOf(ext.toLowerCase(), 0) < 0) {
						// 확장자 체크
						alert(fileName + '은(는) 업로드가 제한 된 파일확장자 입니다.');
						break;
					} else if ((fileSize / 1024) > inst.settings.UPLOAD_SIZE) {
						// 파일 사이즈 체크
						alert("용량 초과\n업로드 가능 용량 : " + inst.settings.UPLOAD_SIZE + " MB");
						break;
					} else {
						// 전체 파일 사이즈
						//totalFileSize += fileSize;
		
						// 파일 배열에 넣기
						inst.settings.FILE_LIST[inst.settings.FILE_INDEX] = files[i];
						var file_list = [];
						$.each(inst.settings.target.find(".attach-list li"),function(e){
							file_list.push($(this));
						});
						if ( ( files.length + file_list.length) > inst.settings.UPLOAD_CNT ) {
								// 파일 갯수 체크
								alert("업로드 가능한 파일 개수 : " + inst.settings.UPLOAD_CNT + "개");
								break;
								
						}
						// 파일 사이즈 배열에 넣기
						inst.settings.FILE_SIZE_LIST[inst.settings.FILE_INDEX] = fileSize;
		
						// 파일 번호 증가
						inst.settings.FILE_INDEX++;
						resultchk = true;
					}
				}
			} else {
				alert("ERROR");
			}
			return resultchk;
		},
		
		// 파일 등록
		_uploadFile : function(inst,_target){	
			// 등록할 파일 리스트
			var uploadFileList = Object.keys(inst.settings.FILE_LIST);
		
			// 파일이 있는지 체크
			if (uploadFileList.length == 0) {
				// 파일등록 경고창
				alert("파일이 없습니다.");
				return;
			}
		
			confirm("등록 하시겠습니까?", function(res) {
				if (res) {
					// 등록할 파일 리스트를 formData로 데이터 입력
					var form = $('#uploadForm')[0];
					var formData = new FormData(form);
		
		
					formData.append(scwin.tokenHeaderNm, scwin.token);
					formData.append(scwin.tokenParameterNm, scwin.token);
					formData.append("ATTACH_FILE_GRP_CD", inst.settings.ATTACH_FILE_GRP_CD);
					formData.append("ATTACH_FILE_GCD", inst.settings.ATTACH_FILE_GCD);
					formData.append("SYSTEM_GCD", inst.settings.SYSTEM_GCD);
		
					for (var i = 0; i < uploadFileList.length; i++) {
						formData.append('files', inst.settings.FILE_LIST[uploadFileList[i]]);
						
					}
					
					$.formuploader._gfn_ajax_file_request({
						url: "/file/multiUpload"
						, reqData: formData
						, success: function(responseData) {
							var options = {};
							options.url = '/file/saveFileList';
							options.reqData = {
								files: responseData,
								SYSTEM_GCD : inst.settings.SYSTEM_GCD
							};
							options.success = function(_data, _responseData) {
								$(_target).focus();
								$.formuploader._fn_fileDetailsSearch(inst); 
								
								if(typeof inst.settings.dataBound == "function"){
				                   inst.settings.dataBound(inst.settings,_target);   
				               }else if (typeof inst.settings.dataBound == "string"){
				                   window[inst.settings.dataBound](inst.settings,_target);
				               }
							};
							gfn_ajax_request(options);
						}
					});
				} else {
					// 파일 배열에서 삭제
					inst.settings.FILE_LIST = new Array();
		
					// 파일 사이즈 배열 삭제
					inst.settings.FILE_SIZE_LIST = new Array();
		
					$.formuploader._fn_fileReset(inst);
					$(_target).focus();
				}
			});
		},
		
		
		_gfn_ajax_file_request : function(options){		
			var reqData = options.reqData;
			if (reqData == null) reqData = {};
			if (!gfn_com_isEmptyObject(scwin.loginUser)) {
				loginCountDown(); //세션시간갱신
			}
			$.ajax({
				url: options.url + '.do',
				data: reqData,
				type: 'POST',
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				dataType: 'json',
				cache: false,
				beforeSend: function(request) {
					if (options.loading == undefined) {
						gfn_ajax_showLoadingImg(true, gfn_str_parseNull(options.loadingMsg), gfn_str_parseNull(options.timestampId));
					}
					request.setRequestHeader("AJAX", "true");
					request.setRequestHeader(scwin.tokenHeaderNm, scwin.token);
				},
				complete: function(a, b, c) {
					if (options.loading == undefined) {
						gfn_ajax_showLoadingImg(false, "", gfn_str_parseNull(options.timestampId));
					}
				},
				success: function(responseData) {
					options.success(responseData);
				},
				error: function(jqXhr, textStatus, errorThrown) {
					gfn_ajax_defaultAjaxError(jqXhr, textStatus, errorThrown, options.failCallBack);
				}
			});
		},
		
		_fn_fileReset : function(inst){		
			var agent = navigator.userAgent.toLowerCase();
			if (agent.indexOf("msie") != -1) {
				inst.settings.target.find("input[type=file]").replaceWith(inst.settings.target.find("input[type=file]").clone(true));
			} else {
				inst.settings.target.find("input[type=file]").val("");
			}
		},
		
		_fn_fileDetailsSearch : function(inst) {
			var options = {};
			options.url = '/file/selectList';
			options.reqData = {
				SYSTEM_GCD: inst.settings.SYSTEM_GCD,
				ATTACH_FILE_GRP_CD: inst.settings.ATTACH_FILE_GRP_CD,
				ATTACH_FILE_GCD: inst.settings.ATTACH_FILE_GCD
			};
			options.success = function(data, responseData) {
				
				// 업로드 파일 목록 생성
				$.formuploader._addFileList(data,inst);
		
				// 파일 배열에서 삭제
				inst.settings.FILE_LIST = new Array();
		
				// 파일 사이즈 배열 삭제
				inst.settings.FILE_SIZE_LIST = new Array();

		
			};
		
			gfn_ajax_request(options);
		},
		
		_addFileList : function(responseData,inst){
			
			var file_list = [];
			$.each(inst.settings.target.find(".attach-list li"),function(e){
				file_list.push($(this).attr("attach_file_seq_no") +"^"+$(this).find("#FILE_TAG_CONTENT").val());
			});
			
			var dropZone = inst.settings.target.find("#dropZone");
			if(responseData[0] != undefined){
				dropZone.html("");
				inst.settings.target.find('.attach').addClass("attached");
			}
			
			var html = "";
			html += "<ul class=\"attach-list\">";
			$.each(responseData, function(idx, obj) {
				html += "<li id='file_" + obj.ATTACH_FILE_SEQ_NO + "' SYSTEM_GCD=" + obj.SYSTEM_GCD + " ATTACH_FILE_GRP_CD=" + obj.ATTACH_FILE_GRP_CD + " ATTACH_FILE_GCD=" + obj.ATTACH_FILE_GCD + " ATTACH_FILE_SEQ_NO=" + obj.ATTACH_FILE_SEQ_NO + ">";
				if(inst.settings.FILE_VIEWER_YN=="Y"){
				html += "<input type='button' id='viewerFile' class='btn btn-dark btn-sm btn-viewer mr-2' style='' value='viewer' title='새창열기'>";
				}
				var href = "javascript:void(0)";
				if(inst.settings.FILE_DWN_YN=="Y"){
					href = "/file/download.do?"+obj.PARAM_CODE;
				}
				html += "<a href="+href+">";
				//html += "<a href='/file/download.do' onclick='$.formuploader._downLoad(this.href,"+obj.ATTACH_FILE_SEQ_NO+",inst);return false;' onkeypress='this.onclick'>";
				html += "<span class=\"attach-name\">" + obj.ORIGIN_FILE_NM + "</span><span class=\"attach-size\">(" + obj.FILE_SIZE + " KB)</span>";
				html += "</a>";
				if(inst.settings.FILE_TAG_CONTENT_YN == "Y"){
					var img_ext = "jpg,gif,png,bmp,alz";
					if(file_list.length > 0 && file_list.length != idx){
						var ATTACH_FILE_SEQ_NO = file_list[idx].split("^")[0];
						var FILE_TAG_CONTENT = file_list[idx].split("^")[1] ;
						
						if(FILE_TAG_CONTENT == "")FILE_TAG_CONTENT = gfn_str_parseNull(obj.FILE_TAG_CONTENT)
						if(ATTACH_FILE_SEQ_NO == obj.ATTACH_FILE_SEQ_NO){
							
							if ((img_ext).indexOf(obj.FILE_EXTENSION_CONTENT.toLowerCase(), 0) > -1) {
								html += "&nbsp;&nbsp;&nbsp;  <input type='text' id='FILE_TAG_CONTENT' value='"+FILE_TAG_CONTENT+"' title='이미지대체텍스트입력'/>";	
							}
						}
					}else{
						if ((img_ext).indexOf(obj.FILE_EXTENSION_CONTENT.toLowerCase(), 0) > -1) {
							html += "&nbsp;&nbsp;&nbsp; <input type='text' id='FILE_TAG_CONTENT' value='"+gfn_str_parseNull(obj.FILE_TAG_CONTENT)+"' title='이미지대체텍스트입력'/>";
						}
					}
				}
				/*$.each(file_list, function(idx2,item2) {
					var ATTACH_FILE_SEQ_NO = item2[idx2].split("|")[0];
					var FILE_TAG_CONTENT = item2[idx2].split("|")[1];
					if(ATTACH_FILE_SEQ_NO == obj.ATTACH_FILE_SEQ_NO){
						html += "&nbsp;&nbsp;&nbsp; 대체텍스트: <input type='text' id='FILE_TAG_CONTENT' value='"+FILE_TAG_CONTENT+"'/>";	
					}
				});*/
				if(inst.settings.FILE_DEL_YN=="Y"){
					html += "<button type=\"button\" class=\"btn\" id=\"delFile\" aria-label=\"파일삭제\"><i class=\"bi bi-x\" aria-hidden=\"true\"></i></button>";
				}
				html += "</li>";
		
			});
			html += "</ul>";
		
			dropZone.append(html);
			loadAccessibility();
			if (inst.settings.target.find('.attach').find("input[name=attach_file_grp_cd]").length == 0
				&& inst.settings.target.find('#dropZone').find("li").length != 0) {
				inst.settings.target.find('.attach').append("<input type='hidden' name='attach_file_grp_cd' value='"+inst.settings.ATTACH_FILE_GRP_CD+"'/>");
			}
			
			$.each(responseData, function(idx, obj) {
				inst.settings.target.find("#file_" + obj.ATTACH_FILE_SEQ_NO).find("#delFile").bind( "click", function(){ $.formuploader._deleteFile(obj.ATTACH_FILE_SEQ_NO ,inst);return false; } );
				
				inst.settings.target.find("#file_" + obj.ATTACH_FILE_SEQ_NO).find("#viewerFile").bind( "click", function(){
					fn_popupMultiFileViewr("/file/download.do?"+obj.PARAM_CODE,this);
				});
			});
			
			
		},

		_completeFile : function(options) {
			
			
			var attach_file_grp_cd = $("#"+options.target).find("input[name=attach_file_grp_cd]").val();
	
			var file_list = [];
			$.each($("#"+options.target).find(".attach-list li"),function(e){
				file_list.push($(this).attr("attach_file_seq_no") +"^"+$(this).find("#FILE_TAG_CONTENT").val());
			});

			
			/////////////////////////////////////////////////////////////////////
			var reqData ={};
			reqData.ATTACH_FILE_GRP_CD = attach_file_grp_cd;
			reqData.file_list = file_list;
			
			gfn_ajax_request({
	            url : '/file/fileTransComplete',
	            reqData : reqData,
	            success : function(data, responseData) {           
		 				//alert("fsd");
						if(typeof options.success == "string"){
							options.success(data, responseData);
						} else if(typeof options.success == "function"){
							options.success(data, responseData);
						}
						/*gfn_ajax_request({
		        			url : "/bbs/saveBbsInfo",
		        			reqData : param,
		        			success : function(data, responseData){
		        				alert(data.msg);
		        				gfn_com_closeModalWall($(_this).closest("#popup").attr("idx"),function(){
		        					fn_sch();
		        				});		
		        			}
		        		});*/
				}
			});
		},

		// 업로드 파일 삭제
		_deleteFile : function(fIndex,inst){
		
			confirm("파일을 삭제하시겠습니까?", function(res) {
				if (res) {
					$.formuploader._udcDeleteFileMultiCallback(fIndex,inst);
		
		
		
					// 전체 파일 사이즈 수정
					//totalFileSize -= file_obj.fileSizeList[fIndex];
		
					// 파일 배열에서 삭제
					delete inst.settings.FILE_LIST[fIndex];
		
					// 파일 사이즈 배열 삭제
					delete inst.settings.FILE_SIZE_LIST[fIndex];
		
					// 업로드 파일 테이블 목록에서 삭제
					inst.settings.target.find("#file_" + fIndex).remove();
					if (inst.settings.target.find('#dropZone').find("li").length == 0) {
						inst.settings.target.find('.attach').removeClass("attached");
						inst.settings.target.find('#dropZone').html("<p class=\"non-info\">Drag &amp; Drop</p>");
					}
				}else{
					inst.settings.target.find("#file_" + fIndex).focus();
				}
			});
		
		},
		
		_udcDeleteFileMultiCallback : function(fIndex,inst) {

			var options = {};
			options.url = '/file/delete';
			options.async = false;
			options.reqData = {
				SYSTEM_GCD: inst.settings.target.find("#file_" + fIndex).attr('system_gcd'),
				ATTACH_FILE_GRP_CD: inst.settings.target.find("#file_" + fIndex).attr('attach_file_grp_cd'),
				ATTACH_FILE_GCD: inst.settings.target.find("#file_" + fIndex).attr('attach_file_gcd'),
				ATTACH_FILE_SEQ_NO: inst.settings.target.find("#file_" + fIndex).attr('attach_file_seq_no')
			};
			options.success = function(data, responseData) {
				alert('삭제되었습니다');
			};
			gfn_ajax_request(options);
		
		},
		_getRandomKey : function(){		
			function s4() {
				return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
			}
			return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
		},
		_downLoad : function(url,seq_no,inst){
		
		var options = {};
		options.url = url;
		options.reqData = {
			SYSTEM_GCD: inst.settings.SYSTEM_GCD,
			ATTACH_FILE_GRP_CD: inst.settings.ATTACH_FILE_GRP_CD,
			ATTACH_FILE_GCD: inst.settings.ATTACH_FILE_GCD,
			ATTACH_FILE_SEQ_NO : seq_no
		};
		options.success = function(data, responseData) {};
	
		gfn_ajax_request(options);
	}
});	


$.fn.formuploader = function(options){
	$.formuploader._SetConfig(this, options);
}

$.formuploader = new FormUploader(); // singleton instance

var formuploader = $.formuploader;


