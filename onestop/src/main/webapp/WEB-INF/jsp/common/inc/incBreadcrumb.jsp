<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div id="breadcrumb">
    <div class="container">
	  <nav aria-label="경로 내비게이션" class="breadcrumb">
	    <ol>
	      <li>
	        <a href="/" title="메인홈 바로가기">
	          <img src="/common/images/home_white.svg" alt="홈">
	        </a>
	      </li>
	      <li>
	        <span id="menu_path">_</span>
	      </li>	      
	    </ol>
	  </nav>
	</div>
</div>
<script type="text/javascript" language="javascript" >
	if(gfn_str_parseNull(scwin.menuInfo) != ""){
		$('#menu_path').text(scwin.menuInfo.PATH_MENU_KOR_NM);	
	}
    
</script>