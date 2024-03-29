<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Integer pageNum = request.getAttribute("pageNum") != null ? (Integer) request.getAttribute("pageNum") : 1;
List boardList = request.getAttribute("boardlist") != null ? (List) request.getAttribute("boardlist") : new ArrayList();
Integer total_record = request.getAttribute("total_record") != null
		? (Integer) request.getAttribute("total_record")
		: 0;
Integer total_page = request.getAttribute("total_page") != null ? (Integer) request.getAttribute("total_page") : 1;
String items = request.getAttribute("items") != null ? (String) request.getAttribute("items") : "";
String text = request.getAttribute("text") != null ? (String) request.getAttribute("text") : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>상품게시판</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
function checkForm() {
    var sessionId = '<%=(String) session.getAttribute("memberId")%>'; // JSP 변수를 JavaScript 변수로 변환

    if (!sessionId) {
        alert("로그인 해주세요");
        location.href = "./member/loginMember.jsp";
        return false;
    } else if (sessionId === 'admin') {
        location.href = "./BoardWriteForm.do"; // 관리자일 경우 글쓰기 페이지로 이동
        return false;
    }
}

</script>
</head>
<style>
/*=====================맨위====================*/
.material-symbols-outlined {
	font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 24;
}

* {
	margin: 0;
	padding: 0;
	list-style: none;
	box-sizing: border-box;
	font-family: "IBM Plex Sans KR", sans-serif;
	font-family: "Noto Sans KR", sans-serif;
	color: #333333;
}

body, html {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	margin: 0;
}

a {
	text-decoration: none;
	display: block;
}

#wrapper {
	height: 100%;
	width: 100%;
	position: absolute;
	overflow-x: hidden;
}

section, #Mainmenu {
	width: 100%;
	height: 100%;
	position: relative;
	/*	border: 3px solid orange;*/
}
/*=====================메인메뉴====================*/
#Mainmenu {
	position: fixed;
	width: 100%;
	height: 70px;
	display: flex;
	justify-content: space-between;
	background-color: white;
	z-index: 999;
}

#Mainmenu .left_box img {
	position: relative;
	top: 10px;
}

.left_box ul li a, .right_box ul li a {
	width: 100%;
	height: 100%;
	text-decoration: none;
	text-align: center;
	line-height: 70px;
	font-weight: bold;
	font-size: 18px;
}

.left_box {
	width: 45%;
	display: flex;
	justify-content: left;
	align-items: center;
	margin-left: 10%;
}

.left_box ul {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	height: 100%;
	margin-left: 50px;
}

.left_box ul li {
	position: relative;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 30%;
	height: 100%;
}

.center_box {
	width: 20%;
}

.right_box {
	width: 35%;
	display: flex;
	justify-content: right;
	align-items: center;
	margin-right: 10%;
}

.right_box ul {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	width: 100%;
	height: 100%;
}

.right_box ul li {
	position: relative;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 30%;
	height: 100%;
	margin-left: 10px;
	white-space: nowrap;
}

.left_box ul li a:hover, .right_box ul li span:hover {
	color: green !important;
}

.right_box .burgerBtn {
	cursor: pointer;
}

/*    ============================숨겨진 메뉴================*/
.hideMenu {
	position: fixed;
	width: 100%;
	height: 50%;
	/*  border: 1px solid red;*/
	z-index: 999;
	top: 70px;
	background-color: white;
}

.hideMenu ul {
	position: relative;
	display: inline-block;
	vertical-align: top;
	margin: 0 20px;
	left: 19%;
	top: 10%;
	line-height: 30px;
	/*		  border: 1px solid red;*/
	/*    font-weight: bold;*/
}

.hideMenu ul li:hover {
	color: green;
}

.hideMenu .hideMenu_img {
	position: relative;
	left: 62%;
	top: -50px;
	width: 330px;
	height: 370px;
}

.hideMenu .hideMenu_img img {
	position: relative;
	right: 0;
}

/*======================작은사이즈 버거메뉴===========*/
#smallMenu {
	background-color: white;
	height: 100%;
	right: -10px;
	width: 80%;
	max-width: 500px;
	display: block;
	position: fixed;
	z-index: 99999;
	padding: 10px;
	font-weight: bold;
}

