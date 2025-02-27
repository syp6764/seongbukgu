(function($) {
	'use strict';

	$(function() {
		var $window = $(window),
		$html = $('html'),
		$container = $('#container');

		$(window).on("load", function() {
			$container.removeClass("preload");
		});

		// visual > visual-slide
		var $visual = $container.find('.visual'),
            $visualList = $visual.find('.visual_list'),
            $visualPrev =  $visual.find('.visual_prev'),
            $visualNext =  $visual.find('.visual_next'),
            $visualAuto =  $visual.find('.visual_auto'),
            $visualCurrent = $visual.find('.visual_current'),
            $visualTotal = $visual.find('.visual_total');

        $visualList.slick({
            draggable: true,
            infinite: false,
            variableWidth: false,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
			// speed: 1000,
            prevArrow: $visualPrev,
            nextArrow: $visualNext,
            dots: false,
			fade: true,
            autoArrow: $visualAuto,
            pauseText: '정지',
            playText: '재생',
            current: $visualCurrent,
            total: $visualTotal,
            customState : function(state) {
                //현재 슬라이드 위치가 10보다 작을 때
                if(state.current < 10) {
                    state.current = '0' + state.current;
                }
                //슬라이드 갯수가 10보다 작을 때
                if(state.total < 10) {
                    state.total = '0' + state.total;
                }
                return state;
            },
        });



		// visual > nolteo-slide
			var $nolteo = $('.nolteo'),
				$PrevBtn = $nolteo.find('.arrow.prev'),
				$NextBtn = $nolteo.find('.arrow.next');
			var $Swiper = new Swiper('.swiper-container', {
					direction: 'horizontal',
					// loop:true,
					speed: 500,
					// autoplay: {
					// 	delay: 8000,  // 초마다 자동 재생
					// 	disableOnInteraction: false, // 사용자 상호 작용 후에도 자동 재생 유지
					// },
					freeMode: false,
					mousewheel:false,
					effect : 'fade',
					watchOverflow: true,
					observer: true,
					observeParents: true,
					slidesPerView : 'auto',
					initialSlide: 0,
					watchSlidesVisibility : true,
					touchRatio : false, //드래그 사용여부
					resistance : false,
					//spaceBetween : 0, //아이템 사이 간격
					allowTouchMove:true,
					navigation: {
						nextEl: $NextBtn,
						prevEl: $PrevBtn
					},
					pagination: {
						el: $(".nolteo").find(".slide_btns").find(".swiper-pagination"),
						type: "progressbar",
					},
					on: {
						init: function() {

						},
						activeIndexChange: function () {

						},
						slideChange: function() {

						},
						slideChangeTransitionEnd: function () {

						}
					},
					breakpoints: {
						1000: {
							allowTouchMove:true,
							touchRatio : true,
						}
					}
			});

		
		// fade
        var $fade = $container.find('.fade');

        function fade() {
            $fade.each(function (i) {
                var bottom_of_object = $(this).offset().top + $(this).outerHeight();
                var bottom_of_window = $window.scrollTop() + $window.height();
                if (bottom_of_window > bottom_of_object / 1.2) {
                    $(this).addClass('show');
                } else {
                    $(this).removeClass('show');
                }
            });
        }

		
        fade();
        $window.scroll(function () {
            fade();
        });

	});
})(window.jQuery);
