<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="com.onestop.core.util.IUtility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.onestop.core.util.CommonStaticFile" %>
<%
Map site = (Map)session.getAttribute("SITE_INFO");
String _site = "{}";
if(site != null) {
    _site = (IUtility.mapToJsonObj(site)).toString();
}
%>
<script src="/common/js/jquery-3.6.0.min.js"></script>
<script src="/common/bootstrap-4.6.1/js/bootstrap.bundle.min.js"></script>
<script src="/common/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="/common/js/jquery-ui.min.js"></script>
<script src="/common/js/jquery.alphanumeric.js"></script>
<script src="/common/js/bluebird.min.js"></script>
<script src="/common/js/bundle.min.js"></script>
<script src="/common/js/script.js"></script>
<script src="/common/js/excel/xlsx.full.min.js?1"></script>
<script src="/common/js/excel/FileSaver.min.js"></script>
<script src="/common/js/crypto.js"></script>
<script src="/common/js/rsa/rsa.js" ></script>
<script src="/common/js/rsa/jsbn.js" ></script>
<script src="/common/js/rsa/prng4.js" ></script>
<script src="/common/js/rsa/rng.js" ></script>
<script src="/common/js/moment-with-locales.min.js"></script>
<script src="/common/js/bootstrap-datetimepicker.min.js"></script>
<script charset="utf-8" src="/common/js/jquery-ui-timepicker-addon.js"></script>
<script src="/common/js/jquery.countdown.js"></script>
<script src="/common/js/gfn/gfn_com.js?${CommonStaticFile.makeVersion('/common/js/gfn/gfn_com.js') }"></script>
<script src="/common/js/gfn/gfn_ajax.js"></script>
<script src="/common/js/gfn/gfn_str.js?${CommonStaticFile.makeVersion('/common/js/gfn/gfn_str.js') }"></script>
<script src="/common/js/gfn/gfn_val.js?${CommonStaticFile.makeVersion('/common/js/gfn/gfn_val.js') }"></script>
<script src="/common/js/gfn/gfn_table.js?${CommonStaticFile.makeVersion('/common/js/gfn/gfn_table.js') }"></script>
<script src="/common/js/gfn/gfn_json.js?${CommonStaticFile.makeVersion('/common/js/gfn/gfn_json.js') }"></script>
<script src="/common/js/common.js?${CommonStaticFile.makeVersion('/common/js/common.js') }"></script>
<script src="/common/js/gfn/gfn_file.js?${CommonStaticFile.makeVersion('/common/js/gfn/gfn_file.js') }"></script>

