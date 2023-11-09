$(function() {
  var mediaXL = window.matchMedia('(min-width: 1200px)');
  var duration = 100; // 애니메이션 duration
var duration300 = 300; // 애니메이션 duration    

  /*#################### 레이아웃 ####################*/

  initLayout();
  $(window).on('orientationchange resize', initLayout);

  /* 테스트 */
  setTimeout(function() {
    //$('.menubar-main > li:first-child > [role="menuitem"]').trigger('mouseenter');
  }, 0);
  

  /** 페이지 전체 레이아웃을 초기화한다. */
  function initLayout() {
    if (isPC()) {
      changeLayoutForPC();
    } else {
      changeLayoutForMobile();
    }    
  }

  /** PC 화면 레이아웃으로 변경한다. */
  function changeLayoutForPC() {
    moveAuthForPC();
    moveMenubarEtcForPC();

    closeSide();
    closeAllHeaderMenu();
    resetMenuboxHeight();
    closeMenubarEtc();
  }

  /** Mobile 화면 레이아웃으로 변경한다. */
  function changeLayoutForMobile() {
    moveAuthForMobile();
    moveMenubarEtcForMobile();
  }

  /*#################### 헤더 ####################*/
if (isMobile()) {
	$(".header-item .heading").attr("tabindex","-1");

	$(".header-item .menu-wrapper a").attr("tabindex","-1");
	$(".menu-wrapper .close-btn").attr("tabindex","-1");
}else{
	$(".menu-wrapper .close-btn").attr("tabindex","-1");
}

  // Side 열기 버튼 클릭.
  $('.header-item .menu-btn').on('click', function(event) {
    if (isMobile()) {
	  $(".header-item .menu-wrapper a").removeAttr("tabindex");
	  $(".menu-wrapper .close-btn").removeAttr("tabindex");
      event.preventDefault();
      toggleSide();
	  location.href="#menu-wrapper-inner";
    } else {
      fn_Sitemap();
    }
  });  



  // Side 닫기 버튼 클릭.
  $('.menu-wrapper .close-btn').on('click', closeSide);

  // 헤더 백도롭 클릭.
  $('.header-backdrop').on('click', function() {
    if (isMobile()) {
      closeSide();
    } else {
      closeMenubarEtc();
    }
  });

  // 헤더에 있는 Menu 클릭.
  $('#header .menubar').on('click', 'a', function() {
    if (isMobile()) {
      toggleMenu($(this));
    }
  });

  // 기타메뉴의 Menu 클릭.
  $('.menubar .menubar-etc').on('click', 'a', function() {
    if (isPC()) {
      if (getMenuDepth($(this)) == 1) {
        closeAllEtcMenu();
      }      
      openEtcMenu($(this));  
    }
  });

  // 전체메뉴의 1뎁스 메뉴 위로 마우스 오버.
  $('.menubar-main > li > a').on('mouseenter focusin', function() {
    if (isPC()) {
      slideDownMenubox($(this));      
    }
  });

  // 전체메뉴의 1뎁스 메뉴 위에서 마우스 아웃.
  $('.menubar-main').on('mouseleave', function() {
    if (isPC()) {
      slideUpMenubox();      
    }
  });


  $('.list-no-gutter').on('focusin ', function() {
    if (isPC()) {
      slideUpMenubox();
    }
  });


  // 메뉴 더보기 버튼 클릭.
  $('.header-main .menu-more-btn').on('click', toggleMenubarEtc);  

  // 기타메뉴 transition end callback.
  $(".header-main .menubar-etc-box").on('transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', function() {
    //applyEtcMenuVisibility();
  });

  // 헤더의 위치 변경
  changeHeaderPosition();
  $(window).on('scroll', changeHeaderPosition);

  /** Side를 토글한다. */
  function toggleSide() {    
    if (isSideOpen()) {
      closeSide();
    } else {
      openSide();
    }
  }

  /** Side를 연다. */
  function openSide() {
    $('.menu-wrapper').addClass('show');
    applyBodyNoScroll();
    showHeaderBackdrop();
    $('.menubar-main .menubox').removeAttr('style');
    addBodyScrollWidthToHeader();
  }

  /** Side를 닫는다. */
  function closeSide() {
	if (isMobile()) {
		$(".header-item .menu-wrapper a").attr("tabindex","-1");
		$(".menu-wrapper .close-btn").attr("tabindex","-1");
	}
    $('.menu-wrapper').removeClass('show');    
    hideHeaderBackdrop();
    setTimeout(function() {
      applyBodyScroll();
      removeBodyScrollWidthFromHeader();
    }, 250);
  }

  /**
   * Side의 열림 여부를 반환한다.
   * @returns {boolean} Side의 열림 여부 반환.
   */
  function isSideOpen() {
    return $('.menu-wrapper').is('.show');
  }

  /** 헤더 백드롭을 보여준다. */
  function showHeaderBackdrop() {
    $('.header-backdrop').fadeIn(duration);
  }

  /** 헤더 백드롭을 감춘다. */
  function hideHeaderBackdrop() {
    $('.header-backdrop').fadeOut(duration);
  }

  /**
   * 메뉴를 토글한다.
   * @param {jQuery} $menuitem - 토글할 menuitem.
   */
  function toggleMenu($menuitem) {
    if ($menuitem.attr('data-expanded') == 'false') {
      openMenu($menuitem);
    } else {
      closeMenu($menuitem);
    }
  }

  /**
   * 메뉴를 연다.
   * @param {jQuery} $menuitem - 열 menuitem.
   */
  function openMenu($menuitem) {
    var $next = $menuitem.next();      

    $menuitem.attr('data-expanded', 'true');
    if ($next.is('#menu')) {
      $next.finish().slideDown(duration, function() {
        $menuitem.attr('data-expanded', 'true');
      });
    } else {
      $next.removeAttr('style');
      $next.find('.menubox-inner > #menu').finish().slideDown(duration, function() {
        $menuitem.attr('data-expanded', 'true');
      });
    }
  }  

  /**
   * 메뉴를 닫는다.
   * @param {jQuery} $menuitem - 닫을 menuitem
   */
  function closeMenu($menuitem) {
    var $next = $menuitem.next();

    $menuitem.attr('data-expanded', 'false');
    if ($next.is('#menu')) {
      $next.finish().slideUp(duration, function() {
        $menuitem.attr('data-expanded', 'false');
      });
    } else {        
      $next.find('.menubox-inner > #menu').finish().slideUp(duration, function() {
        $menuitem.attr('data-expanded', 'false');
      });
    }
  }

  /**
   * 모든 메뉴들을 닫는다.
   */
  function closeAllHeaderMenu() {
    $('#header a [data-haspopup="true"]').attr('data-expanded', 'false');
    $('#header #menu').finish().removeAttr('style');
    $('.menubar-main .menubox').removeAttr('style');
  }

  /**
   * 지정된 1뎁 메뉴의 Menu Box를 슬라이드다운 한다.
   * @param {jQuery} $1depthMenuitem - 지정된 1뎁스 메뉴.
   */
  function slideDownMenubox($1depthMenuitem) {
    var $menuboxes = $('.menubox');
    var $menu = $1depthMenuitem.next('.menubox').find('> .menubox-inner > #menu');
    var menuHeight = $menu.attr('data-height');

	if(menuHeight > $(window).height()){
		menuHeight = $(window).height()-80;
	}

    $('.menubar-main > li > a').removeClass('active');
    $1depthMenuitem.addClass('active');
	$menuboxes.css("display","none");
	$1depthMenuitem.next('.menubox').css("display","block");
    $1depthMenuitem.next('.menubox').stop().animate({
      height: menuHeight
    }, duration300);

    showHeaderBackdrop();
  }

  /** 지정된 1뎁스 메뉴의 Menu Box를 슬라이드업 한다.  */
  function slideUpMenubox() {    
    var $menuboxes = $('.menubox');

    $menuboxes.stop().animate({
      height: '0'
    }, duration, function() {
      $('.menubar-main > li > a').removeClass('active');
    });

    if (!isMenubarEtcOpen()) {
      hideHeaderBackdrop();
    }
  }
  
  /** Menu Box의 높이를 초기화한다. */
  function resetMenuboxHeight() {
    var $subMenus = $('.menubox > .menubox-inner > #menu');

    $subMenus.each(function() {
      var $menuboxInner = $(this).parent();
      var minHeight = 300;

      $menuboxInner.css('height', 'auto');

      var height = $(this).outerHeight();

      height = height < minHeight ? minHeight : height;
      $(this).attr('data-height', height);

      $menuboxInner.css('height', '100%');
    });
  }

  /**
   * 지정된 메뉴의 뎁스를 반환한다.
   * @param {jQuery} $menuitem - 지정된 메뉴.
   * @returns {number} 지정된 메뉴의 뎁스.
   */
   function getMenuDepth($menuitem) {
    return $menuitem.parents('#menu').length + 1;
  }

  /** 기타메뉴를 PC 화면에 맞게 옮긴다. */
  function moveMenubarEtcForPC() {
    $('.menu-more-box .menubar-etc-box').append($('#menu .menubar-etc'));
  }

  /** 기타메뉴를 Mobile 화면에 맞게 옮긴다. */
  function moveMenubarEtcForMobile() {
    $('#menu > .sec-body').append($('.menu-more-box .menubar-etc'));
  }

  /** 메뉴 더보기를 토글한다. */
  function toggleMenubarEtc() {
    if(isMenubarEtcOpen()) {      
      closeMenubarEtc();
    } else {
      openMenubarEtc();
    }
  }

  /** 기타메뉴를 연다. */
  function openMenubarEtc() {
    $('.header-main .menu-more-box').addClass('active');
    applyBodyNoScroll();
    showHeaderBackdrop();    
    applyFirstEtcMenuOpen();
    addBodyScrollWidthToHeader();
  }

  /** 기타메뉴를 닫는다. */
  function closeMenubarEtc() {    
    $('.header-main .menu-more-box').removeClass('active');
    applyBodyScroll();
    hideHeaderBackdrop();
    removeBodyScrollWidthFromHeader();    
  }

  /**
   * 기타메뉴의 열림 여부를 반환한다.
   * @returns {boolean} 기타메뉴의 열림 여부.
   */
  function isMenubarEtcOpen() {
    return $('.header-main .menu-more-box').is('.active');
  }

  /**
   * 기타메뉴의 지정된 메뉴를 연다.
   * @param {jQuery} $menuitem - 지정된 메뉴.
   */
  function openEtcMenu($menuitem) {
    $menuitem.attr('data-expanded', 'true');
  }

  /**
   * 기타메뉴의 지정된 메뉴를 닫는다.
   * @param {jQuery} $menuitem - 지정된 메뉴.
   */
  function closeEtcMenu($menuitem) {
    $menuitem.attr('data-expanded', 'false');
  }

  /** 기타메뉴의 모든 메뉴를 닫는다. */
  function closeAllEtcMenu() {
    $('.menubar-etc > li > a').attr('data-expanded', 'false');
  }

  /** 기타메뉴의 첫 번째 메뉴를 연다. */
  function applyFirstEtcMenuOpen() {
    closeAllEtcMenu();
    $('.menubar-etc > li:first-child > a').attr('data-expanded', 'true');
  }

  /**
   * 지정된 Menuitem이 기타메뉴에 포함된 메뉴인지 여부를 반환한다.
   * @param {jQuery} $menuitem - 지정된 Menuitem.
   * @returns {boolean} 지정된 Menuitem이 기타메뉴에 포함된 메뉴인지 여부.
   */
  function isMenuitemFromEtc($menuitem) {
    return Boolean($menuitem.closest('.menubar-etc').length);
  }

  /** <body> 요소가 스크롤되지 않도록 한다. */
  function applyBodyNoScroll() {
    $('body').addClass('modal-open');
    $('body').css('padding-right', getScrollbarWidth());
  }

  /** <body> 요소가 스크롤되도록 한다. */
  function applyBodyScroll() {
    $('body').removeClass('modal-open');
    $('body').removeAttr('style');
  }

  /**
   * <body> 요소의 수직 스크롤바 width를 반환한다.
   * @returns {number} <body> 요소의 수직 스크롤바 width.
   */
  function getScrollbarWidth() {
    // Creating invisible container
    var outer = document.createElement('div');
    outer.style.visibility = 'hidden';
    outer.style.overflow = 'scroll'; // forcing scrollbar to appear
    outer.style.msOverflowStyle = 'scrollbar'; // needed for WinJS apps
    document.body.appendChild(outer);
  
    // Creating inner element and placing it in the container
    var inner = document.createElement('div');
    outer.appendChild(inner);
  
    // Calculating difference between container's full width and the child width
    var scrollbarWidth = (outer.offsetWidth - inner.offsetWidth);
  
    // Removing temporary elements from the DOM
    outer.parentNode.removeChild(outer);
  
    return scrollbarWidth;
  }

  /** <body> 스크롤 위치에 따라 헤더의 위치를 변경한다. */
  function changeHeaderPosition() {
    var $headerMain = $('#header .header-main');
    var $headerSub = $('#header .header-sub');
    var headerMainHeight = $headerMain.outerHeight();
    var headerSubHeight = $headerSub.outerHeight();
    var posTop = $(window).scrollTop();

    if (posTop > headerSubHeight) {
      if (!$headerSub.next('.header-main-dummy').length) {
        $headerSub.after('<div class="header-main-dummy"></div>');
        $headerSub.next('.header-main-dummy').css('height', headerMainHeight);
      }
      $headerMain.addClass('fixed');
    } else {
      $headerSub.next('.header-main-dummy').remove();
      $headerMain.removeClass('fixed');
    }
  }

  /** 헤더에 <body> 수직 스크롤의 너비를 더한다. */
  function addBodyScrollWidthToHeader() {
    var $headerMain = $('.header-main');
    if ($headerMain.is('.fixed')) {
      $headerMain.css('padding-right', getScrollbarWidth());
    }
  }

  /** 헤더에서 <body> 수직 스크롤의 너비를 없앤다. */
  function removeBodyScrollWidthFromHeader() {
    var $headerMain = $('.header-main');
    if ($headerMain.is('.fixed')) {
      $headerMain.removeAttr('style');
    }
  }

  /*#################### 사이드 ####################*/

  // 사이드에 있는 Menu 클릭.
  $('#side .menubar').on('click', 'a', function() {
    toggleMenu($(this));
  });

  /*#################### 메인 페이지 ####################*/

  /** 인증 영역을 PC 화면에 맞게 옮긴다. */
  function moveAuthForPC() {
    /*var $smartSearch = $('.sec-smart-search');
    var $secAuth = $('#header .sec-auth');

    if ($smartSearch.length) {
	  $('.dummy-auth').remove();
      $smartSearch.before($secAuth);
	  $('.sec-auth').removeClass('d-none');
	  if(scwin.loginUser.userId) {
			$('.sec-auth .logged-in-view').show();
			$('.sec-auth > header, .sec-auth .logged-out-view').hide();
		} else {
			$('.sec-auth .logged-in-view').hide();
			$('.sec-auth > header, .sec-auth .logged-out-view').show();
		}
    } else {
      $secAuth.addClass('hide');
    }*/
  }

  /** 인증 영역을 Mobile 화면에 맞게 옮긴다. */
  function moveAuthForMobile() {
    /*var $menu = $('#menu');

    if ($menu.length) {
      $menu.before($('#main .sec-auth'));
    }

    $('#menu .sec-auth').removeClass('hide');*/
  }

  /*#################### 공통 함수 ####################*/

  /**
   * PC 화면 여부를 반환한다.
   * @returns {boolean} PC 화면 여부.
   */
   function isPC() {
    return mediaXL.matches;
  }

  /**
   * Mobile 화면 여부를 반환한다.
   * @returns {boolean} Mobile 화면 여부.
   */
  function isMobile() {
    return !isPC();
  }
});

