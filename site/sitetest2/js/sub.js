"use strict";

try {
	//제이쿼리가 있으면
	this.jQuery = this.jQuery || undefined;

	//제이쿼리가 있으면
	if(jQuery) {
		//$ 중복방지
		(function($) {
			$(function() {

				//path
				$('.path ul li.list button').on('click', function() {
					var $this = $(this),
						$MyParent = $this.parent('li.list'),
						$OtherParent = $MyParent.siblings('li.list').not(':first-child'),
						$MyLayer = $this.siblings('.layer'),
						$OtherLayer = $OtherParent.find('.layer'),
						MyParentIaActive = $MyParent.is('.active');
					if(!MyParentIaActive){
						$OtherParent.removeClass('active');
						$OtherLayer.slideUp();
						$MyParent.addClass('active');
						$MyLayer.slideDown();
					} else{
						$MyParent.removeClass('active');
						$MyLayer.slideUp();
					};
				});

				$('.tab_menu').not($('.prettyprint').children()).each(function() {
					var li_length = $(this).children('ul').find('li').length;
					if(li_length<=3){
						$(this).addClass('divide'+li_length);
					} else if(li_length==4){
						//$(this).addClass('divide4');
						$(this).addClass('type2').addClass('divide4');
					} else if(li_length>4){
						$(this).addClass('divide4');
					};
				});
				
				//모바일탭메뉴
				$('.tab_menu_box .tab_menu_button').on('click', function() {
					var $this = $(this),
						$Layer = $this.siblings('.tab_menu'),
						LayerIsActive = $Layer.is('.active');
					if(!LayerIsActive){
						$Layer.addClass('active').slideDown();
					} else{
						$Layer.removeClass('active').slideUp();
					};
				});

				$.tag.wdw.on("responsive.sub", function(event) {
					if(event.state == 'wide' || event.state == 'web') {
						$('.tab_menu').not($('.prettyprint').children()).each(function() {
							var li_length = $(this).children('ul').find('li').length,
								already = $(this).is('.type2');
							if((li_length==4) && (!already)){
								$(this).addClass('type2');
							};
						});
					}
					if(event.state == "tablet" || event.state == "phone") {
						$('.tab_menu.type2').removeClass('type2');
					}
					if(event.state == 'wide' || event.state == 'web' || event.state == 'tablet') {
						$('.sub_head .tab_menu_box .tab_menu').removeClass('active').removeAttr('style');
					};
				});

				$('table.table.responsive').not($('.prettyprint').children()).each(function() {
					var RowSpanExist = $(this).find('td, th').is('[rowspan]'),
						TheadExist = $(this).find('thead').length;
					if((RowSpanExist==false) && (TheadExist!=0)){//rowspan이 없을 경우만 실행 (rowspan이 있으면 지원불가)
						$(this).children('tbody').children('tr').find('th, td').each(function() {
							var ThisIndex = $(this).index(),
								TheadText = $(this).parents('tbody').siblings('thead').find('th').eq(ThisIndex).text();
							$(this).attr('data-content', TheadText);
						});
						$(this).children('tfoot').children('tr').find('th, td').each(function() {
							var ThisIndex = $(this).index(),
								TheadText = $(this).parents('tfoot').siblings('thead').find('th').eq(ThisIndex).text();
							$(this).attr('data-content', TheadText);
						});
					};
				});
				
			});
		})(jQuery);
	}
}catch(e) {
	console.error(e);
}