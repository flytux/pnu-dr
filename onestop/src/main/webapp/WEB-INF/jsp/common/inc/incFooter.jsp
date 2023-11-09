<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<footer id="footer">
	<div class="container">
		<div class="row justify-content-center justify-content-lg-start">
			<div class="col-lg-6 mb-2">
				<ul class="list link-list">
					<li><a href="https://www.pusan.ac.kr" target="_blank" title="새창 바로가기">부산대학교 홈페이지</a></li>
					<li><a class="focus" href="https://www.pusan.ac.kr/kor/CMS/Board/Board.do?mCode=MN186" target="_blank" title="새창 바로가기">개인정보처리방침</a></li>
					<li><a href="#popup" onclick="fn_Sitemap();return false;" onkeypress="this.onclick" title="레이어팝업 열기">사이트맵</a></li>
					<li><a href="/page?menuCD=000000000000414" title="서식 및 안내 파일 메뉴 이동">서식 및 안내 파일</a></li>
				</ul>
			</div>
			<div class="col-lg-6 text-lg-right">
				<a title="새창" href="http://www.wa.or.kr/board/list.asp?BoardID=0006" target="_blank">
					<img alt="(사)한국장애인단체총연합회 한국웹접근성인증평가원 웹 접근성
					우수사이트 인증마크(WA인증마크)" src="/common/images/footer-wa.png" width="80"
					height="55" />
				</a>				
				
				<select class="family-site" id="family-site" title="패밀리사이트">
					<option value="">:::: PNU LINK ::::</option>
					<option value="http://ctl.pusan.ac.kr">교수학습지원센터</option>
					<option value="http://culedu.pusan.ac.kr">교양교육원</option>
					<option value="http://cea.pusan.ac.kr">교육인증원</option>
					<option value="https://lei.pusan.ac.kr">언어교육원</option>
					<option value="https://dorm.pusan.ac.kr">대학생활원</option>
					<option value="https://lib.pusan.ac.kr">도서관</option>
					<option value="http://hrd.pusan.ac.kr">취업전략과</option>
					<option value="http://health.pusan.ac.kr">보건진료소</option>
					<option value="http://uitc.pusan.ac.kr">정보화본부</option>
					<option value="">----------------------</option>
					<!-- <option value="http://umypage.pusan.ac.kr/computer/">정보기술활용</option> -->
					<option value="https://cloudpc.pusan.ac.kr">클라우드실습실</option>
				</select>
				<button type="button" class="btn btn-modify2 mb-2" title="새창열림" onclick="goFamilySite();">이동</button>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<small class="copyright">Copyright 2022. Pusan National University All rights reserved.</small>
			</div>
		</div>
	</div>
