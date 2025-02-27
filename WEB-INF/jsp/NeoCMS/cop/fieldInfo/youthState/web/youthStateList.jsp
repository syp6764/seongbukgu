<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import=" kr.co.hanshinit.NeoCMS.cmm.util.StringUtil" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="decorator" content="${menuInfo.siteId}" />
	<link rel="stylesheet" href="/common/css/board.css" />
	<script src="/common/js/board.js"></script>
	<script src="/common/js/calendar.js"></script>
	<script type="text/javascript" src="<c:url value='/cmm/validator.do'/>"></script>
    <title>${menuInfo.cntntsNm} - ${siteInfo.siteNm}</title>

	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a1ab30f2575520064965041e48d6aed9&amp;autoload=false&amp;libraries=clusterer,services&amp;"></script>
	<script src="http://t1.daumcdn.net/mapjsapi/js/main/4.4.19/kakao.js"></script>
	<script src="http://t1.daumcdn.net/mapjsapi/js/libs/clusterer/1.0.9/clusterer.js"></script>
	<script src="http://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
</head>
<body>
	<!-- 탭메뉴 -->
	<div class="cms_tab">
	    <div class="tab">
	        <div class="tab_menu">
	            <button class="tab_select"><span>참여부동산 목록</span></button><!-- 현재메뉴명 입력해주세요 -->
	            <div class="tab_panel">
	                <ul class="tab_list n1 divide4">
                		<li class="tab_item active">
                			<a href="./selectYouthStateList.do?key=${key}" target="_self" class="tab_button"><span>참여 부동산 목록</span></a>
                		</li>
                		<li class="tab_item ">
                			<a href="./youthStateLogin.do?key=${key}" target="_self" class="tab_button"><span>참여 실적 관리</span></a>
                		</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
	<!--// 탭메뉴 -->
	<!-- 지도 -->
	<div class="content_box">
		<p class="map_info"></p>
		<div id="mapInner" class="map_box" style="width:100%;height:500px;">
		</div>
	</div>
	<!--// 지도 -->
	<!-- 검색조건 -->
	
	<form:form modelAttribute="youthStateSearchVO" name="youthStateSearchVOForm" method="get">
        <fieldset>
            <legend>게시물 검색</legend>
            <input type="hidden" name="key" value="${param.key}"/>
            <div class="card card--bgcolor p-search">
                <div class="p-form-group">
                    <form:select path="searchEstDongNm" class="p-input p-input--beside" title="검색영역선택">
                        <form:option value="">행정동</form:option>
                        <c:forEach var="result" items="${dongseList}">
                            <form:option value="${result.code}"><c:out value="${result.codeNm}"/></form:option>
                        </c:forEach>
                    </form:select>
                    <span class="p-form__split"></span>
                    <form:select path="searchCnd" class="p-input p-input--beside" title="검색영역선택">
                        <form:option value="estTitle">상호명</form:option>
                    </form:select>
                    <span class="p-form__split"></span>
                    <form:input path="searchKrwd" class="p-input p-input--beside" title="검색단어 입력" placeholder="검색단어 입력"/>
                    <span class="p-form-group__button">
                        <button type="submit" class="p-button black">검색</button>
                    </span>
                </div>
            </div>
        </fieldset>
    </form:form>
    <!--// 검색조건 -->
    <div class="row">
        <div class="col margin_t_10 small right"> 총 <em class="em_black" data-mask="#,##0" data-mask-reverse="true">${paginationInfo.totalRecordCount}</em>건  &nbsp;[ <em class="em_b_black">${paginationInfo.currentPageNo}</em>/${paginationInfo.totalPageCount} 페이지 ]</div>
    </div>
    <!-- 게시판 -->
    <form name="bbsNttForm" method="post" action="" data-select="checkall" data-checkallid="#check-all" data-checkname="checkid">
	    <fieldset>
	        <legend>게시물 목록</legend>
	        <div class="table-responsive">
		        <table class="p-table simple" data-table="rwd" data-tabletype="simple" data-breakpoint="760">
		        <caption>참여 부동산 목록 - 연번, 상호명, 소재지, 전화번호, 행정동 등 정보  제공</caption>
			        <colgroup>
			            <col width="5%">
			            <col>
			            <col style="20%">
			            <col style="10%">
			            <col style="10%">
			        </colgroup>
			        <thead>
			        <tr>
			            <th scope="col">연번</th>
			            <th scope="col">상호명</th>
			            <th scope="col">소재지</th>
			            <th scope="col">전화번호</th>
			            <th scope="col">행정동</th>
			        </tr>
			        </thead>
			        <tbody class="text_center">
			            <c:forEach var="result" items="${youthStateList}" varStatus="status">
			                <tr>
					            <td>${status.count}</td>
					            <td><c:out value="${result.estTitle}"/></td>
					            <td><c:out value="${result.estAdr}"/></td>
					            <td><c:out value="${result.estTelNo}"/></td>
					            <td><c:out value="${dongseMap[result.estDongNm]}"/></td>
					        </tr>
			            </c:forEach>
			        </tbody>
		    	</table>
	    	</div>
	    	<c:if test="${fn:length(youthStateList) == 0}">
	    		<div class="p-empty">등록된 게시물이 없습니다.</div>
	    	</c:if>
	    </fieldset>
	</form>
	<div class="p-pagination">
	    <ui:pagination paginationInfo = "${paginationInfo}" type="board" jsFunction="./selectYouthStateList.do?key=${key}&${fn:escapeXml(youthStateSearchVO.paramsExclPi)}&amp;pageIndex=" />
	</div>
	<!-- 게시판 -->
<script>

	$(document).ready(function() {
		
		const script = document.createElement("script");
		script.src = "https://dapi.kakao.com/v2/maps/sdk.js?appkey=a1ab30f2575520064965041e48d6aed9&autoload=false&libraries=clusterer,services&";
		document.head.appendChild(script);
		
		script.onload = () => {
		    kakao.maps.load(() => {
		        const node = document.getElementById('mapInner'); // 지도를 표시할 div
		        const center = new kakao.maps.LatLng(37.50802, 127.062835);
		        const options = {
		            center,
		            level: 3
		        };
		        const map = new kakao.maps.Map(node, options);
		        
		        var data = '${jsonString}';
		        
		        marker = new Array(data.length);
		        latlng = new Array(data.length);
		        
		        $(data).each(function(i, elem){
					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new kakao.maps.LatLngBounds();
					
		            displayMarker(elem.estTitle, elem.estLat, elem.estLng);
		            bounds.extend(new kakao.maps.LatLng(elem.estLat, elem.estLng));
				});
		        
		        function displayMarker(estTitle,estLat,estLng) {
		        	
		        	var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(estLat, estLng),
						clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					});
					
					// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
					// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					// marker.setClickable(true);
					
					// 마커를 지도에 표시합니다.
					marker.setMap(map);
					
					// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
					var iwContent = '<div style="width:200px;padding:5px;font-size:12px;">'+estTitle+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
					
					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
						content : iwContent,
						removable : iwRemoveable
					});
					
					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function(){
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);
					});
		        }
		    });
		};
	});
</script>
</body>
</html>