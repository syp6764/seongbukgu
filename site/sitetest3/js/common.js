$(function() {
    var $lnbNav = $('.lnb .nav'),
        $lnbNavActivedText = $lnbNav.find('[data-menu-actived]'),
        lnbNavMenuType = parseInt($lnbNav.attr('data-menu-type'), 10) || 1,
        lnbNavOption = {
            namespace: 'lnb'
        };

    $(window).on('responsive', function(event) {
        //wide, web, tablet, phone분기에 걸렸을때
        if ($.inArray(event.state, event.setting.rangeProperty) > -1) {
            var menuEvent = 'click',
                menuType = 4;

            //wide 또는 web일때
            if (event.state === 'wide' || event.state === 'web') {
                menuEvent = 'mouse';
                menuType = lnbNavMenuType;
                $lnbNavActivedText.removeAttr('data-menu-actived');
            } else {
                $lnbNavActivedText.attr('data-menu-actived', '');
            }

            //현재 메뉴 이벤트와 분기에 따른 메뉴 이벤트가 다를때
            if (lnbNavOption.event !== menuEvent) {
                //메뉴 이벤트 변경
                lnbNavOption.event = menuEvent;

                //data-menu-type변경하고 새로운메뉴 생성 후 data-menu-type복귀
                $lnbNav.attr('data-menu-type', menuType).menu(lnbNavOption).attr('data-menu-type', lnbNavMenuType);
            }
        }
    });

    //검색


	$('#header').find('.search').find('.search_open').on('click.common', function(event) {
		$('html').toggleClass('search_active');
	});

	$('#header').find('.search').find('.search_close').on('click.common', function(event) {
		$('html').removeClass('search_active');
	});

    //banner
    var bannerSlick = $('.banner .banner_list');

    bannerSlick.slick({
        autoplay: true,
        speed: 1000,
        dots: false,
		slidesToShow:2,
		slidesToScroll:1,
		// variableWidth:true,
        prevArrow: $('.banner .banner_control .banner_prev'),
        nextArrow: $('.banner .banner_control .banner_next'),
        pauseOnDotsHover: true,
        swipe: true,
        draggable: true,
		responsive: [
	    {
	      breakpoint: 1001,
	      settings: {
	        slidesToShow: 5
	      }
	  	},
		{
	      breakpoint: 801,
	      settings: {
	        slidesToShow: 4
	      }
	  	},
		{
	      breakpoint: 641,
	      settings: {
	        slidesToShow:2
	      }
	  	}
	  ]
    });
    $('.banner .banner_control .banner_pause').on('click', function(event) {
        $('.banner .banner_control .banner_play').show().focus();
        $('.banner .banner_control .banner_pause').hide();
        bannerSlick.slick('slickPause').slick('slickSetOption', 'pauseOnDotsHover', false);
    });
    $('.banner .banner_control .banner_play').on('click', function(event) {
        $('.banner .banner_control .banner_pause').show().focus();
        $('.banner .banner_control .banner_play').hide();
        bannerSlick.slick('slickPlay').slick('slickSetOption', 'pauseOnDotsHover', true);
    });

    $.responsive({
        range: {
            wide: {
                horizontal: {
                    from: 9999,
                    to: 1201
                }
            },
            web: {
                horizontal: {
                    from: 1200,
                    to: 1001
                }
            },
            tablet: {
                horizontal: {
                    from: 1000,
                    to: 641
                }
            },
            phone: {
                horizontal: {
                    from: 640,
                    to: 0
                }
            }
        },
        lowIE: {
            property: 'web'
        }
    });


    /*액티브 박스-공통*/
    $('.active_box button.active_btn').on('click', function() {
        var $this = $(this);
        if (!$this.hasClass('on')) {
            $this.attr('title', '닫기').addClass('on').parent('.active_box').addClass('active');
        } else {
            $this.attr('title', '열기').removeClass('on').parent('.active_box').removeClass('active');
        }
    });

    //검색
    $('.search_btn button').on('click', function() {
        var $this = $(this);
        if (!$this.hasClass('on')) {
            $this.attr('title', '검색영역 닫기').addClass('on');
            $('.search').addClass('active');
        } else {
            $this.attr('title', '검색영역 열기').removeClass('on');
            $('.search').removeClass('active');
        }
    });

    //상단이동
    var top_move_btn = $(".goto_top");
    top_move_btn.click(function() {
        $("html, body").animate({
            scrollTop: 0
        }, 400);
    });


    // 탭메뉴 공통적으로 사용
    function tabOn(tab, num, img) {
        var $tab, $tab_btn;
        var tabid = tab,
            n = num - 1,
            btn_img = img;

        $tab = $(tabid + '> ul > li');
        $tab_btn = $(tabid + '> ul > li > a');

        $tab_btn.siblings().hide();
        $tab.eq(n).addClass('active');
        $tab.eq(n).children('a').siblings().show();

        if (btn_img == 'img') {
            var btn = $tab.eq(n).children('a').find("img");
            btn.attr("src", btn.attr("src").replace("_off", "_on"));
        }

        $tab_btn.on("click", function(event) {
            var realTarget = $(this).attr('href');

            if (realTarget != "#") {
                return;
            }
            if (btn_img == 'img') {
                for (var i = 0; i < $tab.size(); i++) {
                    var btn = $tab.eq(i).children('a').find("img");
                    btn.attr("src", btn.attr("src").replace("_on", "_off"));
                }
                var active = $(this).parent().attr('class');
                if (active != 'active') {
                    var btn_img_off = $(this).find('img')[0];
                    btn_img_off.src = btn_img_off.src.replace('_off', '_on');
                }
            }
            $tab_btn.siblings().hide();
            $tab_btn.parent().removeClass('active');

            $(this).siblings().show();
            $(this).parent().addClass('active');

            event.preventDefault();
        });
    }

    function tabOrg(tabid, a, img) {
        var $tab, $tab_btn, $obj, $obj_view;
        var tabid = tabid,
            num = a,
            btn_img = img;

        $tab = $(tabid + ' .tab_item  li');
        $tab_btn = $(tabid + ' .tab_item li a');
        $obj = $(tabid + ' .tab_obj');
        $obj_view = $(tabid + ' .tab_obj.n' + num);

        $tab.eq(num - 1).addClass('active');
        $obj_view.show();

        if (btn_img == 'img') {
            var btn = $tab.eq(num - 1).children('a').find("img");
            btn.attr("src", btn.attr("src").replace("_off", "_on"));
        }

        $tab.bind("click", function(event) {
            if (btn_img == 'img') {
                for (var i = 0; i < $tab.size(); i++) {
                    var btn = $tab.eq(i).children('a').find("img");
                    btn.attr("src", btn.attr("src").replace("_on", "_off"));
                }
                var active = $(this).parent().attr('class');
                if (active != 'active') {
                    var btn_img_off = $(this).find('img')[0];
                    btn_img_off.src = btn_img_off.src.replace('_off', '_on');
                }
            }

            var this_eq = $tab.index($(this));
            $tab.removeClass('active');
            $tab.eq(this_eq).addClass('active');

            $obj.hide();
            $(tabid + ' .tab_obj.n' + (this_eq + 1)).show();

            event.preventDefault();
        });
    }


    //이미지 롤오버
    $(".overimg").mouseover(function() {
        var file = $(this).attr('src').split('/');
        var filename = file[file.length - 1];
        var path = '';
        for (i = 0; i < file.length - 1; i++) {
            path = (i == 0) ? path + file[i] : path + '/' + file[i];
        }
        $(this).attr('src', path + '/' + filename.replace('_off.', '_on.'));

    }).mouseout(function() {
        var file = $(this).attr('src').split('/');
        var filename = file[file.length - 1];
        var path = '';
        for (i = 0; i < file.length - 1; i++) {
            path = (i == 0) ? path + file[i] : path + '/' + file[i];
        }
        $(this).attr('src', path + '/' + filename.replace('_on.', '_off.'));
    });


});
