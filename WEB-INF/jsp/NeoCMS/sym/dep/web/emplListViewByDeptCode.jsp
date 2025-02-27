<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>

<c:if test="${not empty teamOrderList and fn:length(teamOrderList) gt 0}">
    <h3>부서별 전화번호 안내</h3>

	<c:forEach var="team" items="${teamOrderList}">
		<c:set var="tn" value="${team.teamNm}"/>
		<c:if test="${not empty emplListByTeamNm and not empty emplListByTeamNm[tn] and fn:length(emplListByTeamNm[tn]) gt 0}">
		<h4>${department.deptNm}<c:if test="${department.deptNm ne team.teamNm}"> - ${team.teamNm}</c:if></h4>

            <table class="table responsive">
                <colgroup>
                    <%--<col />--%>
                    <col style="width:15%"/>
                    <col style="width:15%" />
                    <col />
                </colgroup>
                <thead>
                    <tr>
                        <%--<th scope="col">부서</th>--%>
                        <th scope="col">직책</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">직무</th>
                    </tr>
                </thead>
                <tbody class="text_center" id="tb_body">
                    <c:forEach items="${emplListByTeamNm[tn]}" var="empl">
                        <tr>
                            <%--<td class="text_left">
                                <c:choose>
                                    <c:when test="${empty empl.teamNm}">
                                        <c:out value="${empl.deptNm }" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${empl.teamNm }" />
                                    </c:otherwise>
                                </c:choose>
                            </td>--%>
                            <td data-content="직책"><c:out value="${empl.rspofc }" />
                            <td data-content="전화번호"><nobr><c:out value="${empl.emplTelno}"/></nobr></td>
                            <td data-content="직무" class="text_left">${tsu:nl2br(empl.emplJob)}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

		</c:if>
	</c:forEach>

</c:if>
