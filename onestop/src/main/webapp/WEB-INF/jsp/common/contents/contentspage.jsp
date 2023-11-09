<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item"></div>
				<div class="header-item"></div>
			</header>
			<div class="sec-body contents-page">
				
				<c:if test="${fn:length(menuFileList)  > 0 }">
				<div id="file_tabs1">
				<!------------ start : 1depth 첨부파일 그룹-->
				<c:set var="PRE_FILE_TAG_CONTENT" value="" />
				
					<c:forEach var="item" items="${menuFileList}" varStatus="status">
						<c:if test="${item.FILE_TAG_CONTENT != '' && item.FILE_TAG_CONTENT != null}">
							<c:if test="${status.first }">
								<ul class="nav nav-pills" id="tablist">
								<c:set var="PRE_FILE_TAG_CONTENT" value="${item.FILE_TAG_CONTENT }" />
								<li class="nav-item" role="presentation"><a class="nav-link <c:if test="${status.index ==0}">active</c:if>" id="tab1-${status.index}" data-toggle="tab" href="#tab-cont1-${status.index}"   data-selected="true">${item.FILE_TAG_CONTENT }</a></li>
							</c:if>
							<c:if test="${PRE_FILE_TAG_CONTENT != item.FILE_TAG_CONTENT }">
								<c:set var="PRE_FILE_TAG_CONTENT" value="${item.FILE_TAG_CONTENT }" />
								<li class="nav-item" role="presentation"><a class="nav-link <c:if test="${status.index ==0}">active</c:if>" id="tab1-${status.index}" data-toggle="tab" href="#tab-cont1-${status.index}"   data-selected="false">${item.FILE_TAG_CONTENT }</a></li>
							</c:if>
							<c:if test="${status.last }">
								</ul>
							</c:if>
						</c:if>
					</c:forEach>
				<!------------ end : 1depth 첨부파일 그룹-->

				<!------------ start : 1depth 첨부파일 목록-->
				<c:set var="PRE_FILE_TAG_CONTENT" value="" />
				<div class="tab-content">
					<c:forEach var="item" items="${menuFileList}" varStatus="status">
						<c:if test="${status.first }">
							<c:set var="PRE_FILE_TAG_CONTENT" value="${item.FILE_TAG_CONTENT }" />
							<div class="tab-pane fade <c:if test="${status.index ==0}">show active</c:if>" id="tab-cont1-${status.index}"  aria-labelledby="tab1-${status.index}" >
							<div class="message-box message-box-style-2">
							<div class="message-box-inner">
							<div class="message-header">
								<img src="/common/images/message_box_icon_01.svg" alt="">
							</div>
							<div class="message-body">
						</c:if>
						<c:if test="${PRE_FILE_TAG_CONTENT != item.FILE_TAG_CONTENT }">
							<c:set var="PRE_FILE_TAG_CONTENT" value="${item.FILE_TAG_CONTENT }" />
							</div>
							</div>
							</div>
							</div>
							<div class="tab-pane fade <c:if test="${status.index ==0}">show active</c:if>" id="tab-cont1-${status.index}"  aria-labelledby="tab1-${status.index}" >
							<div class="message-box message-box-style-2">
							<div class="message-box-inner">
							<div class="message-header">
								<img src="/common/images/message_box_icon_01.svg" alt="">
							</div>
							<div class="message-body">
						</c:if>

								<div class="my-2">
				                    ${item.ORIGIN_FILE_NM2}
				                    	<a class="btn btn-sm btn-primary" href="javascript:void(0);" onclick="fn_popupMultiFileViewr('/file/download.do?${item.PARAM_CODE}',this)" onkeypress='this.onclick' data-lang title="새창열기">뷰어<i class="bi bi-eye" aria-hidden="true"></i></a>
				                    	<a class="btn btn-sm btn-primary" href="/file/download.do?${item.PARAM_CODE }" data-lang>다운로드<i class="bi bi-download" aria-hidden="true"></i></a>
			                    </div>
							
						<c:if test="${status.last }">
							</div>
							</div>
							</div>
							</div>
						</c:if>
				</c:forEach>
			</div>
			<!------------ end : 1depth 첨부파일 목록-->
			</div><!-- file_tabs1 -->
			</c:if>
			<!------------ start : 컨텐츠 목록 -->
			<!----- 컨텐츠 목록1개 이상 이면 -->
			<c:if test="${fn:length(contentList)  > 0 }">
			<div id="content_tabs1">
				<!------------ start : 컨텐츠 목록 탭메뉴 -->
				<c:if test="${fn:length(contentList)  != 1 }"> <!-- 컨텐츠 목록이 1개 이상일때만 컨텐츠 탭메뉴 노출 -->
				<ul class="nav nav-pills" id="tablist">
					<c:forEach var="item" items="${contentList}" varStatus="status">
						<li class="nav-item" role="presentation"><a class="nav-link <c:if test="${status.index ==0}">active</c:if>" id="tab${status.index}" data-toggle="tab" href="#tab-cont${status.index}"   data-selected="<c:if test="${status.first }">true</c:if><c:if test="${!status.first }">false</c:if>">${item.CONTENT_NM }</a></li>
					</c:forEach>
				</ul>
				</c:if>
				<!------------ end : 컨텐츠 목록 탭메뉴 -->
				
				<!------------ start : 컨텐츠 목록 내용 -->
				<div class="tab-content">
					<c:forEach var="content" items="${contentList}" varStatus="content_status">
						<div class="tab-pane fade <c:if test="${content_status.index ==0}">show active</c:if>" id="tab-cont${content_status.index}"  aria-labelledby="tab${content_status.index}">
						
						<div id="file_tabs2">
						<!------------ start : 2depth 첨부파일 그룹-->
						<c:if test="${fn:length(content.contentFileList)  > 0 }">
						<c:set var="PRE_FILE_TAG_CONTENT" value="" />
						
							<c:forEach var="item" items="${content.contentFileList}" varStatus="status">
								<c:if test="${item.FILE_TAG_CONTENT != '' && item.FILE_TAG_CONTENT != null}">
									<c:if test="${status.first }">
										<ul class="nav nav-pills" id="tablist">
										<c:set var="PRE_FILE_TAG_CONTENT" value="${item.FILE_TAG_CONTENT }" />
										<li class="nav-item" role="presentation"><a class="nav-link <c:if test="${status.index ==0}">active</c:if>" id="file-tab2-${status.index}" data-toggle="tab" href="#file-tab-cont2-${status.index}"  data-selected="true">${item.FILE_TAG_CONTENT }</a></li>
									</c:if>
									<c:if test="${PRE_FILE_TAG_CONTENT != item.FILE_TAG_CONTENT }">
										<c:set var="PRE_FILE_TAG_CONTENT" value="${item.FILE_TAG_CONTENT }" />
										<li class="nav-item" role="presentation"><a class="nav-link <c:if test="${status.index ==0}">active</c:if>" id="file-tab2-${status.index}" data-toggle="tab" href="#file-tab-cont2-${status.index}"  data-selected="false">${item.FILE_TAG_CONTENT }</a></li>
									</c:if>
									<c:if test="${status.last }">
										</ul>
									</c:if>
								</c:if>
							</c:forEach>
						
						<!------------ end : 2depth 첨부파일 그룹-->
		
						<!------------ start : 2depth 첨부파일 목록-->
						<c:set var="PRE_FILE_TAG_CONTENT" value="" />
						<div class="tab-content">
							<c:forEach var="item" items="${content.contentFileList}" varStatus="status">
								<c:if test="${status.first }">
									<c:set var="PRE_FILE_TAG_CONTENT" value="${item.FILE_TAG_CONTENT }" />
									<div class="tab-pane fade <c:if test="${status.index ==0}">show active</c:if>" id="file-tab-cont2-${status.index}"  aria-labelledby="file-tab2-${status.index}">
									<div class="message-box message-box-style-2">
									<div class="message-box-inner">
									<div class="message-header">
										<img src="/common/images/message_box_icon_01.svg" alt="">
									</div>
									<div class="message-body">
								</c:if>
								<c:if test="${PRE_FILE_TAG_CONTENT != item.FILE_TAG_CONTENT }">
									<c:set var="PRE_FILE_TAG_CONTENT" value="${item.FILE_TAG_CONTENT }" />
									</div>
									</div>
									</div>
									</div>
									<div class="tab-pane fade <c:if test="${status.index ==0}">show active</c:if>" id="file-tab-cont2-${status.index}"  aria-labelledby="file-tab2-${status.index}">
									<div class="message-box message-box-style-2">
									<div class="message-box-inner">
									<div class="message-header">
										<img src="/common/images/message_box_icon_01.svg" alt="">
									</div>
									<div class="message-body">
								</c:if>
									<div class="my-2">
					                    ${item.ORIGIN_FILE_NM2}
					                    	<a class="btn btn-sm btn-primary" href="javascript:void(0);" onclick="fn_popupMultiFileViewr('/file/download.do?${item.PARAM_CODE}',this)" onkeypress='this.onclick' data-lang title="새창열기">뷰어<i class="bi bi-eye" aria-hidden="true"></i></a>
					                    	<a class="btn btn-sm btn-primary" href="/file/download.do?${item.PARAM_CODE }" data-lang>다운로드<i class="bi bi-download" aria-hidden="true"></i></a>
				                    </div>
								<c:if test="${status.last }">
									</div><!-- message-body -->
									</div><!-- message-box-inner -->
									</div><!-- message-box  -->
									</div><!-- tab-pane fade -->
									
								</c:if>
						</c:forEach>
					</div>
					</c:if>
					<!------------ end : 2depth 첨부파일 목록-->
					</div><!-- file_tabs2 -->
						<c:if test="${SESSION_LOCALE =='0001' }">
						${content.KOR_CONTENT }
						</c:if>
						<c:if test="${SESSION_LOCALE =='0002' }">
							<c:choose>
								<c:when test="${content.ENG_CONTENT == null or content.ENG_CONTENT == '' }">
									${content.KOR_CONTENT }
								</c:when>
								<c:otherwise>
									${content.ENG_CONTENT }
								</c:otherwise>
							</c:choose>						
						</c:if>
						<c:if test="${SESSION_LOCALE =='0003' }">
							<c:choose>
								<c:when test="${content.CHN_CONTENT == null or content.CHN_CONTENT == '' }">
									<c:choose>
										<c:when test="${content.ENG_CONTENT == null or content.ENG_CONTENT == '' }">
											${content.KOR_CONTENT }
										</c:when>
										<c:otherwise>
											${content.ENG_CONTENT }
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									${content.CHN_CONTENT }
								</c:otherwise>
							</c:choose>
						</c:if>
						</div><!-- // .tab-content .tab-pane-->
					</c:forEach>
				</div> <!-- // .tab-content-->
			</c:if> <!-- fn:length(contentList)  > 0  -->
			
			
		
		</div>
		<!------------ end : 컨텐츠 목록 내용 -->
		<!------------ end : 컨텐츠 목록 -->
		</div> <!-- sec-body contents-page -->
</section>
</main>
</div>


<script type="text/javascript">
	function fn_initScreen() {
		<c:if test="${fn:length(contentList)  == 0 }" >
		$('.contents-page').html(gfn_com_valencode(scwin.menuInfo.KOR_CONTENT));
		</c:if>
		
		if($(".accordion")){
			initAccordion();
		}
		setTimeout(function() {
		//loadscript($("body"), "/common/js/tabs.js");
		//$("#file_tabs1").tabfocuser();	
		//$("#content_tabs1").tabfocuser();
		//$("#file_tabs2").tabfocuser();
		
		tabFocusAccessibilityCtl('file_tabs1');
		tabFocusAccessibilityCtl('content_tabs1');
		//tabFocusAccessibilityCtl('file_tabs2');
		
		$("table").each(function(i,o){
			if ($(this).hasVerticalScrollBar()_cont || $(this).hasHorizontalScrollBar()_cont) { 
				$(this).attr("tabindex",0);
			}
		});
		
		
		
		}, 500);
		
		
		
	}
</script>