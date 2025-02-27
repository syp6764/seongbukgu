<#ftl encoding="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="accessibility">
            <a href="#contents">본문 바로가기</a>
        </div>

        <div class="gnb">
            <div class="wrap clearfix">
                <div class="site">
                    <ul class="site_list">
                        <li class="site_item"><a href="/yeyak/index.do" target="_blank" title="새창" class="site_anchor">통합예약포털</a></li>
                        <li class="site_item"><a href="/bogunso/index.do" target="_blank" title="새창" class="site_anchor">보건소</a></li>
                        <li class="site_item"><a href="/www/contents.do?key=6376" target="_blank" title="새창" class="site_anchor">재개발·재건축</a></li>
                        <li class="site_item"><a href="/tour/index.do" target="_blank" title="새창" class="site_anchor">문화관광</a></li>
                        <li class="site_item"><a href="https://www.sbc.go.kr/kr/main.do" target="_blank" title="새창" class="site_anchor">성북구의회</a></li>
                    </ul>
                </div>

                <div class="link">
                    <div class="link_line one">
                        <ul class="link_list">
			            	<c:choose>
			            		<c:when test="@@{empty sessionScope.loginVO}">
			            			<li class="link_item login"><a href="/loginView.do" class="link_anchor">로그인</a></li>
									<li class="link_item join"><a href="/webSignUpIntro.do" class="link_anchor">회원가입</a>
			            		</c:when>
			            		<c:otherwise>
							<li class="link_item mypage"><a href="./sub.do?key=5737" class="link_anchor">마이페이지</a></li>
			            			<li class="link_item logout"><a href="/logout.do" class="link_anchor">로그아웃</a></li>
			            		</c:otherwise>
			            	</c:choose>
                            <li class="link_item family_box">
                                <button type="button" title="주요사이트 열기" class="family_btn link_anchor">주요사이트</button>
                            </li>
                        </ul>
                    </div>
                    <div class="link_line two sns">
                        <button type="button" class="sns_title sns_show">성북 <em>SNS</em></button>
                        <div class="sns_panel">
                            <ul class="sns_list">
                                <li class="sns_item youtube">
                                    <a href="https://www.youtube.com/c/%EC%84%B1%EB%B6%81%EA%B5%AC/videos" target="_blank" title="새창" rel="noopener noreferrer" class="sns_anchor">유투브</a>
                                </li>
                                <li class="sns_item blog">
                                    <a href="https://blog.naver.com/storysb" target="_blank" title="새창" rel="noopener noreferrer" class="sns_anchor">블로그</a>
                                </li>
                                <li class="sns_item instagram">
                                    <a href="https://www.instagram.com/seongbuk_official/" target="_blank" title="새창" rel="noopener noreferrer" class="sns_anchor">인스타그램</a>
                                </li>
                                <li class="sns_item facebook">
                                    <a href="https://www.facebook.com/eseongbuk" target="_blank" title="새창" rel="noopener noreferrer" class="sns_anchor">페이스북</a>
                                </li>
                                <li class="sns_item kakao">
                                    <a href="https://pf.kakao.com/_xmERxaxl" target="_blank" title="새창" rel="noopener noreferrer" class="sns_anchor">카카오채널</a>
                                </li>
                                <li class="sns_item carrot">
                                    <a href="https://www.daangn.com/kr/business-profiles/%EC%84%B1%EB%B6%81%EA%B5%AC%EC%B2%AD-3fc719e78a484b158e4f4826060ad8c4/" target="_blank" title="새창" rel="noopener noreferrer" class="sns_anchor">당근</a>
                                </li>
                                <li class="sns_item mail">
                                    <a href="/www/sub.do?key=6364" target="_blank" title="새창" rel="noopener noreferrer" class="sns_anchor">뉴스레터</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="link_line three">
                        <ul class="switch_list">
                            <li class="switch_item zoom">
                                <div class="link_zoom">
                                    <span class="switch_title">화면크기</span>
                                    <ul class="zoom_list">
                                        <li class="zoom_item plus">
                                            <button type="button" title="확대" onclick="Zoom.exec(1); return false;">확대</button>
                                        </li>
                                        <li class="zoom_item minus">
                                            <button type="button" title="축소" onclick="Zoom.exec(-1); return false;">축소</button>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="switch_item color">
                                <div class="switch">
                                    <input type="checkbox" id="gnbToggle" class="color" tabindex="0">
                                    <label for="gnbToggle" class="switch_title">고대비</label>
                                </div>
                            </li>
                            <!--
                            <li class="switch_item language">
                                <button type="button" class="switch_title language_button">언어선택</button>
                                <div class="language_panel">
                                    <ul class="language_list">
                                        <li class="language_item"><a href="/en/index.do" class="language_anchor">영어</a></li>
                                        <li class="language_item"><a href="" class="language_anchor">중국어</a></li>
                                        <li class="language_item"><a href="" class="language_anchor">일본어</a></li>
                                    </ul>
                                </div>
                            </li>-->
                            <li class="switch_item language">
                                <a href="/en/index.do" class="switch_title language_button">영문홈페이지</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="group">
            <div class="logo">
                <div class="wrap">
                    <a href="./index.do" class="logo_anchor">
                        <img src="/site/www/images/common/logo.png" alt="성북의 미래 현장에서 답을 찾다">
                    </a>
                </div>
            </div>

            <div class="lnb">

                <div class="menu_show">
                    <button type="button" class="menu_btn">주메뉴 열기</button>
                </div>

                <nav class="menu after eachdown multiple">
                    <h2 class="skip">주메뉴</h2>

                    <div class="menu_header">
                        <div class="link">
                            <ul class="link_list">
			            	<c:choose>
			            		<c:when test="@@{empty sessionScope.loginVO}">
			            			<li class="link_item login"><a href="/loginView.do" class="link_anchor">로그인</a></li>
									<li class="link_item join"><a href="/webSignUpIntro.do" class="link_anchor">회원가입</a>
			            		</c:when>
			            		<c:otherwise>
							<li class="link_item mypage"><a href="./sub.do?key=5737" class="link_anchor">마이페이지</a></li>
			            			<li class="link_item logout"><a href="/logout.do" class="link_anchor">로그아웃</a></li>
			            		</c:otherwise>
			            	</c:choose>
                                <li class="link_item family_box">
                                    <button type="button" title="주요사이트 열기" class="family_btn link_anchor">주요사이트</button>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="wrap">
                        <div class="depth depth1"><!-- 차수에 맞는 숫자와 조합하여 클래스를 넣어주세요 (예 : depth#, depth#_#) -->
                            <ul class="depth_list depth1_list cut">
                            <c:forEach var="firstMenu" items="@@{mainFirstMenuList}" varStatus="status">
                                <li class="depth_item depth1_item <c:if test="@@{menuInfo.naviList[0].menuNo eq firstMenu.menuNo}">active</c:if>"> <!-- 선택된 메뉴에 active 클래스 넣어주세요-->
                                    <a href="<c:out value="@@{firstMenu.menuUrl}"/>" target="<c:out value="@@{firstMenu.linkTrget}"/>" class="depth_text depth1_text"><c:out value="@@{firstMenu.menuNm}"/></a>

                                    <div class="depth depth2">
	                                    <div class="depth2_content">
                                          <div class="depth2_title"><span><c:out value="@@{firstMenu.menuNm}"/></span></div>
                                          <ul class="depth_list depth2_list cut">

                                              <c:forEach var="secondMenu" items="@@{mainSecondMenuList}" varStatus="status">
                                              <c:if test="@@{firstMenu.menuNo == secondMenu.upperMenuNo and secondMenu.menuLevel == 2}">
                                              <li class="depth_item depth2_item <c:if test="@@{menuInfo.naviList[1].menuNo eq secondMenu.menuNo}">active</c:if>"> <!-- 선택된 메뉴에 active 클래스 넣어주세요-->
                                                  <a href="<c:out value="@@{secondMenu.menuUrl}"/>" target="<c:out value="@@{secondMenu.linkTrget}"/>" class="depth_text depth2_text"><span><c:out value="@@{secondMenu.menuNm}"/></span></a><!-- 2차메뉴 -->
                                                  <div class="depth depth3">
                                                      <ul class="depth_list depth3_list">
                                                       <c:forEach var="thirdMenu" items="@@{mainThirdMenuList}" varStatus="status">
                                                          <c:if test="@@{firstMenu.menuNo == secondMenu.upperMenuNo and secondMenu.menuNo == thirdMenu.upperMenuNo and thirdMenu.menuLevel == 3}">
                                                          <li class="depth_item depth3_item <c:if test="@@{menuInfo.naviList[2].menuNo eq thirdMenu.menuNo}">active</c:if>">
                                                              <a href="<c:out value="@@{thirdMenu.menuUrl}"/>" target="<c:out value="@@{thirdMenu.linkTrget}"/>" class="depth_text depth3_text"><c:out value="@@{thirdMenu.menuNm}"/></a>

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
                                     </div>

                                </li>
                            </c:forEach>
                            </ul>
                        </div>

                    </div>


                    <div class="menu_hide">
                        <button type="button" class="menu_btn">주메뉴 닫기</button>
                    </div>
                </nav>

            </div>
            <div class="quick">

                <div class="quick_item my_menu">
                    <button type="button" class="quick_btn" title="나의메뉴 열기"><span>나의 메뉴</span></button>
                    <div class="quick_box">
                    <c:choose>
                		<c:when test="@@{not empty sessionScope.loginVO}">
                        <div class="quick_text login"> <!-- 로그인 했을때 -->
                            <p class="box_title">나의 메뉴 <span>[@@{myMenuListCnt}]</span></p>
                            <ul class="box_list">
                            	<c:forEach items="@@{myMenuList}" var="myMenu">
                                	<li class="box_item"><a href="@@{myMenu.menuUrl}" class="box_anchor">@@{myMenu.menuNm}</a><button type="button" onclick="deleteMyMenu('@@{myMenu.menuNo}', '@@{siteInfo.siteId}');" class="close_btn">텍스트제거</button></li>
                                </c:forEach>
                            </ul>
                            <!--<a href="" class="box_setting">설정</a>-->
                            <!--<button type="button" class="box_setting">설정</button>-->
                            <button type="button" class="box_close"> 닫기</button>
                        </div>
                		</c:when>
                		<c:otherwise>
                        <div class="quick_text logout"><!-- 로그인 안했을때 -->
                            <p class="box_title">나의 메뉴</p>
                            <a href="/www/contents.do?key=6827" class="box_btn">이용안내</a>
                            <button type="button" class="box_close"> 닫기</button>
                        </div>
                		</c:otherwise>
                		</c:choose>

                    </div>
                </div>

                <div class="quick_item kakao_channel">
                    <button type="button" class="quick_btn" title="채널추가 열기"><span>채널추가</span></button>
                    <div class="quick_box">
                        <p class="box_title">성북구청 카카오톡채널 추가</p>
                        <p class="box_subtitle">매주 수요일마다 <br> 카카오톡채널 친구에게 찾아갑니다!</p>
                        <ul class="num_list">
                            <li>① 생활에 도움되는 사업, 행사 등</li>
                            <li>② SNS 이벤트 & 킬링타임용 콘텐츠</li>
                        </ul>
                        <div class="bottom">
                            <p>친구 추가 안내 문자 받기</p>
                            <form action="">
                                <fieldset>
                                    <legend>친구 추가 안내 문자 받기</legend>
                                    <input type="text" name="" id="" class="k_input" title="휴대폰 번호 입력" placeholder="휴대폰 번호 입력"/>
                                    <button type="submit" class="box_btn" title="친구 추가 안내 문자 받기 확인">확인</button>
                                </fieldset>
                            </form>
                        </div>
                        <button type="button" class="box_close"> 닫기</button>
                    </div>
                </div>
            </div>
            <div class="shortcut">
                <div class="wrap">
                    <ul class="shortcut_list">
                        <!--
                        <li class="shortcut_item language">
                            <button type="button" class="shortcut_anchor language_button">언어선택</button>
                            <div class="language_panel">
                                <ul class="language_list">
                                    <li class="language_item"><a href="/en/index.do" class="language_anchor">영어</a></li>
                                    <li class="language_item"><a href="" class="language_anchor">중국어</a></li>
                                    <li class="language_item"><a href="" class="language_anchor">일본어</a></li>
                                </ul>
                            </div>
                        </li>-->
                        <li class="shortcut_item language">
                            <a href="/en/index.do" class="shortcut_anchor language_button">영문사이트바로가기</a>
                        </li>
                        <li class="shortcut_item search">
                            <button type="button" title="검색열기" class="search_toggle shortcut_anchor">검색열기</button>
                        </li>
                        <li class="shortcut_item sitemap"><a href="./sitemap.do?key=6469" class="shortcut_anchor">사이트맵</a></li>
                    </ul>
                </div>
            </div>

        </div>
