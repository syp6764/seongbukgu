<#ftl encoding="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tsu" uri="http://www.hanshinit.co.kr/jstl/tagStringUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ page import ="kr.co.hanshinit.NeoCMS.cmm.service.LoginVO" %>

<%
LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
    <meta name="keywords" content="@@{siteInfo.siteKwrd}" />
    <meta name="description" content="@@{siteInfo.siteDc}" />
    <link rel="icon" href="/common/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/site/yeyak/css/font.css" />
    <link rel="stylesheet" href="/site/yeyak/css/main.css">
    <script src="/common/js/jquery-1.12.4.min.js"></script>
    <script src="/common/js/plugins.js"></script>
    <script src="/common/js/program.min.js"></script>
    <script src="/site/yeyak/js/main.js"></script>
    <script src="/site/yeyak/js/common.js"></script>
    <script src="/site/yeyak/js/sub.js"></script>
    <script src="/site/public/js/sub.js"></script>
    <title>@@{siteInfo.siteNm}</title>
</head>

<body id="${siteInfo.tmplatId}" class="@@{siteInfo.siteId} page@@{key}">
<div id="wrapper">
    
    
    <header id="header">
        <jsp:include page="/repository/${siteInfo.siteId}/menu/top.jsp" />
    </header>
    
    
    <div id="container">
        <div class="rowgroup">
            <div class="wrap">
                <!-- 480px 이하부터는 서브메뉴로 검색창 보여짐 -->
                <section class="search_wrap">
                    <h2 class="skip">검색</h2>
                    <div class="search_bar">
                        <form action="/search/search.jsp" method="get" class="search_form" onsubmit="return validateSearch()">
                            <fieldset class="search_fieldset">
                                <legend>검색</legend>
                                <span class="search_input">
                                    <label for="search_query" class="search_label">통합검색</label>
                                    <input type="search" placeholder="검색어를 입력해주세요." id="kwd"
                                           class="search_query" name="kwd">
                                </span>
                                <input type="submit" class="search_submit" value="검색">
                            </fieldset>
                        </form>
                    </div>
                </section>
                <section class="select">
                    <div class="select_wrap">
                        <h2 class="skip">선택</h2>
                        <ul class="tab_list">
                            <li class="tab_item n1 active">
                                <button class="tab_button" title="선택됨"><span>분류선택</span></button>
                            </li>
                            <li class="tab_item n2">
                                <button class="tab_button" onclick="fnYeyakMain('URINTY01');"><span>기관선택</span></button>
                            </li>
                        </ul>
                        <div class="tab_cont">
                            <div class="tab_panel n1 active" title="선택됨">
                                <div class="left">
                                    <div class="area_wrap">
                                        <div class="area_title">
                                            <span>한눈에 보는 <em>성북구 통합예약</em></span>
                                            <span>지도를 클릭하면 우리동네 교육/강좌가 한눈에!</span>
                                        </div>
                                        <div class="area_map">
                                            <div class="map_wrap show18">
                                                <div class="map_img">
                                                    <img src="/site/yeyak/images/main/area_map.png" alt="지도 이미지"
                                                         usemap="#map">
                                                    <map name="map">
                                                        <area alt="성북동" title="성북동" coords="34,287,42,285,58,277,71,268,83,268,96,264,110,265,125,271,131,273,147,277,154,278,161,283,169,285,175,298,181,305,189,311,195,321,202,324,211,328,210,343,209,354,206,359,215,358,220,356,232,344,242,359,189,387,179,378,173,359,166,351,155,352,140,354,132,354,112,356,98,358,84,350,70,335,58,329,41,319,34,309,26,303" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="정릉1동" title="정릉1동" coords="266,304,256,293,247,293,253,286,247,277,247,271,254,271,254,250,258,241,258,229,245,208,249,198,253,191,253,208,258,213,263,224,266,233,266,246,273,259,271,267,281,269,285,277,294,280,294,288,294,294,288,297,279,305" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="돈암2동" title="돈암2동" coords="210,326,205,321,195,317,198,310,202,304,213,305,221,300,226,305,234,304,234,298,230,288,238,285,247,283,250,295,256,295,266,303,274,304,274,311,278,320,269,318,260,319,255,311,245,308,242,321,246,334,234,339,223,350,209,357,214,342" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="정릉2동" title="정릉2동" coords="151,278,170,270,173,261,188,257,191,245,187,233,194,229,198,236,214,249,222,248,222,232,227,234,235,232,234,222,239,213,245,212,258,225,256,245,253,267,245,269,246,277,250,283,239,282,229,288,234,301,226,306,219,299,211,304,202,305,194,313,179,298,170,283" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="동선동" title="동선동" coords="245,359,234,342,245,337,243,320,243,311,254,305,261,318,274,318,279,320,283,315,286,319,294,322,298,332,311,341,306,348,307,355,306,362,306,371,298,373,294,378,282,375,276,379,265,363,259,351" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="돈암1동" title="돈암1동" coords="279,314,277,306,292,296,293,287,300,281,313,280,320,268,328,267,340,263,345,271,341,278,338,283,329,289,325,294,321,308,318,315,317,324,317,331,311,342,294,321" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="길음1동" title="길음1동" coords="255,182,254,189,253,206,262,221,266,237,270,247,271,257,271,265,281,269,286,276,294,278,294,284,302,281,314,278,318,268,310,256,301,211,298,200,289,201,282,193,270,184" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="길음2동" title="길음2동" coords="302,210,313,203,318,204,322,199,335,202,348,205,348,228,358,270,344,263,329,261,322,264,309,253" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="종암동" title="종암동" coords="318,325,318,317,322,312,323,298,329,289,334,289,338,282,342,278,348,269,361,273,398,280,408,292,410,312,406,318,410,324,410,331,403,338,396,365,383,365,382,373,375,380,370,369,356,368,345,353,345,340,333,340" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="삼선동" title="삼선동" coords="186,385,211,376,245,357,263,352,264,368,276,380,261,396,257,404,252,411,252,418,251,426,236,436,227,436,226,443,214,445,209,436,201,429,205,416,202,403,186,392,196,392" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="보문동" title="보문동" coords="250,425,250,412,255,407,257,401,273,381,284,395,295,423,298,444,303,452,298,460,290,457,275,459,272,464,258,430" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="안암동" title="안암동" coords="277,380,284,376,298,380,309,370,308,357,317,338,318,330,323,328,330,336,335,340,342,340,342,349,343,356,349,360,353,368,361,368,367,371,371,378,367,386,363,393,358,400,353,408,344,421,341,428,309,454,300,439,286,393" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="월곡1동" title="월곡1동" coords="350,227,386,203,399,210,406,209,413,214,419,214,425,214,426,222,423,229,422,237,411,247,407,260,402,263,390,254,390,259,390,264,390,270,392,276,361,273" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="월곡2동" title="월곡2동" coords="391,268,392,257,400,265,410,261,413,247,424,239,424,226,426,217,434,214,446,214,446,225,447,238,458,239,466,236,470,229,476,226,479,233,474,241,471,246,478,262,478,272,483,283,474,293,468,297,463,303,455,315,452,322,447,329,435,325,424,325,412,330,408,319,412,307,408,293" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="장위1동" title="장위1동" coords="392,201,408,183,411,173,418,174,439,152,448,161,466,148,479,164,458,177,458,189,463,197,459,210,452,210,427,215,419,213,403,209" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="장위3동" title="장위3동" coords="438,148,446,161,470,148,477,163,473,169,484,173,495,186,502,187,516,206,536,205,546,193,535,181,511,164,505,154,494,146,486,130,469,117,450,125" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="장위2동" title="장위2동" coords="445,229,448,213,454,214,464,197,458,185,461,175,474,169,484,173,490,185,501,189,509,199,514,207,534,206,475,240,480,231,475,224,470,227,463,236,452,238" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="석관동" title="석관동" coords="471,245,475,240,488,235,530,207,546,194,590,184,599,202,594,242,592,247,584,248,577,250,571,254,566,261,557,259,547,260,539,261,534,270,527,277,526,286,522,291,510,290,499,291,490,297,482,297,474,291,481,282,482,262" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="정릉4동" title="정릉4동" coords="23,71,38,68,49,78,60,71,76,79,82,91,90,97,126,135,128,142,142,145,152,179,167,168,176,167,182,171,192,178,202,178,204,190,212,200,218,215,222,231,232,232,236,221,242,213,256,190,250,179,238,173,228,166,228,158,216,145,215,114,199,114,170,98,155,81,138,65,122,53,112,50,111,40,98,28,80,18,68,24,51,32,40,36,28,48,18,60,14,67" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="정릉3동" title="정릉3동" coords="48,77,45,91,53,101,64,126,65,138,67,150,70,158,75,170,79,179,81,190,80,200,77,214,85,223,80,234,83,244,85,255,84,263,96,258,115,265,131,270,149,277,170,265,186,254,187,234,193,231,201,238,212,246,219,239,219,225,210,199,198,182,174,169,153,174,141,146,128,139,107,112,89,93,72,82,62,68" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        
                                                        <!-- <area alt="성북동" title="성북동" coords="9,291,14,286,15,275,20,269,29,270,40,264,49,262,50,254,63,253,70,248,77,247,86,248,100,250,111,256,114,262,126,258,131,263,140,267,150,269,157,274,163,284,167,294,172,299,179,304,185,310,192,312,196,322,194,333,188,342,187,351,200,342,207,342,213,335,219,330,227,344,215,351,204,358,172,377,168,367,162,366,155,354,156,342,149,338,142,339,134,337,126,340,116,340,112,344,96,338,92,344,83,344,73,334,64,334,60,321,44,318,33,310,21,306,18,305,16,298" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="정릉1동" title="정릉1동" coords="230,191,234,187,234,180,237,172,239,191,242,200,252,213,249,224,249,230,252,236,257,242,256,249,255,255,264,254,272,263,281,267,284,274,281,280,270,285,261,291,254,288,244,282,233,280,236,275,240,271,231,260,231,254,238,254,238,234,243,229,242,220,242,212,233,201" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="돈암2동" title="돈암2동" coords="180,300,185,306,191,306,197,315,193,325,195,334,189,339,189,345,197,339,206,339,217,324,231,319,226,307,229,295,239,295,245,303,258,303,262,296,259,287,247,283,233,279,228,267,219,272,217,279,220,287,215,291,206,287,197,290,187,291" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="정릉2동" title="정릉2동" coords="136,262,158,252,172,243,175,232,170,219,177,211,186,220,194,223,200,232,208,234,207,214,211,219,218,217,217,210,222,206,223,199,230,196,237,205,241,214,242,226,237,234,237,252,230,254,228,262,237,269,219,269,215,279,220,285,211,290,202,285,189,289,177,299,164,286,156,271" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="동선동" title="동선동" coords="226,337,216,325,229,319,226,303,231,292,240,294,244,305,256,305,264,308,267,301,272,299,275,307,281,305,282,312,288,318,296,325,291,337,292,342,290,347,290,352,280,360,278,367,263,361,257,363,248,353,244,338,234,341" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="돈암1동" title="돈암1동" coords="264,301,262,293,268,289,274,281,280,279,280,272,286,266,298,264,307,257,310,246,321,245,331,251,335,256,330,262,322,269,319,273,313,277,309,285,308,291,308,296,306,303,308,309,302,314,303,321,299,327,286,312,282,303,276,304,273,295" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="길음1동" title="길음1동" coords="237,177,241,172,249,167,262,167,263,178,269,180,274,184,280,184,281,196,288,208,294,232,303,251,300,260,285,269,272,265,264,254,257,249,257,243,254,235,252,224,253,212,245,202,241,190" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="길음2동" title="길음2동" coords="285,196,304,192,306,198,306,187,326,187,331,189,332,213,344,256,324,245,309,244,305,256,291,226" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="종암동" title="종암동" coords="336,257,359,263,382,266,395,278,399,299,394,302,398,310,398,319,391,327,391,337,387,350,371,354,370,361,361,368,359,360,349,359,340,351,334,344,332,336,332,327,319,327,314,314,307,311,306,302,308,283,317,273,331,267" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="삼선동" title="삼선동" coords="176,375,227,345,240,338,249,356,260,368,249,376,238,389,233,401,233,413,225,420,216,422,213,428,199,429,197,423,186,414,189,402,186,391,185,382,173,379,176,375" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="보문동" title="보문동" coords="237,419,234,401,241,394,246,385,253,378,260,370,269,382,273,396,277,410,290,441,283,448,277,442,266,447,261,447,249,423,256,436" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="안암동" title="안암동" coords="262,365,267,360,282,366,285,360,288,355,291,347,293,337,300,328,303,316,308,310,316,320,320,327,327,326,329,340,337,351,344,357,354,357,355,366,354,377,348,384,341,389,329,409,291,438,281,410,275,381" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="월곡1동" title="월곡1동" coords="334,215,344,255,365,263,382,265,374,254,374,243,382,245,385,251,393,241,392,234,402,223,410,210,410,201,398,197,386,193,378,186" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="월곡2동" title="월곡2동" coords="375,258,373,241,383,247,385,254,393,245,393,234,409,219,413,209,413,200,421,200,430,198,433,207,428,214,436,221,437,228,449,222,453,213,461,213,462,221,455,235,465,251,463,260,467,265,463,276,454,276,449,285,444,297,438,305,433,312,425,313,417,311,406,309,399,312,393,301,399,296,395,277" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="장위1동" title="장위1동" coords="377,185,390,193,398,195,412,200,425,197,432,192,439,193,448,183,440,163,464,148,453,133,436,140,423,138,395,162" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="장위3동" title="장위3동" coords="424,137,433,141,452,130,464,146,457,151,468,157,481,170,502,189,514,187,539,180,525,177,517,164,493,148,484,135,465,115,455,103,435,113" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="장위2동" title="장위2동" coords="430,195,439,197,449,186,444,161,458,152,471,158,480,170,495,184,504,193,519,188,460,225,467,213,455,212,447,219,437,222,430,213,434,203" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="석관동" title="석관동" coords="463,223,529,181,574,172,585,186,581,227,574,233,565,233,558,235,554,240,549,245,538,245,528,245,522,248,516,257,510,267,513,276,504,279,494,272,482,273,478,280,465,281,463,270,463,251,455,230" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="정릉4동" title="정릉4동" coords="34,59,44,53,57,61,61,73,83,89,107,108,112,121,124,125,135,156,141,159,155,151,166,155,183,160,185,172,194,185,202,201,205,205,213,216,221,205,224,192,233,184,230,170,236,166,223,154,214,148,197,128,199,97,177,95,168,85,156,80,141,61,124,49,115,37,100,30,87,20,69,10,60,1,46,4,43,10,31,12,21,17,15,24,7,31,4,38,4,48,8,54,26,53" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';">
                                                        <area alt="정릉3동" title="정릉3동" coords="33,76,37,66,46,55,60,63,63,75,91,96,109,115,115,122,124,126,136,158,143,164,155,153,170,157,183,163,189,174,194,189,202,205,206,216,204,229,183,215,175,215,171,219,173,233,169,241,157,247,136,260,120,256,93,244,75,242,69,233,67,220,73,210,65,199,64,186,70,171,56,155,47,129,53,121" shape="poly" onmouseover="document.body.style.cursor='pointer';" onmouseout="document.body.style.cursor='default';"> -->
                                                    </map>
                                                </div>
                                                <div class="map_btn n01">
                                                    <button type="button" onclick="fn_mapSearch('성북동');">
                                                        <span class="dong">성북동</span>
                                                        <span class="map_num" id="sbDong"><c:out value="@@{mapDong.sbDong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n02">
                                                    <button type="button" onclick="fn_mapSearch('정릉1동');">
                                                        <span class="dong">정릉1동</span>
                                                        <span class="map_num" id="jn1Dong"><c:out value="@@{mapDong.jn1Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n03">
                                                    <button type="button" onclick="fn_mapSearch('돈암2동');">
                                                        <span class="dong">돈암2동</span>
                                                        <span class="map_num" id="da2Dong"><c:out value="@@{mapDong.da2Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n04">
                                                    <button type="button" onclick="fn_mapSearch('정릉2동');">
                                                        <span class="dong">정릉2동</span>
                                                        <span class="map_num" id="jn2Dong"><c:out value="@@{mapDong.jn2Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n05">
                                                    <button type="button" onclick="fn_mapSearch('동선동');">
                                                        <span class="dong">동선동</span>
                                                        <span class="map_num" id="dsDong"><c:out value="@@{mapDong.dsDong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n06">
                                                    <button type="button" onclick="fn_mapSearch('돈암1동');">
                                                        <span class="dong">돈암1동</span>
                                                        <span class="map_num" id="da1Dong"><c:out value="@@{mapDong.da1Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n07">
                                                    <button type="button" onclick="fn_mapSearch('길음1동');">
                                                        <span class="dong">길음1동</span>
                                                        <span class="map_num" id="ge1Dong"><c:out value="@@{mapDong.ge1Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n08">
                                                    <button type="button" onclick="fn_mapSearch('길음2동');">
                                                        <span class="dong">길음2동</span>
                                                        <span class="map_num" id="ge2Dong"><c:out value="@@{mapDong.ge2Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n09">
                                                    <button type="button" onclick="fn_mapSearch('종암동');">
                                                        <span class="dong">종암동</span>
                                                        <span class="map_num" id="jaDong"><c:out value="@@{mapDong.jaDong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n10">
                                                    <button type="button" onclick="fn_mapSearch('삼선동');">
                                                        <span class="dong">삼선동</span>
                                                        <span class="map_num" id="ssDong"><c:out value="@@{mapDong.ssDong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n11">
                                                    <button type="button" onclick="fn_mapSearch('보문동');">
                                                        <span class="dong">보문동</span>
                                                        <span class="map_num" id="bmDong"><c:out value="@@{mapDong.bmDong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n12">
                                                    <button type="button" onclick="fn_mapSearch('안암동');">
                                                        <span class="dong">안암동</span>
                                                        <span class="map_num" id="aaDong"><c:out value="@@{mapDong.aaDong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n13">
                                                    <button type="button" onclick="fn_mapSearch('월곡1동');">
                                                        <span class="dong">월곡1동</span>
                                                        <span class="map_num" id="wg1Dong"><c:out value="@@{mapDong.wg1Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n14">
                                                    <button type="button" onclick="fn_mapSearch('월곡2동');">
                                                        <span class="dong">월곡2동</span>
                                                        <span class="map_num" id="wg2Dong"><c:out value="@@{mapDong.wg2Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n15">
                                                    <button type="button" onclick="fn_mapSearch('장위1동');">
                                                        <span class="dong">장위1동</span>
                                                        <span class="map_num" id="jw1Dong"><c:out value="@@{mapDong.jw1Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n16">
                                                    <button type="button" onclick="fn_mapSearch('장위3동');">
                                                        <span class="dong">장위3동</span>
                                                        <span class="map_num" id="jw3Dong"><c:out value="@@{mapDong.jw3Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n17">
                                                    <button type="button" onclick="fn_mapSearch('장위2동');">
                                                        <span class="dong">장위2동</span>
                                                        <span class="map_num" id="jw2Dong"><c:out value="@@{mapDong.jw2Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n18">
                                                    <button type="button" onclick="fn_mapSearch('석관동');">
                                                        <span class="dong">석관동</span>
                                                        <span class="map_num" id="sgDong"><c:out value="@@{mapDong.sgDong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n19 active">
                                                    <button type="button" onclick="fn_mapSearch('정릉4동');">
                                                        <span class="dong">정릉4동</span>
                                                        <span class="map_num" id="jn4Dong"><c:out value="@@{mapDong.jn4Dong}"/></span>
                                                    </button>
                                                </div>
                                                <div class="map_btn n20">
                                                    <button type="button" onclick="fn_mapSearch('정릉3동');">
                                                        <span class="dong">정릉3동</span>
                                                        <span class="map_num" id="jn3Dong"><c:out value="@@{mapDong.jn3Dong}"/></span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="category">
                                        <ul class="category_list">
                                            <li class="category_itm">
                                                <input type="radio" id="ct1" name="categorySelect" value="1" checked>
                                                <label for="ct1" class="category_label"><span class="ct_tit" onclick="fnYeyakMain('URINTY01');">교육/강좌</span></label>
                                            </li>
                                            <li class="category_itm">
                                                <input type="radio" id="ct2" name="categorySelect" value="2">
                                                <label for="ct2" class="category_label"><span class="ct_tit" onclick="fnYeyakMain('URINTY03');">대관/시설</span></label>
                                            </li>
                                            <li class="category_itm">
                                                <input type="radio" id="ct3" name="categorySelect" value="3">
                                                <label for="ct3" class="category_label"><span class="ct_tit" onclick="fnYeyakMain('URINTY02');">체험/대여</span></label>
                                            </li>
                                            <li class="category_itm">
                                                <input type="radio" id="ct4" name="categorySelect" value="4">
                                                <label for="ct4" class="category_label"><span class="ct_tit" onclick="fnYeyakMain('URINTY04');">신청</span></label>
                                            </li>
                                            <!--
                                            <li class="category_itm">
                                                <input type="radio" id="ct5" name="categorySelect" value="5">
                                                <label for="ct5" class="category_label"><span class="ct_tit" onclick="fnYeyakMain('URINTY05');">행사접수</span></label>
                                            </li>
                                            -->
                                        </ul>
                                        <div class="category_reset">
                                            <button class="reset_btn">
                                                초기화
                                            </button>
                                        </div>
                                    </div>
                                    <div class="programs">
                                        <ul class="program_list">
                                            <!--
                                            각각 data-type 넣어주세요.
                                            접수중 : type1,
                                            접수마감 : type2
                                            -->
                                            <div id="unityYeyakList">
                                                <c:forEach var="unityList" items="@@{unityWebList}" varStatus="status">
                                                    <c:set var="dataType" value="type1"/>
                                                    <c:if test="@@{unityList.unitySttusCd eq 'UROPST03'}">
                                                        <c:set var="dataType" value="type2"/>
                                                    </c:if>
                                                    <li class="program_itm" data-type="<c:out value="@@{dataType}"/>">
                                                    <a href="#" onclick="fn_goUrl(<c:out value="@@{unityList.unityLrgNo}"/>,<c:out value="@@{unityList.unityMidNo}"/>,'<c:out value="@@{yeyakMainVO.yeyakTypeCd}"/>');" class="program_anchor">
                                                    <div class="infos">
                                                        <div class="info_itm n1">
                                                            <span><c:out value="@@{unityList.unityLrgNm}"/></span>
                                                        </div>
                                                        <div class="info_itm n2">
                                                            <span><c:out value="@@{unityList.unityMidNm}"/></span>
                                                        </div>
                                                        <div class="info_itm n3">
                                                            <span><em class="application"><c:out value="@@{unityList.rcpUserCo}"/></em>/<c:out value="@@{unityList.totUserCo}"/></span>
                                                        </div>
                                                    </div>
                                                    <div class="program_text">
                                                        <div class="p_left">
                                                            <div class="title_wrap"><span class="title"><c:out value="@@{unityList.unityMidNm}"/></span></div>
                                                            <div class="des_wrap"><span class="date"><c:out value="@@{unityList.useBgnDe}"/>~<c:out value="@@{unityList.useEndDe}"/></span><span class="location"><c:out value="@@{unityList.unityLrgNm}"/></span></div>
                                                        </div>
                                                        <div class="p_right">
                                                            <div class="type">
                                                                <span><c:out value="@@{unityList.unitySttusNm}"/></span>
                                                                <span class="arrow_btn" ></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </a>
                                                    </li>
                                                </c:forEach>
                                            </div>
                                        
                                        </ul>
                                    </div>
                                    <div class="programs_more">
                                        <c:choose>
                                            <c:when test="@@{yeyakMainVO.yeyakTypeCd eq 'URINTY01'}">
                                                <a href="./selectUnityProgrmWebList.do?key=6501&insttTy=URINTY01" class="more_btn">전체보기  +</a>
                                            </c:when>
                                            <c:when test="@@{yeyakMainVO.yeyakTypeCd eq 'URINTY03'}">
                                                <a href="./selectUnityFcltyOperWebList.do?key=6685" class="more_btn">전체보기  +</a>
                                            </c:when>
                                            <c:when test="@@{yeyakMainVO.yeyakTypeCd eq 'URINTY02'}">
                                                <a href="./selectUnityExprnWebList.do?key=6518" class="more_btn">전체보기  +</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="#" class="more_btn">전체보기  +</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <div class="tab_panel n2">
                                <div class="left">
                                    <div class="institution_wrap">
                                        <div class="institution_title">
                                            <span>한눈에 보는 <em>성북구 통합예약</em></span>
                                        </div>
                                        <div class="institution_search">
                                            <span>기관선택</span>
                                        </div>
                                        <div class="institution_box">
                                            <div class="institution_list">
                                                <c:forEach var="instt" items="@@{insttList}" varStatus="status">
                                                    <div class="institution_itm">
                                                        <input type="checkbox" id="it@@{status.count}" name="institutionSelect"  id="institutionSelect" value="<c:out value="@@{instt.yeyakInsttNo}"/>" onclick="fn_insttSearch('<c:out value="@@{instt.yeyakInsttNo}"/>', '');">
                                                        <label for="it@@{status.count}" class="institution_label"><span class="it_tit"><c:out value="@@{instt.yeyakInsttNm}"/></span></label>
                                                    </div>
                                                </c:forEach>
                                            
                                            </div>
                                            <div class="institution_control">
                                                <button type="button" class="institution_btn institution_prev">이전보기</button>
                                                <!-- <span class="institution_count">
                                                    <span class="institution_current">1</span> / <span class="institution_total">2</span>
                                                </span> -->
                                                <button type="button" class="institution_btn institution_next">다음보기</button>
                                            </div>
                                            <div class="institution_btns">
                                                <div class="institution_all">
                                                    <input id="All" class="instAll" type="checkbox" name="institutionSelectAll" value="All" onclick="fn_insttSearch('', 'ALL');">
                                                    <label id="allBtn" for="All" class="All"><span class="it_all">전체선택</span></label>
                                                </div>
                                                <div class="institution_reset">
                                                    <button class="reset_btn"><span>초기화</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="choice">
                                        <div class="choice_box">
                                            <span>좌측에서 기관을 선택하세요.</span>
                                            <span>위에서 기관을 선택하세요.</span>
                                        </div>
                                    </div>
                                    <div class="programs">
                                        <ul class="program_list">
                                            <!--
                                            각각 data-type 넣어주세요.
                                            접수중 : type1,
                                            접수마감 : type2
                                            -->
                                            <div id="insttYeyakList">
                                                <c:forEach var="unityList" items="@@{unityWebList}" varStatus="status">
                                                    <c:set var="dataType" value="type1"/>
                                                    <c:if test="@@{unityList.unitySttusCd eq 'UROPST03'}">
                                                        <c:set var="dataType" value="type2"/>
                                                    </c:if>
                                                    <li class="program_itm" data-type="<c:out value="@@{dataType}"/>">
                                                    <a href="#" onclick="fn_goUrl(<c:out value="@@{unityList.unityLrgNo}"/>, <c:out value="@@{unityList.unityMidNo}"/>,'<c:out value="@@{yeyakMainVO.yeyakTypeCd}"/>');" class="program_anchor">
                                                    <div class="infos">
                                                        <div class="info_itm n1">
                                                            <span><c:out value="@@{unityList.unityLrgNm}"/></span>
                                                        </div>
                                                        <div class="info_itm n2">
                                                            <span><c:out value="@@{unityList.unityMidNm}"/></span>
                                                        </div>
                                                        <div class="info_itm n3">
                                                            <span><em class="application"><c:out value="@@{unityList.rcpUserCo}"/></em>/<c:out value="@@{unityList.totUserCo}"/></span>
                                                        </div>
                                                    </div>
                                                    <div class="program_text">
                                                        <div class="p_left">
                                                            <div class="title_wrap"><span class="title"><c:out value="@@{unityList.unityMidNm}"/></span></div>
                                                            <div class="des_wrap">
                                                                <span class="date"><c:out value="@@{unityList.useBgnDe}"/>~<c:out value="@@{unityList.useEndDe}"/></span>
                                                                <span class="location"><c:out value="@@{unityList.unityLrgNm}"/></span></div>
                                                        </div>
                                                        <div class="p_right">
                                                            <div class="type">
                                                                <span><c:out value="@@{unityList.unitySttusNm}"/></span>
                                                                <span class="arrow_btn"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </a>
                                                    </li>
                                                </c:forEach>
                                            </div>
                                        </ul>
                                    </div>
                                    <div class="programs_more">
                                        <c:choose>
                                            <c:when test="@@{yeyakMainVO.yeyakTypeCd eq 'URINTY01'}">
                                                <a href="./selectUnityProgrmWebList.do?key=6501&insttTy=URINTY01" class="more_btn">전체보기  +</a>
                                            </c:when>
                                            <c:when test="@@{yeyakMainVO.yeyakTypeCd eq 'URINTY03'}">
                                                <a href="./selectUnityFcltyOperWebList.do?key=6685" class="more_btn">전체보기  +</a>
                                            </c:when>
                                            <c:when test="@@{yeyakMainVO.yeyakTypeCd eq 'URINTY02'}">
                                                <a href="./selectUnityExprnWebList.do?key=6518" class="more_btn">전체보기  +</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="#" class="more_btn">전체보기  +</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="rowgroup2">
            <div class="wrap">
                <section class="state">
                    <h2 class="state_title">운영중인 강좌현황</h2>
                    <div class="state_box">
                        <div class="tab_list">
                            <c:set var="actionThum" value="active" />
                            <c:set var="actionList" value="active" />
                            <c:choose>
                                <c:when test="@@{yeyakMainVO.thumAt eq 'list'}">
                                    <c:set var="actionThum" value="" />
                                    <c:set var="actionList" value="active" />
                                </c:when>
                                <c:otherwise>
                                    <c:set var="actionThum" value="active" />
                                    <c:set var="actionList" value="" />
                                </c:otherwise>
                            </c:choose>
                            <div id="thumTab" class="tab_itm @@{actionThum}"><button id="thumTabBtn" class="tab_btn thumbnail active" onclick="fn_classChange('eduThum');">썸네일 보기</button></div>
                            <div id="listTab" class="tab_itm @@{actionList}"><button id="listTabBtn"  class="tab_btn list @@{actionList}" onclick="fn_classChange('eduList');">리스트 보기</button></div>
                        </div>
                        <div class="tab_cont">
                            <div id="pannelThum" class="cont_pannel thumbnail @@{actionThum}">
                                <div class="array_btns">
                                    <c:set var="actionRecent" value="active" />
                                    <c:set var="actionPopular" value="" />
                                    <c:choose>
                                        <c:when test="@@{yeyakMainVO.notiTypeCd eq 'popular'}">
                                            <c:set var="actionPopular" value="active" />
                                            <c:set var="actionRecent" value="" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="actionPopular" value="" />
                                            <c:set var="actionRecent" value="active" />
                                        </c:otherwise>
                                    </c:choose>
                                    <!--
                                    <div class="btn_wrap"><button class="array_btn recent <c:out value="@@{actionRecent}"/>" onclick="fn_eduList('recent','thum')">최신순</button></div>
                                    <div class="btn_wrap"><button class="array_btn popular  <c:out value="@@{actionPopular}"/>" onclick="fn_eduList('popular','thum')">인기순</button></div>
                                     -->
                                    <div class="btn_wrap"><button class="array_btn recent active" onclick="fn_eduList('recentList','thum')">최신순</button></div>
                                    <div class="btn_wrap"><button class="array_btn popular" onclick="fn_eduList('popularList','thum')">인기순</button></div>
                                </div>
                                <!-- 최신순 start -->
                                <div class="thumbnail_list">
                                    <div id="recentList" style="display: '';">
                                        <c:forEach var="eduList" items="@@{recentEduWebList}" varStatus="status">
                                            <div class="thumbnail_itm">
                                                <a href="./unityProgrmWebView.do?key=6501&amp;progrmNo=<c:out value="@@{eduList.unityMidNo}"/>" class="thumbnail_anchor">
                                                <div class="thumbnail_img">
                                                    <div class="top_text">
                                                        <span class="text_category">교육·강좌.</span>
                                                        <span class="text_state"><c:out value="@@{eduList.unitySttusNm}"/></span>
                                                    </div>
                                                    <div class="img_wrap">
                                                        <c:choose>
                                                            <c:when test="@@{empty eduList.storeFileNm}">
                                                                <img src="/site/yeyak/images/edu_sample.jpg" alt="">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="<c:out value="@@{eduList.unityMidNm}"/>/<c:out value="@@{eduList.storeFileNm}"/>" alt="">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div class="bottom_text">
                                                        <span>무료</span>
                                                    </div>
                                                </div>
                                                
                                                <div class="thumbnail_info">
                                                    <div class="info_title">
	                                                    <span><c:out value="@@{eduList.unityMidNm}"/>
	                                                        <span class="new" title="새글">N</span>
	                                                    </span>
                                                    </div>
                                                    <ul class="info_list">
                                                        <li class="info_itm">
                                                            <span class="itm_division n1">신청정원</span>
                                                            <span class="itm_des"><em class="application"><c:out value="@@{eduList.rcpUserCo}"/></em>/<c:out value="@@{eduList.totUserCo}"/></span>
                                                        </li>
                                                        <li class="info_itm">
                                                            <span class="itm_division n2">장 소</span>
                                                            <span class="itm_des"><c:out value="@@{eduList.unityLrgNm}"/></span>
                                                        </li>
                                                        <li class="info_itm">
                                                            <span class="itm_division n3">대 상</span>
                                                            <span class="itm_des">
	                                                            <c:set var="trgetSplit" value="@@{fn:split(eduList.useTrget,',')}" />
																<c:forEach var="trget" items="@@{trgetSplit}" varStatus="status">
																	<c:if test="@@{!status.first}">,</c:if>
																	<c:out value="@@{trgetMap[trget]}"/>
																</c:forEach>
	                                                        </span>
                                                        </li>
                                                        <li class="info_itm">
                                                            <span class="itm_division n4">모집기간</span>
                                                            <span class="itm_des"><c:out value="@@{eduList.rceptBgnDe}"/> ~ <c:out value="@@{eduList.rceptEndDe}"/></span>
                                                        </li>
                                                        <li class="info_itm">
                                                            <span class="itm_division n5">교육기간</span>
                                                            <span class="itm_des"><c:out value="@@{eduList.useBgnDe}"/> ~ <c:out value="@@{eduList.useEndDe}"/></span>
                                                        </li>
                                                    </ul>
                                                    <span class="info_detail btn" href="./unityProgrmWebView.do?key=6501&amp;progrmNo=<c:out value="@@{eduList.unityMidNo}"/>">
                                                    <span>상세보기</span>
                                                    </span>
                                                </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div id="popularList" style="display: none;">
                                        <c:forEach var="popularList" items="@@{popularEduWebList}" varStatus="status">
                                            <div class="thumbnail_itm">
                                                <a href="./unityProgrmWebView.do?key=6501&amp;progrmNo=<c:out value="@@{popularList.unityMidNo}"/>" class="thumbnail_anchor">
                                                <div class="thumbnail_img">
                                                    <div class="top_text">
                                                        <span class="text_category">교육·강좌</span>
                                                        <span class="text_state"><c:out value="@@{popularList.unitySttusNm}"/></span>
                                                    </div>
                                                    <div class="img_wrap">
                                                        <c:choose>
                                                            <c:when test="@@{empty popularList.storeFileNm}">
                                                                <img src="/site/yeyak/images/edu_sample.jpg" alt="">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="<c:out value="@@{popularList.unityMidNm}"/>/<c:out value="@@{popularList.storeFileNm}"/>" alt="">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div class="bottom_text">
                                                        <span>무료</span>
                                                    </div>
                                                </div>
                                                
                                                <div class="thumbnail_info">
                                                    <div class="info_title">
	                                                    <span><c:out value="@@{popularList.unityMidNm}"/>
	                                                        <span class="new" title="새글">N</span>
	                                                    </span>
                                                    </div>
                                                    <ul class="info_list">
                                                        <li class="info_itm">
                                                            <span class="itm_division n1">신청정원</span>
                                                            <span class="itm_des"><em class="application"><c:out value="@@{popularList.rcpUserCo}"/></em>/<c:out value="@@{popularList.totUserCo}"/></span>
                                                        </li>
                                                        <li class="info_itm">
                                                            <span class="itm_division n2">장 소</span>
                                                            <span class="itm_des"><c:out value="@@{popularList.unityLrgNm}"/></span>
                                                        </li>
                                                        <li class="info_itm">
                                                            <span class="itm_division n3">대 상</span>
                                                            <span class="itm_des">
	                                                            <c:set var="trgetSplit" value="@@{fn:split(popularList.useTrget,',')}" />
																<c:forEach var="trget" items="@@{trgetSplit}" varStatus="status">
																	<c:if test="@@{!status.first}">,</c:if>
																	<c:out value="@@{trgetMap[trget]}"/>
																</c:forEach>
	                                                        </span>
                                                        </li>
                                                        <li class="info_itm">
                                                            <span class="itm_division n4">모집기간</span>
                                                            <span class="itm_des"><c:out value="@@{popularList.rceptBgnDe}"/> ~ <c:out value="@@{popularList.rceptEndDe}"/></span>
                                                        </li>
                                                        <li class="info_itm">
                                                            <span class="itm_division n5">교육기간</span>
                                                            <span class="itm_des"><c:out value="@@{popularList.useBgnDe}"/> ~ <c:out value="@@{popularList.useEndDe}"/></span>
                                                        </li>
                                                    </ul>
                                                    <span class="info_detail btn" href="./unityProgrmWebView.do?key=6501&amp;progrmNo=<c:out value="@@{popularList.unityMidNo}"/>">
                                                    <span>상세보기</span>
                                                    </span>
                                                </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                
                                </div>
                                
                                <div class="thumbnail_control">
                                    <button type="button" class="thumbnail_btn thumbnail_prev">이전보기</button>
                                    <button type="button" class="thumbnail_btn thumbnail_next">다음보기</button>
                                </div>
                            </div>
                            <div id="pannelList" class="cont_pannel list @@{actionList}">
                                <div class="array_btns">
                                    <c:set var="actionRecent" value="active" />
                                    <c:set var="actionPopular" value="" />
                                    <c:choose>
                                        <c:when test="@@{yeyakMainVO.notiTypeCd eq 'popular'}">
                                            <c:set var="actionPopular" value="active" />
                                            <c:set var="actionRecent" value="" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="actionPopular" value="" />
                                            <c:set var="actionRecent" value="active" />
                                        </c:otherwise>
                                    </c:choose>
                                    <!--
                                    <div class="btn_wrap"><button class="array_btn recent <c:out value="@@{actionRecent}"/>"  onclick="fn_eduList('recentList','list')">최신순</button></div>
                                    <div class="btn_wrap"><button class="array_btn popular <c:out value="@@{actionPopular}"/>" onclick="fn_eduList('popularList','list')">인기순</button></div>
                                     -->
                                    <div class="btn_wrap"><button class="array_btn recent active"  onclick="fn_eduList('listRecentList','list')">최신순</button></div>
                                    <div class="btn_wrap"><button class="array_btn popular" onclick="fn_eduList('listPopularList','list')">인기순</button></div>
                                </div>
                                <div id="listRecentList" style="display:'';">
                                    <div class="table_wrap">
                                        <div class="row total">
                                            <div class="col-12 col-sm-24 margin_t_10 small">
                                                총 항목 수&nbsp;:&nbsp;<em class="em_blue" data-mask="#,##0" data-mask-reverse="true">@@{paginationInfo.totalRecordCount}</em>건
                                            </div>
                                        </div>
                                        <table class="p-table simple" data-table="rwd" data-tabletype="simple" data-breakpoint="760">
                                            <caption>공연안내 - 번호, 공연명, 공연장, 공연기간 순으로 정보제공</caption>
                                            <colgroup>
                                                <col style="width:8%">
                                                <col style="width:26%">
                                                <col>
                                                <col>
                                                <col>
                                                <col style="width:8%">
                                                <col>
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">프로그램명</th>
                                                <th scope="col">접수기간</th>
                                                <th scope="col">교육일시</th>
                                                <th scope="col">교육장소</th>
                                                <th scope="col">신청/정원</th>
                                                <th scope="col">진행상태</th>
                                            </tr>
                                            </thead>
                                            <tbody class="text_center">
                                            <c:set var="currentPageStartNo" value="@@{paginationInfo.currentPageStartNo}" />
                                            
                                            <c:forEach var="eduList" items="@@{recentEduWebList}" varStatus="status">
                                                <tr>
                                                    <td><c:out value="@@{currentPageStartNo}"/></td>
                                                    <td class="p-subject">
                                                        <a href="./unityProgrmWebView.do?key=6501&amp;progrmNo=<c:out value="@@{eduList.unityMidNo}"/>"><c:out value="@@{eduList.unityMidNm}"/></a>
                                                    </td>
                                                    <td><c:out value="@@{eduList.rceptBgnDe}"/>~<c:out value="@@{eduList.rceptEndDe}"/></td>
                                                    <td><c:out value="@@{eduList.useBgnDe}"/>~<c:out value="@@{eduList.useBgnDe}"/></td>
                                                    <td><c:out value="@@{eduList.unityLrgNm}"/></td>
                                                    <td><c:out value="@@{eduList.rcpUserCo}"/>/<c:out value="@@{eduList.totUserCo}"/></td>
                                                    <!-- 접수중  ing / 접수예정 expect / 접수마감 end 클래스명 붙음 -->
                                                    <c:choose>
                                                        <c:when test="@@{eduList.unitySttusCd eq 'UROPST01'}">
                                                            <td><span class="accept expect">접수예정</span></td>
                                                        </c:when>
                                                        <c:when test="@@{eduList.unitySttusCd eq 'UROPST02'}">
                                                            <td><span class="accept ing">접수중</span></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><span class="accept end">접수마감</span></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tr>
                                                <c:set var="currentPageStartNo" value="@@{currentPageStartNo-1}" />
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <!--
                                        <div class="p-pagination">
                                        <ui:pagination paginationInfo = "@@{paginationInfo}" type="board" jsFunction="./index.do?@@{fn:escapeXml(yeyakMainVO.paramsExclPi)}&amp;pageIndex=" />
                                        </div>
                                         -->
                                    </div>
                                </div>
                                
                                <div id="listPopularList" style="display:none;">
                                    <div class="table_wrap">
                                        <div class="row total">
                                            <div class="col-12 col-sm-24 margin_t_10 small">
                                                총 항목 수&nbsp;:&nbsp;<em class="em_blue" data-mask="#,##0" data-mask-reverse="true">@@{paginationInfo.totalRecordCount}</em>건
                                            </div>
                                        </div>
                                        <table class="p-table simple" data-table="rwd" data-tabletype="simple" data-breakpoint="760">
                                            <caption>공연안내 - 번호, 공연명, 공연장, 공연기간 순으로 정보제공</caption>
                                            <colgroup>
                                                <col style="width:8%">
                                                <col>
                                                <col>
                                                <col>
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">프로그램명</th>
                                                <th scope="col">접수기간</th>
                                                <th scope="col">교육일시</th>
                                                <th scope="col">교육장소</th>
                                                <th scope="col">신청/정원</th>
                                                <th scope="col">진행상태</th>
                                            </tr>
                                            </thead>
                                            <tbody class="text_center">
                                            <c:set var="currentPageStartNo" value="@@{paginationInfo.currentPageStartNo}" />
                                            
                                            <c:forEach var="eduList" items="@@{popularEduWebList}" varStatus="status">
                                                <tr>
                                                    <td><c:out value="@@{currentPageStartNo}"/></td>
                                                    <td class="p-subject">
                                                        <a href="./unityProgrmWebView.do?key=6501&amp;progrmNo=<c:out value="@@{eduList.unityMidNo}"/>"><c:out value="@@{eduList.unityMidNm}"/></a>
                                                    </td>
                                                    <td><c:out value="@@{eduList.rceptBgnDe}"/>~<c:out value="@@{eduList.rceptEndDe}"/></td>
                                                    <td><c:out value="@@{eduList.useBgnDe}"/>~<c:out value="@@{eduList.useBgnDe}"/></td>
                                                    <td><c:out value="@@{eduList.unityLrgNm}"/></td>
                                                    <td><c:out value="@@{eduList.rcpUserCo}"/>/<c:out value="@@{eduList.totUserCo}"/></td>
                                                    <!-- 접수중  ing / 접수예정 expect / 접수마감 end 클래스명 붙음 -->
                                                    <c:choose>
                                                        <c:when test="@@{eduList.unitySttusCd eq 'UROPST01'}">
                                                            <td><span class="accept expect">접수예정</span></td>
                                                        </c:when>
                                                        <c:when test="@@{eduList.unitySttusCd eq 'UROPST02'}">
                                                            <td><span class="accept ing">접수중</span></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><span class="accept end">접수마감</span></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tr>
                                                <c:set var="currentPageStartNo" value="@@{currentPageStartNo-1}" />
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <!--
                                        <div class="p-pagination">
                                        <ui:pagination paginationInfo = "@@{paginationInfo}" type="board" jsFunction="./index.do?@@{fn:escapeXml(yeyakMainVO.paramsExclPi)}&amp;pageIndex=" />
                                        </div>
                                        -->
                                    </div>
                                </div>
                            
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="rowgroup3">
            <div class="wrap">
                <section class="quick">
                    <h2 class="skip">관련사이트링크</h2>
                    <div class="left">
                        <div class="quick_itm edu">
                            <a href="#" class="quick_anchor">
                                <div class="quick_title">
                                    <span>교육/강좌</span>
                                    <span class="edu_state">@@{eduWebReqListCnt}</span>
                                </div>
                                <ul class="quick_list edu">
                                    <c:forEach var="eduReq" items="@@{eduWebReqList}" varStatus="status">
                                        
                                        <li onclick="javascript:fn_eduYeyakList(<c:out value="@@{eduReq.yeyakInsttNo}"/>);">
                                        <c:out value="@@{eduReq.yeyakInsttNm}"/>
                                        (<span class="edu_state"><c:out value="@@{eduReq.rcpUserCo}"/></span>)
                                        </li>
                                    
                                    
                                    </c:forEach>
                                
                                </ul>
                                <div class="quick_btn"></div>
                            </a>
                        </div>
                        <div class="quick_itm rental">
                            <a href="#" class="quick_anchor">
                                <div class="quick_title">
                                    <span>대관/시설</span>
                                </div>
                                <ul class="quick_list rental">
                                    <c:forEach var="fcltyReq" items="@@{fcltyWebReqList}" varStatus="status">
                                        <li><c:out value="@@{fcltyReq.yeyakInsttNm}"/></li>
                                    </c:forEach>
                                </ul>
                                <div class="quick_btn"></div>
                            </a>
                        </div>
                    </div>
                    <div class="right">
                        <div class="top">
                            <div class="quick_itm small">
                                <a href="/tour/contents.do?key=76" class="quick_anchor">
                                    <span class="tag n1">체험</span>
                                    <span class="text">
                                        성북 <br />
                                        도보탐방
                                    </span>
                                    <span class="btn_arrow exp"></span>
                                </a>
                            </div>
                            
                            <div class="quick_itm small">
                                <a href="/yeyak/sub.do?key=6520" class="quick_anchor">
                                    <span class="tag n1">체험</span>
                                    <span class="text">
                                        성북 <br />
                                        생태체험관
                                    </span>
                                    <span class="btn_arrow exp"></span>
                                </a>
                            </div>
                            
                            <div class="quick_itm small">
                                <a href="/yeyak/sub.do?key=6601" class="quick_anchor">
                                    <span class="tag n2">대여</span>
                                    <span class="text">
                                        1인가구 <br />
                                        물품대여
                                    </span>
                                    <span class="btn_arrow rent"></span>
                                </a>
                            </div>
                        </div>
                        <div class="bottom">
                            <div class="quick_itm small">
                                <a href="/yeyak/sub.do?key=6507" class="quick_anchor">
                                    <span class="icon"></span>
                                    <span class="text">
                                        마을미디어 <br />
                                        지원센터
                                    </span>
                                    <span class="btn_arrow"></span>
                                </a>
                            </div>
                            
                            <div class="quick_itm small">
                                <a href="/yeyak/sub.do?key=6505" class="quick_anchor">
                                    <span class="icon"></span>
                                    <span class="text">
                                        문화재단
                                    </span>
                                    <span class="btn_arrow"></span>
                                </a>
                            </div>
                            
                            <div class="quick_itm small">
                                <a href="/yeyak/sub.do?key=6504" class="quick_anchor">
                                    <span class="icon"></span>
                                    <span class="text">
                                        도시관리공단
                                    </span>
                                    <span class="btn_arrow"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="rowgroup4">
            <div class="wrap">
                <section class="bookmark">
                    <h2 class="skip">자주찾는 메뉴</h2>
                    <ul class="bookmark_list">
                        <li class="bookmark_item n1">
                            <a href="/yeyak/contents.do?key=6729" class="bookmark_anchor">
                                <span class="bookmark_title">이용방법</span>
                                <span class="bookmark_des">
                                    시설분류 및 시설의 사용목적에 <br />
                                    유의하여 신청 바랍니다.
                                </span>
                                <span class="arrow_btn"></span>
                            </a>
                        </li>
                        <li class="bookmark_item n2">
                            <a href="/yeyak/sub.do?key=6533" class="bookmark_anchor">
                                <span class="bookmark_title">나의 접수현황</span>
                                <span class="bookmark_des">
                                    교육/강좌를 신청하셨나요?<br />
                                    편리하게 접수내역을 확인해보세요.
                                </span>
                                <span class="arrow_btn"></span>
                            </a>
                        </li>
                        <li class="bookmark_item n3">
                            <a href="/yeyak/contents.do?key=6724" class="bookmark_anchor">
                                <span class="bookmark_title">기관 연락처</span>
                                <span class="bookmark_des">
                                    세부사항은 해당 기관에<br />
                                    문의해 보세요.
                                </span>
                                <span class="arrow_btn"></span>
                            </a>
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
    
    <footer id="footer">
        <div class="toTop">
            <button type="button">화면 맨위로 이동</button>
        </div>
        <div class="wrap">
            
            <div class="banner">
                <h2 class="skip">배너모음</h2>
                <div class="banner_list">
                    <!--
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">마을미디어지원센터</a></div>
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">문화재단</a></div>
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">도시관리공단</a></div>
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">서울시50플러스센터</a></div>
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">서울시평생학습포털</a></div>
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">성북청소년미래지원센터</a></div>
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">배너모음링크</a></div>
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">배너모음링크</a></div>
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">배너모음링크</a></div>
                        <div class="banner_item"><a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">배너모음링크</a></div>
                         -->
                    <c:forEach var="link" items="@@{yeyaklinkZoneItemList}" varStatus="status">
                        <div class="banner_item"><a href="<c:out value="@@{link.linkUrl}"/>" target="<c:out value="@@{link.linkTrget}"/>" title="새창" rel="noopener noreferrer" class="banner_anchor"><c:out value="@@{link.linkZoneIemNm}"/></a></div>
                    </c:forEach>
                </div>
                <div class="banner_control">
                    <button type="button" class="banner_prev">이전</button>
                    <!-- <button type="button" class="banner_auto"></button> -->
                    <button type="button" class="banner_next">다음</button>
                    <!-- <a href="#n" class="banner_more">더보기</a> -->
                </div>
            </div>
            
            
            
            <div class="footer_content">
                <div class="logo">
                    <a href="./index.do" class="logo_anchor"><img src="/site/yeyak/images/sub/footer_logo.png" alt="로고alt"></a>
                </div>
                <div class="link">
                    <h2 class="skip">바로가기</h2>
                    <ul class="link_list">
                        <#--  <li class="link_item n1"><a href="#" class="link_anchor">홈페이지개선건의 </a></li>  -->
                        <li class="link_item n2"><a href="/www/contents.do?key=6467" class="link_anchor">개인정보처리방침 </a></li>
                        <li class="link_item n3"><a href="/www/contents.do?key=6471" class="link_anchor">저작권정책 </a></li>
                        <#--  <li class="link_item n4"><a href="#" class="link_anchor">이메일주소</a></li>  -->
                        <li class="link_item n5"><a href="http://192.168.0.128:8082/www/contents.do?key=6472" class="link_anchor">무단수집거부 </a></li>
                        <#--  <li class="link_item n6"><a href="#" class="link_anchor">홈페이지불편신고</a></li>  -->
                        <li class="link_item n7"><a href="/www/contents.do?key=6470" class="link_anchor">RSS</a></li>
                        <li class="link_item n8"><a href="/www/contents.do?key=6008" class="link_anchor">찾아오시는길</a></li>
                    </ul>
                </div>
                <div class="info">
                    <address><span class="info_address">(02848)서울특별시 성북구 보문로 168 (삼선동 5가) </span><span class="info_tel"> &nbsp 대표전화 02-2241-3114  <em class="m">/ 당직실 02-2241-3330, 2241-3300~02</em> </span></address>
                    <span class="info_copyright"> COPYRIGHT 2012 SEONGBUK-GU GOVERNMENT <br /> ALL RIGHTS RESERVED</span>
                </div>
                <!-- <div class="wa">
                    <a href="http://webwatch.or.kr/certification/situation.html" target="_blank" title="새창" rel="noopener noreferrer" class="wa_anchor">
                        <img src="/common/images/layout/wa_mark.png" alt="과학기술정보통신부 WEB ACCESSIBILITY 마크(웹 접근성 품질인증 마크)">
                    </a>
                </div> -->
            </div>
        </div>
        <!--
        cms 정보 불러오기
        <div class="footer_info">
            <address><span class="info_address">@@{siteInfo.insttAdres}</span><span class="info_tel">TEL : @@{siteInfo.insttTelno}</span></address>
            <p class="info_copyright">@@{siteInfo.siteCpyrht}</p>
        </div>
        -->
    </footer>


