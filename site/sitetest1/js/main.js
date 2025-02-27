

$(function(){
	//visual
	var visualSlick =$('.visual .list');

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
		dots:true,
		appendDots : $('.visual .control .dots'),
		pauseOnDotsHover : true,
		swipe:false,
		draggable:false,
		responsive: [
		{
			breakpoint: 1000,
			settings: {
				arrows:false,	
				swipe:true,
				draggable:true,
				touchMove:true
			}
		}
		]
	});
	$('.visual .control .btn_group .pause').on('click', function(event) {
		$('.visual .control .btn_group .play').show().focus();
		$('.visual .control .btn_group .pause').hide();
		visualSlick.slick('slickPause').slick('slickSetOption', 'pauseOnDotsHover', false);
	});
	$('.visual .control .btn_group .play').on('click', function(event) {
		$('.visual .control .btn_group .pause').show().focus();
		$('.visual .control .btn_group .play').hide();
		visualSlick.slick('slickPlay').slick('slickSetOption', 'pauseOnDotsHover', true);
	});
	
	//현장속으로
	var gallerySlick =$('.gallery .list');

	gallerySlick.slick({
		dots:false,
		swipe:false,
		slidesToShow: 2,
		slidesToScroll: 1,
		draggable:false,
			infinite:false,
		prevArrow:$('.gallery .control .prev'),
		nextArrow:$('.gallery .control .next'),
		variableWidth: true,
		responsive: [
		{
			breakpoint: 1000,
			settings: {
				swipe:true,
				draggable:true,
				touchMove:true
			}
		},
		{
			breakpoint: 801,
			settings: {
				slidesToShow: 2,
				swipe:true,
				draggable:true,
				touchMove:true,
				variableWidth:false
			}
		},
		{
			breakpoint: 641,
			settings: {
				slidesToShow: 1,
				swipe:true,
				draggable:true,
				touchMove:true,
				variableWidth:false
			}
		}	
		]
	});
	
});
