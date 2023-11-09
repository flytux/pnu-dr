<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header">
	<div class="header-sub">
		<div class="container">
			<ul class="list list-with-separator">
				<li><a href="/page?menuCD=000000000000412" style="color: #0D84EA;">서비스 요청 게시판</a></li>
				<li><a href="https://international.pusan.ac.kr/" target="_blank">PNU International</a></li>
				<li id="divClock" style="display:none" ><a href="#divClock" onclick="reSession();return false;" title="세션시간갱신"><span>00:00:00</span></a></li>
				<li id="global_login">
				<c:choose>
				<c:when test="${SITE_INFO.SSO_USE_FG =='Y' && (_host == 'onestop.pusan.ac.kr' || _host == 'e-onestop.pusan.ac.kr') }">
				<a href="#none" onclick="ssoOpen();return false;" onkeypress="this.onclick;" data-lang>
				</c:when>
				<c:otherwise>
				<a href="/main">
				</c:otherwise>
				</c:choose>
				로그인</a></li>
				<li><select id="langGcd" class="form-control" data-bind="selected:langGcd" title="홈페이지언어변경"></select></li>
			</ul>
		</div>
	</div>
	<div class="header-main">
		<div class="container">
			<div class="header-item">
				<h1 tabindex="0" class="heading" onclick="javascript:location.href='/main'">
					<img class="logo" src="/common/images/logo.svg" alt="">
					<div class="title-box">
						<span class="title">부산대학교</span> <span class="sub-title">학생지원시스템</span>
					</div>
				</h1>
			</div>

			<div class="header-item">
				<div class="menu-wrapper">
					<div class="menu-wrapper-inner" id="menu-wrapper-inner">

						<ul class="list link-list">
							<li><a href="https://pusan.ac.kr">부산대학교</a></li>
							<li><a href="#header" onclick="fn_logout();return false;" onkeypress="this.onclick;">로그아웃</a></li>
						</ul>
						<!-- 전체메뉴 -->
						<nav id="menu">
							<header>
								<h2 class="sec-title">전체메뉴</h2>
							</header>
							<div class="sec-body">
								<ul id="top_menu" class="menubar-main menubar" aria-label="전체메뉴">
								</ul>
							</div>
						</nav>
						<!-- /END 전체메뉴 -->
						<button class="close-btn" type="button">
							<img src="/common/images/close_white.svg" alt="메뉴 닫기">
						</button>
					</div>
				</div>
			</div>
			<div class="header-item">
				<ul class="list list-no-gutter">
					<li><a href="#popup" class="btn btn-icon menu-btn " title="사이트맵 레이어팝업 열기"><span class="sr-only">전체메뉴열기</span><img src="/common/images/menu.svg" alt="전체메뉴열기">
					</a></li>
				</ul>
			</div>

		</div>
	</div>



	<div class="header-backdrop"></div>
	<script type="text/javascript" language="javascript">
		$(document)
				.ready(
						function() {
							if (!gfn_com_isEmptyObject(scwin.loginUser)) {

								if (scwin.loginUser.userChgAuthYn == "Y"
										|| !gfn_com_isEmptyObject(scwin.loginUser.originId)) {
									if (!gfn_com_isEmptyObject(scwin.loginUser.originId)) {
										$(".list-with-separator")
												.prepend(
														"<li><a id='user_restore' href='javascript:void(0);'>사용자복귀</a></li>");
										$(".list-with-separator #user_restore")
												.bind("click", function() {
													fn_chgUserRestore();
												});
									} else {
										$(".list-with-separator")
												.prepend(
														"<li><a id='user_pop' href='javascript:void(0);'>사용자전환</a></li>");
										$(".list-with-separator #user_pop")
												.bind("click", function() {
													fn_chgUserPop();
												});
									}
								}

								fn_searchUserList(); // 사용자 계정정보 리스트 초기화

								//세션시간표시
								$('#divClock').show();
								loginCountDown();

								//로그아웃 버튼
								$("#global_login")
										.html(
												"<a href='#header' onclick='fn_logout();return false;' onkeypress='this.onclick;'>로그아웃</a>");
								$(".list-no-gutter")
										.prepend(
												'<li id="bookmark-btn" style="margin-top: -5px;"><a class="btn btn-icon bookmark-btn"  href="#bookmark-modal" data-toggle="modal" title="즐겨찾기 레이어팝업 열기"> <i class="bi bi-star"><span class="sr-only">즐겨찾기 창 열기</span></i></a></li>');

							}
						});
		//공지 팝업
		if ((gfn_str_parseNull(scwin.menuCd) == "" || gfn_str_parseNull(scwin.menuCd) == "000000000000000") 
				&& window.location.href.indexOf('totalSearch') < 0) { //메인 일때 && 검색페이지 아닐때
			fn_noticePop('0002');
		} else {
			if (gfn_str_parseNull(scwin.menuInfo) != ""
					&& scwin.menuInfo.POPUP_CNT > 0) {
				fn_noticePop('0001');
			}
		}
		/* 다국어 번역작업 전 주석처리
		*/
		$("#header #langGcd").dropDownList({
			dataSource : [ {
				label : "KOREAN",
				value : "0001"
			}, {
				label : "ENGLISH",
				value : "0002"
			}, {
				label : "CHINESE",
				value : "0003"
			}],
			dataTextField : "label",
			dataValueField : "value",
			dataBound : function(e) {
				$("#header #langGcd").val(scwin.i18n.locale);

				$("#header #langGcd").change(function() {
					$.this = $(this);
					confirm("다국어 변경 하시겠습니까?",function(_flag){
						if(_flag) {
							gfn_ajax_showLoadingImg(true, '다국어적용 변경 중..');
							gfn_ajax_request({
								url : "/common/lang/langChange",
								reqData : {
									langGcd : $.this.val()
								},
								success : function(data, responseData) {
									location.reload(true);
								}
							});
						}else{
							$("#header #langGcd").focus();
						}
					});
					
				});

			}
		});
		

		if (scwin.menuList != undefined && scwin.menuList != {}) {
			var list = scwin.menuList;
			//1Depth 메뉴 리스트 가져오기
			var menu1Depth = gfn_com_getMatchedJSON(list, 'UPPER_MENU_CD',
					'000000000000000');
			var menuItem = '';

			for ( var menu1 in menu1Depth) {
				if (menu1Depth[menu1].EXT_PERMIT_FG == 'Y') {
					menuItem += '<li >';
					
					if(menu1Depth[menu1].MENU_CONTENT_GCD =="0004"){
					    menuItem += '<a href="'+menu1Depth[menu1].MENU_VAR_INFO+'" target="_blank"  data-haspopup="true" data-expanded="false">'
						+ langMenuNm(menu1Depth[menu1]) + '</a>';    
					}else{
					    menuItem += '<a href="#'+menu1Depth[menu1].MENU_CD+'"  data-haspopup="true" data-expanded="false">'
						+ langMenuNm(menu1Depth[menu1]) + '</a>';
					}
					
					//2Depth 메뉴 리스트 가져오기
					var menu2Depth = gfn_com_getMatchedJSON(list,
							'UPPER_MENU_CD', menu1Depth[menu1].MENU_CD);
					if (menu2Depth.length > 0){
					menuItem += '<div class="menubox">';
					menuItem += '<div class="menubox-inner">';
					menuItem += '<div class="menu-deco">';
					menuItem += '<p class="menu-deco-title">'
							+ langMenuNm(menu1Depth[menu1]) + '</p>';
					menuItem += '<p class="menu-deco-text">PUSAN NATIONAL UNIVERSITY</p>';
					menuItem += '</div>';
					menuItem += '<ul id="menu" >';
					
					let i = 0;
					for ( var menu2 in menu2Depth) {

						//3Depth 메뉴 리스트 가져오기
						var menu3Depth = gfn_com_getMatchedJSON(list,
								'UPPER_MENU_CD', menu2Depth[menu2].MENU_CD);
						if (menu3Depth.length > 0
								|| menu2Depth[menu2].MENU_GCD == '0002') {
							menuItem += '<li >';
							if (menu2Depth[menu2].MENU_GCD == '0002') {
								if(i==0){
									
									
									if(menu2Depth[menu2].MENU_CONTENT_GCD =="0004"){
									    menuItem += '<a  id="'+menu2Depth[menu2].MENU_CD+'" href="'+menu2Depth[menu2].MENU_VAR_INFO+'" target="_blank" '
										+ ' data-haspopup="true" data-expanded="false">'
										+ langMenuNm(menu2Depth[menu2])
										+ '</a>';
									}else{
									    menuItem += '<a  id="'+menu1Depth[menu1].MENU_CD+'" href="javascript:selectMenu(\''
										+ menu2Depth[menu2].MENU_CD
										+ '\');" data-haspopup="true" data-expanded="false">'
										+ langMenuNm(menu2Depth[menu2])
										+ '</a>';
									}
									
								}else{
								    if(menu2Depth[menu2].MENU_CONTENT_GCD =="0004"){
										menuItem += '<a   href="'+menu2Depth[menu2].MENU_VAR_INFO+'" target="_blank"'
										+ ' data-haspopup="true" data-expanded="false">'
										+ langMenuNm(menu2Depth[menu2])
										+ '</a>';		
								    }else{
								        menuItem += '<a   href="javascript:selectMenu(\''
										+ menu2Depth[menu2].MENU_CD
										+ '\');" data-haspopup="true" data-expanded="false">'
										+ langMenuNm(menu2Depth[menu2])
										+ '</a>';	
								    }
								}
								
										
								
							} else {
								menuItem += '<a  id="'+menu1Depth[menu1].MENU_CD+'" href="#'+menu2Depth[menu2].MENU_CD+'" data-haspopup="true" data-expanded="false">'
										+ langMenuNm(menu2Depth[menu2])
										+ '</a>';
							}
							menuItem += '<ul id="menu" >';
						}

						for ( var menu3 in menu3Depth) {
							if (menu3Depth[menu3].MENU_GCD == '0002') {
							    if(menu3Depth[menu3].MENU_CONTENT_GCD =="0004"){
							        menuItem += '<li ><a  id="'+menu2Depth[menu2].MENU_CD+'" href="'+menu3Depth[menu3].MENU_VAR_INFO+'" target="_blank" >'
									+ langMenuNm(menu3Depth[menu3])
									+ '</a></li>';
							    }else{
							        menuItem += '<li ><a  id="'+menu2Depth[menu2].MENU_CD+'" href="javascript:selectMenu(\''
									+ menu3Depth[menu3].MENU_CD
									+ '\');">'
									+ langMenuNm(menu3Depth[menu3])
									+ '</a></li>';
							    }
								
							} else {
								menuItem += '<li ><a >'
										+ langMenuNm(menu3Depth[menu3])
										+ '</a></li>';
							}

						}
						if (menu3Depth.length > 0
								|| menu2Depth[menu2].MENU_GCD == '0002') {
							menuItem += '</ul>';
							menuItem += '</li>';
						}
						i++;
					}

					menuItem += '</ul></div></div>';
					}
					menuItem += '</li>';
				}
			}

			$('#top_menu').append(menuItem).trigger("create");
		}

		
	</script>