</div>
<form name="yeyakMainForm" action="./index.do" method="post">
    <input type="hidden" name="yeyakTypeCd" value=""/>
    <input type="hidden" name="notiTypeCd" value=""/>
    <input type="hidden" name="thumAt" value=""/>
    <input type="hidden" name="yeyakInsttNo" value=""/>
    <input type="hidden" name="key" value=""/>
</form>
<script>
    function fn_mapSearch(dongNm){
        var yeyakTypeCd = document.yeyakMainForm.yeyakTypeCd.value;
        var formData = {yeyakTypeCd : yeyakTypeCd, dongNm : dongNm};

        $.ajax({
            type : 'POST',
            url : './selectYeyakListAjax.do',
            data : formData,
            dataType : 'json',
            success : function(data){

                $("#unityYeyakList").html("");
                if(data.length > 0){

                    var unityHtml = "";
                    var dataType = "type1";
                    $.each(data, function(index, item){

                        var unityLrgNm = item.unityLrgNm;
                        var unityMidNm = item.unityMidNm;
                        var rcpUserCo = nvlNumber(item.rcpUserCo);
                        var totUserCo = nvlNumber(item.totUserCo);

                        var useBgnDe = item.useBgnDe;
                        var useEndDe = item.useEndDe;
                        var unitySttusCd = item.unitySttusCd;
                        var unitySttusNm = item.unitySttusNm;
                        var unityLrgNo = item.unityLrgNo;
                        var unityMidNo = item.unityMidNo;
                        var yeyakTypeCd = item.yeyakTypeCd;

                        if(unitySttusCd =='UROPST03'){
                            dataType = "type2";
                        }

                        var goUrl = "";
                        if(yeyakTypeCd == 'URINTY01'){ //교육 상세
                            goUrl="./unityProgrmWebView.do?key=6501&amp;progrmNo="+unityMidNo;
                        } else if (yeyakTypeCd == 'URINTY02'){
                            goUrl="./unityExprnWebView.do?key=6518&amp;exprnNo="+unityMidNo;
                        } else if (yeyakTypeCd == 'URINTY03'){
                            goUrl="./selectUnityFcltyOperWebView.do?key=6769&amp;fcltyNo="+unityLrgNo+"&amp;fcltyOperNo="+unityMidNo;
                        } else if (yeyakTypeCd == 'URINTY04'){

                        }

                        unityHtml += " <li class='program_itm' data-type='"+dataType+"'>";
                        //unityHtml += "     <a href='#' onclick='fn_goUrl("+unityLrgNo+","+unityMidNo+",'"+yeyakTypeCd+"');' class='program_anchor'>";
                        unityHtml += "     <a href='"+goUrl+"' class='program_anchor'>";
                        unityHtml += "         <div class='infos'>";
                        unityHtml += "             <div class='info_itm n1'>";
                        unityHtml += "                 <span>"+unityLrgNm+"</span>";
                        unityHtml += "             </div>";
                        unityHtml += "             <div class='info_itm n2'>";
                        unityHtml += "                 <span>"+unityMidNm+"</span>";
                        unityHtml += "             </div>";
                        unityHtml += "             <div class='info_itm n3'>";
                        unityHtml += "                 <span><em class='application'>"+rcpUserCo+"</em>/"+totUserCo+"</span>";
                        unityHtml += "             </div>";
                        unityHtml += "         </div>";
                        unityHtml += "         <div class='program_text'>";
                        unityHtml += "             <div class='p_left'>";
                        unityHtml += "                 <div class='title_wrap'><span class='title'>"+unityMidNm+"</span></div>";
                        unityHtml += "                 <div class='des_wrap'>";
                        unityHtml += "                     <span class='date'>"+useBgnDe+"~"+useEndDe+"</span>";
                        unityHtml += "                     <span class='location'>"+unityLrgNm+"</span>";
                        unityHtml += "                 </div>";
                        unityHtml += "             </div>";
                        unityHtml += "             <div class='p_right'>";
                        unityHtml += "                 <div class='type'>";
                        unityHtml += "                     <span>"+unitySttusNm+"</span>";
                        unityHtml += "                     <span class='arrow_btn'></span>";
                        unityHtml += "                 </div>";
                        unityHtml += "             </div>";
                        unityHtml += "         </div>";
                        unityHtml += "     </a>";
                        unityHtml += " </li>";

                    });

                    $("#unityYeyakList").html(unityHtml);
                    $("#unityYeyakList").show();
                    fn_dongAaxj(yeyakTypeCd);
                } else {
                    unityHtml += " <li class='program_itm' data-type='type1'> ";

                    unityHtml += "     <a href='#' class='program_anchor'> ";
                    /* unityHtml += "         <div class='infos'> ";
                   unityHtml += "             <div class='info_itm n1'> ";
                   unityHtml += "                 <span></span> ";
                   unityHtml += "             </div> ";
                   unityHtml += "             <div class='info_itm n2'> ";
                   unityHtml += "                 <span></span> ";
                   unityHtml += "             </div> ";
                   unityHtml += "             <div class='info_itm n3'> ";
                   unityHtml += "                 <span><em class='application'>0</em>0</span> ";
                   unityHtml += "             </div> ";
                   unityHtml += "         </div> "; */

                    unityHtml += "         <div class='program_text'> ";
                    unityHtml += "             <div class='p_left'> ";
                    unityHtml += "                 <div class='title_wrap'><span class='title'>대상 정보가 존재가하지 않습니다.</span></div> ";
                    /*unityHtml += "                 <div class='des_wrap'> ";
                    unityHtml += "                     <span class='date'></span> ";
                    unityHtml += "                     <span class='location'></span> ";
                    unityHtml += "                 </div> "; */
                    unityHtml += "             </div> ";
                    /*unityHtml += "             <div class='p_right'> ";
                    unityHtml += "                 <div class='type'> ";
                    unityHtml += "                     <span></span> ";
                    unityHtml += "                     <span class='arrow_btn'></span> ";
                    unityHtml += "                 </div> ";
                    unityHtml += "             </div> "; */
                    unityHtml += "         </div> ";
                    unityHtml += "     </a> ";
                    unityHtml += " </li> ";
                    $("#unityYeyakList").html(unityHtml);
                    $("#unityYeyakList").show();
                    fn_dongAaxj(yeyakTypeCd);

                }
            },
            error: function(xhr, status, error){
                alert("error!");
            }

        });
    }


    function fnYeyakMain(yeyakTypeCd){
        document.yeyakMainForm.yeyakTypeCd.value=yeyakTypeCd;
        var formData = {yeyakTypeCd : yeyakTypeCd};

        if(yeyakTypeCd == 'URINTY04'){

            $("#unityYeyakList").html("");
            var unityHtml = "";
            for(var i=0 ; i < 4 ; i++){

                unityHtml += " <li class='program_itm' data-type='type1'> ";
                if(i == 0){
                    unityHtml += "     <a href='./contents.do?key=6602' class='program_anchor'> ";
                } else if (i == 1){
                    unityHtml += "     <a href='./selectUserOnlineReceptionView.do?key=6770&programKey=1' class='program_anchor'> ";
                } else if (i == 2){
                    unityHtml += "     <a href='./emptyProgram.do?key=6529' class='program_anchor'> ";
                } else if (i == 3){
                    unityHtml += "     <a href='./unityResveRentInqList.do?key=6604' class='program_anchor'> ";
                }
                unityHtml += "         <div class='program_text'> ";
                unityHtml += "             <div class='p_left'> ";
                if(i == 0){
                    unityHtml += "                 <div class='title_wrap'><span class='title'>미취업청연 응시료지원</span></div> ";
                } else if (i == 1){
                    unityHtml += "                 <div class='title_wrap'><span class='title'>디지털 저장매체 파기서비스</span></div> ";
                } else if (i == 2){
                    unityHtml += "                 <div class='title_wrap'><span class='title'>아동청소년 동행카드</span></div> ";
                } else if (i == 3){
                    unityHtml += "                 <div class='title_wrap'><span class='title'>1인가구 물품 대여</span></div> ";
                }

                unityHtml += "             </div> ";
                unityHtml += "             <div class='p_right'> ";
                unityHtml += "                 <div class='type'> ";
                // unityHtml += "                     <span></span> ";
                if(i == 0){
                    var nJYouth = '@@{nJYouth}';
                    if(nJYouth ==  'Y'){
                        nJYouth = "접수중";
                    } else {
                        nJYouth = "접수마감";
                    }
                    unityHtml += "                 <span>"+nJYouth+"</span> ";
                } else if (i == 1){
                    var destr = '@@{destr}';
                    if(destr ==  'Y'){
                        destr = "접수중";
                    } else {
                        destr = "접수마감";
                    }
                    unityHtml += "                 <span>"+destr+"</span> ";
                } else if (i == 2){
                    var childAt = '@@{childAt}';
                    if(childAt ==  'Y'){
                        childAt = "접수중";
                    } else {
                        childAt = "알수없음";
                    }
                    unityHtml += "                 <span>"+childAt+"</span> ";
                } else if (i == 3){
                    var rentalAt = '@@{rentalAt}';
                    if(rentalAt ==  'Y'){
                        rentalAt = "접수중";
                    } else {
                        rentalAt = "접수마감";
                    }
                    unityHtml += "                 <span>"+rentalAt+"</span> ";
                }
                unityHtml += "                     <span class='arrow_btn'></span> ";
                unityHtml += "                 </div> ";
                unityHtml += "             </div> ";
                unityHtml += "         </div> ";
                unityHtml += "     </a> ";
                unityHtml += " </li> ";

            }
            $("#unityYeyakList").html(unityHtml);
            $("#unityYeyakList").show();

        } else {
            $.ajax({
                type : 'POST',
                url : './selectYeyakListAjax.do',
                data : formData,
                dataType : 'json',
                success : function(data){

                    $("#unityYeyakList").html("");
                    if(data.length > 0){

                        var unityHtml = "";
                        var dataType = "type1";
                        $.each(data, function(index, item){

                            var unityLrgNm = item.unityLrgNm;
                            var unityMidNm = item.unityMidNm;
                            var rcpUserCo = nvlNumber(item.rcpUserCo);
                            var totUserCo = nvlNumber(item.totUserCo);

                            var useBgnDe = item.useBgnDe;
                            var useEndDe = item.useEndDe;
                            var unitySttusCd = item.unitySttusCd;
                            var unitySttusNm = item.unitySttusNm;
                            var unityLrgNo = item.unityLrgNo;
                            var unityMidNo = item.unityMidNo;
                            var yeyakTypeCd = item.yeyakTypeCd;

                            if(unitySttusCd =='UROPST03'){
                                dataType = "type2";
                            }

                            var goUrl = "";
                            if(yeyakTypeCd == 'URINTY01'){ //교육 상세
                                goUrl="./unityProgrmWebView.do?key=6501&amp;progrmNo="+unityMidNo;
                            } else if (yeyakTypeCd == 'URINTY02'){
                                goUrl="./unityExprnWebView.do?key=6518&amp;exprnNo="+unityMidNo;
                            } else if (yeyakTypeCd == 'URINTY03'){
                                goUrl="./selectUnityFcltyOperWebView.do?key=6769&amp;fcltyNo="+unityLrgNo+"&amp;fcltyOperNo="+unityMidNo;
                            } else if (yeyakTypeCd == 'URINTY04'){

                            }

                            unityHtml += " <li class='program_itm' data-type='"+dataType+"'>";
                            //unityHtml += "     <a href='"+goUrl+"' onclick='fn_goUrl("+unityLrgNo+","+unityMidNo+",'"+yeyakTypeCd+"');' class='program_anchor'>";
                            unityHtml += "     <a href='"+goUrl+"' class='program_anchor'>";

                            unityHtml += "         <div class='infos'>";
                            unityHtml += "             <div class='info_itm n1'>";
                            unityHtml += "                 <span>"+unityLrgNm+"</span>";
                            unityHtml += "             </div>";
                            unityHtml += "             <div class='info_itm n2'>";
                            unityHtml += "                 <span>"+unityMidNm+"</span>";
                            unityHtml += "             </div>";
                            unityHtml += "             <div class='info_itm n3'>";
                            unityHtml += "                 <span><em class='application'>"+rcpUserCo+"</em>/"+totUserCo+"</span>";
                            unityHtml += "             </div>";
                            unityHtml += "         </div>";
                            unityHtml += "         <div class='program_text'>";
                            unityHtml += "             <div class='p_left'>";
                            unityHtml += "                 <div class='title_wrap'><span class='title'>"+unityMidNm+"</span></div>";
                            unityHtml += "                 <div class='des_wrap'>";
                            unityHtml += "                     <span class='date'>"+useBgnDe+"~"+useEndDe+"</span>";
                            unityHtml += "                     <span class='location'>"+unityLrgNm+"</span>";
                            unityHtml += "                 </div>";
                            unityHtml += "             </div>";
                            unityHtml += "             <div class='p_right'>";
                            unityHtml += "                 <div class='type'>";
                            unityHtml += "                     <span>"+unitySttusNm+"</span>";
                            unityHtml += "                     <span class='arrow_btn'></span>";
                            unityHtml += "                 </div>";
                            unityHtml += "             </div>";
                            unityHtml += "         </div>";
                            unityHtml += "     </a>";
                            unityHtml += " </li>";

                        });

                        $("#unityYeyakList").html(unityHtml);
                        $("#unityYeyakList").show();
                        fn_dongAaxj(yeyakTypeCd);
                    } else {
                        unityHtml += " <li class='program_itm' data-type='type1'> ";

                        unityHtml += "     <a href='#' class='program_anchor'> ";
                        /* unityHtml += "         <div class='infos'> ";
                       unityHtml += "             <div class='info_itm n1'> ";
                       unityHtml += "                 <span></span> ";
                       unityHtml += "             </div> ";
                       unityHtml += "             <div class='info_itm n2'> ";
                       unityHtml += "                 <span></span> ";
                       unityHtml += "             </div> ";
                       unityHtml += "             <div class='info_itm n3'> ";
                       unityHtml += "                 <span><em class='application'>0</em>0</span> ";
                       unityHtml += "             </div> ";
                       unityHtml += "         </div> "; */

                        unityHtml += "         <div class='program_text'> ";
                        unityHtml += "             <div class='p_left'> ";
                        unityHtml += "                 <div class='title_wrap'><span class='title'>대상 정보가 존재가하지 않습니다.</span></div> ";
                        /*unityHtml += "                 <div class='des_wrap'> ";
                        unityHtml += "                     <span class='date'></span> ";
                        unityHtml += "                     <span class='location'></span> ";
                        unityHtml += "                 </div> "; */
                        unityHtml += "             </div> ";
                        /*unityHtml += "             <div class='p_right'> ";
                        unityHtml += "                 <div class='type'> ";
                        unityHtml += "                     <span></span> ";
                        unityHtml += "                     <span class='arrow_btn'></span> ";
                        unityHtml += "                 </div> ";
                        unityHtml += "             </div> "; */
                        unityHtml += "         </div> ";
                        unityHtml += "     </a> ";
                        unityHtml += " </li> ";
                        $("#unityYeyakList").html(unityHtml);
                        $("#unityYeyakList").show();
                        fn_dongAaxj(yeyakTypeCd);

                    }
                },
                error: function(xhr, status, error){
                    alert("error!");
                }

            });
        }



    }

    function fn_dongAaxj(yeyakTypeCd){

        var formData = {yeyakTypeCd : yeyakTypeCd};

        $.ajax({
            type : 'POST',
            url : './selectYeyakDongListAjax.do',
            data : formData,
            dataType : 'json',
            success : function(data){

                $("#sbDong").text(data.sbDong);
                $("#jn1Dong").text(data.jn1Dong);
                $("#jn2Dong").text(data.jn2Dong);
                $("#jn3Dong").text(data.jn3Dong);
                $("#jn4Dong").text(data.jn4Dong);
                $("#da1Dong").text(data.da1Dong);
                $("#da2Dong").text(data.da2Dong);
                $("#ge1Dong").text(data.ge1Dong);
                $("#ge2Dong").text(data.ge2Dong);
                $("#dsDong").text(data.dsDong);
                $("#bmDong").text(data.bmDong);
                $("#aaDong").text(data.aaDong);
                $("#jaDong").text(data.jaDong);
                $("#wg1Dong").text(data.wg1Dong);
                $("#wg2Dong").text(data.wg2Dong);
                $("#jw1Dong").text(data.jw1Dong);
                $("#jw2Dong").text(data.jw2Dong);
                $("#jw3Dong").text(data.jw3Dong);
                $("#sgDong").text(data.sgDong);
                $("#ssDong").text(data.ssDong);


            },
            error: function(xhr, status, error){
                alert("error!");
            }

        });

    }


    function fn_insttSearch(yeyakInsttNo, checkAllAt){

        var insttNoArr = [];
        if(checkAllAt == 'ALL'){

            if(!$("input[name=institutionSelect]").prop('checked')){
                //$("input[name=institutionSelect]").prop('checked',false);
                <c:forEach items="@@{insttList}" var="instt">
                    insttNoArr.push(@@{instt.yeyakInsttNo})
                </c:forEach>
                fn_insttAjax(insttNoArr);
            } else {
                insttNoArr = 99999999;
                fn_insttAjax(insttNoArr);
            }

        } else {

            $('input[name="institutionSelect"]:checked').each(function(){
                insttNoArr.push($(this).val())
            });

            if(insttNoArr == '') {
                insttNoArr = 99999999;
            }
            fn_insttAjax(insttNoArr);
        }

    }

    function fn_insttAjax(insttNoArr){

        var yeyakTypeCd = document.yeyakMainForm.yeyakTypeCd.value;

        if(yeyakTypeCd == ''){
            yeyakTypeCd = 'URINTY01';      }


        if(yeyakTypeCd == 'URINTY01' || yeyakTypeCd == 'URINTY02' || yeyakTypeCd == 'URINTY03'){
            var formData = {yeyakInsttNo : insttNoArr, yeyakTypeCd : yeyakTypeCd};
            $.ajax({
                type : 'POST',
                url : './selectYeyakInsttListAjax.do',
                data : formData,
                dataType : 'json',
                success : function(data){
                    $("#insttYeyakList").html("");

                    if(data.length > 0){

                        var unityHtml = "";
                        var dataType = "type1";
                        $.each(data, function(index, item){

                            var unityLrgNm = item.unityLrgNm;
                            var unityMidNm = item.unityMidNm;
                            var rcpUserCo = nvlNumber(item.rcpUserCo);
                            var totUserCo = nvlNumber(item.totUserCo);

                            var useBgnDe = item.useBgnDe;
                            var useEndDe = item.useEndDe;
                            var unitySttusCd = item.unitySttusCd;
                            var unitySttusNm = item.unitySttusNm;
                            var unityLrgNo = item.unityLrgNo;
                            var unityMidNo = item.unityMidNo;
                            var yeyakTypeCd = item.yeyakTypeCd;

                            if(unitySttusCd =='UROPST03'){
                                dataType = "type2";
                            }

                            var goUrl = "";
                            if(yeyakTypeCd == 'URINTY01'){ //교육 상세
                                goUrl="./unityProgrmWebView.do?key=6501&amp;progrmNo="+unityMidNo;
                            } else if (yeyakTypeCd == 'URINTY02'){
                                goUrl="./unityExprnWebView.do?key=6518&amp;exprnNo="+unityMidNo;
                            } else if (yeyakTypeCd == 'URINTY03'){
                                goUrl="./selectUnityFcltyOperWebView.do?key=6769&amp;fcltyNo="+unityLrgNo+"&amp;fcltyOperNo="+unityMidNo;
                            } else if (yeyakTypeCd == 'URINTY04'){

                            }
                            unityHtml += " <li class='program_itm' data-type='"+dataType+"'> ";
                            //unityHtml += "     <a href='#' onclick='fn_goUrl("+unityLrgNo+","+unityMidNo+",'"+yeyakTypeCd+"');' class='program_anchor'> ";
                            unityHtml += "     <a href='"+goUrl+"' class='program_anchor'>";
                            unityHtml += "         <div class='infos'> ";
                            unityHtml += "             <div class='info_itm n1'> ";
                            unityHtml += "                 <span>"+unityLrgNm+"</span> ";
                            unityHtml += "             </div> ";
                            unityHtml += "             <div class='info_itm n2'> ";
                            unityHtml += "                 <span>"+unityMidNm+"</span> ";
                            unityHtml += "             </div> ";
                            unityHtml += "             <div class='info_itm n3'> ";
                            unityHtml += "                 <span><em class='application'>"+rcpUserCo+"</em>/"+totUserCo+"</span> ";
                            unityHtml += "             </div> ";
                            unityHtml += "         </div> ";
                            unityHtml += "         <div class='program_text'> ";
                            unityHtml += "             <div class='p_left'> ";
                            unityHtml += "                 <div class='title_wrap'><span class='title'>"+unityMidNm+"</span></div> ";
                            unityHtml += "                 <div class='des_wrap'> ";
                            unityHtml += "                     <span class='date'>"+useBgnDe+" ~ "+useEndDe+"</span> ";
                            unityHtml += "                     <span class='location'>"+unityLrgNm+"</span> ";
                            unityHtml += "                 </div> ";
                            unityHtml += "             </div> ";
                            unityHtml += "             <div class='p_right'> ";
                            unityHtml += "                 <div class='type'> ";
                            unityHtml += "                     <span>"+unitySttusNm+"</span> ";
                            unityHtml += "                     <span class='arrow_btn'></span> ";
                            unityHtml += "                 </div> ";
                            unityHtml += "             </div> ";
                            unityHtml += "         </div> ";
                            unityHtml += "     </a> ";
                            unityHtml += " </li> ";

                        });

                        $("#insttYeyakList").html(unityHtml);
                        $("#insttYeyakList").show();

                    } else {
                        unityHtml += " <li class='program_itm' data-type='type1'> ";

                        unityHtml += "     <a href='#' class='program_anchor'> ";
                        /* unityHtml += "         <div class='infos'> ";
                       unityHtml += "             <div class='info_itm n1'> ";
                       unityHtml += "                 <span></span> ";
                       unityHtml += "             </div> ";
                       unityHtml += "             <div class='info_itm n2'> ";
                       unityHtml += "                 <span></span> ";
                       unityHtml += "             </div> ";
                       unityHtml += "             <div class='info_itm n3'> ";
                       unityHtml += "                 <span><em class='application'>0</em>0</span> ";
                       unityHtml += "             </div> ";
                       unityHtml += "         </div> "; */

                        unityHtml += "         <div class='program_text'> ";
                        unityHtml += "             <div class='p_left'> ";
                        unityHtml += "                 <div class='title_wrap'><span class='title'>대상 정보가 존재가하지 않습니다.</span></div> ";
                        /*unityHtml += "                 <div class='des_wrap'> ";
                        unityHtml += "                     <span class='date'></span> ";
                        unityHtml += "                     <span class='location'></span> ";
                        unityHtml += "                 </div> "; */
                        unityHtml += "             </div> ";
                        /*unityHtml += "             <div class='p_right'> ";
                        unityHtml += "                 <div class='type'> ";
                        unityHtml += "                     <span></span> ";
                        unityHtml += "                     <span class='arrow_btn'></span> ";
                        unityHtml += "                 </div> ";
                        unityHtml += "             </div> "; */
                        unityHtml += "         </div> ";
                        unityHtml += "     </a> ";
                        unityHtml += " </li> ";

                        $("#insttYeyakList").html(unityHtml);
                        $("#insttYeyakList").show();


                    }
                },
                error: function(xhr, status, error){
                    alert("error!");
                }

            });
        }


    }

    function fn_goUrl(lrgCd, midCd, yeyakTypeCd){

        var frm = document.yeyakMainForm;

        if(yeyakTypeCd == ''){
            frm.yeyakTypeCd.value='URINTY01';
        }
        if(yeyakTypeCd == 'URINTY01'){ //교육 상세
            location.href="./unityProgrmWebView.do?key=6501&amp;progrmNo="+midCd;
        } else if (yeyakTypeCd == 'URINTY02'){
            location.href="./unityExprnWebView.do?key=6501&amp;exprnNo="+midCd;
        } else if (yeyakTypeCd == 'URINTY03'){
            location.href="./selectUnityFcltyOperWebView.do?key=6501&amp;fcltyNo="+lrgCd+"&amp;fcltyOperNo="+midCd;
        } else if (yeyakTypeCd == 'URINTY04'){

        }

    }

    function fn_eduYeyakList(searchInsttNo){
        location.href="./selectUnityProgrmWebList.do?key=6501&amp;insttTy=URINTY01&amp;searchInsttNo="+searchInsttNo;

    }



    function fn_eduList_bak(notiType, thumAt){/*
     var frm = document.yeyakMainForm;
       frm.notiTypeCd.value=notiType;

       if(thumAt == ''){
           thumAt = "thum";
       }

       frm.thumAt.value=thumAt;
       frm.action="./index.do";
       frm.method="post";
       frm.submit();
       */
    }
    $("#popularList").hide();
    function fn_eduList(notiType, thumAt){

        if(thumAt =='thum') {
            if(notiType == 'recentList'){
                document.getElementById("recentList").style.display = "";
                document.getElementById("popularList").style.display = "none";

                //$("#recentList").show();
                //$("#popularList").hide();
            } else {
                document.getElementById("recentList").style.display = "none";
                document.getElementById("popularList").style.display = "";
                //$("#recentList").hide();
                //$("#popularList").show();
            }
        } else {
            if(notiType == 'listRecentList'){
                document.getElementById("listRecentList").style.display = "";
                document.getElementById("listPopularList").style.display = "none";
            } else {
                document.getElementById("listRecentList").style.display = "none";
                document.getElementById("listPopularList").style.display = "";
            }
        }



    }


    function fn_classChange(thumCl){
        /*
        var frm = document.yeyakMainForm;
            if(thumCl == '' || thumCl =='eduThum'){
                thumCl = "thum";
            } else {
                thumCl = "list";
            }
            frm.notiTypeCd.value="recent";
            frm.thumAt.value=thumCl;
            frm.action="./index.do";
            frm.method="post";
            frm.submit();
     */
    }

    function fn_classChangeTest(thumCl){//나중에 삭제 또는 수정해서 처리
        //alert(thumCl);
        if(thumCl =='eduThum'){
            $("pannelThum").addClass("active");
            $("thumTab").addClass("active");
            $("thumTabBtn").addClass("active");
            $("pannelList").removeClass("active");
            $("listTabBtn").removeClass("active");
            $("listTab").removeClass("active");


            //document.getElementById('eduThum').className += 'active';
            //document.getElementById('eduList').classList.remove('active');
            //document.getElementById('listBtn').classList.remove('active');

        } else {
            $("pannelThum").removeClass("active");
            $("thumTab").removeClass("active");
            $("thumTabBtn").removeClass("active");
            $("pannelList").addClass("active");
            $("listTabBtn").addClass("active");
            $("listTab").addClass("active");
            //document.getElementById('eduList').className += ' active';
            //document.getElementById('eduThum').classList.remove('active');
            //document.getElementById('thumBtn').classList.remove('active');
        }

    }


    function nvlNumber(input) {
        if (input == null || input == "null" || input == undefined) {
            return "0";
        }
        return input;
    }

    function nvlStr(input) {
        if (input == null || input == "null" || input == undefined) {
            return "";
        }
        return input;
    }
</script>
</body>
</html>
