(function($) {
	'use strict';

	$(function() {

		var $window = $(window),
			$container = $('#container'),
			$contents = $('#contents'),
			debounce = null;

		$window.load(function(){
			$('.sub_visual').addClass('active');
		});


		//cms 탭메뉴
		var $tab = $container.find('.tab'),
			$tabMenu = $tab.find('.tab_menu'),
			$tabSelect = $tabMenu.find('.tab_select');

		$tabSelect.on('click', function(){
			var $this = $(this);

			if(!$this.parent().is('.active')){
				$this.attr('title','목록닫기')
					.parent().addClass('active')
					.end().next().slideDown('250');
			} else{
				$this.attr('title','목록열기')
					.parent().removeClass('active')
					.end().next().slideUp('250');
			}
		});

		//컨텐츠 탭메뉴
		$tab.each(function(index, element){
			var $tabMenu = $(element).find('.tab_menu'),
				$tabList = $(element).find('.tab_list'),
				$tabBtn = $(element).find('.tab_list.n1 > .tab_item > button.tab_button'),
				tabAllChk = $tabBtn.is('.tab_all'),
				$tabContent = $(element).find('.tab_content');

			var liLength = $tabMenu.find('.tab_list.n1 > .tab_item').length;
			$tabList.addClass('divide' + liLength);

			$tabBtn.click(function () {
				var $this = $(this),
					index = $tabBtn.index(this),
					tabButtonText = $this.text(),
					IsTabAll = $this.is('.tab_all'),
					$tabPanel = $this.parents('.tab_panel'),
					$tabMenu = $this.parents('.tab_menu');

				$this.attr('title', '선택됨').closest('.tab_item').addClass('active').siblings('.tab_item').removeClass('active').find('.tab_button').removeAttr('title');
				$this.parents('.tab').find('.tab_select span').text(tabButtonText);
				$tabPanel.attr('class','tab_panel').addClass('active' + (index + 1));

				if (tabAllChk){
					if (IsTabAll) {
						$tabContent.addClass('active');
					} else {
						$tabContent.eq(index - 1).addClass('active').siblings('.tab_content').removeClass('active');
					}
				} else if (!tabAllChk){
					$tabContent.eq(index).addClass('active').siblings('.tab_content').removeClass('active');
				}
				if ($window.width() <= 800) {
					$tabMenu.removeClass('active');
					$tabPanel.slideUp('250');
				}
				if ($window.width() <= 800 && IsTabAll) {
					$tabMenu.removeClass('active');
					$tabPanel.slideUp('250');
				};
			});
		});

		//셀렉트박스 디자인
		$('.style_select_box .search_select').on('click', function (){
			var $this = $(this),
				$MyParent = $this.parent('.style_select_box'),
				MyParentIsActive = $MyParent.is('.active'),
				$MyLayer = $this.siblings('.search_list');

			if(!MyParentIsActive){
				$MyParent.addClass('active');
				$this.attr('title','목록닫기');
				$MyLayer.slideDown();
			} else {
				$MyParent.removeClass('active');
				$this.attr('title','목록열기');
				$MyLayer.slideUp();
			}
		});

		/* 스텝(가로) */
		function stepAutoHeight(){
			var $step = $container.find('.stedp');
			$step.find('.step_inner, .step_title, .step_text').removeAttr('style', 'height');

			$step.each(function () {
				var $stepInner = $(this).find('.step_inner'),
					maxHeight = 0;
				$stepInner.css({'height':'auto'});
				$stepInner.each(function () {
					var $div = $('<div></div>'),
						$stepTitle = $(this).find('.step_title'),
						$stepText = $(this).find('.step_text'),
						$subText = $(this).find('.sub_text');
					$div.addClass('step_wrap');
					if (maxHeight < $(this).innerHeight()) {
						maxHeight = $(this).innerHeight();
					}
					$(this).addClass('vertical')
					if ($(this).find('.step_wrap').length===0) {
						$(this).append($div);
						$(this).find('.step_wrap').append($stepTitle, $stepText, $subText);
					}
				})
				$stepInner.innerHeight(maxHeight);
			})

		}
		stepAutoHeight();

		/* 사이트 링크 */
		function linkAutoHeight(){
			var $linkBox = $container.find('.link_box'),
				$linkList = $linkBox.find('.link_list'),
				$linkInner = $linkBox.find('.inner');

			//초기화
			$linkInner.removeAttr('style', 'height');

			$linkList.each(function (index, element) {
				var $element = $(element),
					linkInnerMinHeight = 0; //기본 높이

				$element.find('.link_item').each(function (index, element) {
					var $element = $(element),
						linkInnerHeight = $element.find('.inner').height();

					//최고높이
					if (linkInnerHeight > linkInnerMinHeight) {
						linkInnerMinHeight = linkInnerHeight;
					}
				});

				$element.find('.inner').height(linkInnerMinHeight);
			});

		}
		linkAutoHeight();

		$window.on('load resize', function () {
			clearTimeout(debounce);
			debounce = setTimeout(function (){
				stepAutoHeight();
				linkAutoHeight()
			}, 50);
		});


		/* 반응형 테이블 */
		var $tableResponsive = $container.find('.table.responsive');

		$tableResponsive.each(function(index, element) {
			var $element = $(element),
				rowdivIs = $element.find('td, th').is('[rowdiv]'),
				theadLength = $element.find('thead').length;

			if(rowdivIs == false && !theadLength == 0){
				$element.find('tbody th, tbody td').each(function(index, element) {
					var $this = $(element),
						thisIndex = $this.index(),
						theadText = $this.parents('tbody').siblings('thead').find('th').eq(thisIndex).text();

					$this.attr('data-content', theadText);
				});

				$element.find('tfoot th, tfoot td').each(function(index, element) {
					var $this = $(element),
						thisIndex = $this.index(),
						theadText = $this.parents('tfoot').siblings('thead').find('th').eq(thisIndex).text();

					$this.attr('data-content', theadText);
				});
			}
		});

		/* map marker 변경하기 */
		$(window).load(function(){

			var $marker = $('.box.map .roughmap_maker_label');

			$marker.parent('div').prev('div').find('img').attr('src', '/site/public/images/template/donghae_map_marker.png');
			$marker.parent('div').prev('div').find('img').css({'width':'69', 'height':'71', 'left':'-11px','clip':'unset'});
		});


		// popup
		var $body = $('body'),
			$popupBg = $('.popup_bg'),
			$pupupBtn = $('.popup_btn'),
			$popupClose = $popupBg.find('.popup_close');
		$pupupBtn.on('click', function () {
			$popupBg.addClass('active');
			if ($popupBg.hasClass('active')) {
				$body.addClass('popup_show');
			}
			return false;
		})
		$popupClose.on('click', function () {
			$popupBg.removeClass('active');
			$body.removeClass('popup_show');
		})

		$(document).ready(function(){
			//ebook 리스트 버튼 박스 접근성 관련 포커스 수정
			var $pEbook = $('.p_ebooklist'),
				$EbookList = $pEbook.find('.ebook_list'),
				$EbookItem = $EbookList.find('.ebook_item');

			$EbookItem.on('mouseover focusin',  function(){
				$EbookItem.removeClass('active');
				$(this).addClass('active');
			});
			$EbookItem.on('mouseleave focusout',  function(){
				$EbookItem.removeClass('active');
			});

		});




	});
})(window.jQuery);