</header>

<!-- Bookmark Modal -->
<div class="modal fade" id="bookmark-modal" aria-hidden="true">
	<div class="modal-dialog " >
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" data-lang>자주 찾는메뉴</h5>
				<button type="button" tabindex="0" class="close" data-dismiss="modal" aria-label="Close" title="닫기">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body"></div>
		</div>
	</div>
</div>

<div class="mask novisible"></div>
<!-- alert 팝업 -->
<div class="layer-popup s400 alert_popup" draggable="true">
	<div class="pop_header">
		<img src="/common/images/ico_pop_monitor.png" alt=""/>알림 <a href="#" class="popup_close modal_alert_close" tabindex="0"><img src="/common/images/icon_pop_close.png" alt='레이어팝업닫기'></a>
	</div>
	<div class="pop_container">
		<div class="txt_dialog message"></div>
		<p class="foot_btn">
			<a href="#header" class="btn_n bg_red modal_alert_confirm">확인</a> <i class="linkEndAppend" tabindex="0"></i>
		</p>
	</div>
</div>

<!-- alert2 팝업 -->
<div class="layer-popup s400 alert2_popup" draggable="true">
	<div class="pop_header">
		<img src="/common/images/ico_pop_monitor.png" alt=""/>알림 
	</div>
	<div class="pop_container">
		<div class="txt_dialog message"></div>
		<p class="foot_btn">
			<a href="#header" class="btn_n bg_red modal_alert_confirm">확인</a> <i class="linkEndAppend" tabindex="0"></i>
		</p>
	</div>
