<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>

<div class="col-side">
	<div id="side">
	    <!-- 좌측메뉴 -->
		<nav class="nav-side">
		  <header>
		    <h2 class="sec-title" id="menu_title">수업</h2>
		  </header>
		  <div class="sec-body" id="left_menu">
		    
		  </div>
		</nav>
		<!-- /END 좌측메뉴 -->
	</div>	
</div>
<script type="text/javascript" language="javascript" >
    var list = scwin.menuList;    
    var menuCD = '${menuCD}';
    var selMenu = gfn_com_getMatchedJSON(list, 'MENU_CD', menuCD);
    
    
    if(gfn_str_parseNull(selMenu) != "" ){
	    //현재 선택된 메뉴의 PATH를 가져와서 1Depth의 메뉴정보를 가져온다. 
	    var menuList = selMenu[0].PATH_MENU_CD.split(">");
	    var menu1Depth = gfn_com_getMatchedJSON(list, 'MENU_CD', menuList[1]);    
	    
	    $('#menu_title').text(menu1Depth[0].MENU_KOR_NM);    
	    //2Depth 메뉴 리스트 가져오기
	    var menu2Depth = gfn_com_getMatchedJSON(list, 'UPPER_MENU_CD', menu1Depth[0].MENU_CD);
	    var menuItem = '<div class="sec-body">';
	    menuItem += '<ul class="menubar-side menubar"  >';
	    var i = 0;
	    for ( var menu2 in menu2Depth) {    	
	    	//3Depth 메뉴 리스트 가져오기
	        var menu3Depth = gfn_com_getMatchedJSON(list, 'UPPER_MENU_CD', menu2Depth[menu2].MENU_CD);
	        if(menu3Depth.length > 0 || menu2Depth[menu2].MENU_GCD =='0002'){	
		        menuItem += '<li >';
		        if(menu2Depth[menu2].PATH_MENU_CD.indexOf(menuList[2]) >= 0){
		        	if(menu2Depth[menu2].MENU_GCD == '0002'){
		        	    if(menu2Depth[menu2].MENU_CONTENT_GCD =="0004"){
		        	    	menuItem += '<a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="'+menu2Depth[menu2].MENU_VAR_INFO+'" target="_blank" data-haspopup="true" data-expanded="true" title="새창열림">' + langMenuNm(menu2Depth[menu2]) + '</a>';
		        	    }else{
		        	        menuItem += '<a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="javascript:selectMenu(\''+menu2Depth[menu2].MENU_CD+'\');" data-haspopup="true" data-expanded="true">' + langMenuNm(menu2Depth[menu2]) + '</a>';
		        	    }
		        	} else {
		        		menuItem += '<a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="#left_'+menu2Depth[menu2].MENU_CD+'" data-haspopup="true" data-expanded="true">' + langMenuNm(menu2Depth[menu2]) + '</a>';
		        	}
		        	if(menu3Depth.length > 0 ){	
		            menuItem += '<ul id="menu" style="display: block;" >';
		        	}
		        } else {
		        	if(menu2Depth[menu2].MENU_GCD == '0002'){
		        	    
		        	    if(menu2Depth[menu2].MENU_CONTENT_GCD =="0004"){
		        	    	menuItem += '<a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="'+menu2Depth[menu2].MENU_VAR_INFO+'" target="_blank" data-haspopup="true" data-expanded="false" title="새창열림">' + langMenuNm(menu2Depth[menu2]) + '</a>';
		        	    }else{
		        	        menuItem += '<a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="javascript:selectMenu(\''+menu2Depth[menu2].MENU_CD+'\');" data-haspopup="true" data-expanded="false">' + langMenuNm(menu2Depth[menu2]) + '</a>';
		        	    }

		        	} else {
		        		menuItem += '<a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="#left_'+menu2Depth[menu2].MENU_CD+'" data-haspopup="true" data-expanded="false">' + langMenuNm(menu2Depth[menu2]) + '</a>';
		        	}
		        	if(menu3Depth.length > 0 ){	
		        	menuItem += '<ul id="menu" >';
		        	}
		        }
	        }       
	        
	        for ( var menu3 in menu3Depth) {
	        	if(menu3Depth[menu3].MENU_CD.indexOf(menuCD)>= 0){
	        		if(menu3Depth[menu3].MENU_GCD == '0002'){
	        		    if(menu3Depth[menu3].MENU_CONTENT_GCD =="0004"){
	        	    		menuItem += '<li ><a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="'+menu3Depth[menu3].MENU_VAR_INFO+'" target="_blank"  style="font-weight:bold;color:#904c8b;" title="새창열림">' + langMenuNm(menu3Depth[menu3]) + '</a></li>';
	        		    }else{
	        		        menuItem += '<li ><a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="javascript:selectMenu(\''+menu3Depth[menu3].MENU_CD+'\');" style="font-weight:bold;color:#904c8b;" title="선택됨">' + langMenuNm(menu3Depth[menu3]) + '</a></li>';
	        		    }
	        		} else {
	        			menuItem += '<li ><a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="left_#'+menu3Depth[menu3].MENU_CD+'" style="font-weight:bold;color:#904c8b;" title="선택됨">' + langMenuNm(menu3Depth[menu3]) + '</a></li>';
	        		}
	        	} else {
	        		if(menu3Depth[menu3].MENU_GCD == '0002'){
	        		    if(menu3Depth[menu3].MENU_CONTENT_GCD =="0004"){
	        		        menuItem += '<li ><a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="'+menu3Depth[menu3].MENU_VAR_INFO+'" target="_blank" title="새창열림">' + langMenuNm(menu3Depth[menu3]) + '</a></li>';
	        		    }else{
	        		        menuItem += '<li ><a  id="left_'+menu2Depth[menu2].MENU_CD+'" href="javascript:selectMenu(\''+menu3Depth[menu3].MENU_CD+'\');">' + langMenuNm(menu3Depth[menu3]) + '</a></li>';
	        		    }
	        			
	        		} else {
	        			menuItem += '<li ><a  href="'+menu3Depth[menu3].MENU_CD+'">' + langMenuNm(menu3Depth[menu3]) + '</a></li>';
	        		}
	        	}
	        }        
	        if(menu3Depth.length > 0 ){
	        menuItem += '</ul>';
	        }
	        if(menu3Depth.length > 0 || menu2Depth[menu2].MENU_GCD =='0002'){
	        menuItem += '</li>';
	        }
	        i++;
	    }
    
    $('#left_menu').append(menuItem).trigger("create");    
    }
</script>