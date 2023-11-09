<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<header id="header">
    <div class="header-sub">
      <div class="container">
        <ul class="list list-with-separator">
          <li>
            <a href="javascript:fn_login();" id="login">로그인</a>
            <a href="javascript:fn_logout();" id="logout">로그아웃</a>
          </li>
          <li>
            <a href="#">밀양대학교 학생지원시스템</a>
          </li>
          <li>
            <a href="#">PNU International</a>
          </li>
        </ul>
      </div>
    </div>
    
    <div class="header-main">
      <div class="container">
        <div class="header-item">
          <h1 class="heading" onclick="javascript:location.href='/main'">
            <img class="logo" src="/common/images/logo.svg" alt="">
            <div class="title-box">
              <span class="title">부산대학교</span>
              <span class="sub-title">학생지원시스템</span>
            </div>
          </h1>
        </div>
        <div class="header-item">
          <div class="menu-wrapper">
            <div class="menu-wrapper-inner">
              <ul class="list link-list">
                <li>
                  <a href="#">부산대학교</a>
                </li>
                <li>
                  <a href="#">로그아웃</a>
                </li>
              </ul>

              <!-- 전체메뉴 -->
              <nav id="menu">
                <header>
                  <h2 class="sec-title">전체메뉴</h2>
                </header>
                <div class="sec-body">
                  <ul id="top_menu" class="menubar-main" role="menubar" aria-label="전체메뉴">                
                  </ul>
                  <!-- 기타메뉴
                  <ul class="menubar-etc" role="menubar" aria-label="기타메뉴">
                    <li role="none">
                      <a role="menuitem" href="#" aria-haspopup="true" aria-expanded="false">
                        <img src="/common/images/menubar_etc_icon_01.svg" alt="">
                        <img class="on" src="/common/images/menubar_etc_icon_01_on.svg" alt="">
                        비교과
                      </a>
                      <ul role="menu" aria-label="비교과">
                        <li role="none">
                          <a role="menuitem" href="#" aria-haspopup="true" aria-expanded="false">비교과 소개</a>
                          <ul role="menu" aria-label="비교과 소개">
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                          </ul>
                        </li>
                        <li role="none"><a role="menuitem" href="#">참가신청</a></li>
                        <li role="none"><a role="menuitem" href="#">보고서 및 활동내역</a></li>
                        <li role="none"><a role="menuitem" href="#">인증서 발급</a></li>
                        <li role="none"><a role="menuitem" href="#">마일리지 조회</a></li>
                      </ul>
                    </li>
    
                    <li role="none">
                      <a role="menuitem" href="#" aria-haspopup="true" aria-expanded="false">
                        <img src="/common/images/menubar_etc_icon_02.svg" alt="">
                        <img class="on" src="/common/images/menubar_etc_icon_02_on.svg" alt="">
                        PASS
                      </a>
                      <ul role="menu" aria-label="PASS">
                        <li role="none">
                          <a role="menuitem" href="#" aria-haspopup="true" aria-expanded="false">2뎁스 메뉴</a>
                          <ul role="menu" aria-label="2뎁스 메뉴">
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                          </ul>
                        </li>
    
                        <li role="none">
                          <a role="menuitem" href="#" aria-haspopup="true" aria-expanded="false">2뎁스 메뉴</a>
                          <ul role="menu" aria-label="2뎁스 메뉴">
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                          </ul>
                        </li>
                      </ul>
                    </li>
    
                    <li role="none">
                      <a role="menuitem" href="#" aria-haspopup="true" aria-expanded="false">
                        <img src="/common/images/menubar_etc_icon_03.svg" alt="">
                        <img class="on" src="/common/images/menubar_etc_icon_03_on.svg" alt="">
                        포트폴리오
                      </a>
                      <ul role="menu" aria-label="포트폴리오">
                        <li role="none">
                          <a role="menuitem" href="#" aria-haspopup="true" aria-expanded="false">2뎁스 메뉴</a>
                          <ul role="menu" aria-label="2뎁스 메뉴">
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                          </ul>
                        </li>
    
                        <li role="none">
                          <a role="menuitem" href="#" aria-haspopup="true" aria-expanded="false">2뎁스 메뉴</a>
                          <ul role="menu" aria-label="2뎁스 메뉴">
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                          </ul>
                        </li>
    
                        <li role="none">
                          <a role="menuitem" href="#" aria-haspopup="true" aria-expanded="false">2뎁스 메뉴</a>
                          <ul role="menu" aria-label="2뎁스 메뉴">
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                            <li role="none"><a role="menuitem" href="#">3뎁스 메뉴</a></li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                  </ul>
                  /END 기타메뉴 -->
                </div>
              </nav>
              <!-- /END 전체메뉴 -->
            </div>
    
            <button class="close-btn" type="button">
              <img src="/common/images/close_white.svg" alt="메뉴 닫기">
            </button>
          </div>
        </div>
        <div class="header-item">
          <ul class="list list-no-gutter">
            <li>
              <a href="#">
                <img src="/common/images/notification.svg" alt="알림">
              </a>
            </li>
            <li>          
              <a class="btn btn-icon menu-btn" href="#">
                <img src="/common/images/menu.svg" alt="메뉴">
              </a>
            </li>
          </ul>
          <!-- 기타메뉴
          <div class="menu-more-box">
            <a class="menu-more-btn" href="#">
              <span class="text text-focus">메뉴</span>
              <span class="text">더보기</span>
            </a>
            <button class="btn close-btn">
              <img src="/common/images/close_circle_white.svg" alt="메뉴 더보기 닫기">
            </button>
            <div class="menubar-etc-box"></div>
          </div> 
          /END 기타메뉴 -->
        </div>
      </div>
    </div>
    
    <div class="header-backdrop"></div>
