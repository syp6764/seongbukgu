(function($) {
	'use strict';

	$(function() {

        var $window = $(window),
            $html = $('html'),
            $document = $(document),
            $header = $document.find('#header'),
            $container = $document.find('#container'),
            $footer = $('#footer');

        /* 상단토글스위치 */
        var $body = $('body'),
            $switch = $header.find('.switch'),
            $switchInput = $switch.find('input.color');

        $switchInput.on('click', function(){
            if ( $switchInput.is(':checked') ){
                $html.addClass('color_switch');
                localStorage.setItem('colorSwitch', true);
            } else {
                $html.removeClass('color_switch');
                localStorage.setItem('colorSwitch', false);
            }
        });

        //언어
        var $language = $header.find('.language');

        $language.on('click', function(event) {
            var $this = $(this);
            $this.toggleClass('active');
            $this.find('.language_panel').stop(false, true).slideToggle('200', 'linear');
        });


        /* sns공유 */
        var $sns = $header.find('.sns'),
            $snsBtn = $sns.find('.sns_show');
        $snsBtn.on('click', function(event) {
            $sns.toggleClass('active');
            if($sns.is('.active')){
                $snsBtn.attr("title","SNS 레이어 닫기")
            }else {
                $snsBtn.attr("title","SNS 레이어 열기")
            }
        });

        /* search */
        var $search = $html.find('.search'),
            $searchForm = $search.find('.search_form'),
            $searchClose = $search.find('.search_close'),
            $searchOptToggle = $search.find('.option_toggle');

        $(window).on('load resize', function () {
            if ($(window).width() > 1001) {
                $html.addClass('search_open');
                $search.addClass('active');
                setTimeout(function () {
                    var formHeight = $searchForm.find('form').innerHeight();
                    $searchForm.height(formHeight);
                });
            }else {
                $searchForm.height(0);
                $html.removeClass('search_open');
                $search.removeClass('active');
            }
        });

        $searchOptToggle.on('click', function () {
            $html.addClass('search_open');
            $search.addClass('active');
            setTimeout(function () {
                var formHeight = $searchForm.find('form').innerHeight();
                $searchForm.height(formHeight);
            });
        });


        /* quick_item */
        var $quick = $footer.find('.quick'),
            $quickBtn = $quick.find('.quick_btn'),
            $quickItem = $quick.find('.quick_item'),
            $quickClose = $footer.find('.box_close');

        $quickBtn.on('click', function(event) {
            var $this=$(this),
                $quickItem = $this.parent('.quick_item');

            $quickItem.addClass('active').siblings().removeClass('active');
        });

        $quickClose.on('click',function (event) {
            $quickItem.removeClass('active');
        })


    });
})(window.jQuery);
