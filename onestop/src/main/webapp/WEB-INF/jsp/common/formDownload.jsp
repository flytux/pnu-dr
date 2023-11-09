<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
					<h2 class="sec-title">서식다운로드</h2>
				</div>
				<div class="header-item">아이템</div>
			</header>
			<div class="sec-body" id="formDownload">
				
			</div>
		</section>
	</main>
</div>
<script type="text/javascript">
	$(document).ready(popInit());
	
	function popInit() {
		gfn_ajax_request({
			url : "/core/main/selectListFormDownload",
			reqData : {},
			success : function(data, responseData) {
				var list = responseData.formDownloadList;
				var item = '';
				var upMenuNm = '';
				var menuCd = ''
				var num = 1;
				for(var i in list) {
					if(i>0 && upMenuNm != list[i].UP_MENU_K) {
						item += '			</tbody>';
						item += '		</table>';
						item += '	</div>';
						item += '</section>';
					}
					if(upMenuNm != list[i].UP_MENU_K) {
						item += '<section class="sec-2">';
						item += '	<header>';
						item += '		<h2 class="sec-title">' + langUpperMenuNm(list[i]) + '</h2>';
						item += '	</header>';
						item += '	<div class="sec-body">';
						item += '		<table class="table">';
						item += '			<caption>' + langUpperMenuNm(list[i]) + '메뉴의 서식다운로드 리스트입니다.</caption>';
						item += '			<tbody>';
						item += '				<tr>';
						item += '					<th scope="col" width="60px">NO</th>';
						item += '					<th scope="col">서식명</th>';
						item += '					<th scope="col" width="160px">다운로드</th>';
						item += '					<th scope="col" width="200px">관련메뉴</th>';
						item += '				</tr>';
						
						upMenuNm = list[i].UP_MENU_K;
						num = 1;
					}
					
					var pre_title = '';
					
					if(gfn_str_parseNull(list[i].CONTENT_NM) != "" && list[i].CONTENT_NM != list[i].MENU_KOR_NM) {
						pre_title += ' <span class="badge badge-pill badge-primary">'+ list[i].CONTENT_NM +'</span>';
					}
					if(gfn_str_parseNull(list[i].FILE_TAG_CONTENT) != "") {
						pre_title += ' <span class="badge badge-pill badge-success">'+ list[i].FILE_TAG_CONTENT +'</span>';
					}
					/*if(pre_title != '') {
						pre_title += '<br/>'
					}*/
					
					
					item += '	<tr>';
					item += '		<td>'+ num +'</td>';
					item += '		<td class="text-left">' + delExt(list[i].ORIGIN_FILE_NM) + pre_title + '</td>';
					item += '		<td>';
					item += '			<a class="btn btn-sm btn-primary" style="font-size:12px;" href="javascript:void(0);" onclick="fn_popupMultiFileViewr(\'/file/download.do?'+ list[i].PARAM_CODE +'\',this)" onkeypress="this.onclick" data-lang title="새창열기">뷰어<i class="bi bi-eye" aria-hidden="true"></i></a>';
					item += '			<a class="btn btn-sm btn-primary" style="font-size:12px;" href="/file/download.do?'+ list[i].PARAM_CODE +'" data-lang>다운로드<i class="bi bi-download" aria-hidden="true"></i></a>';
					item += '		</td>';
					
					if (menuCd != list[i].MENU_CD && list[i].CNT > 1) {
						item += '		<td class="text-left align-text-top" rowspan="'+ list[i].CNT +'"><a href="#none" onclick="selectMenu(\''+ list[i].MENU_CD + '\');return false;" onkeypress="this.onclick">'+ langMenuNm(list[i]) + '</a></td>';
					}else if(list[i].CNT == 1){
						item += '		<td class="text-left align-text-top"><a href="#none" onclick="selectMenu(\''+ list[i].MENU_CD + '\');return false;" onkeypress="this.onclick">'+ langMenuNm(list[i]) + '</a></td>';
					}
					item += '	</tr>';
					menuCd = list[i].MENU_CD;
					
					num++;
					
					// 마지막에 한번
					if(list.length == i) {
						item += '			</tbody>';
						item += '		</table>';
						item += '	</div>';
						item += '</section>';
					}
				}
				
				$('#formDownload').html(item);
			}
		});
	}
	
	function langUpperMenuNm(_obj) {
		if (scwin.i18n.locale != '0001') {
			if (scwin.i18n.locale == '0002') {
				return gfn_str_parseNullDefault(_obj.UP_MENU_E, _obj.UP_MENU_K);
			} else if (scwin.i18n.locale == '0003') {
				return gfn_str_parseNullDefault(_obj.UP_MENU_C, gfn_str_parseNullDefault(_obj.UP_MENU_E, _obj.UP_MENU_K));
			} else {
				return _obj.UP_MENU_K;
			}
		} else {
			return _obj.UP_MENU_K;
		}
	}
	
	function delExt(fileNm) {
		var lstIdx = fileNm.lastIndexOf('.');
		
		return fileNm.substr(0,lstIdx);
	}
</script>