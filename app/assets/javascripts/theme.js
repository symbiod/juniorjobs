// require theme/rs-plugin/initialize
//= require theme/owl.carousel.min
// require theme/isotope/initialize
// require theme/jquery.raty.min
// require theme/jquery.appear
// require theme/jquery.simple-text-rotator.min
// require theme/jquery.magnific-popup.min
// require theme/ion.rangeSlider.min
// require theme/stellar.min
// require theme/retina.min
//= require theme/sticky.min

(function($){
  "use strict";

  /* *********************	Carousel config	********************* */


  $(".owl-portfolio").owlCarousel({
    singleItem:true,
    stopOnHover:true,
    navigation:false,
    autoPlay:5500
  });

  /* *********************	Helper functions	********************* */

  function validate(data, def) {
    return (data !== undefined) ? data : def;
  }

  var $win = $(window),
    $body = $('body'),
    $windowWidth = $win.width(),
    mqWidth = $win.outerWidth(true,true),
    isMobileDevice = (( navigator.userAgent.match(/Android|webOS|iPhone|iPad|iPod|BlackBerry|Windows Phone|IEMobile|Opera Mini|Mobi/i) || (mqWidth < 767) ) ? true : false );

  var ie = (function(){
    var rv = 0,
      ua = window.navigator.userAgent,
      msie = ua.indexOf('MSIE '),
      trident = ua.indexOf('Trident/');

    if (msie > 0) {
      // IE 10 or older => return version number
      rv = parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    } else if (trident > 0) {
      // IE 11 (or newer) => return version number
      var rvNum = ua.indexOf('rv:');
      rv = parseInt(ua.substring(rvNum + 3, ua.indexOf('.', rvNum)), 10);
    }

    return ((rv > 0) ? rv : 0);
  }());

  /* *********************	Megamenu	********************* */

  var menu = $(".menu"),
    Megamenu = {
      desktopMenu: function() {

        menu.children("li").show(0);
        menu.children(".toggle-menu").hide(0);

        if (isMobileDevice) {

          menu.on("click touchstart","a", function(e){

            if ($(this).attr('href') === '#') {
              e.preventDefault();
              e.stopPropagation();
            }

            var $this = $(this),
              $sub = $this.siblings(".submenu, .megamenu");

            $this.parent("li").siblings("li").find(".submenu, .megamenu").stop(true, true).fadeOut(300);

            if ($sub.css("display") === "none") {
              $sub.stop(true, true).fadeIn(300);
            } else {
              $sub.stop(true, true).fadeOut(300);
              $this.siblings(".submenu").find(".submenu").stop(true, true).fadeOut(300);
            }
          });

          $(document).on("click.menu touchstart.menu", function(e){

            if ($(e.target).closest(menu).length === 0) {
              menu.find(".submenu, .megamenu").fadeOut(300);
            }
          });

        } else {

          menu.find('li').on({
            "mouseenter": function() {
              $(this).children(".submenu, .megamenu").stop(true, true).fadeIn(300);
            },
            "mouseleave": function() {
              $(this).children(".submenu, .megamenu").stop(true, true).fadeOut(300);
            }
          });
        }
      },
      mobileMenu: function() {

        var $children = menu.children("li"),
          $toggle = menu.children("li.toggle-menu"),
          $notToggle = $children.not("toggle-menu");

        $notToggle.hide(0);
        $toggle.show(0).on("click", function(){

          if ($children.is(":hidden")){
            $children.slideDown(300);
          } else {
            $notToggle.slideUp(300);
            $toggle.show(0);
          }
        });

        menu.find("li").not(".toggle-menu").each(function(){

          var $this = $(this);

          if ($this.children(".submenu, .megamenu").length) {

            $this.children("a").on("click", function(e){

              if ($(this).attr('href') === '#') {
                e.preventDefault();
                e.stopPropagation();
              }

              var $sub = $(this).siblings(".submenu, .megamenu");

              if ($sub.hasClass("open")) {
                $sub.slideUp(300).removeClass("open");
              } else {
                $sub.slideDown(300).addClass("open");
              }
            });
          }
        });
      },
      unbindEvents: function() {
        menu.find("li, a").off();
        $(document).off("click.menu touchstart.menu");
        menu.find(".submenu, .megamenu").hide(0);
      }
    };

  if ($windowWidth < 768) {
    Megamenu.mobileMenu();
  } else {
    Megamenu.desktopMenu();
  }

  /* *********************	Vertical / Fullscreen Menu	********************* */

  $('#menu-trigger').on("click",function() {

    if ($(this).hasClass('fullscreen-trigger')) {
      $(".fullscreen-menu-wrapper").toggleClass("on");

    } else if ($(this).hasClass("top-menu-trigger")) {
      $(".top-menu-wrapper").toggleClass("on");

    } else {
      $(".vertical-menu-wrapper").toggleClass("on");
      $(".vertical-menu-footer").toggleClass("on");
    }

    $(this).toggleClass("menu-close");
    return false;
  });

  /* *********************	Fixed Header	********************* */

  function fixedHeader() {
    $(".main-header").sticky({
      topSpacing: 0,
      className:"menu-fixed"
    });
  }

  if ( (!$('.static-menu').length) && ($windowWidth > 991) && (!isMobileDevice) ) {
    fixedHeader();
  }

  // Fix IE9 placeholder
  if (ie === 9) {
    $.getScript('../plugins/jquery.placeholder.js',function() {
      $('input, textarea').placeholder();
    });
  }

  var globalResizeTimer = null;
  $(window).on("resize",function() {
    if(globalResizeTimer !== null) {
      window.clearTimeout(globalResizeTimer);
    }
    globalResizeTimer = window.setTimeout(function() {

      var mqWidth = $win.outerWidth(true,true),

        newWidth = $win.width(),
        isMobileDevice = (( navigator.userAgent.match(/Android|webOS|iPhone|iPad|iPod|BlackBerry|Windows Phone|IEMobile|Opera Mini|Mobi/i) || (mqWidth < 767) ) ? true : false );

      if ($windowWidth <= 767 && newWidth > 767) {
        Megamenu.unbindEvents();
        Megamenu.desktopMenu();
      }

      if ($windowWidth > 767 && newWidth <= 767) {
        Megamenu.unbindEvents();
        Megamenu.mobileMenu();
      }

      $windowWidth = newWidth;

      // fixHeight();
      // max_height();

      if (mqWidth < 991) {
        $(".main-header").unstick();
        $(".sticky-wrapper").css("height","auto");
      } else {
        fixedHeader();
        $(".sticky-wrapper").css("height","76px");
      }

    }, 400);
  });

  /* *********************	Website enhancement	********************* */

  $body.append($('<div class="back-to-top"><i class="fa fa-angle-up"></i></div>'));

  $win.scroll(function(){
    if ($(this).scrollTop() > 1) {
      $('.back-to-top .fa').css({bottom:"0"});
    } else {
      $('.back-to-top .fa').css({bottom:"-70px"});
    }
  });

  $('.back-to-top .fa').click(function(){
    $('html, body').animate({scrollTop: '0'}, 500);
    return false;
  });


})(jQuery);
/* END Document ready */
