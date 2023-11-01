$(function() {
  var mediaXL = window.matchMedia('(min-width: 1200px)');
  var duration = 300; // 애니메이션 duration  

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

    closeSideMenu();
    //closeSidePerson();
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

  // Side 열기 버튼 클릭.
  $('.header-main .menu-btn').on('click', function(event) {
    if (isMobile()) {
      event.preventDefault();
      toggleSideMenu();
    } else {
      alert('사이트맵');
    }
  });  

  // Side 열기 버튼 클릭.
  $('.header-main .person-btn').on('click', function(event) {
    if (isMobile()) {
      event.preventDefault();
      toggleSidePerson();
    } 
  });  

  // Sidemenu 닫기 버튼 클릭.
  $('.menu-wrapper .close-btn').on('click', closeSideMenu);
  
  // SidePerson 닫기 버튼 클릭.
  $('.col-side .close-btn').on('click', closeSidePerson);


  // 헤더 백도롭 클릭.
  $('.header-backdrop').on('click', function() {
    if (isMobile()) {
      closeSideMenu();
	  closeSidePerson();
    } else {
      closeMenubarEtc();
    }
  });

  // 헤더에 있는 Menu 클릭.
  $('#header [role="menubar"]').on('click', '[role="menuitem"]', function() {
    if (isMobile()) {
      toggleMenu($(this));
    }
  });

  // 기타메뉴의 Menu 클릭.
  $('[role="menubar"].menubar-etc').on('click', '[role="menuitem"]', function() {
    if (isPC()) {
      if (getMenuDepth($(this)) == 1) {
        closeAllEtcMenu();
      }      
      openEtcMenu($(this));  
    }
  });

  // 전체메뉴의 1뎁스 메뉴 위로 마우스 오버.
  $('.menubar-main > li > [role="menuitem"]').on('mouseenter focusin', function() {
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
  function toggleSideMenu() {    
    if (isSideMenuOpen()) {
      closeSideMenu();
    } else {
      openSideMenu();
    }
  }

  /** Side 학생정보를 토글한다. */
  function toggleSidePerson() {    
    if (isSidePersonOpen()) {
      closeSidePerson();
    } else {
      openSidePerson();
    }
  }

  /** Side를 연다. */
  function openSideMenu() {
    $('.menu-wrapper').addClass('show');
    applyBodyNoScroll();
    showHeaderBackdrop();
    $('.menubar-main .menubox').removeAttr('style');
    addBodyScrollWidthToHeader();
  }

  /** Side 학생정보를 연다. */
  function openSidePerson() {
    //$('.col-side .snb').show();
    $('.col-side .snb').addClass('show');
    applyBodyNoScroll();
    showHeaderBackdrop();
    addBodyScrollWidthToHeader();
  }

  /** Side를 닫는다. */
  function closeSideMenu() {
    $('.menu-wrapper').removeClass('show');    
    hideHeaderBackdrop();
    setTimeout(function() {
      applyBodyScroll();
      removeBodyScrollWidthFromHeader();
    }, 250);
  }

  /** Side를 닫는다. */
  function closeSidePerson() {
    $('.col-side .snb').removeClass('show');   
    //$('.col-side .snb').hide(); 
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
  function isSideMenuOpen() {
    return $('.menu-wrapper').is('.show');
  }

  function isSidePersonOpen(){
	return $('.col-side .snb').is('.show');
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
    if ($menuitem.attr('aria-expanded') == 'false') {
      //openMenu($menuitem);
    } else {
      //closeMenu($menuitem);
    }
  }


  /**
   * 모든 메뉴들을 닫는다.
   */
  function closeAllHeaderMenu() {
    $('#header [role="menuitem"][aria-haspopup="true"]').attr('aria-expanded', 'false');
    $('#header [role="menu"]').finish().removeAttr('style');
    $('.menubar-main .menubox').removeAttr('style');
  }

  /**
   * 지정된 1뎁 메뉴의 Menu Box를 슬라이드다운 한다.
   * @param {jQuery} $1depthMenuitem - 지정된 1뎁스 메뉴.
   */
  function slideDownMenubox($1depthMenuitem) {
    var $menuboxes = $('.menubox');
    var $menu = $1depthMenuitem.next('.menubox').find('> .menubox-inner > [role="menu"]');
    var menuHeight = $menu.attr('data-height');

    $('.menubar-main > li > [role="menuitem"]').removeClass('active')
    $1depthMenuitem.addClass('active');

    $menuboxes.stop().animate({
      height: menuHeight
    }, duration);

    showHeaderBackdrop();
  }

  /** 지정된 1뎁스 메뉴의 Menu Box를 슬라이드업 한다.  */
  function slideUpMenubox() {    
    var $menuboxes = $('.menubox');

    $menuboxes.stop().animate({
      height: '0'
    }, duration, function() {
      $('.menubar-main > li > [role="menuitem"]').removeClass('active');
    });

    if (!isMenubarEtcOpen()) {
      hideHeaderBackdrop();
    }
  }
  
  /** Menu Box의 높이를 초기화한다. */
  function resetMenuboxHeight() {
    var $subMenus = $('.menubox > .menubox-inner > [role="menu"]');

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
    return $menuitem.parents('[role="menu"]').length + 1;
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
    $menuitem.attr('aria-expanded', 'true');
  }

  /**
   * 기타메뉴의 지정된 메뉴를 닫는다.
   * @param {jQuery} $menuitem - 지정된 메뉴.
   */
  function closeEtcMenu($menuitem) {
    $menuitem.attr('aria-expanded', 'false');
  }

  /** 기타메뉴의 모든 메뉴를 닫는다. */
  function closeAllEtcMenu() {
    $('.menubar-etc > li > [role="menuitem"]').attr('aria-expanded', 'false');
  }

  /** 기타메뉴의 첫 번째 메뉴를 연다. */
  function applyFirstEtcMenuOpen() {
    closeAllEtcMenu();
    $('.menubar-etc > li:first-child > [role="menuitem"]').attr('aria-expanded', 'true');
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
  $('#side [role="menubar"]').on('click', '[role="menuitem"]', function() {
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
	  if(scwin.loginUser.stdtNo) {
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

  var $owlHotFacebook = $('.hot-facebook-carousel');
  if ($owlHotFacebook.length) {
    $owlHotFacebook.owlCarousel({
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
    addPlayPauseBtn($owlHotFacebook);
  }


  var $owlHotYoutube = $('.hot-youtube-carousel');
  if ($owlHotYoutube.length) {
    $owlHotYoutube.owlCarousel({
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
    addPlayPauseBtn($owlHotYoutube);
  }

    /*#################### 아코디언 전체 제어 - 20220113 - yjikim ####################*/

    initAccordion();

    function initAccordion() {
  
      if ($('.container-sub .accordion').length) {
        $('.accordion').before("<div class='expand text-right mb-2'></div>");
        $('.expand').prepend("<button id='expandAll' class='btn btn-xs btn-primary'>전체 열기 <i class='bi bi-chevron-bar-expand'></i></button>"); 
        $('.expand').prepend("<button id='collapseAll' class='btn btn-xs btn-primary'>전체 닫기 <i class='bi bi-chevron-bar-contract'></i></button>");
  
        //$('.card .collapse').collapse('hide');
  
        if($('.collapse.show').length) { 
          $('#collapseAll').show();
          $('#expandAll').hide();
        } else {
          $('#collapseAll').hide();
          $('#expandAll').show();
        }
  
        $('#expandAll').on('click', function() {
          $('.card .collapse').collapse('show');
          $('#collapseAll').show();
          $('#expandAll').hide();
        });
        $('#collapseAll').on('click', function() {
          $('.card .collapse').collapse('hide');  
          $('#expandAll').show();
          $('#collapseAll').hide();
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