<script type="text/javascript" language="javascript" >
    
    if(scwin.loginUser != null || scwin.loginUser !=""){
        $("#login").hide();   
    } else {
        $("#loginout").hide();
    }
    var list = scwin.menuList;    
    //1Depth 메뉴 리스트 가져오기
    var menu1Depth = gfn_com_getMatchedJSON(list, 'UPPER_MENU_CD', '000000000000000');
    var menuItem = '';
    
    for ( var menu1 in menu1Depth) {        
        menuItem += '<li role="none">';
        menuItem += '<a role="menuitem" aria-haspopup="true" aria-expanded="false">' + menu1Depth[menu1].MENU_KOR_NM + '</a>';        
        menuItem += '<div class="menubox">';
        menuItem += '<div class="menubox-inner">';
        menuItem += '<div class="menu-deco">';
        menuItem += '<p class="menu-deco-title">' + menu1Depth[menu1].MENU_KOR_NM + '</p>';
        menuItem += '<p class="menu-deco-text">PUSAN NATIONAL UNIVERSITY</p>';
        menuItem += '</div>';
        menuItem += '<ul role="menu" aria-label="' + menu1Depth[menu1].MENU_KOR_NM + '">';
        //2Depth 메뉴 리스트 가져오기
        var menu2Depth = gfn_com_getMatchedJSON(list, 'UPPER_MENU_CD', menu1Depth[menu1].MENU_CD);
        for ( var menu2 in menu2Depth) {            
            menuItem += '<li role="none">';
            if(menu2Depth[menu2].MENU_GCD == '0002'){
                menuItem += '<a role="menuitem" href="javascript:selectMenu(\''+menu2Depth[menu2].MENU_CD+'\');" aria-haspopup="true" aria-expanded="false">' + menu2Depth[menu2].MENU_KOR_NM + '</a>';
            } else {
                menuItem += '<a role="menuitem" aria-haspopup="true" aria-expanded="false">' + menu2Depth[menu2].MENU_KOR_NM + '</a>';
            }
            
            menuItem += '<ul role="menu" aria-label="' + menu2Depth[menu2].MENU_KOR_NM + '">';
            //3Depth 메뉴 리스트 가져오기
            var menu3Depth = gfn_com_getMatchedJSON(list, 'UPPER_MENU_CD', menu2Depth[menu2].MENU_CD);
            for ( var menu3 in menu3Depth) {
                if(menu3Depth[menu3].MENU_GCD == '0002'){
                    menuItem += '<li role="none"><a role="menuitem" href="javascript:selectMenu(\''+menu3Depth[menu3].MENU_CD+'\');">' + menu3Depth[menu3].MENU_KOR_NM + '</a></li>';   
                } else {
                    menuItem += '<li role="none"><a role="menuitem">' + menu3Depth[menu3].MENU_KOR_NM + '</a></li>';
                }
                
            }            
            menuItem += '</ul>';
            menuItem += '</li>';    
        }
        
        menuItem += '</ul></div></div></li>';
    }
    
    $('#top_menu').append(menuItem).trigger("create");
    
    var selectMenu = function (menuCD){
        location.href = "/page?menuCD=" + menuCD;
    };
    
    var fn_login = function(){
        location.href = "/login"
    };
    
    var fn_logout = function(){
        var form = $('<form method="POST" action="/logout">');
        form.append('<input type="hidden" name="' + scwin.tokenParameterNm + '" value="' + scwin.token + '" />');
        $('body').append(form);
        form.submit().remove();
    };
</script>
</header>   
<div class="mask novisible"></div>