#smallMenu ul li {
	margin: 20px;
}

#smallMenu img {
	width: 80%;
}

#smallMenu .material-symbols-outlined {
	position: relative;
	left: 90%;
	margin-top: 10px;
	/*	border: 1px solid red;*/
}

#smallMenu span {
	cursor: pointer;
}

/* ===================위클리====================== */
.weekly_Logo {
	/*	border: 1px solid red;*/
	position: relative;
	width: 100%;
	height: 400px;
	display: flex;
	gap: 20px;
	flex-direction: row;
	align-content: center;
	justify-content: center;
	align-items: center;
	margin-top: 80px;
}

.weekly_Logo hideMenu_img {
	width: 100%;
	height: 100%;
}

.weekly_Logo .best {
	position: absolute;
	font-size: 48px;
	font-weight: bold;
}

.weekly {
	/*    border: 1px solid red;*/
	width: 880px;
	position: relative;
	margin-left: auto;
	margin-right: auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 10px;
	margin-bottom: 20px;
}

.weekly_list {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.weekly_list_number {
	/*	border: 1px solid red;*/
	width: 30px;
	height: 30px;
	text-align: center;
	position: relative;
	top: 30px;
	background-color: #666666;
	color: white;
	font-weight: bold;
}

.weekly_list img {
	background-color: #f9f9f9;
	width: 211px;
	height: 236px;
}

.weekly_list_discount {
	font-size: 14px;
	color: gray;
	text-decoration: line-through;
}

.weekly_list_cost {
	font-size: 18px;
	font-weight: bold;
}

.weekly_list_sale {
	color: #6e9a9a;
	font-weight: bold;
}

.weekly_list_box {
	border: 1px solid #a89079;
	background-color: #a89079;
	width: 70px;
	text-align: center;
	color: white;
	font-weight: bold;
}

.choice_box, .weekly_title {
	/*	border: 1px solid red;*/
	height: 100px;
	display: flex;
	align-items: center;
	width: 880px;
	margin-left: auto;
	margin-right: auto;
	font-weight: bold;
}

.wbest_choice {
	border: 1px solid #6c801a;
	background-color: #6c801a;
	width: 147px;
	text-align: center;
	height: 40px;
	font-size: 18px;
	margin-right: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 100px;
}

.best_choice {
	border: 1px solid #f6f6f6;
	width: 96px;
	text-align: center;
	height: 40px;
	font-size: 18px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f6f6f6;
	border-radius: 100px;
}

.wbest_choice a {
	color: white;
	font-weight: bold;
}

.best_choice a {
	color: #999999;
	font-weight: 500;
}

.table_btm {
	display: flex;
	justify-content: center;
}

#sec9 {
	height: 450px;
	margin-top: 150px;
	margin-bottom: 500px;
}

#sec9 .footer_login {
	height: 15%;
	background-color: #67625d;
	display: flex;
	justify-content: center;
	position: relative;
}

#sec9 .footer_login_box {
	width: 80%;
	height: 100%;
	left: 15%;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

#sec9 .footer_login p {
	/*	border: 1px solid black; */
	width: 94px;
	height: 40px;
	font-size: 15px;
	color: white;
	background-color: #3f3e3c;
	text-align: center;
	position: relative;
	border-radius: 10%;
	line-height: 40px;
}

#sec9 .footer_login p, #sec9 .footer_login img {
	margin: 0 10px;
}

#sec9 .footer_top {
	position: relative;
	width: 100%;
	height: 40%;
	/*	border: 1px solid blue;*/
	display: flex;
	background-color: #f2f2f2;
}

#sec9 .footer_top_info {
	/*	border: 1px solid red;*/
	height: 100%;
	width: 40%;
	margin-left: 10%;
	display: flex;
}

#sec9 .footer_top_info_left, #sec9 .footer_top_info_right {
	width: 50%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-content: flex-start;
	justify-content: center;
	align-items: flex-start;
	line-height: 25px;
}

#sec9 .footer_top_info_left_title {
	font-size: 14px;
	color: dimgray;
}

