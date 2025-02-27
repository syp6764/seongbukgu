<#ftl encoding="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import ="kr.co.hanshinit.NeoCMS.cmm.service.LoginVO" %>

<%
LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <meta name="viewport"
          content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes"/>
    <meta name="keywords" content="@@{siteInfo.siteKwrd}"/>
    <meta name="description" content="@@{siteInfo.siteDc}"/>
    <link rel="icon" href="/common/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/common/css/font.css"/>
    <link rel="stylesheet" href="/site/public/css/sub.css">
    <link rel="stylesheet" href="/site/bogunso/css/sub.css">
    <script src="/common/js/jquery-1.12.4.min.js"></script>
    <script src="/common/js/plugins.js"></script>
    <script src="/common/js/program.js"></script>
    <script src="/site/public/js/common.js"></script>
    <script src="/site/public/js/sub.js"></script>
    <script src="/site/public/js/program.js"></script>
    <title>@@{menuInfo.menuNm} - @@{siteInfo.siteNm}</title>
</head>

<body id="${siteInfo.tmplatId}" class="@@{siteInfo.siteId} page@@{key}">
<div id="wrapper">
    
    
    <header id="header">
        <jsp:include page="/repository/${siteInfo.siteId}/menu/top.jsp" />
    </header>
    
    <jsp:include page="/repository/family.jsp" />
    
    <div id="container">
        <div class="wrap clearfix">
            <div class="sub_visual"></div>
            <div id="side" class="side">
                <div class="side_title">
                    <span class="side_subject"><c:out value="@@{menuInfo.naviList[0].menuNm}"/></span>
                </div>
                <div class="side_menu">
                    <nav class="menu init">
                        <h2 class="skip"><c:out value="@@{menuInfo.menuNm}"/></h2>
                        <div class="depth depth1">
                            <ul class="depth_list depth1_list">
                                <c:forEach var="secondMenu" items="@@{mainSecondMenuList}" varStatus="status">
                                    <c:if test="@@{menuInfo.naviList[0].menuNo == secondMenu.upperMenuNo and secondMenu.menuLevel == 2}">
                                        <li class="depth_item depth1_item <c:if test='@@{menuInfo.naviList[1].menuNo == secondMenu.menuNo}'>active</c:if>">
                                            <a href="<c:out value="@@{secondMenu.menuUrl}"/>" class="depth_text depth1_text" target="<c:out value="@@{secondMenu.linkTrget}"/>"><c:out value="@@{secondMenu.menuNm}"/></a>
                                            <div class="depth depth2">
                                                <ul class="depth_list depth2_list">
                                                    <c:forEach var="thirdMenu" items="@@{mainThirdMenuList}" varStatus="status">
                                                        <c:out value="@@{thirdMenu.menuNm}"/>
                                                        <c:if test="@@{secondMenu.menuNo eq thirdMenu.upperMenuNo}">
                                                            <li class="depth_item depth2_item <c:if test='@@{menuInfo.naviList[2].menuNo == thirdMenu.menuNo}'>active</c:if>">
                                                                <a href="<c:out value="@@{thirdMenu.menuUrl}"/>" class="depth_text depth2_text" target="<c:out value="@@{thirdMenu.linkTrget}"/>"><c:out value="@@{thirdMenu.menuNm}"/></a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            
            
            <main class="colgroup">
                <article>
                    
                    <header class="sub_head">
                        
                        <div class="sub_title">
                            <h2>@@{menuInfo.menuNm}</h2>
                        </div>
                        
                        <div class="breadcrumbs">
                            <ol class="breadcrumbs_list">
                                <!-- 차수에 맞게 링크 추가해주세요! -->
                                <li class="breadcrumbs_item home"><a href="./index.do" class="breadcrumbs_anchor">홈</a>
                                
                                </li>
                                <c:forEach var="navi" items="@@{menuInfo.naviList}" varStatus="status">
                                    <li class="breadcrumbs_item n@@{status.count}"><a href="@@{navi.menuUrl}" class="breadcrumbs_anchor">@@{navi.menuNm}</a></li>
                                </c:forEach>
                            </ol>
                        </div>
                        
                        
                        <div class="addons">
                            <ul class="addons_list">
                                <li class="addons_item share">
                                    <button type="button" class="addons_button share_show">공유하기</button>
                                    <c:url var="facebookUrl" value="http://www.facebook.com/sharer.php">
                                        <c:param name="u">http://<%= request.getServerName() %>:<%= request.getServerPort() %>/@@{siteInfo.siteId}/sub.do?key=@@{param.key}</c:param>
                                        <c:param name="t"><c:out value="@@{menuInfo.cntntsNm}"/> - ${siteInfo.siteNm!""}</c:param>
                                    </c:url>
                                    <c:url var="blogUrl" value="http://share.naver.com/web/shareView.nhn">
                                        <c:param name="url"><c:out value="@@{menuInfo.cntntsNm}"/> - ${siteInfo.siteNm!""} http://<%= request.getServerName() %>:<%= request.getServerPort() %>/@@{siteInfo.siteId}/sub.do?key=@@{param.key}</c:param>
                                        <c:param name="title"><c:out value="@@{menuInfo.cntntsNm}"/> - ${siteInfo.siteNm!""}</c:param>
                                    </c:url>
                                    <div class="share_panel">
                                        <ul class="share_list clearfix">
                                            <li class="share_item blog">
                                                <a href="@@{blogUrl}" target="_blank" title="새창" rel="noopener noreferrer"
                                                   class="share_anchor">블로그</a>
                                            </li>
                                            <li class="share_item facebook">
                                                <a href="@@{facebookUrl}" target="_blank" title="새창" rel="noopener noreferrer"
                                                   class="share_anchor">페이스북</a>
                                            </li>
                                        </ul>
                                        <button type="button" class="share_hide">닫기</button>
                                    </div>
                                </li>
                                <li class="addons_item print">
                                    <button type="button" onclick="window.print();" class="addons_button print_anchor">인쇄</button>
                                </li>
                                <li class="addons_item copy">
                                    <button onclick="clip()"  class="addons_button copy_anchor">복사</button>
                                </li>
                            </ul>
                        </div>
                    </header>
                    
                    <jsp:include page="/repository/common/tabMenu.jsp" />
                    
                    <div id="contents" class="cts@@{key}">
                        <decorator:body/>
                        
                        <!-- 담당자 정보 -->
                        <div class="manager_info clearfix">
                            <h3 class="skip">담당자 정보</h3>
                            <ul class="clearfix">
                                <li class="manager_item n1"><span>담당부서</span> 기획예산과</li>
                                <li class="manager_item n2"><span>전화번호</span>02-2241-6571</li>
                                <li class="manager_item n3"><span>팩스번호</span>02-2241-3813</li>
                                <li class="manager_item n4"><span>최종수정일</span>2024.06.18</li>
                            </ul>
                        </div>
                    
                    
                    </div>
                
                
                </article>
            </main>
        
        </div>
    </div>
    
    <jsp:include page="/repository/${siteInfo.siteId}/footer.jsp" />


</div>
</body>
</html>