</div>
<!-- confirm 팝업 -->
<div class="layer-popup s400 confirm_popup" draggable="true">
	<div class="pop_header">
		<img src="/common/images/ico_pop_monitor.png" alt=""/>확인 <a class="popup_close modal_alert_close" tabindex="0"><img src="/common/images/icon_pop_close.png" alt='레이어팝업닫기'></a>
	</div>
	<div class="pop_container">
		<div class="txt_dialog message"></div>
		<p class="foot_btn">
			<a href="#header" class="btn_n bg_red modal_alert_confirm">확인</a> <a href="#" class="btn_n bg_gray modal_alert_close">취소</a> <i class="linkEndAppend" tabindex="0"></i>
		</p>
	</div>
</div>
<script type="text/javascript" language="javascript">
	LayerPopup = {
		target : {
			alert : $(".layer-popup.alert_popup"),
			alert2 : $(".layer-popup.alert2_popup"),
			confirm : $(".layer-popup.confirm_popup"),
			progress : $(".layer-popup.status_progress_popup")
		},
		show : function(target, mode, msg) {
			if ($(".modal_bg").length == 0) {
				var cloneObj;
				if (mode == "alert")
					cloneObj = LayerPopup.target.alert.clone();
				if (mode == "alert2")
					cloneObj = LayerPopup.target.alert2.clone();
				if (mode == "confirm")
					cloneObj = LayerPopup.target.confirm.clone();
				if (mode == "progress")
					cloneObj = LayerPopup.target.progress.clone();

				target.empty().append(cloneObj.html());

				if (msg) {
					if (scwin.i18n.locale != '0001') {
						var _lang = scwin.i18n.list.find(function(e) {
							return e.KEY == "0000_000000000000000_" + msg
						});
						if (_lang != undefined) {
							if (scwin.i18n.locale == '0002') {
								msg = gfn_str_parseNullDefault(_lang.ENG_NM,
										msg);
							} else if (scwin.i18n.locale == '0003') {
								msg = gfn_str_parseNullDefault(_lang.CHN_NM,
										gfn_str_parseNullDefault(_lang.ENG_NM,
												msg));
							}
						}
					}
					target.find(".message").html(
							gfn_str_replaceAll(msg, '\n', '<br />'));
				}

				var oHeight = target.height();
				var wHeight = $(window).height();
				var oWidth = target.width();
				var zIndex = gfn_com_maxZindex(3);
				
				target.css({
					top : ((wHeight - oHeight) / 2) - 200,
					marginLeft : (-(oWidth / 2)),
					visibility : 'visible',
					zIndex : (parseInt(zIndex) + 3)
				});
				$('body').append(
						'<div class="modal_bg" style="z-index:'
								+ (parseInt(zIndex) + 2) + '"></div>');

				target.draggable();
				/* 
				target.attr("tabindex","0");
				target.find(".pop_container").attr("tabindex","0").focus();
				target.focus(function(){
					target.find(".popup_close").focus();
				});
				 */
				$("#bookmark-modal").removeAttr("tabindex");
				target.find(".modal_alert_confirm").focus();
				target.find(".linkEndAppend").focus(function() {
					target.find(".popup_close").focus();
				});

				$('.modal_alert_close', target).click(function(e) {
					e.preventDefault();
					if($("#bookmark-modal").hasClass("show")){
					    $("#bookmark-modal").attr("tabindex","0");    
					}
					$('.modal_bg:last').remove();
					$(this).parents('.layer-popup').css({
						top : '-9999px',
						visibility : 'hidden'
					});
				});
			}
		},
		alert : function(msg, callback) {
			LayerPopup.show(LayerPopup.target.alert, "alert", msg);

			if (typeof callback != 'undefined' && callback) {
				$('.modal_alert_confirm', LayerPopup.target.alert).click(
						function(e) {
							e.preventDefault();
							if($("#bookmark-modal").hasClass("show")){
							    $("#bookmark-modal").attr("tabindex","0");    
							}
							$('.modal_bg:last').remove();
							$(this).parents('.layer-popup').css({
								top : '-9999px',
								visibility : 'hidden'
							});
							if (typeof callback == 'function') {
								callback();
							} else if (typeof callback == 'object'
									&& $(callback).length > 0) {
								fn_focusScroll(callback);
								fn_focusScroll(callback);
							}
							$(this).unbind("click");
						});
			} else {
				$('.modal_alert_confirm', LayerPopup.target.alert).click(
						function(e) {
							e.preventDefault();
							if($("#bookmark-modal").hasClass("show")){
							    $("#bookmark-modal").attr("tabindex","0");    
							}
							$('.modal_bg:last').remove();
							$(this).parents('.layer-popup').css({
								top : '-9999px',
								visibility : 'hidden'
							});
							alert(objTarget)
							if (objTarget.length > 0) {
								if($("#"+objTarget.attr("id")).length ==0){
									$(".viewpage .share-btn:eq(0)").focus();
								}else{
									objTarget.focus();
								}
							} else if ($("#btnApply").length > 0) {
								$("#btnApply").focus();
							} else {
								$(".viewpage .share-btn:eq(0)").focus();
							}

						});
			}
		},
		alert2 : function(msg, callback) {
			LayerPopup.show(LayerPopup.target.alert2, "alert2", msg);

			if (typeof callback != 'undefined' && callback) {
				$('.modal_alert_confirm', LayerPopup.target.alert2).click(
						function(e) {
							e.preventDefault();
							$('.modal_bg:last').remove();
							$(this).parents('.layer-popup').css({
								top : '-9999px',
								visibility : 'hidden'
							});
							if (typeof callback == 'function') {
								callback();
							} else if (typeof callback == 'object'
									&& $(callback).length > 0) {
								fn_focusScroll(callback);
							}
							$(this).unbind("click");
						});
			} else {
				$('.modal_alert_confirm', LayerPopup.target.alert2).click(
						function(e) {
							e.preventDefault();
							$('.modal_bg:last').remove();
							$(this).parents('.layer-popup').css({
								top : '-9999px',
								visibility : 'hidden'
							});
							if (objTarget.length > 0) {
								objTarget.focus();
							} else if ($("#btnApply").length > 0) {
								$("#btnApply").focus();
							} else {
								$(".viewpage #sec-title").focus();
							}

						});
			}
		},
		confirm : function(msg, conf, canc, callback) {
			if (conf != null && conf != undefined) {
				$(".confirm_popup .foot_btn .modal_alert_confirm").text(conf);
			} else {
				$(".confirm_popup .foot_btn .modal_alert_confirm").text("확인");
			}
			if (canc != null && canc != undefined) {
				$(".confirm_popup .foot_btn .modal_alert_close").text(canc);
			} else {
				$(".confirm_popup .foot_btn .modal_alert_close").text("취소");
			}

			LayerPopup.show(LayerPopup.target.confirm, "confirm", msg);

			$('.modal_alert_confirm', LayerPopup.target.confirm).click(
					function(e) {
						e.preventDefault();
						$('.modal_bg:last').remove();
						$(this).parents('.layer-popup').css({
							top : '-9999px',
							visibility : 'hidden'
						});

						var suffixStr = "";
						let pop_index = $("div[id^='popupWrap']").length +1;
						for(var idx = 1; idx < pop_index; idx++) {
							suffixStr += "_";
						}
						let target_href = $(this).closest(".foot_btn").find(".modal_alert_close").attr("href");
						setTimeout(function() {
			    			$("#popupWrap"+suffixStr+" .pop_close").attr("href",target_href);
				    		$("#popupWrap"+suffixStr+" .pop_close").on("click",function (e){
				    			$(target_href).focus();
				        	});
			    		}, 300);
						
						
						if (typeof callback == 'function') {
							callback(true);
						}
						$(this).unbind("click");
					});

			$('.modal_alert_close', LayerPopup.target.confirm).click(
					function(e) {
						if (typeof callback == 'function') {
							callback(false);
						}

						$(this).unbind("click");
					});
		},
		progress : function(msg, callback) {
			LayerPopup.show(LayerPopup.target.progress, "progress", msg);

			if (typeof callback != 'undefined' && callback) {
				$('.modal_progress_close', LayerPopup.target.progress).click(
						function(e) {
							e.preventDefault();
							$('.modal_bg:last-child').remove();
							$(this).parents('.layer-popup').css({
								top : '-9999px',
								visibility : 'hidden'
							});

							if (typeof callback == 'function') {
								callback();
							} else {
								if (callback) {
									if (callback.indexOf("(") == -1) {
										(new Function(callback + "()"))();
									} else {
										(new Function(callback))();
									}
								} else {
									if (typeof (confirmAfter) == "function") {
										confirmAfter();
									}
								}
							}

							$(this).unbind("click");
						});
			} else {
				$('.modal_progress_close', LayerPopup.target.progress).click(
						function(e) {
							e.preventDefault();
							$('.modal_bg:last').remove();
							$(this).parents('.layer-popup').css({
								top : '-9999px',
								visibility : 'hidden'
							});
						});
			}
		},
		// popup close
		closeProgress : function() {
			$('.modal_progress_close', LayerPopup.target.progress).click();
		}
	}
</script>