#sec9 .footer_top_info_left_email {
	font-size: 18px;
}

#sec9 .footer_top_info_left_tell {
	font-size: 33.7px;
}

#sec9 .footer_top_info_left_time {
	font-size: 12px;
	color: dimgray;
}

#sec9 .footer_top_info_right_title {
	font-size: 14px;
	color: dimgray;
}

#sec9 .footer_top_info_right_email {
	font-size: 18px;
}

#sec9 .footer_top_info_right_kakao {
	font-size: 13px;
}

#sec9 .footer_top_info_right_time {
	font-size: 12px;
	color: dimgray;
}

#sec9 .footer_top_icon {
	width: 45%;
	margin-right: 5%;
	display: flex;
	align-items: center;
	justify-content: center;
}

#sec9 .footer_top_icon div {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 0 20px;
	white-space: nowrap;
}

#sec9 .footer_btm {
	/*	border: 1px solid red;*/
	width: 80%;
	height: 45%;
	position: relative;
	display: flex;
	left: 10%;
	justify-content: center;
	align-items: center;
}

#sec9 .footer_btm a {
	width: 120px;
}

#sec9 .footer_btm_img1 {
	width: 112px;
	height: 158px;
	position: relative;
	top: 20px;
}

#sec9 .footer_btm_img2 {
	width: 300px;
	height: 110px;
	position: relative;
	border: 0.5px solid lightgray;
}

#sec9 .footer_btm .footer_btmtxt1 {
	font-size: 12px;
	font-weight: bold;
}

#sec9 .footer_btm .footer_btmtxt2, #sec9 .footer_btm .footer_btmtxt3 {
	font-size: 12px;
	color: #a0a0a0;
}

#sec9 .mini_footer, #sec9 .footer_tgBox {
	display: none;
}

/*==========================미디어 쿼리======================*/
@media screen and (max-width: 1280px) {
	.left_box ul, #login {
		display: none;
	}
}

@media screen and (max-width: 1050px) {
	/*	===============#sec9==========*/
	/*#sec9{
      position: relative;
      top: -100px;
  }*/
	.weekly {
		/*    border: 1px solid red;*/
		width: 100%;
		display: grid;
		grid-template-columns: repeat(2, 1fr);
		margin: 10px;
	}
	.weekly_list img {
		background-color: #f9f9f9;
		width: 100%;
		height: auto;
	}
	.burgerBtn {
		opacity: 1;
	}
	#sec9 .footer_tgBox {
		display: flex;
		justify-content: center;
	}
	#sec9 .footer_tgBox #toggleFooter {
		border: none;
		background-color: white;
		font-size: 1em;
		cursor: pointer;
	}
	#sec9 .footer_login, #sec9 .footer_top_icon, #sec9 .footer_btm {
		display: none;
	}
	#sec9 .footer_top_info {
		width: 100%;
	}
	#sec9 .footer_top_info_left_title {
		font-size: 10px;
		color: dimgray;
	}
	#sec9 .footer_top_info_left_email {
		font-size: 15px;
	}
	#sec9 .footer_top_info_left_tell {
		font-size: 22px;
	}
	#sec9 .footer_top_info_left_time {
		font-size: 10px;
		color: dimgray;
	}
	#sec9 .footer_top_info_right_title {
		font-size: 10px;
		color: dimgray;
	}
	#sec9 .footer_top_info_right_email {
		font-size: 15px;
	}
	#sec9 .footer_top_info_right_kakao {
		font-size: 11px;
	}
	#sec9 .footer_top_info_right_time {
		font-size: 10px;
		color: dimgray;
	}
	#sec9 .mini_footer .hide_footer_txt {
		background-color: #f2f2f2;
	}
	#sec9 .mini_footer .hide_footer_txt p {
		font-size: 12px;
		color: gray;
		margin-left: 10px;
	}
	#sec9 .mini_footer .footer_btmtxt1 {
		font-size: 12px;
		text-align: center;
	}
}
</style>