initCommon();	// 공통

/**
 * 공통 
 */
function initCommon() {
  $('.carousel-box .prev-btn').on('click', function() {
    $(this).closest('.carousel-box').find('.owl-carousel').trigger('prev.owl.carousel');
  });

  $('.carousel-box .next-btn').on('click', function() {
    $(this).closest('.carousel-box').find('.owl-carousel').trigger('next.owl.carousel');
  });
  $('.carousel-wrapper .prev-btn').on('click', function() {
    $(this).closest('.carousel-wrapper').find('.owl-carousel').trigger('prev.owl.carousel');
  });

  $('.carousel-wrapper .next-btn').on('click', function() {
    $(this).closest('.carousel-wrapper').find('.owl-carousel').trigger('next.owl.carousel');
  });

  // carousel 자동실행, 정지 버튼
  $('.carousel-btns .play-pause').on('click', function() {
    var $carousel = $(this).closest('.carousel-box').find('.owl-carousel');
    if ($(this).is('.pause')) {
      $carousel.trigger('stop.owl.autoplay');
      $(this)
        .removeClass('pause')
        .addClass('play');
      $(this).find('span').text('자동실행');
    } else {
      $carousel.trigger('play.owl.autoplay');
      $(this)
        .removeClass('play')
        .addClass('pause');
      $(this).find('span').text('정지');
    }
  });
}


    /*#################### 아코디언 전체 제어 - 20220113 - yjikim ####################*/

    initAccordion();

    function initAccordion() {
      if ($('.container-sub .accordion').length) {
		if($('.accordion').closest("section").find(".expand").length == 0){
			$('.accordion').before("<div class='expand text-right mb-2'></div>");
  	    	$('.expand').prepend("<button id='expandAll' class='btn btn-xs btn-primary'>전체 열기 <i class='bi bi-chevron-bar-expand' aria-hidden='true'></i></button>"); 
    	    $('.expand').prepend("<button id='collapseAll' class='btn btn-xs btn-primary'>전체 닫기 <i class='bi bi-chevron-bar-contract' aria-hidden='true'></i></button>");  	
		}else{
			$('.accordion').closest("section").find(".expand").remove();
			$('.accordion').before("<div class='expand text-right mb-2'></div>");
  	    	$('.expand').prepend("<button id='expandAll' class='btn btn-xs btn-primary'>전체 열기 <i class='bi bi-chevron-bar-expand' aria-hidden='true'></i></button>"); 
    	    $('.expand').prepend("<button id='collapseAll' class='btn btn-xs btn-primary'>전체 닫기 <i class='bi bi-chevron-bar-contract' aria-hidden='true'></i></button>");
		}
        
        //$('.card .collapse').collapse('show');
  
        if($('.collapse.show').length) { 
          $('.expand #collapseAll').show();
          $('.expand #expandAll').hide();
        } else {
          $('.expand #collapseAll').hide();
          $('.expand #expandAll').show();
        }
  
        $('.expand #expandAll').on('click', function() {
          $(this).parent().next().find('.card .collapse').collapse('show');
		  $(this).parent().next().find('.card .card-header button').attr("title","접기");
          $(this).parent().find('#collapseAll').show();
		  $(this).parent().find('#collapseAll').focus();
          $(this).parent().find('#expandAll').hide();
        });
        $('.expand #collapseAll').on('click', function() {
          $(this).parent().next().find('.card .collapse').collapse('hide');
		  $(this).parent().next().find('.card .card-header button').attr("title","열기");  
          $(this).parent().find('#expandAll').show();
		  $(this).parent().find('#expandAll').focus();
          $(this).parent().find('#collapseAll').hide();
        });
      }
    }

function addPlayPauseBtn(_obj) {
	
}
  
  /* 
    if ($next.is('[role="menu"]')) { 
  
    } else {
  
    }
      
  */