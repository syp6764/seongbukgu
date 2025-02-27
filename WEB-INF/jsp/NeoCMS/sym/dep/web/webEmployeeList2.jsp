<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="decorator" content="${menuInfo.siteId}" />
<link rel="stylesheet" href="/common/css/board.css" />
<script src="/common/js/board.js"></script>
<script src="/common/js/calendar.js"></script>
<script type="text/javascript" src="<c:url value='/cmm/validator.do'/>"></script>
<title>${menuInfo.cntntsNm}- ${siteInfo.siteNm}</title>
</head>
<body>
	<div class="cts6005_wrap">
		<div class="organ_detail">

<c:choose>
    <c:when test="${employeeList[0].deptNm eq '감사담당관'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>행정의 투명성·적법성 확립을 위한 감사 실시</li>
                    <li>특정민생업무 조사점검 및 인권도시 성북 추진</li>
                    <li>체계적 분석을 통한 성과감사 추진</li>
                    <li>쾌적하고 안전한 생활환경 조성을 위한 환경순찰</li>
                    <li>적극적 민원행정 처리로 주민불편사항 해소</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>감사총괄</li>
                        <li>인권조사</li>
                        <li>청렴행정</li>
                        <li>환경순찰</li>
                        <li>직소민원</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 8층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '도시정비신속추진단'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>효율적인 빈집관리 및 쾌적한 도시 조성</li>
                    <li>맞춤형 주민 갈등 조정 및 공모사업 지원</li>
                    <li>공공재개발·신속통합기획을 통한 신속한 정비사업</li>
                    <li>소규모주택정비사업으로 주거환경 개선</li>
                    <li>신속한 재건축으로 주거 안정 조성</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>모아주택 관리팀</li>
                        <li>공공 공모팀</li>
                        <li>소규모 주택팀</li>
                        <li>재건축팀</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 8층
                </p>
            </div>
        </div>
    </c:when>
	<c:when test="${employeeList[0].deptNm eq '복지정책과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>국가유공자 복리증진</li>
                    <li>서로 행복한 기부와 나눔의 활성화</li>
                    <li>1인 가구 주민 관계망 형성사업</li>
                    <li>자원봉사캠프 안녕캠페인</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>복지기획</li>
                        <li>복지연계</li>
                        <li>희망복지지원</li>
                        <li>돌봄지원</li>
                        <li>자원봉사</li>
                        <li>1인가구지원</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 7층
                </p>
                <p class="caution type2">
                    <span class="caution_icon">유의사항</span> 자원봉사센터 (장위동, 꿈의숲아이파크)
                </p>
            </div>
        </div>
	</c:when>
	<c:when test="${employeeList[0].deptNm eq '생활보장과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>국민기초생활보장 지원</li>
                    <li>복지 통합조사 및 관리</li>
                    <li>자활사업으로 저소득층 생활안정 지원</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>기초생활보장</li>
                        <li>통합조사관리1</li>
                        <li>통합조사관리2</li>
                        <li>통합조사관리3</li>
                        <li>자활주거</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 7층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '어르신?장애인복지과'}">
        <!-- <h3>${employeeList[0].deptNm}</h3> -->
        <h3>${fn:replace(employeeList[0].deptNm, '?', '·')}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>경로당시설 확대 및 운영 활성화</li>
                    <li>구립 실버복지센터 운영 활성화 및 노인복지시설 관리 강화</li>
                    <li>노인맞춤돌봄서비스 추진</li>
                    <li>장애인가족지원센터 설치·지원</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>어르신지원</li>
                        <li>재가복지</li>
                        <li>장애인지원</li>
                        <li>장애인시설</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 8층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '여성가족과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>어린이집 운영지원사업</li>
                    <li>부모모니터링단 운영</li>
                    <li>여성안심사업 추진</li>
                    <li>가정 내 보육지원 활성화</li>
                    <li>성인지적 역량강화를 위한 교육 확대</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>보육행정</li>
                        <li>보육지원</li>
                        <li>여성복지</li>
                        <li>출생가족지원</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 7층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '아동청소년과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>아동청소년 활동지원</li>
                    <li>아동친화도시 업무</li>
                    <li>아동학대 보호 및 조사</li>
                    <li>취약계층아동 맞춤형 통합서비스 제공</li>
                    <li>우리동네 키움센터 운영</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>아동청소년친화</li>
                        <li>아동보호</li>
                        <li>드림스타트</li>
                        <li>온종일돌봄</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 10층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '교육지원과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>교육경비보조금 지원사업</li>
                    <li>차별 없이 모두 건강한 친환경 급식 지원</li>
                    <li>지속가능한 평생학습사회 실현을 위한 평생교육 지원</li>
                    <li>멘토링 지원사업</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>교육지원</li>
                        <li>친환경급식</li>
                        <li>평생교육</li>
                        <li>미래교육</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 본관 10층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '주택정책과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>주택임대사업자 등록</li>
                    <li>공동주택 관리 사업 지원</li>
                    <li>공동주택관리 실태조사 추진</li>
                    <li>신발생 위반건축물 단속</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>주택정책</li>
                        <li>공동주택관리1</li>
                        <li>공동주택관리2</li>
                        <li>주택정비</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 9층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '주거정비과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>투명한 정비사업 추진을 위한 공공지원 추진</li>
                    <li>재정비 촉진지구 정비사업</li>
                    <li>주택재개발정비사업 추진지원</li>
                    <li>재건축·지역조합·시장정비·리모델링사업 원활한 추진 지원</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>재정비사업1</li>
                        <li>재정비사업2</li>
                        <li>재개발1</li>
                        <li>재개발2</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 9층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '도시계획과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>합리적인 도시계획 관리</li>
                    <li>체계적·합리적 지구단위계획 관리</li>
                    <li>장위 서울형 도시재생사업</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>도시계획</li>
                        <li>지구단위</li>
                        <li>도시상임기획</li>
                        <li>킴퍼스타운조성</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 11층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '건축과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>도시미관 증진을 위한 건축위원회 운영</li>
                    <li>건축물 유지관리 지도점검</li>
                    <li>지역건축안전센터 운영</li>
                    <li>한옥 보전 및 지원 내실화 추진</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>건축관리</li>
                        <li>건축허가</li>
                        <li>공공건축1</li>
                        <li>공공건축2</li>
                        <li>건축안전</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 본관 2층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '공원녹지과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>도시공원·마을마당·쉼터 조성 및 유지관리</li>
                    <li>가로녹지대 유지관리 및 꽃길 조성</li>
                    <li>개발제한구역 단속 · 행위제한 업무 및 산불·산사태·산림병해충 예방</li>
                    <li>하천변(성북천, 정릉천, 우이천, 중랑천) 녹지대 관리</li>
                    <li>도시 농업 및 여가 프로그램 운영</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>공원기획</li>
                        <li>공원관리</li>
                        <li>조경</li>
                        <li>자연생태</li>
                        <li>수변여가</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 9층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '교통행정과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>교통사고 제로(Zero)화 추진</li>
                    <li>소규모 공영(노외)주차장 건립 및 유휴지 활용 주차장 조성</li>
                    <li>자동차관련 과태료 체납징수</li>
                    <li>안전한 교통환경 개선</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>교통행정</li>
                        <li>교통시설</li>
                        <li>자동차등록</li>
                        <li>자동차정비</li>
                        <li>교통개선</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 2층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '교통지도과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>건축물 부설주차장 공유</li>
                    <li>편리한 대중교통 질서 확립</li>
                    <li>교통법규위반 과태료 부과·징수</li>
                    <li>무인단속시스템 확대</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>주차관리</li>
                        <li>운수지도</li>
                        <li>교통과징</li>
                        <li>주차단속</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 4층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '건설관리과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>도시계획시설사업 손실보상 추진</li>
                    <li>효율적인 공공용지 관리를 통한 세수 증대</li>
                    <li>쾌적한 거리환경을 위한 광고문화 정착</li>
                    <li>거리가게 및 도로 적치물 정비 계획</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>건설행정</li>
                        <li>공공용지관리</li>
                        <li>광고물</li>
                        <li>가로정비</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 10층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '도로과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>도로개설사업</li>
                    <li>도로 및 도로시설물 유지관리</li>
                    <li>숭인초 주변 등 11개소 친환경 열선시스템 구축 사업</li>
                    <li>도로조명 시설관리</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>도로계획</li>
                        <li>도로굴착</li>
                        <li>도로시설</li>
                        <li>보도관리</li>
                        <li>도로조명</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 10층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '치수과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>안전한 풍수해 대책</li>
                    <li>쾌적하고 안전한 하천유지관리</li>
                    <li>하수시설물 유지관리</li>
                    <li>빗물관리시설 확충공사</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>치수</li>
                        <li>하수</li>
                        <li>빗물관리</li>
                        <li>기전관리</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 10층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '기획예산과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>미래성북과제 구축 및 운영</li>
                    <li>예산 편성 및 관리</li>
                    <li>공공데이터플랫폼 운영, 법규 정비 및 사회조사, 통계</li>
                    <li>공·재단 경영관리 및 창의·정부혁신 업무</li>
                    <li>공공시설 관리체계 구축 및 운영</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>기획</li>
                        <li>예산</li>
                        <li>법제통계</li>
                        <li>혁신경영지원</li>
                        <li>미래성북</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 8층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '재무과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>공유재산 실태조사 및 관리</li>
                    <li>계약업무의 통합 및 공정관리</li>
                    <li>회계관리의 투명성 및 책임성 확보</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>재산관리</li>
                        <li>계약</li>
                        <li>지출</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 5층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '세무1과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>지방세 세입목표 달성 추진</li>
                    <li>법인 지방세 징수 강화로 세입확충</li>
                    <li>공정한 개별주택가격 산정 및 공시</li>
                    <li>세외수입 체납징수 목표 달성</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>세입총괄</li>
                        <li>재산1</li>
                        <li>재산2</li>
                        <li>재산3</li>
                        <li>법인관리</li>
                        <li>주택평가</li>
                        <li>세외수입</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 3층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '세무2과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>지방세 세입목표 달성</li>
                    <li>체납 지방세 징수활동 강화</li>
                    <li>체납차량 번호판 영치활동 강화</li>
                    <li>지방소득세 신고센터 설치</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>세입정리</li>
                        <li>자동차세</li>
                        <li>지방소득세1</li>
                        <li>지방소득세2</li>
                        <li>주민세</li>
                        <li>38세금징수</li>
                        <li>번호판영치</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 3층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '부동산정보과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>부동산중개업 지도 및 관리</li>
                    <li>부동산거래질서 확립을 위한 실거래 신고제 운영</li>
                    <li>개별공시지가 조사 및 결정·공시, 현장상담실 운영</li>
                    <li>지적불부합지 해결을 위한 지적재조사 사업(삼선동 1가지구)</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>부동산행정</li>
                        <li>부동산관리</li>
                        <li>지적관리</li>
                        <li>지가조사</li>
                        <li>지적재조사</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 3층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '도시안전과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>취약계층 안전관리를 위한 폭염(한파)대책 추진</li>
                    <li>민방위 편성 관리 및 교육훈련</li>
                    <li>방범용 CCTV 확대 설치</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>재난관리</li>
                        <li>안전지원</li>
                        <li>중대해예방</li>
                        <li>민방위</li>
                        <li>관제센터운영</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 9층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '청소행정과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>쓰레기 혼합배출 및 무단투기 단속</li>
                    <li>서울형 리앤업사이클플라자 조성</li>
                    <li>안전하고 쾌적한 공중화장실 조성</li>
                    <li>도로청소 강화 및 차량관리 적정화</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>청소행정</li>
                        <li>자원순환</li>
                        <li>위생설비</li>
                        <li>장비관리</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 5층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '일자리정책과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>일자리 창출 활성화</li>
                    <li>혁신산업 육성 지원</li>
                    <li>청년 취창업지원 및 자립기반 구축</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>일자리지원</li>
                        <li>신산업지원</li>
                        <li>청년지원</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 11층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '지역경제과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>사회적경제 활성화 사업</li>
                    <li>모바일 성북사랑상품권 운영</li>
                    <li>전통시장 및 골목상권 활성화 지원</li>
                    <li>유기동물보호 및 길고양이 중성화 사업</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>사회적경제</li>
                        <li>소상공인지원</li>
                        <li>시장상권지원</li>
                        <li>동물보호</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 8층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '환경과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>소규모 다중이용시설 실내공기질 관리 및 환경교육 운영</li>
                    <li>2050 탄소중립 기반 조성 및 실천사업 추진</li>
                    <li>석유, 가스시설 인허가 및 관리</li>
                    <li>소음, 대기 및 수질의 적정 관리</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>환경기획</li>
                        <li>기후변화대응</li>
                        <li>에너지관리</li>
                        <li>환경보전</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 11층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '행정지원과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>쾌적하고 편리하며 안전한 구청사 환경 조성</li>
                    <li>조직역량 강화 및 행정신뢰도 향상을 위한 체계적인 인사운영</li>
                    <li>직원 후생복지 증진</li>
                    <li>대내·외 교류증진 및 글로벌 문화 확산</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>총무</li>
                        <li>인사</li>
                        <li>후생지원</li>
                        <li>대외협력</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 6층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '자치행정과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>통반장 활성화 지원</li>
                    <li>동청사 시설관리 및 환경개선</li>
                    <li>주민자치 프로그램 운영</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>자치협치</li>
                        <li>현장행정</li>
                        <li>주민자치</li>
                        <li>주민사업</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 본관 4층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '문화체육과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>문화시설 운영</li>
                    <li>구립 예술단체 운영</li>
                    <li>책 읽는 성북 확산을 위한 장서 확충 및 홍보</li>
                    <li>생활체육 활성화를 통한 건강증진</li>
                    <li>여가산업 관리 및 종사자교육</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>문화기획</li>
                        <li>도서관지원</li>
                        <li>생활체육</li>
                        <li>관광여가</li>
                        <li>문화재관리</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 7층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '홍보전산과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>현장 중심의 언론보도 활성화</li>
                    <li>홈페이지 성능 개선 및 활성화</li>
                    <li>정보격차 해소를 위한 구민정보화교육 운영</li>
                    <li>무료 와이파이 존 설치 확대를 통한 대민서비스 강화</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>언론홍보</li>
                        <li>미디어</li>
                        <li>정보화운영</li>
                        <li>정보통신</li>
                        <li>스마트시티 T/F</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 구청 9층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '민원여권과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>중요 종이기록물 전산화 구축사업</li>
                    <li>친절하고 신속한 민원행정서비스 추진</li>
                    <li>여권행정 고객서비스 지속 추진</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>민원관리</li>
                        <li>민원처리</li>
                        <li>가족관계등록</li>
                        <li>여권</li>
                    </ul>
                </div>
                <p class="caution map">
                    <span class="caution_icon">위치안내</span> 위치 : 본관 2층
                </p>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '건강정책과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>금연사업</li>
                    <li>신체활동 늘리기</li>
                    <li>영양플러스사업</li>
                    <li>주민주도 걷기운동 활성화 사업</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>보건행정</li>
                        <li>건강도시</li>
                        <li>건강증진</li>
                        <li>건강주치의T/F</li>
                    </ul>
                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '건강관리과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>산모신생아 건강관리사 지원사업</li>
                    <li>방역소독사업</li>
                    <li>결핵관리사업</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>모자보건</li>
                        <li>감염병관리</li>
                        <li>감염병대응</li>
                        <li>건강관리</li>
                        <li>가족보건</li>
                    </ul>
                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '의약과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>정신건강증진사업</li>
                    <li>생명존중 및 자살예방사업</li>
                    <li>성북건강관리센터 운영</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>의무</li>
                        <li>약무</li>
                        <li>검진</li>
                        <li>마음건강</li>
                    </ul>
                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '보건위생과'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>식품접객업소 관리 및 위생점검 강화</li>
                    <li>부정·불량식품 단속강화 등 식품안전관리</li>
                    <li>공중위생업소 관리 및 지도점검</li>
                    <li>식품접객업소 불법 영업행위 단속 강화</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>식품위생1</li>
                        <li>식품위생2</li>
                        <li>식품안전</li>
                        <li>공중위생</li>
                        <li>위해업소단속T/F</li>
                    </ul>
                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${employeeList[0].deptNm eq '보건지소'}">
        <h3>${employeeList[0].deptNm}</h3>
        <div class="box type3">
            <div class="box_wrap">
                <h3 class="box_title">주요업무</h3>
                <ul class="bu">
                    <li>대사증후군관리사업</li>
                    <li>재활보건사업</li>
                    <li>정릉아동보건지소 운영</li>
                </ul>
                <div class="bu_box">
                    <ul class="bu">
                        <li>행정</li>
                        <li>동선지소</li>
                        <li>정릉지소</li>
                        <li>장위석관지소</li>
                    </ul>
                </div>
            </div>
        </div>
    </c:when>