<body>
	<div id="wrapper">
		<header id="Mainmenu">
			<div class="left_box">
				<h1>
					<a href="index.html"><img src="https://image.osulloc.com/kr/ko/static_cdj/images/main/logo_black.png" alt="" /></a>
				</h1>
				<ul>
					<li><a href="subpage1.html">제품</a></li>
					<li><a href="subpage5.html">선물추천</a></li>
					<li><a href="subpage4.html">다다일상</a></li>
					<li><a href="subpage3.html">브랜드</a></li>
				</ul>
			</div>
			<div class="center_box"></div>
			<div class="right_box">
				<!-- 구현 후 a태그 추가하기 -->
				<ul>
					<li><span class="material-symbols-outlined"> search </span></li>
					<li><span class="material-symbols-outlined"> shopping_cart </span></li>
					<li class="burgerBtn"><span class="material-symbols-outlined"> menu </span></li>
				</ul>
				<ul id="login">
					<li><a href="loginMember.html">로그인</a></li>
					<li><a href="addMember.html">회원가입</a></li>
				</ul>
			</div>
		</header>
		<div class="hideMenu">
			<ul>
				<a href="subpage1.html"><li>위클리베스트(subpage1연결)</li></a>
				<a href="subpage2.html"><li>베스트((subpage2연결))</li></a>
			</ul>
			<ul>
				<li style="color: rgb(192, 192, 192)">작업중</li>
				<!-- <li>티 세트</li>
          <li>명차</li>
          <li>녹차/말차</li>
          <li>발효차/홍차</li>
          <li>블렌디드티</li>
          <li>허브티</li>
          <li>밀크티/아이스티</li>
          <li>콤부차</li> -->
			</ul>
			<ul>
				<li style="color: rgb(192, 192, 192)">작업중</li>
				<!-- <li>과자/초콜릿</li>
          <li>베이커리</li>
          <li>아이스크림</li> -->
			</ul>
			<ul>
				<li style="color: rgb(192, 192, 192)">작업중</li>
				<!-- <li>용도별</li>
          <li>브랜드별</li> -->
			</ul>
			<ul>
				<li style="color: rgb(192, 192, 192)">작업중</li>
				<!-- <li>스킨케어</li>
          <li>단체 및 기업 구매</li> -->
			</ul>
			<div class="hideMenu_img">
				<img src="https://image.osulloc.com/upload/kr/ko/adminImage/RT/FM/20231231234524683OH.jpg" width="330px" height="370px" alt="" />
			</div>
		</div>

		<div id="smallMenu">
			<div>
				<div>
					<span class="material-symbols-outlined">close</span>
				</div>
			</div>
			<div>
				<ul>
					<a href="subpage1.html"><li>위클리베스트(subpage1연결)</li></a>
					<hr />
					<a href="subpage2.html"><li>베스트(subpage2연결)</li></a>
					<hr />
					<a href="subpage4.html"><li>다다일상</li></a>
					<hr />
					<a href="subpage3.html"><li>브랜드</li></a>
					<hr />
					<a href="subpage5.html"><li>선물추천</li></a>
				</ul>
			</div>
			<img src="https://image.osulloc.com/upload/kr/ko/adminImage/VW/TT/20231231234528926RY.jpg" alt="" />
			<div>
				<div>
					<a href="loginMember.html">로그인</a>
				</div>
				<div>
					<a href="addMember.html">회원가입</a>
				</div>
			</div>
		</div>

		<div class="weekly_Logo">
			<img src="https://image.osulloc.com/kr/ko/static_cdj/images/catBanner/banner_teaprod.jpg" alt="" />
			<div class="best">티제품</div>
		</div>

		<form action="<c:url value="./BoardListAction.do?"/>" method="post">

			<div class="choice_box">
				<div class="wbest_choice">
					<a href="#"> 티제품</a>
				</div>
				<div class="best_choice">
					<a href="#"> 티푸드</a>
				</div>
			</div>
			<hr />
			<div class="weekly_title">
				총
				<%=total_record%>개의 제품이 있습니다.
			</div>

			<div class="weekly">
				<%
				for (int i = 0; i < boardList.size(); i++) {
					BoardDTO boardDTO = (BoardDTO) boardList.get(i);
				%>
				<div class="weekly_list">
					<div class="weekly_list_number"><%=boardDTO.getNum()%></div>
					<!-- <img alt="" src="https://image.osulloc.com/upload/kr/ko/adminImage/UJ/EE/20231117152950667NN.png"> -->
					<img src="./resources/img/<%=boardDTO.getImg()%>" class="img-thumbnail" width="100" />
					<div class="weekly_list_text">
						<div class="weekly_list_title">
							<a href="./BoardViewAction.do?num=<%=boardDTO.getNum()%>&pageNum=<%=pageNum%>"><%=boardDTO.getSubject()%></a>
						</div>
						<div class="weekly_list_priceBox">
							<div class="weekly_list_cost"><%=boardDTO.getPrice()%>원
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>

			<!--       ======================================= -->
			<div class="table_btm">

				<div class="text-center">
					<c:set var="pageNum" value="<%=pageNum%>" />
					<c:set var="items" value="<%=items%>" />
					<c:set var="text" value="<%=text%>" />
					<c:forEach var="i" begin="1" end="<%=total_page%>">
						<%-- <a href="<c:url value='./BoardListAction.do?pageNum=${i}' />"> --%>
						<%-- ※검색시 검색결과 안에서 페이징되도록 추가※ --%>
						<c:if test="${items != null && text !=null}">
							<a href="<c:url value='./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}'/>"> <c:choose>
									<c:when test="${pageNum==i}">
										<b>[${i}]</b>
									</c:when>
									<c:otherwise>
									[${i}]
								</c:otherwise>
								</c:choose>
							</a>
						</c:if>
						<c:if test="${items == null || text ==null}">
							<a href="<c:url value='./BoardListAction.do?pageNum=${i}'/>"> <c:choose>
									<c:when test="${pageNum==i}">
										<b>[${i}]</b>
									</c:when>
									<c:otherwise>
										[${i}]
									</c:otherwise>
								</c:choose>
							</a>
						</c:if>
					</c:forEach>
				</div>

				<div class="text-left container">
					<table class="col-12">
						<tr>
							<td align="left" class="col-12 col-sm-8"><select name="items" id="" class="control">
									<c:if test="${items.equals('subject')}">
										<option value="subject" selected>제목에서</option>
									</c:if>
									<option value="subject">제목에서</option>
									<c:if test="${items.equals('content')}">
										<option value="content" selected>본문에서</option>
									</c:if>
									<option value="content">본문에서</option>
									<c:if test="${items.equals('name')}">
										<option value="name" selected>글쓴이에서</option>
									</c:if>
									<option value="name">글쓴이에서</option>
							</select> <input type="text" name="text" value="${text}" /> <input type="submit" class="btn btn-primary" value="검색" /> <%-- ※검색시 검색결과 안에서 페이징되도록 추가※ --%> <a class="btn btn-info" href="<c:url value='./BoardListAction.do?pageNum=1' />">검색 초기화</a></td>

							<%
							String sessionId = (String) session.getAttribute("memberId");
							if ("admin".equals(sessionId)) {
							%>
							<td align="right" class="col-12 col-sm-4"><a href="#" onclick="checkForm(); return false;" class="btn btn-warning">&laquo;글쓰기</a></td>
							<%
							}
							%>

						</tr>
					</table>
				</div>
			</div>
		</form>

		<section id="sec9">
			<div class="footer_tgBox">
				<div>오설록 사업자 정보확인</div>
				<button id="toggleFooter">>Click!<</button>
			</div>
			<div class="mini_footer">
				<div class="hide_footer_txt">
					<p>
						㈜ 오설록<br /> 대표이사 : 서혁제<br /> 주소 : 서울 특별시 용산구 한강대로 100 (한강로2가)<br /> 사업자 등록번호 : 390-87-01499<br /> 통신판매업신고번호 : 2019-서울용산-1173호<br /> 호스팅제공자 : ㈜오설록<br /> <br /> (주)오설록은 오설록 브랜드를 제외한 입점 브랜드에 대해서는 <br /> 통신판매중개자 이며 통신판매의 당사자가 아닙니다.<br /> 따라서 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.<br /> <br /> NHN KCP 구매안전(에스크로)서비스<br /> 고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에 가입한<br /> NHN KCP의 구매안전서비스를 이용하실 수 있습니다.
					</p>
				</div>
				<hr />
				<p class="footer_btmtxt1">회사소개 | 서비스이용약관 | 개인정보 처리방침 | 영상정보 처리방침 | 뷰티포인트 | 임직원할인 | 사이트맵 | 전자공고</p>
			</div>

			<div class="footer_login">
				<div class="footer_login_box">
					<a href="loginMember.html"><p>로그인</p></a> <img src="https://image.osulloc.com/kr/ko/static_cdj/images/sns/sns_t.png" alt="" /> <img src="https://image.osulloc.com/kr/ko/static_cdj/images/sns/sns_y.png" alt="" /> <img src="https://image.osulloc.com/kr/ko/static_renew/images/sns_i.png" alt="" />
				</div>
			</div>
			<div class="footer_top">
				<div class="footer_top_info">
					<div class="footer_top_info_left">
						<p class="footer_top_info_left_title">고객상담센터 · 주문/배송문의</p>
						<p class="footer_top_info_left_email">help@osulloc.com</p>
						<p class="footer_top_info_left_tell">080-805-5555</p>
						<p class="footer_top_info_left_time">평일 09:30 - 17:00 (점심 11:30 - 13:00)</p>
					</div>
					<div class="footer_top_info_right">
						<p class="footer_top_info_right_title">특판, 대량구매 문의</p>
						<p class="footer_top_info_right_email">mall@osulloc.com</p>
						<p class="footer_top_info_right_kakao">카카오톡ID : osullocmall</p>
						<p class="footer_top_info_right_time">평일 09:30 - 17:00 (점심 11:30 - 13:00)</p>
					</div>
				</div>
				<div class="footer_top_icon">
					<div>
						<img src="https://image.osulloc.com/kr/ko/static_renew/images/f1.png" alt="" /> 매장안내
					</div>
					<div>
						<img src="https://image.osulloc.com/kr/ko/static_renew/images/f2.png" alt="" /> 멤버십혜택
					</div>
					<div>
						<img src="https://image.osulloc.com/kr/ko/static_renew/images/f5.png" alt="" /> 단체 및<br />기업구매
					</div>
					<div>
						<img src="https://image.osulloc.com/kr/ko/static_renew/images/f4.png" alt="" /> 1:1문의
					</div>
					<div>
						<img src="https://image.osulloc.com/kr/ko/static_renew/images/beauti.png" alt="" /> 뷰티포인트 <br />추후적립
					</div>
				</div>
			</div>
			<div class="footer_btm">
				<a href="index.html"> <img class="footer_btm_img1" src="https://image.osulloc.com/kr/ko/static_renew/images/logo_f.png" alt="" />
				</a>
				<div>
					<p class="footer_btmtxt1">회사소개 | 서비스이용약관 | 개인정보 처리방침 | 영상정보 처리방침 | 뷰티포인트 | 임직원할인 | 사이트맵 | 전자공고</p>
					<p class="footer_btmtxt2">
						㈜ 오설록<br /> 대표이사:서혁제 주소:서울특별시 용산구 한강대로 100 (한강로2가) 사업자등록번호: 390-87-01499 <br /> 통신판매업신고번호:2019-서울용산-1173호 호스팅제공자: ㈜오설록
					</p>
					<p class="footer_btmtxt3">
						주)오설록은 오설록 브랜드를 제외한 입점 브랜드에 대해서는 통신판매중개자 이며 통신판매의 당사자가 아닙니다. <br />따라서 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.
					</p>
				</div>
				<img class="footer_btm_img2" src="img/footerLogo.png" alt="" />
			</div>
		</section>
	</div>
	<script>
		// ================메인메뉴 스크립트====================
		$(function() {
			let Mainli = $("#Mainmenu");
			let MainA = $("#Mainmenu a");
			let MainLogo = $("#Mainmenu h1 a img");
			let originalLogoUrl = "https://image.osulloc.com/kr/ko/static_cdj/images/main/logo_white.png";
			let hoverLogoUrl = "https://image.osulloc.com/kr/ko/static_cdj/images/main/logo_black.png";
			let hideMenu = $(".hideMenu");
			let hideList = $(".hideMenu ul");
			let left_menu = $(".left_box ul li a");

			hideMenu.hide();

			function showMainMenu() {
				Mainli.css("background", "white");
				MainA.css("color", "#333333");
			}

			function hideMainMenu() {
				Mainli.css("background", "white");
				MainA.css("color", "#333333");
			}

			Mainli.hover(function() {
				showMainMenu();
			}, function() {
				// 마우스가 hideMenu를 벗어나면 Mainmenu가 숨겨져 있을 때만 hideMainMenu실행
				if (!hideMenu.is(":visible")) {
					hideMainMenu();
				}
			});
			$(".left_box ul li a").hover(function() {
				// 마우스가 요소 위에 있을 때
				$(this).css("color", "green");
			}, function() {
				// 마우스가 요소를 벗어났을 때
				$(this).css("color", "white");
			});

			MainA.hover(function() {
				$(this).css("color", "green");
			}, function() {
				$(this).css("color", "#333333");
			});

			left_menu
					.eq(0)
					.hover(
							function() {
								hideMenu.slideDown();
								showMainMenu(); // hideMenu가 나타날 때 Mainmenu도 hover 상태로 유지
							},
							function() {
								// 마우스가 메인메뉴와 hideMenu를 벗어나면 숨김
								$(document)
										.on(
												"mouseover",
												function(e) {
													if (!hideMenu.is(e.target)
															&& hideMenu
																	.has(e.target).length === 0
															&& !Mainli
																	.is(e.target)
															&& Mainli
																	.has(e.target).length === 0) {
														hideMenu.slideUp();
														hideMainMenu();
													}
												});
							});

			$(window)
					.scroll(
							function() {
								//스크롤이 내려가면 스타일 바뀌
								let scroll = $(window).scrollTop();
								if (scroll >= 100) {
									Mainli.css("background", "white");
									MainA.css("color", "#333333");
									MainLogo.attr("src", hoverLogoUrl);
								}
								if (scroll < 100) {
									MainA.css("color", "white");
									Mainli
											.css("background",
													"linear-gradient(to bottom, rgba(0, 0, 0, 0.33), rgba(255, 255, 255, 0))");
									MainLogo.attr("src", originalLogoUrl);
								}
							});
		});

		$(function() {
			let burger_close_Btn = $("#smallMenu span");
			let burgerMenuBtn = $(".burgerBtn");
			let burgerMenu = $("#smallMenu");
			let body = $("body");

			burgerMenu.hide();

			// smallMenu 내부에서 스크롤이 가능하도록 설정
			burgerMenu.css("overflow-y", "auto");

			burgerMenuBtn.click(function(event) {
				event.stopPropagation();
				burgerMenu.show();
				body.css("overflow", "hidden"); // 배경 스크롤 비활성화
			});

			burger_close_Btn.click(function() {
				burgerMenu.hide();
				body.css("overflow", "auto"); // 배경 스크롤 다시 활성화
			});

			$(document).click(function() {
				burgerMenu.hide();
				body.css("overflow", "auto"); // 배경 스크롤 다시 활성화
			});
		});

		//footer 영역 토글 구현
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var toggleButton = document
									.getElementById("toggleFooter");
							var miniFooter = document
									.querySelector(".mini_footer");

							toggleButton
									.addEventListener(
											"click",
											function() {
												// 화면 너비가 1050px 이하일 때만 토글 기능이 작동합니다.
												if (window.innerWidth <= 1050) {
													miniFooter.style.display = miniFooter.style.display === "block" ? "none"
															: "block";
												}
											});

							// 화면 크기 변경에 따라 mini_footer의 표시 여부를 조정합니다.
							window.addEventListener("resize", function() {
								if (window.innerWidth > 1050) {
									miniFooter.style.display = "none";
								} else {
									// 화면이 1050px 이하로 변경될 때 기본적으로 숨깁니다.
									miniFooter.style.display = "none";
								}
							});
						});
	</script>
</body>
</html>
