<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="decorator" content="${menuInfo.siteId}" />
	<link rel="stylesheet" href="/common/css/board.css" />
	<script src="/common/js/board.js"></script>
	<script src="/common/js/calendar.js"></script>
	<script type="text/javascript" src="<c:url value='/cmm/validator.do'/>"></script>
    <title>${menuInfo.cntntsNm} - ${siteInfo.siteNm}</title>
</head>
<body>

  <script>
            document.addEventListener('DOMContentLoaded', function () {
            let originalOrder = [];
            let isSorted = false;

            const sortingButton = document.getElementById('sorting');
            if (!sortingButton) {
                console.error('sorting 버튼을 찾을 수 없습니다.');
                return;
            }

            sortingButton.addEventListener('click', function () {
                const linkLists = document.querySelectorAll('.community .link_list');

                if (originalOrder.length === 0) {
                    linkLists.forEach(list => {
                        originalOrder.push(Array.from(list.children));
                    });
                }

                if (isSorted) {
                    linkLists.forEach((list, index) => {
                        originalOrder[index].forEach(item => list.appendChild(item));
                    });

                    sortingButton.textContent = '가나다순 정렬';
                    sortingButton.classList.remove('active');
                    isSorted = false;
                } else {
                    linkLists.forEach(list => {
                        const items = Array.from(list.querySelectorAll('.link_item'));
                        items.sort((a, b) => {
                            const indexA = parseInt(a.getAttribute('data-index'));
                            const indexB = parseInt(b.getAttribute('data-index'));
                            return indexA - indexB;
                        });
                        items.forEach(item => list.appendChild(item));
                    });

                    sortingButton.textContent = '이전 돌아가기';
                    sortingButton.classList.add('active');
                    isSorted = true;
                }
            });
        });
    </script>


