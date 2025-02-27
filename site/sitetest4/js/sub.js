/*
 * @author (주)한신정보기술 퍼블리셔팀 이경선
 * @since 2018-09-04
 */

 $(function(){
 	$('.side_menu').menu({
 		cut : {},
 		event : 'click',
 		namespace : 'side_menu'
 	});

    //studio
	var studioSlick =$('.studio_view .studio_list');

	studioSlick.on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
		var i = (currentSlide ? currentSlide : 0) + 1;
		//console.log(i + '/' + slick.slideCount);
		$('.studio_view .control .count .current').text(i); //현재페이지
		$('.studio_view .control .count .all').text(slick.slideCount); //전체페이지
	});
	studioSlick.slick({
		autoplay : false,
		speed : 1000,
		fade : false,
		dots:false,
		prevArrow : $('.studio_view .studio_prev'),
		nextArrow : $('.studio_view .studio_next'),
		pauseOnDotsHover : true,
		swipe:false,
		draggable:false
	});
});
