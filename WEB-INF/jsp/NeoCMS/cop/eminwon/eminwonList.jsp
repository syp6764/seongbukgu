<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="${menuInfo.siteId}" />
<link rel="stylesheet" href="/common/css/board.css"/>
<title>${menuInfo.cntntsNm} 목록</title>
</head>
<body>
    <script>
    $(document).ready(function(){
        $('.page_size > button').click(function(){
            $('.page_size > button').removeClass('active');
            $(this).addClass('active');
        })

    })

    function setDateRange(days) {
        var today = new Date(); // 오늘 날짜
        var startDate = new Date(); // 시작 날짜
        startDate.setDate(today.getDate() - days); // 지정된 기간만큼 이전 날짜 계산

        // yyyy-mm-dd 형식으로 날짜 변환
        function formatDate(date) {
            var year = date.getFullYear();
            var month = (date.getMonth() + 1).toString(); // 월은 0부터 시작하므로 +1
            var day = date.getDate().toString(); // 일자를 문자열로 변환

            if (month.length < 2) {
                month = "0" + month;
            }
            if (day.length < 2) {
                day = "0" + day;
            }
            return year + "-" + month + "-" + day;
        }

        // 계산한 날짜를 입력 필드에 반영
        document.getElementById('bgnde').value = formatDate(startDate);
        document.getElementById('endde').value = formatDate(today);
     }

    function setPageUnit(value, button) {
        var form = document.getElementById('eminwon');
        var input = document.getElementById('pageUnit');

        // 기존 hidden input의 값 설정
        input.value = value;

        // 모든 버튼에서 active 클래스 제거
        var buttons = form.querySelectorAll('.page_size button');
        buttons.forEach(function (btn) {
            btn.classList.remove('active');
        });

        // 클릭된 버튼에 active 클래스 추가
        button.classList.add('active');

        // 폼 제출
        form.submit();
    }
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('eminwon').addEventListener('submit', function (event) {
            var bgnde = document.getElementById('bgnde').value;
            var endde = document.getElementById('endde').value;


            if (bgnde === "" && endde === "") {
                return;
            }

            var datePattern = /^\d{4}-\d{2}-\d{2}$/;

            if (!datePattern.test(bgnde) || !datePattern.test(endde)) {
                alert('날짜를 yyyy-mm-dd 형식으로 제대로 입력해주세요.');
                event.preventDefault();
                return;
            }

            if (!isValidDate(bgnde) || !isValidDate(endde)) {
                alert('유효한 날짜를 입력해주세요.');
                event.preventDefault();
                return;
            }
        });
    });

    // 유효한 날짜인지 확인하는 함수
    function isValidDate(dateString) {
        if (!dateString) return true; // 날짜가 비어있는 경우는 유효하다고 간주

        var parts = dateString.split('-');
        var year = parseInt(parts[0], 10);
        var month = parseInt(parts[1], 10);
        var day = parseInt(parts[2], 10);

        if (month < 1 || month > 12) return false;

        var lastDay = new Date(year, month, 0).getDate(); // 해당 월의 마지막 날
        return day >= 1 && day <= lastDay;
    }

    // 유효한 날짜인지 확인하는 함수
    function isValidDate(dateString) {
        var parts = dateString.split('-');
        var year = parseInt(parts[0], 10);
        var month = parseInt(parts[1], 10);
        var day = parseInt(parts[2], 10);

        // 월은 1~12 사이, 일은 1~해당 월의 마지막 일자 사이여야 함
        if (month < 1 || month > 12) return false;

        var lastDay = new Date(year, month, 0).getDate(); // 해당 월의 마지막 날
        return day >= 1 && day <= lastDay;
    }
    </script>