<script type="text/javascript" language="javascript" >
let objTarget = "";
if((document.location.host).startsWith("e-onestop")) {
    document.location.href = "https://onestop.pusan.ac.kr";
} else {
	var RSAModulus = '${RSAModulus}';
	var RSAExponent = '${RSAExponent}';
	var _rsa = new RSAKey();
	_rsa.setPublic(RSAModulus,RSAExponent);
	
    scwin = {};    
    scwin.detailObj = {};
    scwin.systemGcd = "${SESSION_SYSTEM_GCD}";
    scwin.tokenHeaderNm = "${_csrf.headerName}";
    scwin.tokenParameterNm = "${_csrf.parameterName}";
    scwin.token = "${_csrf.token}";
    scwin._sToken = '${_sToken}';
    scwin._resetFg = '${_resetFg}';
    scwin.server = "${_server}";
    scwin.host = "${_host}";
    scwin.site = <%=_site%>;
    scwin.loginUser = {};
    scwin.i18n = {};
    scwin.i18n.locale = "0001";
    scwin.i18n.list = [];
    scwin.menuList = {};
    scwin.menuInfo = {};
    scwin.menuCd = '${menuCD}';
    scwin.termInfo = {};
    scwin.favList = {}; 
    scwin.userList = {};

    gfn_ajax_request({
        url : "/global/info",
        reqData : {
            menuCD : scwin.menuCd
        },
        async: false,
        success : function(data, responseData) {
        	if(gfn_str_parseNull(scwin.menuCd) != "" && gfn_str_parseNull(responseData._LoginUser) != "") { //로그인후
        		scwin.loginUser = responseData._LoginUser;    
                scwin.menuList = responseData._Menu;    
                
                
                scwin.menuInfo = common.getMatchedJSON(responseData._Menu, 'MENU_CD', scwin.menuCd)[0];
                if(gfn_str_parseNull(scwin.menuInfo)==""){
                	scwin.menuInfo = {};
                }
                scwin.i18n.locale = scwin.loginUser.langGcd;

            } else { //로그인전
            	scwin.menuList = responseData._Menu;
            	scwin.menuInfo = common.getMatchedJSON(responseData._Menu, 'MENU_CD', scwin.menuCd)[0];
            	//scwin.menuInfo.AUTH_STR = {};
            	scwin.i18n.locale = responseData._locale;
            	if("${stdtInfo.userId}" != ""){
            		scwin.i18n.locale = "${stdtInfo.langGcd}";
            	}
            }
        	if(scwin.i18n.locale != '0001') {
        		scwin.i18n.list = responseData._i18n;
        	}
        	scwin.termInfo = responseData.termInfo; //기준년도 학기 정보
        	if(scwin.menuCd != "000000000000000"){
        		if(gfn_str_parseNull(scwin.menuInfo) != "" ){
        			$('head title').text(scwin.menuInfo.REVERSE_PATH_MENU_KOR_NM+">부산대학교 학생지원시스템");
        		}
        	}
        	
        }
    });
    scwin.pageInfo = {"totPage" : 1, "totCnt" : 0, "pageSize" : 10, "pageIndex" : 0, "pageGrp" : 1};    
    scwin.pageParam = "";
    <c:if test="${pageParam ne null}">
        scwin.pageParam = ${pageParam};
        if(!gfn_com_isEmptyObject(scwin.pageParam) && typeof scwin.pageParam == "string"){
            scwin.pageParam = gfn_json_parse(scwin.pageParam);
        }
    </c:if>

    String.prototype.startsWith = function(str) {
        if (this.length < str.length) { return false; }
        return this.indexOf(str) == 0;
    }

    String.prototype.endsWith = function(str) {
        if (this.length < str.length) { return false; }
        return this.lastIndexOf(str) + str.length == this.length;
    }
    
    if(scwin.server != 'local') {
        document.onmousedown=disableclick;
        
        status="마우스 우클릭은 사용하실 수 없습니다.";
                        
        function disableclick(event){
            if (event.button==2) {
                alert(status);
                return false;
            }
        }
    }
    
    var filter = "win16|win32|win64|mac|macintel";

    $(document).ready(function(){
        if (filter.indexOf(navigator.platform.toLowerCase()) < 0) { //모바일
            
        }
        if(scwin.server != 'local') {
            $(document).bind('keydown',function(e){
                if(e.keyCode == 123) {
                    e.preventDefault();
                    e.returnValue = false;
                }
            });
        }
        
        var _ua = navigator.userAgent.toLowerCase(); 

        if( (navigator.appName == 'Netscape' && _ua.indexOf('trident') != -1) || (_ua.indexOf("msie") != -1)) {
            _browser = "msie";
        } else if( _ua.indexOf("chrome") != -1 ){
            _browser = "chrome";
        } else if ( _ua.indexOf("safari") != -1 ){
            _browser = "safari";
        } else if ( _ua.indexOf("firefox") != -1 ){
            _browser = "firefox";
        }
        
        $(".numeric").numeric();
        
        if(scwin.i18n.locale != '0001') {
        	var _insert = [];
        	$.each($("#root [data-lang]"),function(i,o){
            	var _ko = $(this).text();
            	var _lang = scwin.i18n.list.find(function(e){ return e.KEY == "0002_"+scwin.menuCd+"_"+_ko});   
            	if(_lang != undefined) {
            		if(scwin.i18n.locale == '0002') {
            			$(this).text(gfn_str_parseNullDefault(_lang.ENG_NM,_ko));
            		} else if(scwin.i18n.locale == '0003') {
            			$(this).text(gfn_str_parseNullDefault(_lang.CHN_NM,gfn_str_parseNullDefault(_lang.ENG_NM,_ko)));
            		} 
            	} else {
            		_lang = scwin.i18n.list.find(function(e){ return e.KEY == "0000_000000000000000_"+_ko});
            		if(_lang != undefined) {
                		if(scwin.i18n.locale == '0002') {
                			$(this).text(gfn_str_parseNullDefault(_lang.ENG_NM,_ko));
                		} else if(scwin.i18n.locale == '0003') {
                			$(this).text(gfn_str_parseNullDefault(_lang.CHN_NM,gfn_str_parseNullDefault(_lang.ENG_NM,_ko)));
                		}
                	} else {
                		_insert.push({
                			SYSTEM_GCD : '0000',
                			MENU_CD : '000000000000000',
                			KOR_NM : _ko
                		});
                	}
            	}
            });
        	if(_insert.length > 0 && !gfn_com_isEmptyObject(scwin.loginUser)) {
	        	gfn_ajax_request({
	    			url : "/common/lang/addLangInfo",
	    			reqData : _insert,
	    			loading : false,
	    			success : function(data, responseData){
	    				
	    			}
	    		});
        	}
        }

        $.each($(".calendar"),function(idx){
            var obj = $(".calendar")[idx];
            if(!$(obj).is("[readonly]")){
                if(!gfn_com_isEmptyObject($(obj).attr("id"))){
                    gfn_com_createDateComp($(obj).attr("id"));  
                }           
            }
        });

        $.each($(".datepicker"),function(idx){
            var obj = $(".datepicker")[idx];
            if(!$(obj).is("[readonly]")){
                if(!gfn_com_isEmptyObject($(obj).attr("id"))){
                	gfn_com_createDatetimeComp($(obj).attr("id"),"YYYY-MM-DD",false);  
                }           
            }
        });
        
        $.each($(".timepicker"),function(idx){
            var obj = $(".timepicker")[idx];
            if(!$(obj).is("[readonly]")){
                if(!gfn_com_isEmptyObject($(obj).attr("id"))){
                	gfn_com_createDatetimeComp($(obj).attr("id"),"HH:mm:ss",true);  
                }           
            }
        });
        
        $.each($(".datetimepicker"),function(idx){
            var obj = $(".datetimepicker")[idx];
            if(!$(obj).is("[readonly]")){
                if(!gfn_com_isEmptyObject($(obj).attr("id"))){
                	gfn_com_createDatetimeComp($(obj).attr("id"),"YYYY-MM-DD HH:mm:ss",true);  
                }           
            }
        });
        
        $.each($(".profsearcher"),function(idx){
        	if(!gfn_com_isEmptyObject($(this).attr("id"))){
                gfn_com_createProfSearchComp($(this).attr("id"));  
            }
        });
        
        $.each($(".sliderpointer"),function(idx){
        	if(!gfn_com_isEmptyObject($(this).attr("id"))){
                gfn_com_createSliderComp($(this).attr("id"));  
            }
        });
        
        $.each($("input[auto-bind],select[auto-bind]"),function(idx){
        	var obj = $(this);
        	$(obj).css('width',$("#"+$(obj).attr("auto-bind")).width()+26);
        	$(window).resize(function(e){
        		$(obj).css('width',$("#"+$(obj).attr("auto-bind")).width()+26);
            });
        });
        
        if(typeof fn_initScreen == "function"){
            fn_initScreen();
        }
        if(gfn_str_parseNull(scwin.menuInfo) != "" &&  (scwin.menuInfo.MENU_CONTENT_GCD=="0001"
    		|| scwin.menuInfo.MENU_CONTENT_GCD=="0002" || scwin.menuInfo.MENU_CONTENT_GCD=="0008") ){
        	if( gfn_str_parseNull(scwin.menuInfo.ATTACH_FILE_GRP_CD) !="" ){
        		if($("#download_target").length ==0){
    	        	$("main .sec-1 header").eq(0).after('<div id="download_target"></div> ');
    	        }
        	}
	        
        }
        if($("#download_target").length >0){
			var options = {};
			options.url = '/file/selectTagGroupList';
			options.reqData = {
				SYSTEM_GCD:  scwin.menuInfo.SYSTEM_GCD,
				ATTACH_FILE_GCD: "0001",
				ATTACH_FILE_GRP_CD: scwin.menuInfo.ATTACH_FILE_GRP_CD
			};
			options.success = function(data, responseData) {
					var download_target_html = "";
					$.each(responseData.fileTabList,function(idx,FILE_TAG_CONTENT){
						if(gfn_str_parseNull(FILE_TAG_CONTENT) != "" ){
							if(idx==0){
								download_target_html += "<ul class='nav nav-pills' id='tablist'>";	
							}
							download_target_html += "	<li class='nav-item' role='presentation'><a class='nav-link "+(idx==0?" active":"")+"' id='tab1-"+idx+"' data-toggle='tab' href='#tab-cont1-"+idx+"' data-controls='profile' data-selected='false'> "+FILE_TAG_CONTENT+"</a></li>";
							if( (idx+1)==responseData.fileTabList.length){
								download_target_html += "</ul>";
							}
							
						}
					});
					download_target_html += "<div class='tab-content'>";
					$.each(responseData.fileTabList,function(idx,FILE_TAG_CONTENT){
							
							download_target_html += "<div class='tab-pane fade"+(idx==0?"show active":"")+"' id='tab-cont1-"+idx+"'  aria-labelledby='tab1-"+idx+"'>";
							
							download_target_html += "<div class='message-box message-box-style-2'>";
							download_target_html += "<div class='message-box-inner'>";
							download_target_html += "	<div class='message-header'>";
							download_target_html += "		<img src='/common/images/message_box_icon_01.svg' alt=''>";
							download_target_html += "	</div>";
							download_target_html += "	<div class='message-body'>";
							$.each(responseData.fileList,function(idx,file){
								if(gfn_str_parseNull(FILE_TAG_CONTENT) == gfn_str_parseNull(file.FILE_TAG_CONTENT)){
									download_target_html += "<div class='my-2'>";
									download_target_html += file.ORIGIN_FILE_NM2;
									download_target_html += " <a class='btn btn-sm btn-primary' href='javascript:void(0);'  onclick='fn_popupMultiFileViewr(\"/file/download.do?"+file.PARAM_CODE+"\",this)' onkeypress='this.onclick' title='새창열기'>뷰어<i class='bi bi-eye' aria-hidden='true'></i></a>";
									download_target_html += " <a class='btn btn-sm btn-primary' href='/file/download.do?"+file.PARAM_CODE+"'>다운로드<i class='bi bi-download' aria-hidden='true'></i></a>";
									download_target_html += "	</div>";
								}
							});
					
							download_target_html += "</div>";
							download_target_html += "</div>";
							download_target_html += "</div>";
							download_target_html += "</div>"; //.tab-pane fade
					
					});
					download_target_html += "</div>"; //.tab-content
				
				$("#download_target").html(download_target_html);
			};

			gfn_ajax_request(options);
		}
        
        $.each($("a"),function(){
            if($(this).attr("target") =="_blank"){
                $(this).attr("rel","noopener noreferrer");
            }
        });
        
        $.each($("label"),function(){
            if($(this).attr("class") =="req"){
                $(this).prepend("<span class=\"sr-only\">필수 입력 사항입니다.</span>");
            }
        });

        /*뒤로가기 방지
        history.pushState(null, document.title, location.href);
        window.addEventListener("popstate", function(event){
            history.pushState(null, document.title, location.href);
        });
        */
        
        $(document).on("keyup","input[type=text], textarea",function() {
            var str = /[$]/gi;
            var tempStr = $(this).val();
            if(str.test(tempStr)) {
                $(this).val(tempStr.replace(str,""));
            }
        });
        
        setTimeout(function(){
    		$(".fixed-table-header").css("margin-right", "");
    	}, 200);	
        
        /* 5분마다 유효한 토큰 체크 */
        setInterval(function(){
            fn_ssoTokenChecking();
        }, 300000);
    });
    
    function fn_ssoTokenChecking() {
	   	 if( scwin.loginUser.userId != undefined &&
	   	     !(document.location.host).startsWith("127.0.0.1") && 
	         !(document.location.host).startsWith("localhost") && 
	         !(gfn_str_parseNull(scwin.loginUser.userIp)).startsWith("192.168.2") && 
	         gfn_str_parseNull(scwin.loginUser.userIp) != "10.125.10.92" &&
	       	 scwin.site != undefined && 
	       	 gfn_str_parseNull(scwin.site.SSO_USE_FG) == "Y" &&
	       	 gfn_str_parseNull(scwin._sToken) != "")         
	     {
	   		gfn_ajax_request({
	   	        url : "/core/function/sTokenValid",
	   	        reqData : {},
	   	        success : function(data, responseData) {
	   	        	if(!responseData.sTokenValid) {
	   	        		fn_logout();
	                }
	   	        }
	   	    });
	    }
    }

    var obj_L = 0;
    var obj_T = 0;
    var targetObj;

    function getLeft(o){
         return parseInt(o.style.left.replace('px', ''));
    }
    function getTop(o){
         return parseInt(o.style.top.replace('px', ''));
    }

    // 이미지 움직이기
    function fn_moveDrag(e){
         var e_obj = window.event? window.event : e;
         var dmvx = parseInt(e_obj.clientX + obj_L);
         var dmvy = parseInt(e_obj.clientY + obj_T);
         targetObj.style.left = dmvx +"px";
         targetObj.style.top = dmvy +"px";
         return false;
    }

    // 드래그 시작
    function fn_startDrag(e, obj){
         targetObj = $(obj).parent().parent().get(0);
         var e_obj = window.event? window.event : e;
         obj_L = getLeft(targetObj) - e_obj.clientX;
         obj_T = getTop(targetObj) - e_obj.clientY;

         document.onmousemove = fn_moveDrag;
         document.onmouseup = fn_stopDrag;
         if(e_obj.preventDefault)e_obj.preventDefault(); 
    }

    // 드래그 멈추기
    function fn_stopDrag(){
         document.onmousemove = null;
         document.onmouseup = null;
    }
    
    function loadscript(el, url) {        
        var script = document.createElement('script');
        script.src = url;
        script.type = "text/javascript";
        script.async = false;
        $(el).prepend(script);
    }
    
  	//즐겨찾기 조회 
	function fn_SelectBookMark(param){       
	        
	        var options = {};
	        if(param.reset =="Y"){
	        	options.url = '/core/main/resetSelectListBookMark';
	        }else{
	        	options.url = '/core/main/selectListBookMark';	
	        }
	        
	        options.success = function(data, responseData){
	        	scwin.favList = responseData.favList; 
	        	var fav_html = "";
				fav_html +='<ul class="bookmark-list">                                               ';
				$.each(scwin.favList,function(idx,obj){ 
					fav_html +='	<li class="bmark_li" data-cd="'+obj.MENU_CD+'"  data-name="'+obj.MENU_KOR_NM+'" >                                           ';
					fav_html +='      <div class="bookmark-menu">';
					fav_html +='			<a href="javascript:selectMenu(\''+obj.MENU_CD+'\')" >                                    ';
					fav_html +='				<h6>'+langMenuNm(obj)+'</h6>                                ';
					fav_html +='				<p>'+langMenuPathNm(obj)+'</p>                                ';
					fav_html +='			</a>                                           ';
					fav_html +='		</div>                                      ';
					fav_html +='      <div class="btn-group" >';
					fav_html +='				<button type="button" class="btn btn-outline-primary" onclick="fn_favPositionUp(this);return false;" ><i class="bi bi-chevron-up"><span class="sr-only">위로</span></i></button>    ';
					fav_html +='				<button type="button" class="btn btn-outline-primary" onclick="fn_favPositionDown(this);return false;" ><i class="bi bi-chevron-down"><span class="sr-only">아래로</span></i></button>  ';
					fav_html +='				<button type="button" class="btn btn-primary" onclick="fn_DeleteBookMark(this);return false;" data-cd="'+obj.MENU_CD+'"><i class="bi bi-trash-fill"><span class="sr-only">삭제</span></i></button>    ';
					fav_html +='		</div>                                     ';

					fav_html +='	</li>                                          ';
				});                                         
				fav_html +='</ul>                                              ';
				
				$("#bookmark-modal .modal-body").html(fav_html);
				$(".bookmark-btn").show();
	        	$(".bookmark-btn").bind("click",function(){
					fn_favModalPop();
				});
	        	
	        	if (typeof param.dataBound == "function") {
	        		param.dataBound();
	        	} else if (typeof param.dataBound == "string") {
	        		window[param.dataBound]();
	        	}
	        };
	        gfn_ajax_request(options);
	    }
	
	function fn_favModalPop(){
		 $("#bookmark-modal").modal();
	}

	function fn_favPositionUp(_this){
		var this_li = $(_this).closest("li");
		var this_li_index = $(".bmark_li").index(this_li);

		if(this_li_index == 0){
				alert("즐겨찾기 순번이 첫번째이므로 위로 이동할 수 없습니다.");
		}else{
			$(".bmark_li").eq(this_li_index-1).before(this_li.clone());
			this_li.remove();
			
			fn_excutePositionBookMark();
	        
		}
	}

	function fn_favPositionDown(_this){
		var this_li = $(_this).closest("li");
		var this_li_index = $(".bmark_li").index(this_li);

		if(this_li_index == (scwin.favList.length-1)){
				alert("즐겨찾기 순번이 마지막이므로 아래로 이동할 수 없습니다.");
		}else{
			$(".bmark_li").eq(this_li_index+1).after(this_li.clone());
			this_li.remove();
			
			fn_excutePositionBookMark();
		}
	}
	
	function fn_DeleteBookMark(_this){
		var options = {};
        options.url = '/core/main/excuteBookMark';
        options.reqData = {                    
            'MENU_CD': $(_this).data("cd"),
            'rowStatus' : 'D',
        };        
        
        options.success = function(data, responseData){                        
        	var this_li = $(_this).closest("li");
        	this_li.remove();
        };
                        
        gfn_ajax_request(options);
	}
	
	function fn_excutePositionBookMark(){
		var favMapList = new Array();
        $.each($(".bmark_li"),function(idx,obj){ 
        	var favInfo = {};
        	favInfo["MENU_CD"] = $(this).data("cd");
        	favInfo["MENU_KOR_NM"] = $(this).data("name");
        	favInfo["LINEUP_SEQ_NO"] = idx;
        	favMapList.push(favInfo);
        }); 
		
		var options = {};
        options.url = '/core/main/excutePositionBookMark';
        options.reqData = favMapList;        
        options.success = function(data, responseData) {
	        options.reset = "Y";
			fn_SelectBookMark(options);
        };
        gfn_ajax_request(options);
	}
	
	function loginCountDown(){
		var nowGetTime = new Date().getTime();
	    var fiveSeconds = nowGetTime + (30*60*1000); 
	    var cnt =0;
	    var ckTimeCount = $('#divClock a span');
	    ckTimeCount.countdown(fiveSeconds, { elapse: true })
	    .on('update.countdown', function (event) {
	        var $this = $(this);
	        if (event.elapsed) {
	        	if(cnt ==1){
	        		location.href = "/";
	        	}
	        	cnt++;	
	        } else {
	        	
	        	//ckTimeCount.html(event.strftime('<a href="#divClock" onclick="loginCountDown();return false;" onkeypress="this.onclick" title="세션시간갱신" ><span tabindex="0">%H:%M:%S</span></a>'));
	        	ckTimeCount.html(event.strftime('%H:%M:%S'));
	        }
	    });
	}
	function fn_logout() {
		var options = {};
        options.url = '/core/function/sTokenUnreg';
        options.reqData = {};        
        options.success = function(data, responseData) {
        	var form = $('<form method="POST" action="/logout">');
    		form.append('<input type="hidden" name="' + scwin.tokenParameterNm + '" value="' + scwin.token + '" />');
    		$('body').append(form);
    		form.submit().remove();
        };
        gfn_ajax_request(options);
	};
	function fn_Sitemap(){
        // 팝업 파라메타
        //var popParam = dlt_Menu.getMatchedJSON();
        var popParam = {};
         
         // 팝업 호출
        var options = {
           
            title : "사이트맵", 
            width : 1200, 
            height : 600,
            include : "/html/ost/core/popup/SiteMapPop.html"
            //data : popParam,
            //modal : true,            
            //resizable : true, 
            //callBackFunc: 'fn_sitemapCallBack'
        };           
        gfn_com_modalPopup(options);   
    }
	
	function smartSearch(paramKeyword){
	    var schKeyword = "";
		if(gfn_str_parseNull(paramKeyword) != ""){
		    schKeyword = paramKeyword;
		}else{
		    schKeyword = $('#total_keyword').val();
		}
		if(schKeyword == ""){
			alert("검색어를 입력해 주세요.",$('#total_keyword'));
			return false;
		}
		
		var form = $('<form method="POST" action="/totalSearch">');
		form
				.append('<input type="hidden" name="' + scwin.tokenHeaderNm + '" value="' + scwin.token + '" />');
		form
				.append('<input type="hidden" name="' + scwin.tokenParameterNm + '" value="' + scwin.token + '" />');
		form.append('<input type="hidden" name="keyword" value="'
				+ schKeyword + '" />');
		
		$('body').append(form);
		form.submit().remove();
		
		
		
	}
	
	function langMenuNm(_obj) {
		if (scwin.i18n.locale != '0001') {
			if (scwin.i18n.locale == '0002') {
				return gfn_str_parseNullDefault(_obj.MENU_ENG_NM,
						_obj.MENU_KOR_NM);
			} else if (scwin.i18n.locale == '0003') {
				return gfn_str_parseNullDefault(_obj.MENU_CHN_NM,
						gfn_str_parseNullDefault(_obj.MENU_ENG_NM,
								_obj.MENU_KOR_NM));
			} else {
				return _obj.MENU_KOR_NM;
			}
		} else {
			return _obj.MENU_KOR_NM;
		}
	}

	function langMenuPathNm(_obj) {
		if (scwin.i18n.locale != '0001') {
			if (scwin.i18n.locale == '0002') {
				return gfn_str_parseNullDefault(_obj.PATH_MENU_ENG_NM,
						_obj.PATH_MENU_KOR_NM);
			} else if (scwin.i18n.locale == '0003') {
				return gfn_str_parseNullDefault(_obj.PATH_MENU_CHN_NM,
						gfn_str_parseNullDefault(_obj.PATH_MENU_ENG_NM,
								_obj.PATH_MENU_KOR_NM));
			} else {
				return _obj.PATH_MENU_KOR_NM;
			}
		} else {
			return _obj.PATH_MENU_KOR_NM;
		}
	}

	var selectMenu = function(menuCD) {
		location.href = "/page?menuCD=" + menuCD ;
	};

	function fn_chgUserPop() {
		gfn_com_modalPopup({
			width : 420,
			height : 200,
			target : null,
			overflow_y : "off",
			title : "사용자전환",
			include : "/html/ost/core/popup/chgUserPop.html"
		});
	}

	function fn_chgUserRestore() {
		var form = $('<form method="POST" action="/login/loginCheck">');
		form
				.append('<input type="hidden" name="' + scwin.tokenHeaderNm + '" value="' + scwin.token + '" />');
		form
				.append('<input type="hidden" name="' + scwin.tokenParameterNm + '" value="' + scwin.token + '" />');
		form.append('<input type="hidden" name="USER_ID" value="'
				+ fn_ajax_enc_param(scwin.loginUser.originId) + '" />');
		form.append('<input type="hidden" name="PWD" value="" />');
		form.append('<input type="hidden" name="ORIGIN_ID" value="'
				+ fn_ajax_enc_param(scwin.loginUser.originId) + '" />');
		form
				.append('<input type="hidden" name="SYSTEM_GCD" value="0002" />');
		$('body').append(form);
		form.submit().remove();
	}

	function fn_noticePop(POPUP_GCD) {
		var __options = {};
		__options.url = '/core/function/getNoticePopupInfo';
		__options.reqData = {
			POPUP_GCD : POPUP_GCD,
			ATTACH_FILE_GCD : '0001'
		};
		__options.success = function(data, responseData) {
			var i = 0;
			$
					.each(
							data,
							function(__idx, __obj) {
								var noticePopId = "noticePopup"
										+ i
										+ "_"
										+ gfn_str_parseNull(__obj.SYSTEM_GCD)
										+ gfn_str_parseNull(__obj.POPUP_GCD)
										+ gfn_str_parseNull(__obj.SEQ_NO);

								if (gfn_str_parseNull(gfn_com_getCookie(noticePopId)) == "N") {

								} else {
									gfn_com_noticeModalPopup({
										id : noticePopId,
										width : gfn_str_parseNull(__obj.WIDTH_SIZE),
										height : gfn_str_parseNull(__obj.VERTICAL_SIZE),
										position : {
											top : parseInt(gfn_str_parseNull(__obj.VERTICAL_COORDI)),
											left : parseInt(gfn_str_parseNull(__obj.WIDTH_COORDI))
										},
										target : null,
										//overflow_y: "off",
										title : __obj.POPUP_TITLE_CONTENT,
										content : __obj.CONTENT,
										fileList : __obj.noticefileList,
										linkMenuCd : __obj.LINK_MENU_CD,
										closeDayCnt : __obj.POPUP_CLOSE_VALID_DAY_CNT,
										dataBound : function(e) {
											var noticePopClass = $("."
													+ noticePopId);
											noticePopClass.find(
													"#notice_pop_cont")
													.html(__obj.CONTENT);
										}
									});
									i++;
								}
							});
		};
		gfn_ajax_request(__options);
	}

	function fn_searchUserList() {
		var options = {};
		options.url = '/core/main/selectListUser';
		options.data = {};
		options.success = function(data, responseData) {
			fn_createUser(data);
		};
		gfn_ajax_request(options);
	}

	function fn_createUser(data) {
		scwin.userList = data;
		if (data.length > 0) {
			/*
			$("header .list-with-separator").prepend("<li><a id='userListPop' href='javascript:void(0);'>계정전환</a></li>");
			$("header .list-with-separator #userListPop").bind("click",function() {fn_userListPop();});
			*/
		}
	}

	function fn_userListPop() {
		gfn_com_modalPopup({
			width : 520,
			height : 500,
			target : null,
			overflow_y : "off",
			title : "계정전환",
			include : "/html/ost/core/popup/userListPop.html"
		});
	}
	
	function reSession(){
		var options = {};
		options.url = '/core/main/reSession';
		options.data = {};
		options.success = function(data, responseData) {
			loginCountDown();
		};
		gfn_ajax_request(options);
	}
	
	function ssoOpen() {	
		location.href = "https://login.pusan.ac.kr/"+((document.location.host).split("."))[0]+"/"+scwin.token+"/loginPage";
	}
	
	var _zoom = 1;
	
	function plusPage() {
		_zoom += 0.1;	
		$("#root").animate({ 'zoom': _zoom }, 400);
	}
	
	function minusPage() {
		_zoom -= 0.1;	
		$("#root").animate({ 'zoom': _zoom }, 400);
	}
		
	function printPage() {
		window.print();
	}
	function fn_contSkipLink(target){
	  
	  //스킵네비게이션 링크 수정
	  /*
		if(gfn_str_parseNull(scwin.menuCd) != "" && gfn_str_parseNull(scwin.loginUser.userId) != "") { //로그인후
			$("#webMail").focus();
			$('html, body').animate({ scrollTop: 200 }, 500);
			
			
	    }else{
	        $("#userID").focus();
	        $('html, body').animate({ scrollTop: 100 }, 500);
		}
	  */
		var keyword = gfn_str_parseNull("${keyword}");
		if((gfn_str_parseNull(scwin.menuCd) == "000000000000000" || gfn_str_parseNull(scwin.menuCd) == "" ) && keyword == '' ){
		    if( gfn_str_parseNull(scwin.loginUser.userId) != "") { //로그인후
		        $("#webMail").focus();
				$('html, body').animate({ scrollTop: 100 }, 500);
		    }else{
		        $("#userID").focus();
		        $('html, body').animate({ scrollTop: 100 }, 500);
			}  
		}else if(keyword != ''){
		    //$("#contSkipLink").attr("href","#sch_keyword");
		    $("#sch_keyword").focus();
		    $('html, body').animate({ scrollTop: 100 }, 500);
		}else if(gfn_str_parseNull(scwin.menuCd)  != "000000000000000" && gfn_str_parseNull(scwin.menuCd) !="" ){
		    //$("#contSkipLink").attr("href","#plus_icon");
		    $("#plus_icon").focus();
		    $('html, body').animate({ scrollTop: 100 }, 500);
		}	  
	}
	
	function openLinkSSO(formname, url){
		var form = '';
		form = $('<form name="'+formname+'" method="POST" action="'+url+'" target="_blank">');
        if(formname == 'mailForm') {
            form.append('<input type="hidden" name="sso_token" value="'+scwin._sToken+'" />');
        } else if(formname == 'pass' || formname == 'hrd') {
        	form.append('<input type="hidden" name="_sToken" value="'+scwin._sToken+'" />');
        } else if(formname == 'chatbot') {
        	form.append('<input type="hidden" name="ssotoken" value="'+scwin._sToken+'" />');                           
        } else {
            form.append('<input type="hidden" name="token_info2" value="'+scwin._sToken+'" />');	                        
        }
	    $('body').append(form);
	    form.submit().remove();      
	};
}
</script>

<div id="skipNavi">
    <h1 class="blind">스킵네비게이션</h1>
    <ul>
    	<li><a href="#skipNavi"  class="skipLink" id="contSkipLink" onclick="fn_contSkipLink(this.href);return false;" onkeypress="this.onclick">본문바로가기</a></li>
        <li><a href="#top_menu" class="skipLink" id="menuSkipLink" onclick="$('#top_menu').find('a:eq(0)').focus();return false;" onkeypress="this.onclick;">주메뉴바로가기</a></li>
    </ul>
</div>