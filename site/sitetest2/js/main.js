"use strict";

try {
	//제이쿼리가 있으면
	this.jQuery = this.jQuery || undefined;

	//제이쿼리가 있으면
	if(jQuery) {
		//$ 중복방지
		(function($) {
			$(function() {
				//공지사항탭기능(모바일용)
				$('.board .tabbox ul li a').on('click', function(event) {
					var $this = $(this),
						$MyParent = $this.parent('li'),
						ParentIndex = $MyParent.index(),
						MyparentIsActive = $MyParent.is('.active'),
						$OtherParents = $MyParent.siblings('li'),
						$tabcontent = $('.board .tabcontent'),
						$tabcon = $tabcontent.find('.tabcon'),
						$MyTabcon = $tabcon.eq(ParentIndex),
						$OtherTabcon = $MyTabcon.siblings('.tabcon');
					if(!MyparentIsActive){
						$OtherParents.removeClass('active');
						$MyParent.addClass('active');
						$OtherTabcon.removeClass('active');
						$MyTabcon.addClass('active');
					};
					event.preventDefault();
				});
				
				$.tag.wdw.on('responsive.main', function(event) {
					if(event.state == 'wide' || event.state == 'web') {
						
					}
					if(event.state == 'tablet' || event.state == 'phone') {

					};
				});

				
			});
		})(jQuery);
	}
}catch(e) {
	console.error(e);
}