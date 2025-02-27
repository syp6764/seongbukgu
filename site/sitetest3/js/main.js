/**
 * @author (주)한신정보기술 퍼블리셔팀 이경선
 * @since 2018-09-15
 * @version 1.0.0
 */

$(function() {

	//visual
	var visualSlick =$('.visual .visual_list');

	visualSlick.on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
		var i = (currentSlide ? currentSlide : 0) + 1;
		//console.log(i + '/' + slick.slideCount);
		$('.visual .control .count .current').text(i); //현재페이지
		$('.visual .control .count .all').text(slick.slideCount); //전체페이지
	});
	visualSlick.slick({
		autoplay : true,
		speed : 1000,
		fade : true,
		dots: true,
		appendDots : $('.visual .control .dots'),
		prevArrow : $('.visual .visual_control .visual_prev'),
		nextArrow : $('.visual .visual_control .visual_next'),
		pauseOnDotsHover : true,
		swipe:true,
		draggable:true
	});
	$('.visual .control .pause').on('click', function(event) {
		$('.visual .control .play').show().focus();
		$('.visual .control .pause').hide();
		visualSlick.slick('slickPause').slick('slickSetOption', 'pauseOnDotsHover', false);
	});
	$('.visual .control .play').on('click', function(event) {
		$('.visual .control .pause').show().focus();
		$('.visual .control .play').hide();
		visualSlick.slick('slickPlay').slick('slickSetOption', 'pauseOnDotsHover', true);
	});


	//popup
	var popupSlick =$('.popup .popup_list');

	popupSlick.on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
		var i = (currentSlide ? currentSlide : 0) + 1;
		//console.log(i + '/' + slick.slideCount);
		$('.popup .popup_control .count .current').text(i); //현재페이지
		$('.popup .popup_control .count .all').text(slick.slideCount); //전체페이지
	});
	popupSlick.slick({
		autoplay : true,
		speed : 1000,
		fade : true,
		dots: false,
		// appendDots : $('.popup .control .dots'),
		prevArrow : $('.popup .popup_control .popup_prev'),
		nextArrow : $('.popup .popup_control .popup_next'),
		pauseOnDotsHover : true,
		swipe:true,
		draggable:true
	});
	$('.popup .popup_control .pause').on('click', function(event) {
		$('.popup .popup_control .play').show().focus();
		$('.popup .popup_control .pause').hide();
		popupSlick.slick('slickPause').slick('slickSetOption', 'pauseOnDotsHover', false);
	});
	$('.popup .popup_control .play').on('click', function(event) {
		$('.popup .popup_control .pause').show().focus();
		$('.popup .popup_control .play').hide();
		popupSlick.slick('slickPlay').slick('slickSetOption', 'pauseOnDotsHover', true);
	});

	//service_link
	var service_linkSlick =$('.service_link .service_link_list');

	service_linkSlick.slick({
		autoplay : false,
		speed : 1000,
		slidesToShow:6,
		slidesToScroll:1,
		// variableWidth: true,
		dots: false,
		pauseOnDotsHover : true,
		swipe:true,
		draggable:true,
		responsive: [
	    {
	      breakpoint: 1001,
	      settings: {
	        arrows: false,
			variableWidth: true,
	        slidesToShow: 3
	      }
	    }
	  ]
	});

	//photo_gallery
	var photoGallerySlick =$('.photo_gallery .photo_gallery_list');
	photoGallerySlick.slick({
		autoplay : false,
		speed : 1000,
		dots: false,
		slidesToShow:3,
		slidesToScroll:1,
		centerMode:true,
		variableWidth : true,
		prevArrow : $('.photo_gallery_control .photo_gallery_prev'),
		nextArrow : $('.photo_gallery_control .photo_gallery_next'),
		swipe:true,
		draggable:true,
		responsive: [
	    {
	      breakpoint: 801,
	      settings: {
	        arrows: false,
			variableWidth: true,
	        slidesToShow: 1
	      }
	    }
	  ]
	});

});