</footer>
<script type="text/javascript">
	if (!gfn_com_isEmptyObject(scwin.menuInfo)) {
		var header_item1 = $(".container .col-main .sec-1 .header-item").eq(0);
		if (gfn_com_parseNull(header_item1) != "") {
			var sec_title_tag = '<h2 class="sec-title" id="sec-title" role="heading">'
					+ scwin.menuInfo.MENU_KOR_NM + '</h2>';
			header_item1.html(sec_title_tag);
		}

		var header_item2 = $(".container .col-main .sec-1 .header-item").eq(1);
		if (gfn_com_parseNull(header_item2) != "") {
			var sec_header_item_tag = '';
			sec_header_item_tag += '<ul class="list list-narrow-gutter">';			
			sec_header_item_tag += '	<li><button class="btn btn-icon share-btn" id="plus_icon" type="button" onclick="return plusPage();">';
			sec_header_item_tag += '			<img alt="화면 확대" src="/common/images/plus.svg" />';
			sec_header_item_tag += '		</button></li>';
			sec_header_item_tag += '	<li><button class="btn btn-icon share-btn" type="button" onclick="return minusPage();">';
			sec_header_item_tag += '			<img alt="화면 축소" src="/common/images/minus.svg" />';
			sec_header_item_tag += '		</button></li>';
			sec_header_item_tag += '	<li><button class="btn btn-icon print-btn" type="button" onclick="return printPage();">';
			sec_header_item_tag += '			<img alt="현재 페이지 프린트" src="/common/images/print.svg" style="width:22px" />';
			sec_header_item_tag += '		</button></li>';
			sec_header_item_tag += '	<li><button class="btn btn-icon fav-btn"  id="fav_'+scwin.menuCd+'" type="button">';
			sec_header_item_tag += '			<img src="/common/images/bookmark.svg" style="width:23px" alt="현재 페이지 즐겨찾기 추가">';
			sec_header_item_tag += '		</button></li>';
			if(!gfn_com_isEmptyObject(scwin.loginUser) && scwin.menuInfo.MENU_CONTENT_GCD != '0003' && scwin.menuInfo.MENU_CONTENT_GCD != '0002' && scwin.loginUser.userId != 'tst601200'){ //2023-09-15 접금성심사용 id 이면 권한 없음 
			sec_header_item_tag += '	<li><button class="btn btn-icon manual-btn"  id="" type="button" onclick="return gfn_onlineManualJspPop();">';
			sec_header_item_tag += '			<img src="/common/images/notification.svg" style="width:23px" alt="온라인매뉴얼 열기">';
			sec_header_item_tag += '		</button></li>';
			}
			sec_header_item_tag += '</ul>';
			header_item2.html(sec_header_item_tag);
		}
		if (!gfn_com_isEmptyObject(scwin.loginUser)) {
			
			var options = {}; 
	        options.dataBound = function(e) {
				bindFavBtnEvent()
			};
			fn_SelectBookMark(options);
		}

	}

	//제목 옆에 있는 즐겨찾기 아이콘 토글
	function bindFavBtnEvent() {
		var $favBtns = $('.header-item .list-narrow-gutter .fav-btn');
		//현재 선택된 화면이 즐겨찾기가 있는지 검사를 하여 있으면 즐겨찾기 체크    
		if (scwin.favList.length > 0) {
			$favBtns.each(function() {
				var active_fav = false;
				$.each(scwin.favList, function(idx, obj) {
					if (obj.MENU_CD == scwin.menuCd) {
						active_fav = true;
					}
				});

				if (active_fav) {
					btnLabel = '현재 페이지 즐겨찾기 취소';
					$favBtns.addClass('active');
					$favBtns.find("img").attr("alt", btnLabel);
					$favBtns.find("img").attr('src',
							'/common/images/bookmark_on.svg');
				}
			});
		}
		if ($favBtns.length) {
			$favBtns.off('click');
			$favBtns.on('click', function() {
				var rowStatus = 'R';
				if ($(this).is('.active')) {
					rowStatus = 'D';
				} else {
					rowStatus = 'C';
				}
				fn_ExcuteBookMark(rowStatus);

			});
		}
	}

	//즐겨찾기 추가 삭제 함수 
	function fn_ExcuteBookMark(rowStatus) {

		var options = {};
		options.url = '/core/main/excuteBookMark';
		options.reqData = {
			'MENU_CD' : scwin.menuCd,
			'rowStatus' : rowStatus
		};

		options.success = function(data, responseData) {
	        options.reset = "Y";
			fn_SelectBookMark(options);
			var $favBtns = $('.header-item .list-narrow-gutter .fav-btn');
			var btnLabel = null;
			var rowStatus = 'R';
			if ($favBtns.is('.active')) {
				btnLabel = '현재 페이지 즐겨찾기 추가';
				$favBtns.removeClass('active');
				$favBtns.find("img").attr("alt", btnLabel);
				$favBtns.find("img").attr('src', '/common/images/bookmark.svg');
			} else {
				btnLabel = '현재 페이지 즐겨찾기 취소';
				$favBtns.addClass('active');
				$favBtns.find("img").attr("alt", btnLabel);
				$favBtns.find("img").attr('src',
						'/common/images/bookmark_on.svg');

			}
		};
		//options.async = false;                
		gfn_ajax_request(options);
	}

	window.onload = function() {
		/** s: 접근성 js**/
		// 팝업 오픈 버튼을 클릭하면 클릭한 초점을 가지고 있는다.
		setTimeout(function() {
			loadAccessibility();
	
			accordionLabelChg();
	
			$(".fixed-table-container").find(".fixed-table-header table").prepend("<caption>"+$(".fixed-table-container").find(".fixed-table-body table").find("caption").html()+"</caption>")
			
			
			if($("#content_tabs").length >0){
			    tabFocusAccessibilityCtl('content_tabs');
		    }
	
			if($("#download_target").length >0){
			    tabFocusAccessibilityCtl('download_target');
		    }
			
			//스킵네비게이션 링크 수정
			/*
			var keyword = gfn_str_parseNull("${keyword}");
			if((gfn_str_parseNull(scwin.menuCd) == "000000000000000" || gfn_str_parseNull(scwin.menuCd) == "" ) && keyword == '' ){
			    if( gfn_str_parseNull(scwin.loginUser.userId) != "") { //로그인후
					$("#contSkipLink").attr("href","#webMail");
			    }else{
					$("#contSkipLink").attr("href","#userID");
				}  
			}else if(keyword != ''){
			    $("#contSkipLink").attr("href","#sch_keyword");
			}else if(gfn_str_parseNull(scwin.menuCd)  != "000000000000000" && gfn_str_parseNull(scwin.menuCd) !="" ){
			    $("#contSkipLink").attr("href","#plus_icon");
			}
			*/
			 $.each($(".accordion"),function(){
			     $.each($(this).find(".card-header"),function(){
			         $(this).find("button").removeAttr("data-controls");
			         $(this).find("button").removeAttr("aria-controls");
			         /*
			     	$(this).prepend('<div class="head-text">'+$(this).find("button").text()+'</div>');
			     	if($(this).closest(".accordion").attr("id") == "board-faq"){
			     		$(this).find(".head-text").css("margin-left","30px"); 
			     		$(this).prepend('<div class="q-icon"> </div>');
			     	}
			     	
			     	$(this).find("button").text("");
			     	*/
			     });
			     
			 });
			 
			 $(".fixed-table-header caption").remove();
			 if($(".fixed-table-header table").html() ==""){
			     $(".fixed-table-header table").remove();
			 }
			
		}, 1000);
		/** e: 접근성 js**/
	}

	function goFamilySite() {
		var url = $("#family-site").val();
		if(!url){
		    alert("이동할 사이트를 선택해주세요.",$("#family-site"));
		    return false;
		}
		window.open(url);
		
	}
	
	if(gfn_str_parseNull(scwin.menuInfo.AUTH_CD) == "4" && (gfn_str_parseNull(scwin.menuInfo.MENU_CONTENT_GCD) != "0003" && gfn_str_parseNull(scwin.menuInfo.MENU_CONTENT_GCD) != "0002" && gfn_str_parseNull(scwin.menuInfo.MENU_CONTENT_GCD) != "0008" )) {   
		setTimeout(function() {
			$('body').append('<div class="w_bg" style="z-index:1;left:'+($('.container-sub .col-main').offset().left)+'px;top:'+($('.container-sub .col-main').offset().top)+'px;width:'+($('.container-sub .col-main').width())+'px;height:'+($('.container-sub .col-main').height())+'px;"></div>');
	    	alert('교직원으로 로그인한 경우 해당 페이지 이용에 제한이 있습니다.');
        },350);
    }
</script>