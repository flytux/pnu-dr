<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="ko">
    <jsp:include page="inc/incCommonCss.jsp" flush="false" />
	<body>
	   <jsp:include page="inc/incCommonJs.jsp" flush="false" />
	   <div id="root">	
	       <jsp:include page="inc/incHeader.jsp" flush="false" />
	       <jsp:include page="inc/incBreadcrumb.jsp" flush="false" />
	       <div class="container container-sub">
	           <jsp:include page="inc/incLeftMenu.jsp" flush="false" />
               <div class="viewpage" id="viewpage" >
               		<jsp:include page="${viewpage}" flush="false" />
               	</div>
	       </div>
	       <jsp:include page="inc/incFooter.jsp" flush="false" />	  
	   </div>     
    </body>
</html>