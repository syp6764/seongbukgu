(function ($) {
    'use strict';

    $.fn.eleResize = function (callback) {
        this.each(function () {
            var $this = $(this),
                prevWid = $this.width();

            $(window).on('resize', chkSize);

            if (typeof callback === 'function') $this.on('eleResize', callback);

            function chkSize() {
                var newWid = $this.width();
                if (prevWid === newWid) return;
                prevWid = newWid;
                $this.trigger('eleResize');
            };

            chkSize();
        });
        return this;
    };

    $(function () {

        var $window = $(window),
            $html = $('html'),
            $document = $(document),
            $header = $document.find('#header'),
            $container = $document.find('#container'),
            $footer = $('#footer');


        /* 토글 */
        var $toggle = $('.toggle'),
            $toggleSelector = $toggle.find('[class*="_show"], [class*="_hide"]');

        $toggleSelector.on('click', function (event) {
            var $this = $(this),
                $parent = $this.parents('.toggle'),
                parentClass = $this.closest('.toggle').attr('class').replace(/\s+\active/g, '').split(/\s+/).slice(-2)[0].replace(/_item/, '');

            if ($this.is('[class*="_show"]')) {
                if ($parent.siblings().hasClass('active')) {
                    $parent.siblings().removeClass('active');
                    $html.removeClass(parentClass + '_open');
                }
                $html.toggleClass(parentClass + '_open');
                $parent.toggleClass('active');
            }

            if ($this.is('[class*="_hide"]')) {
                $html.removeClass(parentClass + '_open');
                $this.closest('.active').removeClass('active');
            }
        });

        // search
        var $search = $html.find('.search'),
            $searchForm = $search.find('.search_form'),
            $searchTop = $search.find('.form_top'),
            $searchBot = $search.find('.form_bottom'),
            $searchToggle = $search.find('.search_toggle'),
            $searchClose = $search.find('.search_close'),
            $searchOptToggle = $search.find('.option_toggle'),
            $srchFcsEle = $search.find('a, button, input, select');

        $searchToggle.on('click', function () {
            if ($search.hasClass('active')) {
                $searchForm.height(0);
                setTimeout(function () {
                    $html.removeClass('search_open');
                    $search.removeClass('active');
                }, 250);
                $(this).text('검색창 열기');
            } else {
                $html.addClass('search_open');
                $search.addClass('active');
                $(this).text('검색창 닫기');
                setTimeout(function () {
                    var formHeight = $searchForm.find('form').innerHeight();
                    $searchForm.height(formHeight);
                });
            }
            ;
        });

        $searchOptToggle.on('click', function () {
            if ($search.hasClass('active_option')) {
                $searchForm.height(0);
                $html.removeClass('search_open');
                $search.removeClass('active');
                $search.removeClass('active_option');
            } else $search.addClass('active_option');

            var searchHei = $searchTop.innerHeight() + $searchBot.innerHeight();
            $searchForm.height(searchHei);
        });


        $searchClose.on('click', function () {
            $searchForm.height(0);
            $html.removeClass('search_open');
            $search.removeClass('active');
            $searchToggle.text('검색창 열기');
        });

        $searchForm.eleResize(function () {
            var hei = $(this).find('.form_top, .form_bottom').map(function () {
                return $(this).innerHeight()
            }).toArray().reduce(function (a, b) {
                return a + b
            });
            $(this).height(hei);
        });


        $srchFcsEle.first().on('keydown', function (e) {
            if (!$search.hasClass('active')) return;
            if (e.which === 9 && e.shiftKey) {
                e.preventDefault();
                $(this).blur();
                var $focus = $(document.activeElement),
                    fcsEleArr = $srchFcsEle.toArray();
                while ($focus.closest('.search').length < 1) {
                    $(fcsEleArr.pop()).focus();
                    $focus = $(document.activeElement);
                }
                ;
            }
            ;
        }).end().last().on('keydown', function (e) {
            if (e.which === 9 && !e.shiftKey) {
                e.preventDefault();
                $srchFcsEle.first().focus();
            }
            ;
        });
        $searchTop.find('.keyword a').last().on('keydown', function (e) {
            if ($search.hasClass('active_option')) return;
            if (e.which === 9 && !e.shiftKey) {
                e.preventDefault();
                $srchFcsEle.first().focus();
            }
            ;
        });

        // datePicker
        $searchTop.find('#cal_start, #cal_end').closest('.search_input.calendar').datepicker().on('changeDate', function (e) {
            var $input = $(this).find('input'),
                date = e.date;
            $input.val(date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate());
            $searchForm.css('overflow', '');
        }).on('show', function (e) {
            if (window.innerWidth > 1000) return;
            var $cal = $(this).next(),
                $input = $(this).find('input');
            $searchTop.animate({
                scrollTop: $cal.position().top + $cal.height()
            }, 250);
            if (window.innerWidth > 640 || $input.attr('id') !== 'cal_start') return;
            $cal.css('left', '0');
        });
        $searchTop.find('.search_input.calendar input, .search_input.calendar button').on('click', function () {
            var $wrap = $(this).closest('.search_input');
            setTimeout(function () {
                var $calWrap = $wrap.next();
                if (!($calWrap.length > 0)) return;
                $searchForm.css('overflow', 'visible');
            });
        });


        /* sns공유 */
        var $share = $container.find('.share'),
            $shareBtn = $share.find('.share_show'),
            $shareClose = $share.find('.share_hide');

        $shareBtn.on('click', function (event) {
            $share.toggleClass('active');
        });
        $shareClose.on('click', function (event) {
            $share.removeClass('active');
        })


        //클립보드복사
        var $urlCopy = $container.find('#url_copy');

        $urlCopy.on('click', function (event) {
            $('#url_copy div').remove();
            var html = "<div><label for='clip_target'>복사된 URL</label><input id='clip_target' type='text' value='' /></div>";
            $(this).append().html(html);

            var input_clip = document.getElementById("clip_target");
            var _url = $(location).attr('href');
            $('#clip_target').val(_url);

            if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) {
                var editable = input_clip.contentEditable;
                var readOnly = input_clip.readOnly;

                input_clip.contentEditable = true;
                input_clip.readOnly = false;

                var range = document.createRange();
                range.selectNodeContents(input_clip);

                var selection = window.getSelection();
                selection.removeAllRanges();
                selection.addRange(range);
                input_clip.setSelectionRange(0, 999999);

                input_clip.contentEditable = editable;
                input_clip.readOnly = readOnly;
            } else {
                input_clip.select();
            }
            try {
                var successful = document.execCommand('copy');
                input_clip.blur();
                if (successful) {
                    alert("URL이 복사 되었습니다");
                } else {
                    alert('이 브라우저는 지원하지 않습니다.');
                }
            } catch (err) {
                alert('이 브라우저는 지원하지 않습니다.');
            }
        });

        //바로가기
        $('.footer .site .site_list .site_item .site_show').on('click', function () {
            var $this = $(this),
                $MyParent = $this.parent('li.site_item'),
                MyParentIsActive = $MyParent.is('.active'),
                $MyLayer = $this.siblings('.site_panel'),
                $OtherParents = $MyParent.siblings('li.site_item'),
                $OtherLayer = $OtherParents.find('.site_panel'),
                $OtherBtn = $OtherParents.find('.site_show');
            if (!MyParentIsActive) {
                $OtherParents.removeClass('active');
                $OtherLayer.slideUp();
                $OtherBtn.attr('title', '목록열기');
                $MyParent.addClass('active');
                $this.attr('title', '목록닫기');
                $MyLayer.slideDown();
            } else {
                $MyParent.removeClass('active');
                $this.attr('title', '목록열기');
                $MyLayer.slideUp();
            }
            ;
        });

        //패밀리사이트
        var $familyBtn = $('.family_btn'),
            $familyLayer = $('.family_layer'),
            $familyClose = $familyLayer.find('.close'),
            $familyItem = $familyLayer.find('.item_btn');

        $familyBtn.on('click', function () {
            $familyLayer.addClass('active');
            $familyLayer.fadeIn();
        });
        $familyClose.on('click', function () {
            $familyLayer.removeClass('active');
            $familyLayer.fadeOut();
        })

        $familyItem.on('click', function () {
            var $this = $(this),
                $MyParent = $this.parent('li.item'),
                IsActive = $MyParent.is('.active'),
                $MyLayer = $this.siblings('.layer'),
                $OtherParents = $MyParent.siblings('li.item'),
                $OtherLayer = $OtherParents.find('.layer'),
                $OtherBtn = $OtherParents.find('.item_btn');
            if (!IsActive) {
                $OtherParents.removeClass('active');
                $OtherLayer.slideUp();
                $OtherBtn.attr('title', '목록열기');
                $MyParent.addClass('active');
                $this.attr('title', '목록닫기');
                $MyLayer.slideDown();
            } else {
                $MyParent.removeClass('active');
                $this.attr('title', '목록열기');
                $MyLayer.slideUp();
            }
            ;
        });


        /* 배너모음 */
        var $banner = $footer.find('.banner'),
            $bannerList = $banner.find('.banner_list'),
            $bannerPrev = $banner.find('.banner_prev'),
            $bannerAuto = $banner.find('.banner_auto'),
            $bannerNext = $banner.find('.banner_next');

        $bannerList.slick({
            draggable: false,
            infinite: true,
            variableWidth: false,
            slidesToShow: 5,
            slidesToScroll: 1,
            autoplay: true,
            vertical: true,
            playText: '재생',
            pauseText: '정지',
            autoArrow: $bannerAuto,
            prevArrow: $bannerPrev,
            nextArrow: $bannerNext,
            responsive: [
                {
                    breakpoint: 641,
                    settings: {
                        slidesToShow: 3,
                    }
                },
            ],
        });

        /* 상단으로 */
        var $htmlBody = $('html, body'),
            $wrapper = $('#wrapper'),
            $upButton = $footer.find('.up_button');

        if ($upButton.length) {
            $upButton.on('click', function (event) {
                $htmlBody.animate({
                    scrollTop: $wrapper.offset().top
                }, {
                    duration: 1000,
                });
                event.preventDefault();
            });

            $window.scroll(function () {
                if ($window.scrollTop() > 100) {
                    $upButton.addClass('show');
                } else {
                    $upButton.removeClass('show');
                }
            });
        }

        //팝업 시작
        var $popup = $('.popup .popup_list'),
            $popupTotal = $('.popup .template_total'),
            $popupCurrent = $('.popup .template_current');

        $popup.slick({
            //기본
            autoplay: false,
            dots: false,
            swipe: true,
            draggable: true,
            fade:true,
            slidesToShow: 1,
            variableWidth: false,
            infinite: false,
            speed: 1000,
            autoplaySpeed: 5000,
            prevArrow: $('.popup .template_control .template_prev'),
            nextArrow: $('.popup .template_control .template_next'),

            //추가 기능
            autoArrow: $('.popup .template_control .template_auto'),
            isRunOnLowIE: false,
            pauseOnArrowClick: true,
            pauseOnDirectionKeyPush: true,
            pauseOnSwipe: true,
            pauseText: '정지',
            playText: '재생',
            total: $popupTotal,
            current: $popupCurrent,
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
        //팝업 끝

    });
})(window.jQuery);