</c:choose>


<c:choose>

	<c:when test="${empty employeeDeptGroupList and not empty employeeList }">
						<h4>${employeeList[0].deptNm }</h4>
						<table class="table responsive">
							<caption>${employeeList[0].deptNm } - 담당업무, 담당자, 연락처 정보 제공</caption>
							<colgroup>
								<col>
								<col style="width: 10%;">
								<col style="width: 20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">담당업무</th>
									<th scope="col">담당자</th>
									<th scope="col">연락처</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${employeeList}" var="result">
								<tr>
									<th scope="row" rowspan="2">${result.emplJob }</th>
									<td>${result.rspofc }</td>
									<td>${result.emplTelno }</td>
								</tr>
								<tr>
									<td>FAX</td>
									<td>${result.emplFax }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
	</c:when>

	<c:when test="${not empty employeeList && fn:endsWith(employeeList[0].deptNm, '국')}">
						<h4>${employeeList[0].deptNm }</h4>
						<table class="table responsive">
							<caption>${employeeList[0].deptNm } - 담당업무, 담당자, 연락처 정보 제공</caption>
							<colgroup>
								<col>
								<col style="width: 10%;">
								<col style="width: 20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">담당업무</th>
									<th scope="col">담당자</th>
									<th scope="col">연락처</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${employeeList}" var="result">
								<tr>
									<th scope="row" rowspan="2">${result.emplJob }</th>
									<td>${result.rspofc }</td>
									<td>${result.emplTelno }</td>
								</tr>
								<tr>
									<td>FAX</td>
									<td>${result.emplFax }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
	</c:when>

	<c:otherwise>

			<c:forEach items="${employeeDeptGroupList}" var="team">
						<h4>${team.teamNm }</h4>
						<table class="table responsive">
							<caption>${team.teamNm } - 담당업무, 담당자, 연락처 정보 제공</caption>
							<colgroup>
								<col>
								<col style="width: 10%;">
								<col style="width: 20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">담당업무</th>
									<th scope="col">담당자</th>
									<th scope="col">연락처</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${employeeList}" var="result">
								<c:if test="${team.teamNm eq result.teamNm }">
								<c:choose>
								<c:when test="${team.teamNm == '부서장' || team.teamNm == '동장'}">
								<tr>
									<th scope="row" rowspan="2">${result.emplJob }</th>
									<td>${result.rspofc }</td>
									<td>${result.emplTelno }</td>
								</tr>
								<tr>
									<td>FAX</td>
									<td>${result.emplFax }</td>
								</tr>
								</c:when>
								<c:otherwise>
								<tr>
									<th scope="row">${result.emplJob }</th>
									<td>${result.rspofc }</td>
									<td>${result.emplTelno }</td>
								</tr>
								</c:otherwise>
								</c:choose>
								</c:if>
								</c:forEach>
							</tbody>
						</table>
			</c:forEach>
		</c:otherwise>
	</c:choose>

			<div class="btn_group">
			    <c:if test="${employee.deptCode eq '30701630000'}">
				<a href="/www/selectEmployeeWebList.do?key=6005" class="bbsbtn type1 big">목록</a>
				</c:if>
				<c:if test="${not empty employeeList && fn:endsWith(employeeList[0].deptNm, '동')}">
				<a href="./selectEmployeeWebList2.do?key=6005&deptCode=30701630000" title="새창" target="_blank" class="bbsbtn type1 big">우리 동 방문간호사</a>
				</c:if>
			</div>

		</div>

	</div>

</body>
</html>