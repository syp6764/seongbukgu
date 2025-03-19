(function ($) {
	'use strict';

	$(function () {

		var $window = $(window),
            $html = $('html'),
			$container = $('#container');

        //상세 검색 시작
        var $search = $container.find('.search'),
            $searchDetailBtn = $search.find('.detail_btn'),
            $searchDetailPopup = $search.find('.layer_popup.search_popup'),
            $searchDetailClose = $searchDetailPopup.find('.close_btn');

        $searchDetailBtn.on('click',function(){
            $('html').addClass('search_detail_open');
        });
        $searchDetailClose.on('click',function(){
            $('html').removeClass('search_detail_open');
        });
        //상세 검색 끝

        //즐겨찾는메뉴 더보기 시작
        var $shortcut1 = $container.find('.shortcut1'),
            $shortcutMoreBtn = $shortcut1.find('.shortcut_btn.more'),
            $shortcutMorePopup = $shortcut1.find('.layer_popup.shortcut_more_popup'),
            $shortcutMoreClose = $shortcutMorePopup.find('.close_btn');

        $shortcutMoreBtn.on('click',function(){
            $('html').addClass('shortcut_more_open');
            $shortcutMorePopup.attr('tabindex', '-1').focus(); // 팝업에 포커스
            trapFocus($shortcutMorePopup); // 포커스 트랩 실행
        });
        $shortcutMoreClose.on('click',function(){
            $('html').removeClass('shortcut_more_open');
            $shortcutMoreBtn.focus(); // 팝업을 연 버튼으로 포커스 이동
            releaseFocusTrap(); // 포커스 트랩 해제
        });
        //즐겨찾는메뉴 더보기 끝

        //즐겨찾는메뉴 나의메뉴설정 시작
        var $shortcutSettingBtn = $shortcut1.find('.shortcut_btn.setting'),
            $shortcutSettingPopup = $container.find('.layer_popup.shortcut_setting_popup'),
            $shortcutSettingSaveBtn = $shortcutSettingPopup.find('.save_btn'),
            $shortcutSettingClose = $shortcutSettingPopup.find('.close_btn');

        $shortcutSettingBtn.on('click',function(){
            $('html').addClass('shortcut_setting_open');
            $shortcutSettingPopup.attr('tabindex', '-1').focus(); // 팝업에 포커스
            trapFocus($shortcutSettingPopup); // 포커스 트랩 실행
        });
        $shortcutSettingClose.on('click',function(){
            $('html').removeClass('shortcut_setting_open');
            $shortcutSettingBtn.focus(); // 팝업을 연 버튼으로 포커스 이동
            releaseFocusTrap(); // 포커스 트랩 해제
        });
        //즐겨찾는메뉴 나의메뉴설정 끝


		var $shortcutSettingBtn = $shortcut1.find('.shortcut_btn.setting'),
		    $shortcutSettingPopup = $container.find('.layer_popup.shortcut_setting_popup'),
		    $shortcutSettingClose = $shortcutSettingPopup.find('.close_btn'),
		    $settingBtn = $container.find('.setting_btn'); // 추가: setting_btn 선택자

		$shortcutSettingBtn.on('click', function() {
		    $('html').addClass('shortcut_setting_open');
		    $shortcutSettingPopup.attr('tabindex', '-1').focus(); // 팝업에 포커스
		    trapFocus($shortcutSettingPopup); // 포커스 트랩 실행
		});

		$shortcutSettingClose.on('click', function() {
		    $('html').removeClass('shortcut_setting_open');
		    $shortcutSettingBtn.focus(); // 팝업을 연 버튼으로 포커스 이동
		    releaseFocusTrap(); // 포커스 트랩 해제
		});

        $shortcutSettingSaveBtn.on('click', function() {
            $('html').removeClass('shortcut_setting_open');
            $shortcutSettingBtn.focus(); // 팝업을 연 버튼으로 포커스 이동
            releaseFocusTrap(); // 포커스 트랩 해제
        });

		// 추가된 부분: setting_btn 버튼과 동일한 동작 설정
		$settingBtn.on('click', function() {
		    $('html').addClass('shortcut_setting_open');
		    $shortcutSettingPopup.attr('tabindex', '-1').focus(); // 팝업에 포커스
		    trapFocus($shortcutSettingPopup); // 포커스 트랩 실행
		});


        //비주얼 슬라이드 시작
        var $visual = $container.find('.visual'),
            $visualList = $visual.find('.visual_list'),
            $visualPrev =  $visual.find('.visual_prev'),
            $visualNext =  $visual.find('.visual_next'),
            $visualAuto =  $visual.find('.visual_auto'),
            $visualCurrent = $visual.find('.visual_current'),
            $visualTotal = $visual.find('.visual_total'),
            $visualProgress = $visual.find('.visual_progress'),
            $visualAllMore = $visual.find('.visual_more');

        $visualList.slick({
            rows: 0,
            draggable: true,
            infinite: false,
            variableWidth: false,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            prevArrow: $visualPrev,
            nextArrow: $visualNext,
            dots: false,
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

        $visualList.on("beforeChange", function() {
            $visualProgress.removeClass('on');
        }).on('afterChange', function(event, slick, current) {
            if(!$visualProgress.hasClass('pause')){
                $visualProgress.addClass('on');
            }
        });
        $visualAuto.on('click', function(event){
            if($visualProgress.hasClass('pause')){
                $visualProgress.removeClass('pause');
            } else {
                $visualProgress.addClass('pause');
            }
        });
        //비주얼 슬라이드 끝

        //비주얼 팝업 배너 모아보기 시작
        var $visualPopup = $container.find('.layer_popup.visual_popup'),
            $bannerList = $visualPopup.find('.banner_slide_list'),
            $bannerCurrent = $visualPopup.find('.banner_slide_current'),
            $bannerTotal = $visualPopup.find('.banner_slide_total'),
            $bannerPrev =  $visualPopup.find('.banner_slide_prev'),
            $bannerNext =  $visualPopup.find('.banner_slide_next'),
            $visualAllClose = $visualPopup.find('.close_btn');

        $bannerList.slick({
            rows: 2,
            draggable: true,
            infinite: false,
            variableWidth: false,
            slidesToShow: 3,
            slidesToScroll: 3,
            autoplay: false,
            prevArrow: $bannerPrev,
            nextArrow: $bannerNext,
            current: $bannerCurrent,
            total: $bannerTotal,
            customState : function(state) {
                var slidestoshow = $bannerList.slick('getSlick').options.slidesToShow,
                    current = Math.ceil(state.current / slidestoshow),
                    total = Math.ceil(state.total / slidestoshow);

                state.current = current;
                state.total = total;

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
            responsive: [{
                breakpoint: 1001,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                }
            },{
                breakpoint: 641,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            },{
                breakpoint: 481,
                settings: {
                    rows: 3,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            }]
        });

        $visualAllMore.on('click',function(){
            $('html').addClass('visual_open');
            $visualPopup.attr('tabindex', '-1').focus(); // 팝업에 포커스
            trapFocus($visualPopup); // 포커스 트랩 실행
        });
        $visualAllClose.on('click',function(){
            $('html').removeClass('visual_open');
            $visualAllMore.focus(); // 팝업을 연 버튼으로 포커스 이동
            releaseFocusTrap(); // 포커스 트랩 해제
        });
        //비주얼 팝업 배너 모아보기 끝


        // 포커스 트랩 함수
        function trapFocus($popup) {
            var focusableElements = $popup.find('a, button, input, [tabindex]:not([tabindex="-1"])');
            var firstElement = focusableElements.first();
            var lastElement = focusableElements.last();

            // 팝업 내에서 포커스 순환
            $popup.on('keydown', function(e) {
                if (e.key === 'Tab') {
                    if (e.shiftKey) { // Shift + Tab -> 역방향 이동
                        if ($(document.activeElement).is(firstElement)) {
                            e.preventDefault();
                            lastElement.focus(); // 마지막 요소로 이동
                        }
                    } else { // Tab -> 순방향 이동
                        if ($(document.activeElement).is(lastElement)) {
                            e.preventDefault();
                            firstElement.focus(); // 첫 요소로 이동
                        }
                    }
                }
            });
        }
        // 포커스 트랩 해제 함수
        function releaseFocusTrap() {
            $shortcutMorePopup.off('keydown');
        }


        //알려드립니다(공지사항) 탭메뉴 시작
        var $notice = $('.notice'),
            $noticeTab = $notice.find('.tab_box'),
            $noticeTabList = $notice.find('.tab_list'),
            $noticeTabBtn = $noticeTab.find('.tab_btn'),
            $noticePanel = $notice.find('.notice_panel'),
            $noticeMore = $notice.find('.notice_more');

        $noticeTabBtn.on("click", function (){
            var $parent = $(this).parent(),
                $noticePanel = $notice.find('.notice_panel'),
                parentIndex = $parent.index(),
                thisText = $(this).text(),
                $MyCont = $noticePanel.eq(parentIndex),
                $MySlide = $MyCont.find('.notice_list.type1');

            $(this).attr('title', '선택됨').closest('.tab_item').addClass('active').siblings('.tab_item').removeClass('active').find('.tab_btn').removeAttr('title');
            $noticePanel.eq(parentIndex).addClass('active').siblings().removeClass('active');

            $MySlide.slick('setPosition');

            var url = "";
            if(thisText == '새소식'){
                url = "/www/sub.do?key=6350";
            }else if(thisText == '고시공고'){
                url = "/www/sub.do?key=6353";
            }else if(thisText == '일자리'){
                url = "/www/sub.do?key=5930";
            }else if(thisText == '유관기관'){
                url = "/www/sub.do?key=6352";
            }else if(thisText == '언론보도'){
                url = "/www/sub.do?key=6357";
            }else if(thisText == '설문조사'){
                url = "/www/sub.do?key=5820";
            }

            $noticeMore.prop('href', url);
        });

        $noticePanel.each(function (){
            var $this = $(this),
                $slideList = $this.find('.notice_list.type1'),
                $noticePrev = $this.find('.notice_prev'),
                $noticeNext = $this.find('.notice_next');

            $slideList.slick({
                autoplay : false,
                dots:false,
                rows: 2,
                slidesToShow: 2,
                slidesToScroll: 1,
                infinite: false,
                arrows: true,
                prevArrow : $noticePrev,
                nextArrow : $noticeNext,
                swipe:false,
                draggable:false,
                responsive: [{
                    breakpoint: 641,
                    settings: {
                        slidesToShow: 1,
                        swipe: true,
                        draggable: true
                    }
                }]
            })
        });


        //notice_item 타이틀 새글 표시
        var $notice1Title = $notice.find('.notice_list.type1 .title');
        $window.on('load resize',function(){
            $notice1Title.each(function(){
                var $this = $(this),
                    $new = $this.find('.new'),
                    thisSH = $this.prop('scrollHeight'),
                    thisCH = $this.prop('clientHeight');

                if($new.length<1) return;
                if(thisSH > thisCH) $this.addClass('textOver');
                else $this.removeClass('textOver');
            });
        });
        //알려드립니다(공지사항) 탭메뉴 끝

        //일정안내 시작
        var $schedule = $container.find('.schedule'),
            $scheduleList = $schedule.find('.schedule_list'),
            $scheduleCont =  $schedule.find('.schedule_contents'),
            $textList =  $scheduleCont.find('.text_list'),
            $textPrev =  $scheduleCont.find('.text_prev'),
            $textNext =  $scheduleCont.find('.text_next'),
            $textControl = $scheduleCont.find('.text_control');

        $scheduleList.slick({
            rows: 1,
            draggable: false,
            infinite: false,
            variableWidth: false,
            slidesToShow: 31,
            slidesToScroll: 1,
            autoplay: false,
            swipe:true,
            arrows: false,
            responsive: [{
                breakpoint: 1501,
                settings: {
                    slidesToShow: 26,
                }
            }, {
                breakpoint: 1301,
                settings: {
                    slidesToShow: 18,
                }
            }, {
                breakpoint: 1001,
                settings: {
                    slidesToShow: 15,
                }
            }, {
                breakpoint: 801,
                settings: {
                    slidesToShow: 20,
                }
            }, {
                breakpoint: 481,
                settings: {
                    slidesToShow: 15,
                    slidesToScroll: 12,
                },
            }]
        });

        $textList.slick({
            rows: 3,
            vertical: true,
            draggable: true,
            infinite: false,
            variableWidth: false,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: false,
            autoplaySpeed: 3000,
            prevArrow: $textPrev,
            nextArrow: $textNext,
        });

        //text_item이 2개 미만일 때 text_control 숨김
        if ($textList.find('.text_item').length < 2) {
            $textControl.hide();
        } else {
            $textControl.show();
        }

        //일정안내 끝

        //주요 서비스 시작
        var $service = $('.service'),
            $serviceTab = $service.find('.service_tab'),
            $serviceItem = $serviceTab.find('.service_item'),
            $serviceTabBtn = $serviceItem.find('.service_btn');

        $serviceTabBtn.on("click", function (){
            var $parent = $(this).parent(),
                $tabContent = $parent.find('.service_panel'),
                $MySlide = $tabContent.find('.slide_list');

            $(this).attr('title', '선택됨').closest('.service_item').addClass('active').siblings('.service_item').removeClass('active').find('.service_btn').removeAttr('title');

            $MySlide.slick('setPosition');

        });

        $serviceItem.each(function (){
            var $this = $(this),
                $slideList = $this.find('.slide_list'),
                $slidePrev = $this.find('.service_control .service_prev'),
                $slideNext = $this.find('.service_control .service_next');

            $slideList.slick({
                autoplay : false,
                dots:false,
                slidesToShow: 6,
                slidesToScroll: 1,
                infinite: false,
                arrows: true,
                prevArrow : $slidePrev,
                nextArrow : $slideNext,
                swipe:false,
                draggable:false,
                responsive: [{
                    breakpoint: 1501,
                    settings: {
                        slidesToShow: 5,
                        swipe:true,
                        draggable:true,
                    }
                },{
                    breakpoint: 1301,
                    settings: {
                        slidesToShow: 3,
                        swipe:true,
                        draggable:true,
                    }
                },{
                    breakpoint: 481,
                    settings: {
                        slidesToShow: 2,
                        swipe:true,
                        draggable:true,
                    }
                }]
            });

            function toggleArrows() {
                var windowWidth = $(window).width();
                var slideCount = $slideList.find('.slick-slide:not(.slick-cloned)').length;

                if (windowWidth >= 1500 && slideCount === 6) {
                    // 1500px 이상이면서 슬라이드가 6개일 때 화살표 숨김
                    $slidePrev.hide();
                    $slideNext.hide();
                } else {
                    $slidePrev.show();
                    $slideNext.show();
                }
            }

            // 슬라이드 로드 후 화살표 제어
            $slideList.on('setPosition', function () {
                toggleArrows();
            });

            // 초기 상태에서 화살표 제어
            toggleArrows();

            // 화면 크기 조정 시 화살표 다시 제어
            $(window).resize(function () {
                toggleArrows();
            });
        });

        //주요 서비스 끝

        //스크롤 유도 애니메이션
        $(document).ready(function() {
            function animateScroll() {
                $('.scroll .line').animate({
                    height: '30px'
                }, 1000, function() {

                    $('.scroll .circle1').animate({
                        opacity: 1
                    }, 1000, function() {

                        $('.scroll .circle2').animate({
                            opacity: 1
                        }, 1500, function() {

                            setTimeout(function() {
                                $('.scroll .line').css('height', '0');
                                $('.scroll .circle1').css('opacity', '0');
                                $('.scroll .circle2').css('opacity', '0');
                                animateScroll();
                            }, 500);
                        });
                    });
                });
            }
            animateScroll();
        });

        //하단 퀵메뉴 시작
        var $floating = $html.find('.floating'),
            $floatingBtn = $floating.find('.floating_btn'),
            $floatingQuick = $html.find('.floating_quick'),
            $floatingClose = $floatingQuick.find('.floating_close'),
            $floatingTab = $floatingQuick.find('.tab_box'),
            $floatingTabBtn = $floatingTab.find('.tab_btn');

        $floatingBtn.on('click',function(){
            $('html').addClass('floating_quick_open');
        });
        $floatingClose.on('click',function(){
            $('html').removeClass('floating_quick_open');
        });

        $floatingTabBtn.on("click", function (){
            var $parent = $(this).parent(),
                $quickPanel = $floatingQuick.find('.quick_panel'),
                parentIndex = $parent.index();

            $(this).attr('title', '선택됨').closest('.tab_item').addClass('active').siblings('.tab_item').removeClass('active').find('.tab_btn').removeAttr('title');
            $quickPanel.eq(parentIndex).addClass('active').siblings().removeClass('active');

        });
        //하단 퀵메뉴 끝


        // 메인 검색 자동완성
        var $searchInput = $('.total_search');
        $searchInput.each(function(){

            $(this).after($('<div>',{
                class:'search_logs',
            }).append($('<ul>')));

            var $input = $(this),
                $searchLogs = $input.next();

            $input.on('input',function(){
                var $this = $(this),
                    thisQuery = $this.val();

                if(thisQuery.length<1) AtcpDeactive($searchLogs);
                else AtcpActive($searchLogs, thisQuery);
            }).on('focusin',function(){
                if($searchLogs.hasClass('active')) $searchLogs.height($searchLogs.find('ul').innerHeight()).find('a, button').attr('tabindex',0);
            }).on('focusout',function(){
                setTimeout(function(){
                    if(!document.activeElement.closest('.search_input')) $searchLogs.height(0).find('a, button').attr('tabindex',-1);
                });
            });

            $(window).on('resize',function(){
                $searchLogs.height(0).find('a, button').attr('tabindex',-1);
            });
        });

	});
})(window.jQuery);

/**
 * 검색어 입력시 자동완성
*/
function AtcpActive($logs, thisQuery){
    var $autolist = $logs.find('ul');
    $.ajax({
        url: "/search/api/akc.jsp?kwd=" + thisQuery,
        contentType: 'application/json;charset=utf-8',
        success: function(response) {
            var obj = JSON.parse(response),
                // seed = obj.seed,
                list = obj.suggestions[0],
                $input = $logs.prev();

            $input[0].originVal = thisQuery;

            $autolist.html('');

            $.each(list,function(i,item){
                var $item = $('<li>'),
                    $button = $('<button type="button" title="자동완성 삭제" class="search_delete"></button>'),
                    kwd = item[0],
                    $a = $('<a>',{
                        href: '/search/search.jsp?kwd='+kwd,
                        html: kwd.replace(new RegExp(thisQuery,'gi'),function(match){
                            return '<em>' + match + '</em>';
                        }),
                    });

                $a.on('focusin',function(){
                    $input.val(kwd);
                });

                $a.add($button).on('focusout',function(){
                    setTimeout(function(){
                        if(!!document.activeElement.closest('.search_input')) return;
                        $logs.height(0).find('a, button').attr('tabindex',-1);
                        $input.val($input[0].originVal);
                    });
                });

                $autolist.append($item.append($a, $button));
            });

            if($autolist.children().length<1) AtcpDeactive($logs);
            $logs.addClass('active').height($autolist.innerHeight());
        },
        error: function(){
            console.log('Error')
        }
    });
};

function AtcpDeactive($logs){
    $logs.removeClass('active').height(0);
};



/*
document.addEventListener('DOMContentLoaded', function() {
    // 버튼과 팝업 요소 선택
    const shortcutList = document.querySelector('.shortcut_box .shortcut_list');
    const settingButton = document.querySelector('.setting_btn');
    const closeSettingButton = document.querySelector('.close_btn');
    const saveButton = document.querySelector('.save_btn');
    const resetButton = document.querySelector('.reset_btn');
    const shortcutSettingPopup = document.querySelector('.shortcut_setting_popup');
    const shortcutBox = document.querySelector('.shortcut_box .shortcut_list');
    const moreButton = document.querySelector('.shortcut_btn.more'); // 더보기 버튼
    const settingButton2 = document.querySelector('.setting');
    const moreList = document.querySelector('.shortcut_list.more'); // 더보기 ul 요소

    // 최초 접속 시에만 favoriteShortcuts에 7개 아이템 추가
    if (!localStorage.getItem('favoriteShortcuts')) {
        // 초기 아이템 7개
        const initialFavorites = ['item1', 'item2', 'item3', 'item4', 'item5', 'item6', 'item7'];
        localStorage.setItem('favoriteShortcuts', JSON.stringify(initialFavorites));
    }

    // '나의메뉴설정' 버튼 클릭 시 팝업 열기
    settingButton.addEventListener('click', function() {
        shortcutSettingPopup.style.display = 'block'; // 팝업 표시
        loadCheckedItems(); // 팝업을 열 때 체크된 항목을 로드
    });

    settingButton2.addEventListener('click', function() {
        shortcutSettingPopup.style.display = 'block'; // 팝업 표시
        loadCheckedItems(); // 팝업을 열 때 체크된 항목을 로드
    });

    // '닫기' 버튼 클릭 시 팝업 닫기
    closeSettingButton.addEventListener('click', function() {
        shortcutSettingPopup.style.display = 'none'; // 팝업 숨기기
    });

    // '설정하기' 버튼 클릭 시 체크된 항목 저장
    saveButton.addEventListener('click', function() {
        const selectedItems = [];

        // 체크된 항목을 selectedItems 배열에 추가
        document.querySelectorAll('.shortcut_menu input[type="checkbox"]:checked').forEach(function(checkbox) {
            const itemId = checkbox.getAttribute('data-id'); // data-id 사용
            selectedItems.push(itemId); // 체크된 메뉴 ID를 배열에 추가
        });

        // localStorage에 저장
        localStorage.setItem('favoriteShortcuts', JSON.stringify(selectedItems));

        // 설정 팝업 닫기
        shortcutSettingPopup.style.display = 'none';

		loadPage();
		updateShortcutFavorites();
    });

    // '초기화' 버튼 클릭 시 체크박스 모두 해제
    resetButton.addEventListener('click', function() {
        document.querySelectorAll('.shortcut_menu input[type="checkbox"]').forEach(function(checkbox) {
            checkbox.checked = false; // 모든 체크박스를 해제
        });
    });

    // 저장된 항목에 맞게 체크박스를 체크
    function loadCheckedItems() {
        // localStorage에서 저장된 즐겨찾기 항목을 가져옴
        const favorites = JSON.parse(localStorage.getItem('favoriteShortcuts')) || [];

        // 저장된 항목을 확인
        console.log('Favorites loaded from localStorage:', favorites);

        // 모든 체크박스를 초기화하고 저장된 항목에 맞게 체크
        document.querySelectorAll('.shortcut_menu input[type="checkbox"]').forEach(function(checkbox) {
            console.log(`Checking checkbox with data-id: ${checkbox.getAttribute('data-id')}`);
            checkbox.checked = favorites.includes(checkbox.getAttribute('data-id')); // 저장된 data-id가 체크박스의 data-id와 일치하면 체크
        });
    }

	// 더보기 버튼 동작 실행 로직을 함수로 추출
	function updateShortcutFavorites() {
	    const favorites = JSON.parse(localStorage.getItem('favoriteShortcuts')) || [];

	    // 모든 .shortcut_list.more 내부 항목의 <i class="star"> 요소를 초기화
	    document.querySelectorAll('.shortcut_box.more .shortcut_list.more .shortcut_item a .star').forEach(star => {
	        star.remove(); // 기존 star 태그를 모두 삭제
	    });

	    // 즐겨찾기 항목에 맞게 <i class="star">즐겨찾는메뉴</i> 추가
	    favorites.forEach(function(itemId) {
	        const listItem = document.querySelector(`.shortcut_box.more .shortcut_list.more [data-id="${itemId}"]`)?.closest('.shortcut_item');
	        if (listItem) {
	            const anchors = listItem.querySelectorAll('a'); // 모든 <a> 태그를 가져옴
	            anchors.forEach(anchor => {
	                // '즐겨찾는메뉴' 아이콘 추가
	                if (!anchor.querySelector('.star')) {
	                    const starElement = document.createElement('i');
	                    starElement.className = 'star';
	                    starElement.textContent = '즐겨찾는메뉴';
	                    anchor.insertBefore(starElement, anchor.firstChild); // <a>의 첫 번째 자식으로 star 아이콘 삽입
	                }
	            });
	        }
	    });
	}

	// '더보기' 버튼 클릭 시 updateShortcutFavorites 호출
	moreButton.addEventListener('click', updateShortcutFavorites);


	function loadPage(){
		const favorites = JSON.parse(localStorage.getItem('favoriteShortcuts')) || [];
	    // 기존 li 초기화
	    shortcutList.innerHTML = '';

	    // 즐겨찾기 항목 중 최대 7개만 추가
	    favorites.slice(0, 7).forEach(function(itemId) {
	        // a 태그 내에서 data-id를 찾는 방법
	        const matchingAnchor = document.querySelector(`.shortcut_list a[data-id="${itemId}"]`);
	        if (matchingAnchor) {
	            const listItem = matchingAnchor.closest('li'); // <a> 태그의 부모 li를 찾음
	            if (listItem) {
	                // li 항목을 첫 번째 .shortcut_list에 추가
	                shortcutList.appendChild(listItem.cloneNode(true)); // 원본을 복제하여 추가
	            }
	        }
	    });
	}

	loadPage();
});
*/