<div class="cts6483_wrap bbs">
    <!--
    <div class="box icon only_title">
        <div class="box_wrap">
            <h3 class="box_title">고시·공고는 일정한 사항을 일반에 알리기 위한 문서를 말합니다.<br />(『행정업무 운영 편람』, 행정안전부(2020), 26p.)<br />채용관련 게시물만 확인 할 경우, <em class="em_blue">[채용공고]</em>를 이용하시기 바랍니다</h3>
        </div>
        <a href="https://urban.seoul.go.kr/view/html/PMNU4010000000" target="_blank" title="새창" class="btn small type2 blank n01">도시관리계획 열람공고</a><a href="https://urban.seoul.go.kr/view/html/PMNU9020000000" target="_blank" title="새창" class="btn small type2 blank">도시관리계획 결정고시</a>
    </div>
    -->

    <div class="box icon only_title n31 margin_b_30">
        <div class="box_wrap">
            <h3 class="box_title">이 게시판은 <em class="em_red">주민자치위원 모집 공고인적 공고 및 자치회관 수강료 수입 및 지출 내역 공고 등 그 밖의 조례상의
                내용을 공고하는 곳</em>입니다. 이외의 사항은 다른 게시판을 이용해 주시기 바랍니다.</h3>
        </div>
    </div>

    <form name="eminwon" id="eminwon" action="./selectEminwonList.do" method="get">
	<input type="hidden" name="key" value="${key}">
	<input type="hidden" name="searchCnd" value="notAncmtSj">
	<input type="hidden" name="pageUnit" id="pageUnit" value="10">
	<div class="p-wrap bbs bbs__list">
	    <div class="table_scroll">
	        <table class="table type2">
	            <caption>테이블제목 - 순으로 정보를 제공</caption>
	            <colgroup>
	                <col class="w10p">
	                <col>
	            </colgroup>
	            <tbody>
	                <tr>
	                    <th scope="row">기간설정</th>
	                    <td class="card card--bgcolor p-search type2">
	                        <div class="p-form-group n01">
	                            <div class="p-form_line">
	                                <div class="p-date_wrap">
	                                    <div class="p-date-group">
	                                        <div class="p-form-group p-date" data-date="datepicker">
	                                            <input type="text" id="bgnde" name="bgnde" class="p-input" value="${eminwon.bgnde}">
	                                            <div class="p-input__split">
	                                                <div class="p-datepicker__wrap"><button type="button" class="p-input__item p-date__icon">달력 열기</button></div>
	                                            </div>
	                                        </div>
	                                        <span class="p-form__split">-</span>
	                                        <div class="p-form-group p-date" data-date="datepicker">
	                                            <input type="text" id="endde" name="endde" class="p-input" value="${eminwon.endde}">
	                                            <div class="p-input__split">
	                                                <div class="p-datepicker__wrap"><button type="button" class="p-input__item p-date__icon">달력 열기</button></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="p-btn_group">
	                                    <button type="button" class="p-button grey_btn" onclick="setDateRange(7)">일주일</button>
	                                    <button type="button" class="p-button grey_btn" onclick="setDateRange(30)">최근 1개월</button>
	                                    <button type="button" class="p-button grey_btn" onclick="setDateRange(90)">최근 3개월</button>
	                                </div>
	                            </div>
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row">검색어</th>
	                    <td class="card card--bgcolor p-search type2">
	                        <div class="p-form_line n02">
	                            <span class="input_wrap">
	                                <input type="text" name="searchKrwd" id="searchKrwd" class="p-input p-input--beside" title="검색단어 입력" value="${eminwon.searchKrwd}" placeholder="검색어를 입력하세요">
	                            </span>
	                            <span class="p-form-group__button">
	                                <button type="submit" class="p-button search active">검색</button>
	                            </span>
	                        </div>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	</div>


    <div class="bbs_page">
        <span class="item count">총게시물 :
            <em class="em_black" data-mask="#,##0" data-mask-reverse="true">${paginationInfo.totalRecordCount}</em>건</span>
        <span class="item page">페이지 : <em class="em_b_black">${paginationInfo.currentPageNo}</em> / ${paginationInfo.totalPageCount}</span>
        <!-- 1페이지당 보이는 개수 10, 20, 30, 40,...등등 버튼 클릭시 나오도록 해주세요 -->
        <div class="page_size">
            <button type="button" <c:if test="${eminwon.pageUnit eq '10'}">class="active"</c:if> onclick="setPageUnit(10, this)">10</button>
            <button type="button" <c:if test="${eminwon.pageUnit eq '20'}">class="active"</c:if> onclick="setPageUnit(20, this)">20</button>
            <button type="button" <c:if test="${eminwon.pageUnit eq '30'}">class="active"</c:if> onclick="setPageUnit(30, this)">30</button>
            <button type="button" <c:if test="${eminwon.pageUnit eq '40'}">class="active"</c:if> onclick="setPageUnit(40, this)">40</button>
            <button type="button" <c:if test="${eminwon.pageUnit eq '50'}">class="active"</c:if> onclick="setPageUnit(50, this)">50</button>
        </div>
    </div>
	</form>

    <form name="bbsNttForm" method="post" action="#" data-select="checkall" data-checkallid="#check-all" data-checkname="checkid">
        <fieldset>
            <legend>게시물 목록</legend>
            <table class="p-table simple" data-table="rwd" data-tabletype="simple" data-breakpoint="760">
	        <caption>고시/공고 목록 : 번호, 제목, 담당부서, 등록일</caption>
	        <colgroup>
                    <col/>
                    <col/>
                    <col/>
                    <col/>
                    <col/>
	        </colgroup>
	        <thead>
	            <tr>
	                <th scope="col">번호</th>
	                <th scope="col">고시공고 번호</th>
	                <th scope="col">제목</th>
	                <th scope="col">담당부서</th>
	                <th scope="col">게재일자</th>
	            </tr>
	        </thead>
	        <tbody class="text_center">
                <c:if test="${key eq '5930' }">
                    <tr>
                        <td colspan="5">
                            현재 목록은 <em class="em_blue">게시글 제목</em>에 <em class="em_blue">'일자리'</em>, <em class="em_blue">'채용'</em>, <em class="em_blue">'아르바이트'</em>, <em class="em_blue">'공공근로'</em> 키워드가 포함되어 검색된 목록입니다. <br />
                            자세한 내용은 상단 안내문구를 확인해주세요.
                        </td>
                    </tr>
                </c:if>
				<c:set var="currentPageStartNo" value="${paginationInfo.currentPageStartNo}" />
	        	<c:forEach var="result" items="${resultEminwonList}" varStatus="status">
		            <tr>
		            	<td>${currentPageStartNo}</td>
		                <td>${result.notAncmtRegNo}</td>
		                <td class="p-subject">
		                    <a href="./selectEminwonView.do?<c:out value="${eminwon.params}"/>&amp;key=<c:out value="${key}"/>&amp;notAncmtMgtNo=<c:out value="${result.notAncmtMgtNo}"/>&amp;notAncmtSeCode=<c:out value="${param.notAncmtSeCode }"/>">
		                    	${result.notAncmtSj}
		                    </a>
		                </td>
		                <td>${result.depNm}</td>
		                <td data-mask="#,##0" data-mask-reverse="true">
		                	<c:catch var="errmsg">
							    <fmt:parseDate value="${result.pbsHopYmd}" var="pbsHopYmd" pattern="yyyyMMdd" />
								<fmt:formatDate value="${pbsHopYmd}" pattern="yyyy-MM-dd" />
							</c:catch>
							<c:out value="${errmsg }"></c:out>
		                </td>
		            </tr>
		            <c:set var="currentPageStartNo" value="${currentPageStartNo-1}" />
				</c:forEach>

				<c:if test="${fn:length(resultEminwonList) == 0}">
					<tr>
						<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>

	        </tbody>
	    </table>
        </fieldset>
    </form>

		<div class="p-pagination">
			<div class="p-page">
				<ui:pagination paginationInfo = "${paginationInfo}" type="board" jsFunction="./selectEminwonList.do?key=${key}&amp;notAncmtSeCode=${eminwon.notAncmtSeCode}&amp;pageUnit=${eminwon.pageUnit}&amp;searchCnd=${eminwon.searchCnd}&amp;searchKrwd=${eminwon.searchKrwd}&amp;pageIndex=" />
			</div>
		</div>
</div>
</body>
</html>