<div class="p-wrap bbs bbs__list">
    <div class="cts6005_wrap">
    	<!--
        <form action="./selectEmployeeWebList.do" method="get">
        <input type="hidden" name="key" value="${key}" />
        <div class="color_box">
            <p>업무직원 검색</p>

            <span class="sb_input">
                <select name="searchCnd" title="searchCnd">
                    <option value="deptNm" <c:if test="${employee.searchCnd eq 'deptNm'}">selected=selected</c:if>>부서</option>
                    <option value="emplJob" <c:if test="${employee.searchCnd eq 'emplJob'}">selected=selected</c:if>>담당업무</option>
                    <option value="emplTelno" <c:if test="${employee.searchCnd eq 'emplTelno'}">selected=selected</c:if>>전화번호</option>
                </select>
            </span>
            <span class="sb_input">
                <input type="text" name="searchKrwd" placeholder="검색어를 입력하세요" title="검색어" value="${employee.searchKrwd}">
            </span>
            <div class="btn_box">
                <button type="submit" class="btn type3">검색</button>
            </div>

        </div>
        </form>
        -->

        <form action="./selectEmployeeWebList.do" method="get" class="boardSearchForm">
        <input type="hidden" name="key" value="${key}" />
            <fieldset>
                <legend>업무직원 검색</legend>
                <div class="card card--bgcolor p-search">
                    <div class="p-form-group">
                        <span class="p-form__split">업무직원 검색</span>
                        <select name="searchCnd" title="searchCnd" class="p-input" title="검색영역선택">
                            <option value="deptNm" <c:if test="${employee.searchCnd eq 'deptNm'}">selected=selected</c:if>>부서</option>
                            <option value="emplJob" <c:if test="${employee.searchCnd eq 'emplJob'}">selected=selected</c:if>>담당업무</option>
                            <option value="emplTelno" <c:if test="${employee.searchCnd eq 'emplTelno'}">selected=selected</c:if>>전화번호</option>
                        </select>
                        <span class="p-form__split"></span>
                        <input type="text" name="searchKrwd" class="p-input p-input--beside" title="검색단어 입력" value="${employee.searchKrwd}" placeholder="검색어를 입력하세요.">
                        <span class="p-form-group__button">
                            <button type="submit" class="p-button search">검색</button>
                        </span>
                    </div>
                </div>
            </fieldset>
        </form>


        <!-- 검색 결과 정보들이 아래 테이블에 나오도록 해주세요 -->
        <table class="table responsive">
            <caption>업무직원 - 부서, 담당업무, 전화번호 순으로 정보를 제공</caption>
            <colgroup>
                <col class="w15p">
                <col>
                <col class="w15p">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">부서</th>
                    <th scope="col">담당업무</th>
                    <th scope="col">전화번호</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="result" items="${employeeList}" varStatus="status">
    			<c:if test="${not empty result.emplJob && not empty result.emplTelno}">
                <tr>
                    <td data-content="부서">${result.deptNm }</td>
                    <td data-content="담당업무">${result.emplJob}</td>
                    <td data-content="전화번호"><c:out value="${result.emplTelno}"/></td>
                </tr>
    			</c:if>
            </c:forEach>
            </tbody>
        </table>
        <!-- 검색 결과 정보들이 아래 테이블에 나오도록 해주세요 -->

        <div class="line type3"></div>
        <h3 class="n01">조직 및 업무</h3>
        <div class="organ">
            <ol>
                <li class="step1">
                    <div class="depth_title depth1_title">구청장</div>
                </li>
                <li class="step2">
                    <div class="depth_title depth2_title box01"><a href="./contents.do?key=6773" target="_blank" title="새창">정책실</a></div>
                    <div class="depth_title depth2_title box02"><a href="./contents.do?key=6774" target="_blank" title="새창">비서실</a></div>
                </li>
                <li class="step3">
                    <div class="depth_title depth2_title type2"><a href="./contents.do?key=6775" target="_blank" title="새창">부구청장</a></div>
                </li>
                <li class="step4">
                    <div class="depth_title depth3_title"><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30701480000" target="_blank" title="새창">감사담당관</a></div>
                </li>
                <li class="step5">
                    <div class="depth_title depth3_title type2"><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702900000" target="_blank" title="새창">도시정비신속추진단</a></div>
                </li>
                <li class="step6">
                    <ul class="step_line list01">
                        <li>
                            <div class="depth_box depth4_box">
                                <div class="depth_title depth4_title"><a href="https://www.sbc.go.kr/kr/intro/cmsOffice.do" target="_blank" title="새창">구의회사무국</a></div>
                                <ul class="depth_sub depth4_sub">
                                    <li><a href="https://www.sbc.go.kr/kr/intro/cmsOffice.do" target="_blank" title="새창">의정팀</a></li>
                                    <li><a href="https://www.sbc.go.kr/kr/intro/cmsOffice.do" target="_blank" title="새창">의사팀</a></li>
                                    <li><a href="https://www.sbc.go.kr/kr/intro/cmsOffice.do" target="_blank" title="새창">홍보팀</a></li>
                                    <li><a href="https://www.sbc.go.kr/kr/intro/cmsOffice.do" target="_blank" title="새창">정책지원팀</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="depth_box depth4_box">
                                <div class="depth_title depth4_title"><a href="./contents.do?key=6776" target="_blank" title="새창">복지교육국</a></div>
                                <ul class="depth_sub depth4_sub">
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702910000" target="_blank" title="새창">복지정책과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702920000" target="_blank" title="새창">생활보장과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702930000" target="_blank" title="새창">어르신·장애인 복지과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702940000" target="_blank" title="새창">여성가족과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702950000" target="_blank" title="새창">아동청소년과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702960000" target="_blank" title="새창">교육지원과</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="depth_box depth4_box">
                                <div class="depth_title depth4_title"><a href="./contents.do?key=6777" title="새창">도시관리국</a></div>
                                <ul class="depth_sub depth4_sub">
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702670000" target="_blank" title="새창">주택정책과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702680000" target="_blank" title="새창">주거정비과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702690000" target="_blank" title="새창">도시계획과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702710000" target="_blank" title="새창">건축과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702720000" target="_blank" title="새창">공원녹지과</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="depth_box depth4_box">
                                <div class="depth_title depth4_title"><a href="./contents.do?key=6778" title="새창">건설교통국</a></div>
                                <ul class="depth_sub depth4_sub">
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702730000" target="_blank" title="새창">교통행정과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702740000" target="_blank" title="새창">교통지도과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702750000" target="_blank" title="새창">건설관리과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702760000" target="_blank" title="새창">도로과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702770000" target="_blank" title="새창">치수과</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <ul class="step_line">
                        <li>
                            <div class="depth_box depth4_box">
                                <div class="depth_title depth4_title"><a href="./contents.do?key=6779" title="새창">기획재정국</a></div>
                                <ul class="depth_sub depth4_sub">
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702780000" target="_blank" title="새창">기획예산과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702790000" target="_blank" title="새창">재무과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702810000" target="_blank" title="새창">세무1과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702820000" target="_blank" title="새창">세무2과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702970000" target="_blank" title="새창">부동산정보과</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="depth_box depth4_box">
                                <div class="depth_title depth4_title"><a href="./contents.do?key=6780" title="새창">안전생활국</a></div>
                                <ul class="depth_sub depth4_sub">
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702840000" target="_blank" title="새창">도시안전과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702850000" target="_blank" title="새창">청소행정과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702980000" target="_blank" title="새창">일자리정책과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702990000" target="_blank" title="새창">지역경제과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30702870000" target="_blank" title="새창">환경과</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="depth_box depth4_box">
                                <div class="depth_title depth4_title"><a href="./contents.do?key=6781" title="새창">행정문화국</a></div>
                                <ul class="depth_sub depth4_sub">
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30703010000" target="_blank" title="새창">행정지원과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30703020000" target="_blank" title="새창">자치행정과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30703030000" target="_blank" title="새창">문화체육과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30703040000" target="_blank" title="새창">홍보전산과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30703050000" target="_blank" title="새창">민원여권과</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="depth_box depth4_box">
                                <div class="depth_title depth4_title"><a href="./contents.do?key=6782" title="새창">보건소</a></div>
                                <ul class="depth_sub depth4_sub">
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30701620000" target="_blank" title="새창">건강정책과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30701630000" target="_blank" title="새창">건강관리과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30700370000" target="_blank" title="새창">의약과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30701670000" target="_blank" title="새창">보건위생과</a></li>
                                    <li><a href="./selectEmployeeWebList2.do?key=${key}&deptCode=30701950000" target="_blank" title="새창">보건지소</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </li>
            </ol>
        </div>
        <div class="group">
            <div class="link_box">
                <ul class="link_list">
                    <li class="link_item">
                        <a href="https://www.gov.kr/portal/orgInfo?Mcode=11180" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">정부/지자체 조직도</div>
                                <p class="text">이곳을 클릭하시면 정부 및 지자체의 조직도를 확인하실 수 있습니다.</p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <h3>동주민센터</h3>
        <p class="center_text">동주민센터명을 클릭하면 상세 업무 담당자를 확인하실 수 있습니다. <button type="button" class="community_sorting btn small" id="sorting">가나다순 정렬</button></p>
        <div class="community">
            <div class="link_box none">
                <ul class="link_list">
                    <li class="link_item" data-index="9">
                        <a href="./selectEmployeeWebList2.do?key=6092&deptCode=30701410000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">성북동 주민센터</div>
                                <p class="text">02-2241-5000</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="7">
                        <a href="./selectEmployeeWebList2.do?key=6097&deptCode=30701420000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">삼선동 주민센터</div>
                                <p class="text">02-2241-5040</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="5">
                        <a href="./selectEmployeeWebList2.do?key=6102&deptCode=30701430000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">동선동 주민센터</div>
                                <p class="text">02-2241-5080</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="3">
                        <a href="./selectEmployeeWebList2.do?key=6107&deptCode=30700470000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">돈암1동 주민센터</div>
                                <p class="text">02-2241-5120</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="4">
                        <a href="./selectEmployeeWebList2.do?key=6112&deptCode=30700480000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">돈암2동 주민센터</div>
                                <p class="text">02-2241-5160</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="10">
                        <a href="./selectEmployeeWebList2.do?key=6117&deptCode=30700490000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">안암동 주민센터</div>
                                <p class="text">02-2241-5200</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="6">
                        <a href="./selectEmployeeWebList2.do?key=6122&deptCode=30700500000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">보문동 주민센터</div>
                                <p class="text">02-2241-5240</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="16">
                        <a href="./selectEmployeeWebList2.do?key=6127&deptCode=30700510000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">정릉1동 주민센터</div>
                                <p class="text">02-2241-5280</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="17">
                        <a href="./selectEmployeeWebList2.do?key=6132&deptCode=30700520000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">정릉2동 주민센터</div>
                                <p class="text">02-2241-5320</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="18">
                        <a href="./selectEmployeeWebList2.do?key=6137&deptCode=30700530000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">정릉3동 주민센터</div>
                                <p class="text">02-2241-5360</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="19">
                        <a href="./selectEmployeeWebList2.do?key=6142&deptCode=30700540000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">정릉4동 주민센터</div>
                                <p class="text">02-2241-5400</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="1">
                        <a href="./selectEmployeeWebList2.do?key=6147&deptCode=30700550000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">길음1동 주민센터</div>
                                <p class="text">02-2241-5440</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="2">
                        <a href="./selectEmployeeWebList2.do?key=6152&deptCode=30701460000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">길음2동 주민센터</div>
                                <p class="text">02-2241-5480</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="20">
                        <a href="./selectEmployeeWebList2.do?key=6157&deptCode=30701440000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">종암동 주민센터</div>
                                <p class="text">02-2241-5520</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="11">
                        <a href="./selectEmployeeWebList2.do?key=6162&deptCode=30700600000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">월곡1동 주민센터</div>
                                <p class="text">02-2241-5560</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="12">
                        <a href="./selectEmployeeWebList2.do?key=6167&deptCode=30700610000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">월곡2동 주민센터</div>
                                <p class="text">02-2241-5600</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="13">
                        <a href="./selectEmployeeWebList2.do?key=6172&deptCode=30700650000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">장위1동 주민센터</div>
                                <p class="text">02-2241-5640</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="14">
                        <a href="./selectEmployeeWebList2.do?key=6177&deptCode=30700660000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">장위2동 주민센터</div>
                                <p class="text">02-2241-5680</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="15">
                        <a href="./selectEmployeeWebList2.do?key=6182&deptCode=30700670000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">장위3동 주민센터</div>
                                <p class="text">02-2241-5720</p>
                            </div>
                        </a>
                    </li>
                    <li class="link_item" data-index="8">
                        <a href="./selectEmployeeWebList2.do?key=6187&deptCode=30701450000" target="_blank" title="새창" rel="noopener noreferrer" class="link_anchor">
                            <div class="inner">
                                <div class="title">석관동 주민센터</div>
                                <p class="text">02-2241-5760</p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


</div>
</body>
</html>