<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns='http://www.w3.org/1999/xhtml' xmlns:ev='http://www.w3.org/2001/xml-events' xmlns:w2='http://www.inswave.com/websquare' xmlns:xf='http://www.w3.org/2002/xforms' lang="ko">
    	<jsp:include page="../inc/incCommonCss.jsp" flush="false" />
	<body>
    	<jsp:include page="../inc/incCommonJs.jsp" flush="false" />
    	  <link href="/common/css/manual/stylesheet_ext.css" rel="stylesheet">
		  <link href="/common/css/manual/type01.css" rel="stylesheet">  
		  <link href="/common/css/manual/common_ses.css" rel="stylesheet">
		  <link href="/common/css/manual/common_ses_dev.css" rel="stylesheet">
    	<jsp:include page="userManualScript.jsp" flush="false" /> 

        <script>
        scwin.isFirst = true;
        var d = null;

        scwin.fn_commSearch = function() {
        	if(!gfn_com_parseNull($('#SCH_SYSTEM_GCD').val())) {
        		alert('시스템구분을 확인할 수 없습니다.');
        		return;
        	}
        	$("#treeviewWrap").empty();
        	$("#viewWrap").empty();
        	
            var options = {};
            options.url = '/core/manual/selectmenu';
            options.contentType = 'application/x-www-form-urlencoded;charset=UTF-8';
            options.reqData = {
                SCH_MENU_TEXT: gfn_com_parseNull($('#SCH_MENU').val())
                , SCH_CONTENT_TEXT: gfn_com_parseNull($('#SCH_CONTENT').val())
            };
            options.loadingMsg = '관련 메뉴를 검색 중 입니다.';
            options.success = function(data, responseData) {
            	dataCollect.dlt_01 = data;
            	d = new _dTree('d');  
            	d.clearCookie();
            	d.add('000000000000000',-1,'<strong>메뉴</strong>');
	            $.each(data,function(index, item){
	            	d.add(item.MENU_CD, item.UPPER_MENU_CD,item.MENU_KOR_NM, '');
	            });
	            $("#treeviewWrap").html(d.toString());
	            
                if(scwin.isFirst) {
                	scwin.isFirst = false;
                	if(scwin.frameMenuData && scwin.frameMenuData.PATH_MENU_CD){
                		scwin.pathArr = scwin.frameMenuData.PATH_MENU_CD.split('>');
                		scwin.pathArr.splice(0, 1);
                		
                		scwin.pathClick = function(){
                			var selectedMenuId = scwin.pathArr.splice(0, 1);
                			setTimeout(function(){
                				if(scwin.pathArr.length == 0) {
                					$('#' + selectedMenuId).trigger('onclick');
                					$('#' + selectedMenuId).focus();
                				} else {
                					$('#' + selectedMenuId).siblings('a')[0].click()
                					scwin.pathClick();
                				}
                			}, 100);
                		};
                		scwin.pathClick();
                	}
                }
            };
     
            gfn_ajax_request(options);  
        };
        
        function fn_manualDetail(clickedMenu){
        	var menuId = $(clickedMenu).attr('id');
        	d.selectNode(menuId);
        	$("#viewWrap").empty();

            var options = {};
            options.url = '/core/manual/selectcontents';
            options.contentType = 'application/x-www-form-urlencoded;charset=UTF-8';
            options.reqData = {
                MENU_CD : menuId,
                SCH_CONTENT_TEXT : gfn_com_parseNull($('#SCH_CONTENT').val()),
            };
            options.success = function(data, responseData) {
                if(data.length > 0) {                            
                    var _manager = "";
                    if(data[1] != null) {
                        $.each(data[1],function(i,v){
                            _manager += v.STR;
                        });
                    }
                    if(data[0][0] != null) {
                        $("#viewWrap").html(data[0][0].CONTENT + _manager + data[0][0].CURRENT_UPD_INFO);
                    }
                }
            };                    
            gfn_ajax_request(options);
        }
        
        $(document).ready(function(e){
        	
        	getCode({
        		SYSTEM_GCD: '0000'
        		, CODE: 'SYSTEM_GCD'
        		, dataBound: function(data, cd){
	            		$.each(data, function(i, obj){
	            			var optionTag = $('<option>')
	            			optionTag.val(obj.COMMON_DETAIL_CD);
	            			optionTag.text(obj.COMMON_DETAIL_CD_KOR_NM);
	            			$('#SCH_SYSTEM_GCD').append(optionTag);
	            		});
	            		
	            		if(scwin.frameMenuData && scwin.frameMenuData.SYSTEM_GCD) {
	            			$('#SCH_SYSTEM_GCD').val("0002");
	            			scwin.fn_commSearch();
	            		}
	            	}
        		});
        	
        	$('#btnSearch').click(function(e){
        		scwin.fn_commSearch();
        	});
        	
        	$('#btn_close').click(function(e){
        		window.close();
        	});
        	
        	$('#SCH_CONTENT').keyup(function(e){
        		if(e.keyCode == 13)
        			scwin.fn_commSearch();
        	});
        	
        	$('#SCH_MENU').keyup(function(e){
        		if(e.keyCode == 13)
        			scwin.fn_commSearch();
        	});
        	
        	$('#btnExtend').click(function(e){
        		if(d)
        			d.oAll(true);
        	});
        	
        	$('#btnUnfold').click(function(e){
        		if(d)
        			d.oAll(false);
        	});
        	
        	window.onresize = function(e){
        		var winHeight = window.innerHeight;
        		var secHeaderHeight = Math.ceil($('#divSecHeader').height() + 20);
        		var searchBoxHeight = Math.ceil($('#divSearchBox').height() + 30);
        		$('#treeviewWrap').height(winHeight - secHeaderHeight - searchBoxHeight - 65);
        		$('#viewWrap').height(winHeight - 30 - secHeaderHeight - searchBoxHeight - 65);
        	}
        	
        	window.onresize();
        });
        </script>
		<div class="w2window w2window_restored w2popup_window type-work browser-popup" style="height: 100% !important;" id="wrap">
			<div class="popup-contents popup-notice">
				<div class="contents-body" id="divContentsBody">
					<div class="sec-body">
						<div class="sec sec-1">
							<div class="sec-header" id="divSecHeader">
								<div class="header-gr">
									<div class="title-box">
										<h3 class="sec-title" id="txtTitle">온라인 매뉴얼</h3>
									</div>
								</div>
								<div class="btn-box">
									<input type="button" class="btn btn-secondary" id="btnExtend" value="전체펼치기" />
									<input type="button" id="btnUnfold" class="btn btn-secondary" value="전체접기"/>
									<input type="button" class="btn btn-primary" id="btnSearch" value="조회" />
									<input type="button" id="btn_close" class="btn btn-secondary close-popup-btn d-none" value="닫기"/>
								</div>
							</div>
							<div class="sec-body">
								<div class="search-box" id="divSearchBox">
									<div class="b-table-box flex-col-3" id="" style="" role="table" aria-label="조회조건">
			                            <div class="b-row-box" id="" style="" role="row">
			                            	<div class="b-row-item" id="" style="">
			                                    <div class="b-title-box" id="" style="" role="rowheader">
			                                        <label class="" id="" title="시스템구분" style="" for="SCH_SYSTEM_GCD">시스템구분</label>
			                                    </div>
			                                    <div class="b-con-box" id="" style="" role="cell">
			                                        <select id="SCH_SYSTEM_GCD" ref="data:dma_SearchParam01.SCH_SYSTEM_GCD" class="form-control form-w-auto" disabled="disabled">
			                                        	<option value="">선택</option>
			                                        </select>
			                                    </div>
			                                </div>
			                                <div class="b-row-item" id="" style="">
			                                    <div class="b-title-box" id="" style="" role="rowheader">
			                                        <label class="" id="" title="메뉴명" style="" for="SCH_MENU">메뉴명</label>
			                                    </div>
			                                    <div class="b-con-box" id="" style="" role="cell">
			                                        <input type="text" adjustMaxLength="false" style="" id="SCH_MENU" ref="data:dma_SearchParam01.SCH_MENU_TEXT" class="form-control"></input>
			                                    </div>
			                                </div>
			                                <div class="b-row-item" id="" style="">
			                                    <div class="b-title-box" id="" style="" role="rowheader">
			                                        <label class="" id="" title="내용" style="" for="SCH_CONTENT">내용</label>
			                                    </div>
			                                    <div class="b-con-box" id="" style="" role="cell">
			                                        <input type="text" style="" id="SCH_CONTENT" ref="data:dma_SearchParam01.SCH_CONTENT_TEXT" class="form-control"></input>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div id="treeviewWrap" style="margin:15px 0 15px 15px;border: 1px solid #d5d5d8;border-radius:7px;overflow-y: auto;">
											<div id="treebox"></div>
										</div>
									</div>
									<div class="col-md-8">
										<div class="w2group gr preview-wrap" id="viewWrap" style="margin:15px 15px 15px 0;padding:15px;border: 1px solid #d5d5d8;border-radius:7px;overflow-y: auto;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>