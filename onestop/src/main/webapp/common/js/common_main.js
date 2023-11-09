
	$('#ost_tabs1 #tablist.owl-carousel').owlCarousel({
			loop : false,
			autoWidth : true,
			nav : false,
			dots : false,
		});
	$("#ost_tabs1 .owl-prev").attr("tabindex","-1");
	$("#ost_tabs1 .owl-next").attr("tabindex","-1");	
		
		$("#ost_tabs1 #tablist a").click(function() {
			$("#ost_tabs1 #tablist a").not($(this)).removeClass("active");
			$("#ost_tabs1 #tablist a").not($(this)).attr("data-selected", false);
		});
		
		 $('.carousel-wrapper .prev-btn').on('click', function() {
			    $(this).closest('.carousel-wrapper').find('.owl-carousel').trigger('prev.owl.carousel');
			  });

			  $('.carousel-wrapper .next-btn').on('click', function() {
			    $(this).closest('.carousel-wrapper').find('.owl-carousel').trigger('next.owl.carousel');
			  });

		
		/* 퀵메뉴 */
		var $owlQuick = $('.quick-carousel');
		if ($owlQuick.length) {
		  $owlQuick.owlCarousel({
		    autoplay: true,
		    autoplayHoverPause: true,
		    autoplayTimeout: 5000,
		    dots: true,
		    items: 2,
		    loop: true,
		    responsive: {
		      400: {
		        items: 3
		      },
		      576: {
		        items: 4
		      },
		      768: {
		        items: 5
		      },
		      992: {
		        items: 6
		      },
		      1200: {
		        items: 7
		      }
		    }
		  });
			$owlQuick.on("changed.owl.carousel",function(e){
				
				setTimeout(function() {
					$.each($('.quick-carousel .owl-item'),function(){
					
						if($(this).attr("class").indexOf("active") < 0){
							$(this).find("a").attr("tabindex","-1");
						}else{
							$(this).find("a").attr("tabindex","0");
						}
					});
				}, 500);
				
			});
		}
		
		

		/* sns */
		  var $owlHotFocus = $('.hot-focus-carousel');
		  if ($owlHotFocus.length) {
		    $owlHotFocus.owlCarousel({
		      autoplay: true,
		      autoplayHoverPause: true,
		      autoplayTimeout: 5000,
		      dots: true,
		      items: 1,
		      loop: true,
		      responsive: {
		        576: {
		          items: 2,
		          margin: 15
		        },
		        768: {
		          items: 3,
		          margin: 15
		        },
		        1200: {
		          items: 5,
		          margin: 20
		        }
		      }
		    });
		    addPlayPauseBtn($owlHotFocus);
		  }

function openSchPop(){
		var reqData ={};
		gfn_bbs_modalPopup({
        	width : 700,
            height : 650,
            index : 5,
            target : null,            
            title : "학사일정 ",
            include : '/core/main/selectScheduleListPop.do',
			reqData : reqData
        });
}

function fn_openChangePopup(_option) {
		gfn_bbs_changeModalPopup({
        	width : 1000,
            height : 600,
            index : _option.index,
            target : null,                                
            title : "게시글 "+_option.headertitle,
            include : _option.url,
            reqData : _option.reqData,
            dataBound : _option.dataBound
        });
	}

