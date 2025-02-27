$(function(){
	$('.path_menu [data-menu-type]').menu({
		cut : {},
		event : 'click',
		namespace : 'path'
	});

	//서브페이지 고정 sns공유, 프린트
    $('.contents_fixed li.sns button').click(function(event) {
        var $target = $(event.target);
        if ($target.is('.active')) {
            $(this).removeClass('active');
			 $('.contents_fixed li.sns').removeClass('active')

        } else {
            $(this).addClass('active');
            $('.contents_fixed li.sns').addClass('active')
        };
        return false;
    });
});

/*
// 만족도조사
function fn_validateCntntsEvalHist( frm ) {
    var valiEvl = false;
    for( var i=0; i<frm.cntntsEvlSe.length; i++ ) {
        if( frm.cntntsEvlSe[i].checked == true ) {
            valiEvl = true;
            break;
        }
    }
    if( !valiEvl ) {
        alert("만족도의 등급을 선택하지 않으셨습니다.\n만족도 등급을 선택하여 주세요.");
        fn_setFocus(frm, 'value5');
        return false;
    }
    return true;
}
*/