function openBbsDetailPop(menu_cd,posting_seq_no, attach_file_grp_cd){
		/*var reqData ={};
		reqData.SESSION_MENU_CD = menu_cd;
		reqData.POSTING_SEQ_NO = posting_seq_no;
		reqData.ATTACH_FILE_GRP_CD = attach_file_grp_cd;
		reqData.mode = "DETAIL";
		fn_openPopup({
			width : 1000,
            height : 650,
            index : 5,
			url : '/bbs/detailPop.do',
			headertitle : '상세',
			reqData : reqData
		});*/
		
		//2023-09-15 접금성심사용 id 이면 권한 없음 
		if(scwin.loginUser.userId =="tst601200"){
			alert("조회 권한이 없습니다.")
		}else{
			location.href="/page?menuCD="+menu_cd+"&mode=DETAIL&seq="+posting_seq_no;
		}
		
	}
	
	function openPassChkPop(menu_cd,bbs_type_gcd,bbs_type_seq_no, posting_seq_no){
		/*var reqData ={};
		reqData.SESSION_MENU_CD = menu_cd;
		reqData.BBS_TYPE_GCD = bbs_type_gcd;
		reqData.BBS_TYPE_SEQ_NO = bbs_type_seq_no;
		reqData.POSTING_SEQ_NO = posting_seq_no;
		fn_openPopup({
			width : 420,
            height : 150,
            index : 1,
            overflow_y : "off",
			url : '/bbs/passChkPop.do',
			headertitle : '확인번호',
			reqData : reqData
		});*/
		location.href="/page?menuCD="+menu_cd+"&mode=DETAIL&seq="+posting_seq_no;
	}
	
	//팝업띄우기
	function fn_openPopup(_option) {
		gfn_bbs_modalPopup({
        	width : _option.width,
            height : _option.height,
            index : _option.index,
            target : null,            
            overflow_y: _option.overflow_y,
            title : "게시글 "+_option.headertitle,
            include : _option.url, 
            reqData : _option.reqData
        });
	}	
	
	
	//대학공지
	function f_pnuNotice(bbsPageSize){
		gfn_ajax_request({
			url : "/core/main/selectPnuNoticeList",
			reqData : {
				bbsPageSize : bbsPageSize
			},
			success : function(data, responseData) {
				
				
				var pnuNoticeHtml = "";
				pnuNoticeHtml+='	<ul class="board-list">';
				$.each(responseData.PnuNoticeList,function(i,o){
					pnuNoticeHtml+='		<li class="board-item">';
					pnuNoticeHtml+='					<a class="board-link" href="#none" onclick="fnPnuNoticeView(\''+o.BOARD_SEQ+'\');return false;" onkeypress="this.onclick" title="새창열기">';
					pnuNoticeHtml+='					<div class="item-title">';
					pnuNoticeHtml+='						<span class="board-title">'+o.TITLE+'</span>';
					pnuNoticeHtml+='					</div>';
					pnuNoticeHtml+='<div class="item-writer" ><span>'+o.MEMBER_NAME+'</span></div>';
					pnuNoticeHtml+='<time datetime="'+o.REG_DATE2+'" class="item-date">'+o.REG_DATE2+'</time>';
					pnuNoticeHtml+='				</a>';
					pnuNoticeHtml+='		</li>';
				});
				pnuNoticeHtml+='	<a class="more-link" href="#none" onclick="fnGoMoreNotice();return false;" onkeypress="this.onclick" title="새창열기"><span class="sr-only">대학공지 바로가기</span></a>';
				pnuNoticeHtml+='	</ul>';
			
			$("#board-tabpanel-2").html(pnuNoticeHtml);
			}
		});
	}
	
	function f_mainBbsList(bbsNo,menuCd, bbsPageSize){
		gfn_ajax_request({
			url : "/core/main/selectMainBbsList",
			reqData : {
				menuCd : menuCd,
				bbsPageSize : bbsPageSize
			},
			success : function(data, responseData) {
				const bbsMgrAuth = responseData.bbsMgrAuth;
				
				var bbsHtml = "";
				
				
				if(responseData.bbsDataList.length >0){
				
					bbsHtml+='	<ul class="board-list">';
					$.each(responseData.bbsDataList,function(i,o){
						bbsHtml+='		<li class="board-item">';
						if(o.LEVEL == 0){
							if(o.SECRET_FG == "Y"){
								if(bbsMgrAuth.SECRET_POSTING_SEARCH_AUTH_FG =="Y" || o.INS_USER_ID.trim() == scwin.loginUser.userId){
									bbsHtml+='<a class="board-link"  href="#none" onclick="openBbsDetailPop(\''+bbsMgrAuth.MENU_CD+'\',\''+o.POSTING_SEQ_NO+'\',\''+o.ATTACH_FILE_GRP_CD+'\');return false;" onkeypress="this.onclick">';									
								}else{
									bbsHtml+='<a class="board-link"  href="#none" onclick="openPassChkPop(\''+bbsMgrAuth.MENU_CD+'\',\''+o.BBS_TYPE_GCD+'\',\''+o.BBS_TYPE_SEQ_NO+'\',\''+o.POSTING_SEQ_NO+'\');return false;" onkeypress="this.onclick">';
								}
							}else{
								bbsHtml+='<a class="board-link"  href="#none" onclick="openBbsDetailPop(\''+bbsMgrAuth.MENU_CD+'\',\''+o.POSTING_SEQ_NO+'\',\''+o.ATTACH_FILE_GRP_CD+'\');return false;" onkeypress="this.onclick">';
							}
							
							bbsHtml+='					<div class="item-title">';
							if(o.NOTICE_FG =="Y" && o.RN == '0'){
								bbsHtml+='<span class="noti" data-lang>공지</span>';
							}
							bbsHtml+='<span class="board-title">'+((o.CATE_TYPE_NM !="")?'['+o.CATE_TYPE_NM+']':'' )+""+o.TITLE_CONTENT+' ';
							if(o.ATTACH_FILE_GRP_CD !=''){
								bbsHtml+='<img src="/common/images_ses/icon-file.gif" alt="첨부파일있음"/>';
							}
							if(o.SECRET_FG == 'Y'){
								bbsHtml+='<i class="bi bi-lock"><span class="sr-only">비밀글</span></i>';
							}
							bbsHtml+='</span>';
							if(o.DATE_CNT <3){
								bbsHtml+='<span class="icon-new">NEW</span>';
							}
							bbsHtml+='					</div>';
							bbsHtml+='<div class="item-writer" ><span>'+o.WRITEOUT_USER_NM+'</span></div>';
							bbsHtml+='<time datetime="'+o.INS_DT.substring(0,10)+'" class="item-date">'+o.INS_DT.substring(0,10)+'</time>';
							bbsHtml+='				</a>';
							
						}else{
							if(bbsMgrAuth.REPLY_SEARCH_AUTH_FG =="N" && o.ORIGIN_POSTING_INS_USER_ID != scwin.loginUser.userId){
								bbsHtml+='<a class="board-link"  href="#none" onclick="alert(\'조회 권한이 없습니다.\');return false;" onkeypress="this.onclick">';									
							}else{
								bbsHtml+='<a class="board-link"  href="#none" onclick="openBbsDetailPop(\''+bbsMgrAuth.MENU_CD+'\',\''+o.POSTING_SEQ_NO+'\',\''+o.ATTACH_FILE_GRP_CD+'\')" ;return false;" onkeypress="this.onclick">';
							}

							
							bbsHtml+='					<div class="item-title" style="padding-left: '+o.LEVEL*2+'0px;">';
							if(o.NOTICE_FG =="Y" && o.RN == '0'){
								bbsHtml+='<span class="noti" data-lang>공지</span>';
							}
							bbsHtml+='<span class="board-title">┗ Re :'+((o.CATE_TYPE_NM !="")?'['+o.CATE_TYPE_NM+']':'' )+""+o.TITLE_CONTENT+' ';
							if(o.ATTACH_FILE_GRP_CD !=''){
								bbsHtml+='<img src="/common/images_ses/icon-file.gif" alt="첨부파일있음"/>';
							}
							if(o.SECRET_FG == 'Y'){
								bbsHtml+='<i class="bi bi-lock"><span class="sr-only">비밀글</span></i>';
							}
							bbsHtml+='</span>';
							if(o.DATE_CNT <3){
								bbsHtml+='<span class="icon-new">NEW</span>';
							}
							bbsHtml+='					</div>';
							bbsHtml+='<div class="item-writer" ><span>'+o.WRITEOUT_USER_NM+'</span></div>';
							bbsHtml+='<time datetime="'+o.INS_DT.substring(0,10)+'" class="item-date">'+o.INS_DT.substring(0,10)+'</time>';
							bbsHtml+='				</a>';
						}
						bbsHtml+='		</li>';
					});
					bbsHtml+='	</ul>';
				}else{
					bbsHtml+='<p class="non-info mb" data-lang>조회된 게시물이 없습니다.</p>';
				}
				
				let boardNm = "";
				if(bbsNo =="4"){
					boardNm = "장학공지";
				}else if(bbsNo =="5"){
					boardNm = "Q&amp;A";
				}else if(bbsNo =="6"){
					boardNm = "FAQ";
				}
				bbsHtml+='	<a class="more-link"  href="#none" onclick="selectMenu(\''+menuCd+'\');return false;" onkeypress="this.onclick"  ><span class="sr-only">'+boardNm+' 바로가기</span></a>';
			$("#board-tabpanel-"+bbsNo).html(bbsHtml);
			onPopupOpenerClickFocus();
			}
		});
	}
	
	//대학공지 더보기 윈도우팝업
	function fnGoMoreNotice(){
		var width = 720;
		var height = 600;
		var linkURL = "//www.pusan.ac.kr/kor/CMS/Board/PopupBoard.do?mgr_seq=3&mode=list";
		window.open(
				linkURL,
				"PNUNotice",
				"status=no,scrollbars=yes,resizable=no,toolbar=no,width=" + width + ",height=" + height + ",top=" + ((window.screen.height - height) / 2) + ",left=" + ((window.screen.width - width) / 2));
	}
	
	//대학공지 상세보기 윈도우팝업
	function fnPnuNoticeView(boardNo) {
		var width = 720;
		var height = 600;
		var strURL = '//www.pusan.ac.kr/kor/CMS/Board/PopupBoard.do?mgr_seq=3&mode=view&board_seq=' + boardNo;
		calcWindowLocation(width, height);
		window.open(strURL, "공지사항및학교소식목록보기","status=no,scrollbars=yes,resizable=no,toolbar=no,width=" + width + ",height=" + height + ",top=" + theTop + ",left=" + theLeft);
	}
	
	function calcWindowLocation(nWidth, nHeight) {
		theLeft = (window.screen.width / 2) - (nWidth / 2);
		theTop = (window.screen.height / 2) - (nHeight / 2);
	}
	
	
	function fn_openProPlanReport(SCH_SYEAR,SCH_TERM_GCD,PROF_NO,SUBJ_NO,CLASS_NO,EDUCERT_GCD) {
		var options ={};
        
		var objParam = {};
    	if(EDUCERT_GCD == ""){ //교육인증 구분코드 없을때./////////////////////////////////////////////////////////////////////////////
        	if(scwin.i18n.locale == "0001") { //국문
                options.rptName = "/ses/cls/sylmng/sylprint/SylPrint_001.crf";
            } else {//영문
                options.rptName = "/ses/cls/sylmng/sylprint/SylPrint_002.crf";
            }	
		    		objParam.bind = [{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["MST"
		                ,SCH_SYEAR
		                ,SCH_TERM_GCD
		                ,PROF_NO
		                ,SUBJ_NO
		                ,CLASS_NO
		                ,scwin.i18n.locale
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
						]
		        },{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["DTL"
		                ,SCH_SYEAR
		                ,SCH_TERM_GCD
		                ,PROF_NO
		                ,SUBJ_NO
		                ,CLASS_NO
		                ,scwin.i18n.locale
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,EDUCERT_GCD
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
						]
		        },{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["DTL2"
		                ,SCH_SYEAR
		                ,SCH_TERM_GCD
		                ,PROF_NO
		                ,SUBJ_NO
		                ,CLASS_NO
		                ,scwin.i18n.locale
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
						]
		        },{
		                db : "LECTURE",
		                proc : "CLS_교수계획표_교수계획표출력_출력",
		                params : ["DTL1"
		                ,SCH_SYEAR
		                ,SCH_TERM_GCD
		                ,PROF_NO
		                ,SUBJ_NO
		                ,CLASS_NO
		                ,scwin.i18n.locale
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
		                ,""
						]
		        }];
        
        }else{////////교육인증 구분코드 존재할때./////////////////////////////////////////////////
        	if(scwin.i18n.locale == "0001"){
        		options.rptName = "/ses/ae/sylmng/sylprint/SylPrint"+EDUCERT_GCD+"_001.crf";
        		objParam.bind = [{
	                db : "EDUCERT",
	                proc : "AE_교수계획표관리_통합_교수계획표_출력",
	                params : [
	                SCH_SYEAR
	                ,SCH_TERM_GCD
	                ,SUBJ_NO
	                ,CLASS_NO
	                ,PROF_NO
	                ,scwin.i18n.locale
	                ,EDUCERT_GCD
	                ]
	       		 }];
        	}else{
        		options.rptName = "/ses/ae/sylmng/sylprint/SylPrint"+EDUCERT_GCD+"_002.crf";
        		objParam.bind = [{
	                db : "EDUCERT",
	                proc : "AE_교수계획표관리_통합_교수계획표_출력",
	                params : [
	                SCH_SYEAR
	                ,SCH_TERM_GCD
	                ,SUBJ_NO
	                ,CLASS_NO
	                ,PROF_NO
	                ,scwin.i18n.locale
	                ,EDUCERT_GCD
	                ]
	       		 }];
        	}
		}
        	
    /*    //파라메터 설정
        //var objParam = dma_SearchParam.getJSON();
        var objParam = {};
        objParam.SCH_CURC_APPLY_SYEAR 							= SCH_SYEAR;  //기준년도
        objParam.SCH_TERM_GCD                       = SCH_TERM_GCD;  //기준월
        //objParam.SCH_PROF_NO                        = PROF_NO;
        objParam.SCH_SUBJ_NO                        = SUBJ_NO;
        objParam.SCH_CLASS_NO                        = CLASS_NO;
		objParam.SCH_PRINT_GCD				= '4';
	    objParam.SCH_LANG_GCD                        = scwin.i18n.locale;


		objParam.bind = [{
                        db : "LECTURE",
                        proc : "CLS_교수계획표_교수계획표출력_출력",
                        params : ["MST"
                        ,SCH_SYEAR
                        ,SCH_TERM_GCD
                        ,PROF_NO
                        ,SUBJ_NO
                        ,""
                        ,scwin.i18n.locale
                        ,scwin.loginUser.collGradGcd
                        ,scwin.loginUser.gradGcd
                        ,scwin.loginUser.collCd
                        ,scwin.loginUser.deptCd
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,scwin.loginUser.userId
                        ,scwin.loginUser.nm
                        ,scwin.loginUser.deptCd
                        ,scwin.menuInfo.SEARCH_SCOPE_GCD
						]
                },{
                        db : "LECTURE",
                        proc : "CLS_교수계획표_교수계획표출력_출력",
                        params : ["DTL"
                        ,SCH_SYEAR
                        ,SCH_TERM_GCD
                        ,PROF_NO
                        ,SUBJ_NO
                        ,CLASS_NO
                        ,scwin.i18n.locale
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""//"{dataset.EDUCERT_GCD}"
                        ,""
                        ,scwin.loginUser.userId
                        ,scwin.loginUser.nm
                        ,scwin.loginUser.deptCd
                        ,scwin.menuInfo.SEARCH_SCOPE_GCD
						]
                },{
                        db : "LECTURE",
                        proc : "CLS_교수계획표_교수계획표출력_출력",
                        params : ["DTL2"
                        ,SCH_SYEAR
                        ,SCH_TERM_GCD
                        ,PROF_NO
                        ,SUBJ_NO
                        ,CLASS_NO
                        ,scwin.i18n.locale
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,scwin.loginUser.userId
                        ,scwin.loginUser.nm
                        ,scwin.loginUser.deptCd
                        ,scwin.menuInfo.SEARCH_SCOPE_GCD
						]
                },{
                        db : "LECTURE",
                        proc : "CLS_교수계획표_교수계획표출력_출력",
                        params : ["DTL1"
                        ,SCH_SYEAR
                        ,SCH_TERM_GCD
                        ,PROF_NO
                        ,SUBJ_NO
                        ,CLASS_NO
                        ,scwin.i18n.locale
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,""
                        ,scwin.loginUser.userId
                        ,scwin.loginUser.nm
                        ,scwin.loginUser.deptCd
                        ,scwin.menuInfo.SEARCH_SCOPE_GCD
						]
                }];*/

        //레포트를 생성시킬 group component 또는 id를 넣는다.
        options.div = 'grp_report';

        //레포트에서 사용할 옵션
        //현재 다운로드 버튼 관련 기능만 제공...
        options.reportOption = {};
        options.reportOption.useHwp = false; //한글다운로드 기능 사용안할 경우
        options.reportOption.useDoc = false; //word다운로드 기능 사용안할 경우
        options.reportOption.useEtc = false; //기타다운로드 기능(ppt, rtf, html 등) 사용안할 경우
        options.reportOption.usePrint = false; //프린트 기능 사용안할 경우

        //실행실킬 레포트 파일에서 사용할 파라미터 object 형식
        //프로그램 정보(PROG_INFO)와 사용자 정보(USER_INFO)는 기본값으로 전송됨.
        options.data = objParam;

        fn_openPopup2(options);

	}
	
	
	function fn_openPopup2(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "교수계획표",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
	
	
/*** 학과게시판 ***/
$(function(){
	rssBoardInfo={};
	rssBoardInfo.siteId = "";
	rssBoardInfo.boardId="";
	/* 학과공지 사용자별 설정 정보*/
	 f_getDepartConfig = function() {
		if (gfn_com_isEmptyObject(scwin.loginUser)) {
			return false;
		} else {
			gfn_ajax_request({
				url : "/core/main/middleware/departConfigSearch",
				success : function(data, responseData) {
					var SITE_ID = "";
					var BOARD_ID = "";
					$(data).each(function(key, val) {
						//$("#siteId").val(val.SITE_ID);
						//$("#boardId").val(val.BOARD_ID);
						SITE_ID = val.SITE_ID;
						BOARD_ID = val.BOARD_ID;
					}); 
					if(SITE_ID !="" && BOARD_ID != ""){
						f_departBoard(SITE_ID,BOARD_ID);	
					}else{
						$(".departNoticeList").html($(".departNonInfo").html());
					}
					
				}
			});
		}

	}
	
	/* 학과공지 */
	f_departBoard= function(SITE_ID,BOARD_ID) {
		
		var siteId = SITE_ID;
		var boardId = BOARD_ID;
		
		if (siteId == "" || boardId == "") {
			return;
		} else {
			var data = {};
			data.siteId = siteId;
			data.boardId = boardId;
			
			

			gfn_ajax_request({
				url: "/core/main/middleware/rssSearch",
				reqData: data,
				success: function(data, responseData) {
					var pnuNoticeHtml = "";
					
					pnuNoticeHtml+='	<ul class="board-list">';
					//responseData.rssBbsList = "";
					if(responseData.rssBbsList.length >0){
						$.each(responseData.rssBbsList,function(i,o){
							pnuNoticeHtml+='		<li class="board-item">';
							pnuNoticeHtml+='					<a class="board-link" href="'+o.LINK+'" target="_blank" title="새창열기">';
							pnuNoticeHtml+='					<div class="item-title">';
							pnuNoticeHtml+='						<span class="board-title">';
							if(o.CATEGORY != ""){
								pnuNoticeHtml+='['+o.CATEGORY+']';
							}
							pnuNoticeHtml+=						o.TITLE;
							pnuNoticeHtml+='						</span>';
							pnuNoticeHtml+='					</div>';
							pnuNoticeHtml+='<div class="item-writer" ><span>'+o.AUTHOR+'</span></div>';
							pnuNoticeHtml+='<time datetime="'+o.REG_DATE2+'" class="item-date">'+o.REG_DATE2+'</time>';
							pnuNoticeHtml+='				</a>';
							pnuNoticeHtml+='		</li>';
						});
						pnuNoticeHtml+='	</ul>';
						
						pnuNoticeHtml+='<a class="col h3" href="#none" onclick="f_reConfig();return false;" onkeypress="this.onclick" style="position: absolute;top: -36px;right: 50px;transform: translateY(-50%) rotate(0deg);display: inline-block;width: 20px;height: 20px;transition: all 0.3s ease 0s;    color: red;">';
						pnuNoticeHtml+='	<i class="bi bi-gear"><span class="sr-only">학과공지 즐겨찾기 수정</span></i>';
						pnuNoticeHtml+='</a>';
						pnuNoticeHtml+='	<a class="more-link" href="https://his.pusan.ac.kr/bbs/'+siteId+'/'+boardId+'/artclList.do" target="_blank" title="새창열기"><span class="sr-only">학과공지 바로가기</span></a>';
						
						
						$(".departNoticeList").html(pnuNoticeHtml);
					}else{
						$(".departNoticeList").html($(".departNonInfo").html());
					}
					
					
					
					
				}
			});
		}
	}
	
	
	f_reConfig = function() {
		$(".departNoticeList").html($(".departNonInfo").html());
	}
	
	
	handleDepart = function(e) {
		if (e.keyCode == 13) {
			f_departSearch();
		}
		return false;
	}
	
	f_departSearch = function(){
		
		var data = {};
		data.pName = "params1";
		data.pValue = $.trim($("#departName").val());
		
		if(data.pValue == ""){
			alert("학과명을 입력해주세요.",$("#departName"));
			return ;
		}
		
		$('#divBtn').hide();
		$("#tb_board tr").remove();
		$("#tb_depart tr").remove();
		
		gfn_ajax_request({
				url: "/core/main/middleware/pnuHisSiteInfo",
				reqData: data,
				success: function(data, responseData) {
					$("#departDivBox").show();
					const tb_depart = $("#departDiv");
					if (responseData.rssDeptList.length > 0) {
						var list_html = "";
						list_html += '<select id="selDepart" class="form-control"  onchange="f_boardSearch(this.value)" title="학과선택">';
						list_html += '<option >선택</option>';
						$.each(responseData.rssDeptList, function(i,val) {
							list_html += '<option value="'+val.SiteID+'">'+val.SiteName+'</option>';
						});
						list_html += '</select>';
						tb_depart.html(list_html);
					}else{
						tb_depart.html("검색된 학과가 없습니다");
					}
				}
		});
	}
	
	f_boardSearch = function(param) {
		
		var data = {};
		data.pName = "params1";
		data.pValue = param;
		
		$('#divBtn').hide();
		$("#tb_board tr").remove();

		gfn_ajax_request({
				url: "/core/main/middleware/pnuHisBoardInfo",
				reqData: data,
				success: function(data, responseData) {
					$("#departBoardDivBox").show();	
					const tb_depart = $("#departBoardDiv");
					if (responseData.rssDeptBoardList.length < 1) {
						tb_depart.html("검색된 게시판이 없습니다");
					} else {
						$("#departBoardDivBox").show();
						var list_html = "";
						list_html += '<select  class="form-control"  onchange="f_showConfirm(\''+param+'\',this.value)" title="게시판검색">';
						list_html += '<option >선택</option>';
						$.each(responseData.rssDeptBoardList, function(i,val) {
							list_html += '<option value="'+val.BoardID+'">'+val.BoardName+'</option>';
						});
						list_html += '</select>';
						tb_depart.html(list_html);
					}
				}
		});
		
		
		
	}
	
	f_showConfirm = function(deptCd, boardCd) {
		$("#siteId").val(deptCd);
		$("#boardId").val(boardCd);
		rssBoardInfo.siteId = deptCd;
		rssBoardInfo.boardId = boardCd;
		$('#divBtn').show();
		$('#departBoardBtn').show();
	}
	
	f_submit = function() {
		
		confirm('학과 게시판 설정을 저장 하시겠습니까?',function(_flag){
    		if(_flag) {
    			
    			var data = {};
				data.siteId = rssBoardInfo.siteId;
				data.boardId = rssBoardInfo.boardId;
				
				gfn_ajax_request({
						url: "/core/main/middleware/departConfigUpdate",
						reqData: data,
						success: function(data, responseData) {
								alert("반영 되었습니다.",$("#board-tab-3"));
								$("#departDivBox").hide();
								$("#departBoardDivBox").hide();
								
								$("#departDiv").html("");
								$("#departBoardDiv").html("");
								$("#departBoardBtn").hide();
								f_departBoard(rssBoardInfo.siteId,rssBoardInfo.boardId);
						}
				});
    			
    		}else{
				$("#departNoticeConfBtn").focus();
			}
    	});
	}
});


	window.onload = function() {
		//loadscript($("body"), "/common/js/owl_tabs.js");
		//$("#ost_tabs1").tabfocuser();
		//$("#ost_tabs1").find(".linkEndAppend").focus(function() {
					//$("#popupWrap" + suffixStr).removeAttr("tabindex");
		//			$("#smart-tab0001").focus();
		//});
		//$("#meal_tabs").tabfocuser();	
		loadAccessibility();
		tabFocusAccessibilityCtl('ost_tabs1');
		
		tabFocusAccessibilityCtl('meal_tabs');
		if($(".schedule-list").hasVerticalScrollBar()){
			$(".schedule-list").attr("tabindex",0);
		}
		
		//스킵네비게이션 링크 수정
		if(gfn_str_parseNull(scwin.menuCd) != "" && gfn_str_parseNull(scwin.loginUser.userId) != "") { //로그인후
			//$("#contSkipLink").attr("href","#webMail");
	    }else{
			//$("#contSkipLink").attr("href","#userID");
		}   
		
		//메인게시판 링크텍스트 수정
		$.each($(".sec-smart-board .nav-link"), function() {
			if ($(this).attr("data-selected") == "true" || $(this).attr("aria-expanded") == "true") {
				$(this).attr("title", "선택됨");
			} 
		});
		$(".sec-smart-board .nav-link").on("click", function() {
			$.each($(".sec-smart-board .nav-item"),function(){
					$(this).find("a").removeAttr("title");
				});

			$(this).attr("title", "선택됨");
		});	
	}
	
	