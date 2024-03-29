<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.MemberDAO, dto.MemberDTO"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>수정설록</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
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
    body,
    html {
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
    }
    section,
    #Mainmenu {
      width: 100%;
      height: 100%;
      position: relative;
      /*		border: 3px solid orange;*/
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
      transition: background-color 0.5s;
    }

    #Mainmenu .left_box img {
      position: relative;
      top: 10px;
    }

  
    #Mainmenu li,
    #smallMenu .material-symbols-outlined {
      cursor: pointer;
    }

    .left_box ul li a,
    .right_box ul li a {

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
      width: 40%;
      height: 100%;
   /*    margin-left: 10px; */
/*       white-space: nowrap; */
    }

    .left_box ul li a:hover {
      color: green !important;
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
    .hideMenu ul li {
      cursor: pointer;
    }
    .hideMenu ul li:nth-child(1) {
      /*	font-weight: bold;*/
    }
    .hideMenu ul li:hover {
      color: green;
    }

    .hideMenu .hideMenu_img {
      position: relative;
      left: 72%;
      top: -230px;
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
    .burgerBtn {
      opacity: 0;
    }
    /*========================섹션1===================*/

    #sec1 {
      aspect-ratio: 16 / 6;
      width: 100%;
      height: auto;
    }
    #carousel {
      top: 0;
      width: 100%;
      height: 100%;
      position: relative;
      overflow: hidden;
    }

    .gallery li {
      list-style: none;
      position: absolute;
      width: 100%;
      height: 100%;
      opacity: 0;
      transition: opacity 0.5s ease-in-out;
    }

    .gallery li.active {
      opacity: 1;
    }

    .btn_set {
      position: absolute;
      bottom: 20px;
      left: 50%;
      transform: translateX(-50%);
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .btn_set li {
      /*        border: 1px solid red;*/
      display: inline-block;
      /*        margin: 0 5px;*/
      cursor: pointer;
      color: white;
      text-indent: -9999px;
      width: 80px;
      height: 2px;
      background-color: lightgray;
    }
    .btn_set li:hover {
      background-color: gray;
    }

    .btn_set li.active {
      background-color: darkgray;
      font-weight: bold;
    }

    #carousel ol.gallery li:nth-child(1) {
      background: url(https://image.osulloc.com/upload/kr/ko/adminImage/EF/EB/20231201151721763VW.jpg)
        no-repeat center;
      background-size: cover;
    }

    #carousel ol.gallery li:nth-child(2) {
      background: url(https://image.osulloc.com/upload/kr/ko/adminImage/YD/XC/20231201151450603ZE.jpg)
        no-repeat center;
      background-size: cover;
    }

    #carousel ol.gallery li:nth-child(3) {
      background: url(https://image.osulloc.com/upload/kr/ko/adminImage/JC/TT/20231128091934132HJ.jpg)
        no-repeat center;
      background-size: cover;
    }

    #carousel ol.gallery li:nth-child(4) {
      background: url(https://image.osulloc.com/upload/kr/ko/adminImage/RQ/WL/20231130132219288OE.jpg)
        no-repeat center;
      background-size: cover;
    }

    #carousel ol.gallery li:nth-child(5) {
      background: url(https://image.osulloc.com/upload/kr/ko/adminImage/WM/FB/20231012142912711BJ.jpg)
        no-repeat center;
      background-size: cover;
    }

    /*    ============================케로셀 버튼//문구================*/

    .btn_set button {
      background-color: #ffffff;
      background-color: rgba(255, 255, 255, 0.5);
      opacity: 0.5;
      border: none;
    }
    #carousel ol.gallery li div {
      /*  border: 1px solid red;*/
      position: relative;
      top: 200px;
      left: 20%;
      position: 100px;
    }
    #carousel ol.gallery li div h1 {
      margin-bottom: 10px;
      font-size: 2em;
    }
    #carousel ol.gallery li div p {
      margin-bottom: 20px;
    }
    #carousel ol.gallery li div span {
      font-weight: bold;
    }

    /*===================섹션2 메뉴*/
    /*#sec2{
	height: 600px;
}*/
    #sec2 {
      /*  border: 1px solid red;*/
      aspect-ratio: 16 / 8; /* 원하는 비율로 설정 */
      width: 70%; /* 가로길이는 부모 요소에 맞춤 */
      height: auto; /* 세로길이는 비율에 따라 자동 조정 */
      background-color: #fafafa;
      left: 15%;
      margin-top: 3%;
    }
    #sec2 h1 {
      font-size: 28px;
      font-weight: 700;
      color: #333333;
    }

    #sec2 img {
      width: 100%;
    }
    #sec2 li {
      cursor: pointer;
    }
    #sec2 li h2 {
      font-size: 1em;
      text-align: center;
    }
    #sec2 li p {
      margin-top: 20px;
      text-align: center;
    }

    #sec2 .swiper {
      /*  border: 1px solid red;*/
      position: relative;
      top: 50px;
      width: 95%;
      height: 80%;
    }

    .swiper-button-next,
    .swiper-button-prev {
      color: lightgray;
    }

    .moreBox {
      border: 1px solid lightgray;
      width: 150px;
      height: 40px;
      position: relative;
      left: 50%;
      margin-left: -75px;
      bottom: 10%;
      text-align: center;
      line-height: 40px;
      z-index: 999;
    }

    .moreBox a {
      color: gray;
      cursor: pointer;
    }

    /*===================섹션3 오늘만 이가격============================*/

    #sec3 {
      position: relative;
      width: 100%;
      height: 400px;
      display: flex;
      gap: 20px;
      flex-direction: row;
      align-content: center;
      justify-content: center;
      align-items: center;
    }

    #sec3 .onlyToday {
      position: relative;
      /*    border: 1px solid red;*/
      display: flex;
      flex-direction: column;
    }
    #sec3 .sec3_img1 {
      width: 1200px;
      height: 275px;
    }
    #sec3 .priceBox {
      position: absolute;
      display: flex;
      width: 50%;
      flex-direction: column;
      transform: translate(120%, 70%);
      margin-bottom: 30px;
    }

    #sec3 .priceBox2 {
      position: absolute;
      display: flex;
      width: 100%;
      top: 120px;
    }
    #sec3 .priceBox h3 {
      font-size: 2em;
      font-weight: 500;
      margin-bottom: 30px;
    }
    #sec3 .priceBox h4 {
      font-size: 1.5em;
      font-weight: 500;
    }
    #sec3 .priceBox2 .oriCost {
      color: gray;
      font-size: 0.8em;
      text-decoration: line-through;
      margin-right: 10px;
    }
    #sec3 .priceBox2 .disCost {
      font-size: 2em;
      font-weight: 500;
      line-height: 10px;
      margin-right: 40px;
    }
    #sec3 .priceBox2 .sale {
      position: relative;
      top: -30px;
      border: 1px solid red;
      border-radius: 50%;
      width: 74px;
      height: 74px;
      text-align: center;
      color: white;
      background-color: red;
      line-height: 74px;
      font-size: 30px;
      font-weight: bold;
    }

    #sec3 .sec3_img2 {
      display: none;
    }
    #sec3 .priceBox_mini {
      display: none;
    }

    /*========================섹션 4=========================*/

    #sec4 {
      height: 800px;
    }
    #sec4 {
      position: relative;
      aspect-ratio: 16 / 8; /* 원하는 비율로 설정 */
      width: 100%; /* 가로길이는 부모 요소에 맞춤 */
      height: auto; /* 세로길이는 비율에 따라 자동 조정 */
      background-color: #f2f2f2;
      display: flex;
      flex-direction: column;
      align-content: center;
      justify-content: center;
      align-items: center;
    }
    #sec4 h2,
    #sec4 p {
      position: relative;
      left: 0px;
      width: 1200px;
    }

    #sec4 .dada {
      /*    border: 1px solid blue;*/
      position: relative;
      width: 1200px;
      height: 570px;
      display: flex;
      justify-content: space-between;
      align-items: stretch;
    }
    #sec4 .dada1 img {
      width: 590px;
      height: 570px;
    }

    #sec4 .dada2 img {
      width: 590px;
      height: 275px;
    }
    #sec4 .dada3 img {
      width: 590px;
      height: 275px;
    }

    #sec4 .dada_right {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    #sec4 .hidedada {
      display: none;
    }
    #sec4 h2 {
      font-size: 1.8em;
    }
    #sec4 h2,
    p {
      margin-bottom: 20px;
    }

    #sec4 .hdadaText {
      position: relative;
      display: flex;
      flex-direction: column;
      /*    border: 1px solid red;*/
      width: 100%;
      height: 80%;
    }
    #sec4 .mySwiper2 .swiper-slide {
      flex-direction: column;
      text-align: left;
      line-height: 30px;
      font-weight: bold;
    }
    #sec4 .hdadaText .hdadaTag {
      background-color: darkgreen;
      color: white;
      width: 90px;
      text-align: center;
      border-radius: 10%;
    }

    /*=========================#sec5=========================*/

    #sec5 {
      position: relative;
      width: 100%;
      height: 400px;
      display: flex;
      gap: 20px;
      flex-direction: row;
      align-content: center;
      justify-content: center;
      align-items: center;
    }
    #sec5 div {
      position: relative;
      /*    border: 1px solid red;*/
      display: flex;
      flex-direction: column;
    }
    #sec5 img {
      width: 580px;
      height: 280px;
    }
    #sec5 .ltext,
    #sec5 .rtext {
      position: absolute;
      top: 50%;
      transform: translate(40%, -50%);
      display: flex;
      flex-direction: column;
      font-size: 1.5em;
      line-height: 10px;
      font-weight: 500;
    }
    #sec5 .ltext p:nth-child(2) {
      font-size: 0.7em;
    }
    #sec5 .rtext p {
      color: white;
    }
    #sec5 .rtext p:nth-child(1) {
      color: lightgray;
      font-size: 0.7em;
    }

    /*================================섹션 6===================*/
    #sec6 {
      width: 100%;
      height: auto;
      justify-content: center;
      align-items: center;
      display: flex;
    }
    #sec6 .dadaRecord {
      position: relative;
      /*	top: 50px;*/
      width: 1200px;
      height: 100%;
    }
    .dada_title h2 {
      font-size: 28px;
      /*	font-weight: 500;*/
      margin: 10px 0 10px 0;
    }

    .dada_title p {
      color: gray;
      font-size: 16px;
    }

    #sec6 .dadaRecord_img1 {
      position: relative;
      width: 100%;
      /*	max-height: 400px*/
    }
    #sec6 .dadaRecord_img1,
    #sec6 .dadaRecord_img2 {
      cursor: pointer;
    }
    #sec6 .dadaRecord_img2 {
      display: none;
    }
    #sec6 .dadaRecord_img_text p {
      position: relative;
      top: -230px;
      left: 80px;
      color: white;
      width: 200px;
    }

    #sec6 .dadaRecord_img p:nth-child(1) {
      font-size: 1.2em;
    }
    #sec6 .dadaRecord_img p:nth-child(2) {
      font-size: 2em;
    }

    /*===============================섹션 7=====================*/
    #sec7 {
      aspect-ratio: 16 / 5; /* 원하는 비율로 설정 */
      width: 100%; /* 가로길이는 부모 요소에 맞춤 */
      height: auto; /* 세로길이는 비율에 따라 자동 조정 */
    }
    #sec7 .dada_title {
      position: relative;
      left: 18%;
      width: 50%;
    }
    #sec7 .swiper {
      width: 64%;
      height: auto;
      padding-top: 50px;
      padding-bottom: 50px;
    }

    #sec7 .swiper-slide {
      background-position: center;
      background-size: cover;
      width: 400px;
      height: 400px;
      min-width: 300px;
    }

    #sec7 .swiper-slide img {
      display: block;
      aspect-ratio: 5 / 5; /* 원하는 비율로 설정 */
      width: 100%; /* 가로길이는 부모 요소에 맞춤 */
      height: auto; /* 세로길이는 비율에 따라 자동 조정 */
      min-width: 300px;
    }

    #sec7 .swiper_txt {
      color: white;
      position: absolute;
      transform: translate(10%, -150%);
    }
    #sec7 .swiper_txt h2 {
      color: white;
      font-weight: 500;
      font-size: 30px;
    }
    #sec7 .swiper_txt p {
      color: white;
      font-weight: 500;
      margin-top: 20px;
      font-size: 14px;
    }
    #sec8 {
      position: relative;
      width: 100%;
      height: 400px;
      display: flex;
      gap: 20px;
      flex-direction: row;
      align-content: center;
      justify-content: center;
      align-items: center;
      margin-top: 100px;
    }

    #sec8 .group {
      position: relative;
      /*    border: 1px solid red;*/
      display: flex;
      flex-direction: column;
    }
    #sec8 .img1 {
      width: 1200px;
      height: 275px;
    }
    #sec8 .img2 {
      display: none;
    }

    #sec8 .groupTxt h2 {
      /*	font-weight: 500;*/
      font-size: 1.8em;
    }
    #sec8 .groupTxt p {
      font-size: 1.2em;
      color: gray;
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
    #sec9 .footer_login p,
    #sec9 .footer_login img {
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
    #sec9 .footer_top_info_left,
    #sec9 .footer_top_info_right {
      width: 50%;
      height: 100%;
      display: flex;
      flex-direction: column;
      align-content: flex-start;
      justify-content: center;
      align-items: flex-start;
      line-height: 12px;
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
    #sec9 .footer_btm .footer_btmtxt2,
    #sec9 .footer_btm .footer_btmtxt3 {
      font-size: 12px;
      color: #a0a0a0;
    }

    #sec9 .mini_footer,
    #sec9 .footer_tgBox {
      display: none;
    }

    /*==================미디어 쿼리==================================
====================미디어 쿼리==================================
====================미디어 쿼리==================================*/

    @media screen and (max-width: 1280px) {
      .left_box ul,
      #login {
        display: none;
      }
    }

    @media screen and (max-width: 1050px) {
      .burgerBtn {
        opacity: 1;
      }

      #sec1 {
        height: 100%;
      }

      #carousel ol.gallery li:nth-child(1) {
        background: url(https://image.osulloc.com/upload/kr/ko/adminImage/LR/LC/20231201151724697AQ.jpg)
          no-repeat center;
        background-size: cover;
      }

      #carousel ol.gallery li:nth-child(2) {
        background: url(https://image.osulloc.com/upload/kr/ko/adminImage/VO/TD/20231201151453625OS.jpg)
          no-repeat center;
        background-size: cover;
      }

      #carousel ol.gallery li:nth-child(3) {
        background: url(https://image.osulloc.com/upload/kr/ko/adminImage/RQ/PR/20231128091937447KQ.jpg)
          no-repeat center;
        background-size: cover;
      }

      #carousel ol.gallery li:nth-child(4) {
        background: url(https://image.osulloc.com/upload/kr/ko/adminImage/WD/YI/20231130132221730QZ.jpg)
          no-repeat center;
        background-size: cover;
      }

      #carousel ol.gallery li:nth-child(5) {
        background: url(https://image.osulloc.com/upload/kr/ko/adminImage/EL/TW/20231012142918597SA.jpg)
          no-repeat center;
        background-size: cover;
      }

      #carousel ol.gallery li div {
        top: 550px;
        /*      border: 1px solid red;*/
        font-size: 0.8em;
        left: 20px;
      }
      .btn_set {
        width: 80%;
      }

      #sec2 {
        width: 100%;
        left: 0;
        height: 90%;
        margin-bottom: 0;
      }
      #sec2 .swiper {
        width: 100%;
        left: 0;
      }
      #sec2 h1 {
        font-size: 1.5em;
        text-align: center;
      }

      .swiper-button-next,
      .swiper-button-prev {
        font-size: 0.5em;
      }

      .moreBox {
        width: 90%;
        margin-left: 0;
        left: 5%;
        bottom: 10%;
      }
      /*=============================섹션3*/

      #sec3 {
        width: 100%;
        height: auto;
      }
      /*#sec5 .sec5_left, #sec5 .sec5_right{
 max-width: 100%; 
}*/

      #sec3 .onlyToday {
        width: 100%;
        height: auto;
      }

      #sec3 .sec3_img1,
      #sec3 .priceBox {
        display: none;
      }
      #sec3 .onlyToday,
      #sec3 .onlyToday a {
        width: 100%;
        height: 100%;
      }
      #sec3 .sec3_img2 {
        display: block;
        width: 100%;
        height: auto;
      }
      #sec3 .priceBox_mini {
        /*	border: 1px solid red;*/
        display: flex;
        position: relative;
        width: 100%;
        top: -150px;
        flex-direction: column;
        margin-left: 10px;
      }

      #sec3 .priceBox_mini h3 {
        position: relative;
        top: -30px;
      }
      #sec3 .priceBox_mini h4 {
        font-size: 1.5em;
        margin-bottom: 5px;
      }
      #sec3 .priceBox_mini2 {
        display: flex;
        margin-top: 5px;
      }
      #sec3 .priceBox_mini2 > div {
        margin-right: 10px;
      }
      #sec3 .priceBox_mini2 .oriCost {
        color: gray;
        font-size: 0.8em;
        text-decoration: line-through;
        margin-right: 10px;
      }
      #sec3 .priceBox_mini2 .disCost {
        font-size: 1em;
        font-weight: 500;
        line-height: 10px;
        margin-right: 40px;
      }
      #sec3 .priceBox_mini2 .sale {
        position: relative;
        top: -10px;
        left: -30px;
        border: 1px solid red;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        text-align: center;
        color: white;
        background-color: red;
        line-height: 50px;
        font-size: 20px;
        font-weight: bold;
      }

      #sec4 {
        background-color: white;
        align-items: flex-start;
      }
      #sec4 h2,
      #sec4 p {
        position: relative;
        width: 50%;
        margin-left: 5%;
        left: 0;
      }
      #sec4 > p {
        font-size: 2.5vw;
      }
      #sec4 .dada {
        display: none;
        top: 0;
      }

      #sec4 .hidedada {
        display: block;
        top: 0;
      }
      .swiper {
        width: 100%;
        height: auto;
      }

      .mySwiper2 .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        left: 30px;
      }

      .mySwiper2 .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .mySwiper2 .swiper-slide {
        width: 80%;
      }

      .mySwiper2 .swiper-slide:nth-child(2n) {
        width: 80%;
      }

      .mySwiper2 .swiper-slide:nth-child(3n) {
        width: 80%;
      }

      #sec5 {
        display: block;
        width: 100%;
        height: auto;
        margin-top: 100px;
      }
      #sec5 img {
        width: 100%;
        /*    height: auto;*/
        /*    min-width: 100%;*/
      }
      #sec5 .sec5_left,
      #sec5 .sec5_right {
        max-width: 100%;
      }
      #sec5 img {
        width: 100%; /* 이미지 너비를 컨테이너의 100%로 조정 */
        height: auto; /* 비율 유지 */
      }
      /*========================섹션 6================*/

      #sec6 {
        width: 100%;
        height: auto;
        margin-top: 5%;
      }

      #sec6 .dadaRecord {
        top: 5%;
      }
      #sec6 .dada_title {
        position: relative;
        left: 5%;
        width: 50%;
      }
      #sec6 .dada_title h2 {
        font-size: 28px;
      }
      #sec6 .dada_title p {
        font-size: 19px;
      }
      #sec6 .dadaRecord_img1 {
        display: none;
        width: 1px;
      }
      #sec6 .dadaRecord_img {
        width: 100%;
      }
      #sec6 .dadaRecord_img2 {
        display: block;
        position: relative;
        width: 100%;
        margin: 0;
      }
      #sec7,
      #sec8 {
        top: 0;
      }
      #sec7 .swiper {
        width: 100%;
      }
      #sec7 .dada_title {
        position: relative;
        left: 5%;
      }
      #sec7 .swiper-slide {
        width: 300px;
        height: 300px;
      }
      .sec7_slide {
        width: 100%;
        margin-left: auto;
        margin-right: 1%;
      }
      #sec7 .swiper-slide,
      #sec7 .swiper-slide-visible,
      #sec7 .swiper-slide-active {
        margin: 0;
      }

      #sec8 {
        height: 1000px;
        height: auto;
      }

      #sec8 .group {
        width: 100%;
        height: auto;
      }
      #sec8 .groupTxt {
        margin-left: 5%;
        width: 80%;
      }
      #sec8 .img1 {
        display: none;
      }
      #sec8 .img2 {
        position: relative;
        display: inline-block;
        width: 100%;
        height: auto;
      }

      /*	===============#sec9==========*/
      /*#sec9{
	position: relative;
	top: -100px;
}*/
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

      #sec9 .footer_login,
      #sec9 .footer_top_icon,
      #sec9 .footer_btm {
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
            <a href="#"
              ><img
                src="https://image.osulloc.com/kr/ko/static_cdj/images/main/logo_black.png"
                alt=""
            /></a>
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
          <ul>
            <li>
              <a href="#">
                <span class="material-symbols-outlined"> search </span></a
              >
            </li>
            <li>
              <a href="#">
                <span class="material-symbols-outlined"> shopping_cart </span>
              </a>
            </li>
            <li class="burgerBtn">
              <span class="material-symbols-outlined"> menu </span>
            </li>
          </ul>
          <ul id="login">
          <c:choose>
    <c:when test="${not empty sessionScope.memberId}">
        <li>${sessionScope.memberId}님  <br>로그인중</li>
        <li><a href="../member/updateMember.jsp">정보수정</a></li>
        <li><a href="../member/logoutMember.jsp">로그아웃</a></li>
    </c:when>
    <c:otherwise>
        <li><a href="../member/loginMember.jsp">로그인</a></li>
        <li><a href="../member/addMember.jsp">회원가입</a></li>
    </c:otherwise>
</c:choose>
        </ul>
        </div>
      </header>
      <div class="hideMenu">
        <ul>
          <a href="subpage1.html"><li>위클리베스트(subpage1연결)</li></a>
          <a href="subpage2.html"><li>베스트((subpage2연결))</li></a>
        </ul>
        <ul>
          <li><a class="nav-link"
				href='<c:url value="/BoardListAction.do?PageNum=1"/>'>게시판</a></li>
          <li>티 세트</li>
          <li>명차</li>
          <li>녹차/말차</li>
          <li>발효차/홍차</li>
          <li>블렌디드티</li>
          <li>허브티</li>
          <li>밀크티/아이스티</li>
          <li>콤부차</li>
        </ul>
        <ul>
          <li>티푸드</li>
          <li>과자/초콜릿</li>
          <li>베이커리</li>
          <li>아이스크림</li>
        </ul>
        <ul>
          <li>티웨어</li>
          <li>용도별</li>
          <li>브랜드별</li>
        </ul>
        <ul>
          <li>라이프스타일</li>
          <li>스킨케어</li>
          <li>단체 및 기업 구매</li>
        </ul>
        <div class="hideMenu_img">
          <img
            src="https://image.osulloc.com/upload/kr/ko/adminImage/CG/WL/20231130172838557BP.jpg"
            width="330px"
            height="370px"
            alt=""
          />
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
        <img
          src="https://image.osulloc.com/upload/kr/ko/adminImage/CG/WL/20231130172838557BP.jpg"
          alt=""
        />
        <div>
          <div><a href="loginpage.html">로그인</a></div>
          <div><a href="NewMember.html">회원가입</a></div>
        </div>
      </div>

      <section id="sec1">
        <!-- 메인 케로셀 -->
        <div id="carousel">
          <ol class="gallery">
            <li class="active">
              <div>
                <h1>오설록x경성크리처<br />현장이벤트 초대권 증정</h1>
                <p>
                  넷플릭스 시리즈 <경성크리처>와 오설록의 만남!<br />
                  콜라보 기념 배우들과 함께하는 현장 이벤트 초대권을 드립니다.
                </p>
                <span></span>
              </div>
            </li>
            <li>
              <div>
                <h1>
                  홀리데이 팁 파티를 위한<br />
                  얼그레이&블랙티 런칭
                </h1>
                <p>
                  런칭 기념 최대 할인과 선착순 사운품 증정!<br />
                  오설록의 새로운 홍차 라인과 함께 연말 티 파티를 즐겨보세요
                </p>
                <span>12.04 - 12.20</span>
              </div>
            </li>
            <li>
              <div>
                <h1>새해를 기다리는 12월 <br />선물상자 챌린지</h1>
                <p>
                  매일매일 하나식 오설록 선물 받기!! <br />
                  더 특별해진 올해의 마지막 출석체크에 참여해 보세요.
                </p>
                <span>12.01 - 12.31</span>
              </div>
            </li>
            <li>
              <div>
                <h1>2023 OSULLOC <br />TEA AWARDS</h1>
                <p>
                  올 한해 오설록을 빛낸 베스트셀러를 <br />
                  최대20%할인과 함께 소개합니다.
                </p>
                <span>12.01 - 12.20</span>
              </div>
            </li>
            <li>
              <div>
                <h1>오설록몰 첫 구매시 <br />뷰티포인트 3천점 적립</h1>
                <p>
                  첫 구매하고 적립 신청하면 <br />뷰티포인트 3,000,점을 드려요.
                </p>
                <span>10.23 - 12.31</span>
              </div>
            </li>
          </ol>
          <ol class="btn_set">
            <li class="active" onclick="changeImage(0)">1</li>
            <li onclick="changeImage(1)">2</li>
            <li onclick="changeImage(2)">3</li>
            <li onclick="changeImage(3)">4</li>
            <li onclick="changeImage(4)">5</li>
            <button onclick="togglePlayPause()">
              <span class="material-symbols-outlined"> play_pause </span>
            </button>
          </ol>
        </div>
      </section>
      <section id="sec2">
        <h1>오늘은 어떤 차를 마셔볼까요?</h1>
        <div class="swiper mySwiper1">
          <ul class="swiper-wrapper">
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/HF/US/20231108164808269EP.png"
                alt=""
              />
              <h2>
                티타임 포 캠퍼&티탄 싱글 <br />
                머그 300
              </h2>
              <p>53,300</p>
            </li>
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/DV/IV/20231005161250272CR.png"
                alt=""
              />
              <h2>귤꽃향을 품은 우잣담 20입</h2>
              <p>25,000원</p>
            </li>
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/HP/UB/20231113130954597FS.png"
                alt=""
              />
              <h2>귤꽃향 블라썸 티</h2>
              <p>9,500원</p>
            </li>
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/IY/HQ/20231128115515640XU.png"
                alt=""
              />
              <h2>스윗 허니 블랙티</h2>
              <p>8,550원</p>
            </li>
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/XY/UY/20231128131807987AG.png"
                alt=""
              />
              <h2>시그니처 얼그레이 20입</h2>
              <p>20,000원</p>
            </li>
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/OQ/AL/20231129145755197LR.png"
                alt=""
              />
              <h2>
                [홀리데이 한정] <br />
                제주 말차 슈톨렌
              </h2>
              <p>32,000</p>
            </li>
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/OA/EO/20200707155646390AC.png"
                alt=""
              />
              <h2>세작 20입</h2>
              <p>22,400원</p>
            </li>
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/SC/TR/20231117152945375XR.png"
                alt=""
              />
              <h2>2023 어드벤트 캘린더</h2>
              <p>51,000원</p>
            </li>
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/MB/PC/20230518093624132CX.png"
                alt=""
              />
              <h2>삼다 꿀배 티</h2>
              <p>9,500원</p>
            </li>
            <li class="swiper-slide">
              <img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/JY/QU/20210825170710069ZN.png"
                alt=""
              />
              <h2>시크릿 티 스토리</h2>
              <p>47,000원</p>
            </li>
          </ul>

          <div class="swiper-pagination"></div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="moreBox"><a href="subpage1.html">더보기></a></div>
      </section>
      <section id="sec3">
        <div class="onlyToday">
          <a href="#">
            <img
              class="sec3_img1"
              src="https://image.osulloc.com/upload/kr/ko/adminImage/FX/ID/20231206131939106DH.jpg"
              alt=""
            />
            <img
              class="sec3_img2"
              src="https://image.osulloc.com/upload/kr/ko/adminImage/UB/FC/20231206131944774GC.jpg"
              alt=""
            />
          </a>
          <div class="priceBox">
            <h3>오늘만 이 가격</h3>
            <h4>메모리 인 제주 20입</h4>
            <div class="priceBox2">
              <div class="oriCost">38,000원</div>
              <div class="disCost">30,400원</div>
              <div class="sale">20%</div>
            </div>
          </div>
          <div class="priceBox_mini">
            <h3>오늘만 이 가격</h3>
            <h4>메모리 인 제주 20입</h4>
            <div class="priceBox_mini2">
              <div class="oriCost">38,000원</div>
              <div class="disCost">30,400원</div>
              <div class="sale">20%</div>
            </div>
          </div>
        </div>
      </section>
      <section id="sec4">
        <h2>다다일상 구독</h2>
        <p>다채로운 차 향기로 더욱 풍요로워지는 티 라이프를 만보세요.</p>
        <div class="dada">
          <div class="dada1">
            <a href="subpage4.html"
              ><img
                src="https://image.osulloc.com/upload/kr/ko/adminImage/RZ/SU/20231130154942155FU.jpg"
                alt=""
            /></a>
          </div>
          <div class="dada_right">
            <div class="dada2">
              <a href="subpage4.html"
                ><img
                  src="https://image.osulloc.com/kr/ko/static_cdj/images/dada_renew/dadaLightPc_1.jpg"
                  alt=""
              /></a>
            </div>
            <div class="dada3">
              <a href="subpage4.html"
                ><img
                  src="https://image.osulloc.com/kr/ko/static_cdj/images/dada_renew/dadaDeliPc_1.jpg"
                  alt=""
              /></a>
            </div>
          </div>
        </div>
        <div class="hidedada">
          <div class="swiper mySwiper2">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <a href="subpage4.html"
                  ><img
                    src="https://image.osulloc.com/upload/kr/ko/adminImage/UX/UB/20231130154948805CR.jpg"
                    alt=""
                /></a>
                <div class="hdadaText">
                  <span class="hdadaTitle">12월의 다다일상</span>
                  <span hdadaPrice>매월 24,900원</span>
                  <span class="hdadaTag">무료배송</span>
                </div>
              </div>
              <div class="swiper-slide">
                <a href="subpage4.html"
                  ><img
                    src="https://image.osulloc.com/kr/ko/static_cdj/images/dada_renew/dadaLightMo.jpg"
                    alt=""
                /></a>
                <div class="hdadaText">
                  <span class="hdadaTitle">다다일상 라이트</span>
                  <span hdadaPrice>매월 13,900원</span>
                  <span class="hdadaTag">무료배송</span>
                </div>
              </div>
              <div class="swiper-slide">
                <a href="subpage4.html"
                  ><img
                    src="https://image.osulloc.com/kr/ko/static_cdj/images/dada_renew/dadaDeliMo.jpg"
                    alt=""
                /></a>
                <div class="hdadaText">
                  <span class="hdadaTitle">정기배송</span>
                  <!-- <span hdadaPrice></span> -->
                  <span class="hdadaTag">무료배송</span>
                </div>
              </div>
            </div>
            <div class="swiper-pagination2"></div>
          </div>
        </div>
      </section>
      <section id="sec5">
        <div class="sec5_left">
          <a href="subpage3.html"
            ><img
              src="https://image.osulloc.com/upload/kr/ko/adminImage/LD/UQ/20231130154734732OV.jpg"
              alt=""
          /></a>
          <div class="ltext">
            <p>12월 출석체크</p>
            <p>12.01 - 12.31</p>
          </div>
        </div>
        <div class="sec5_right">
          <a href="subpage3.html"
            ><img
              src="https://image.osulloc.com/kr/ko/static_cdj/images/main/brand_story_img.jpg"
              alt=""
          /></a>
          <div class="rtext">
            <p>TEA FROM JEJU</p>
            <p>오설록 스토리</p>
          </div>
        </div>
      </section>
      <section id="sec6">
        <div class="dadaRecord">
          <div class="dada_title">
            <h2>다다일상 기록</h2>
            <p>
              차와 함께하는 삶, 각자의 취향이 묻어있는<br />
              레시피와 인터뷰를 만나보세요.
            </p>
          </div>
          <div class="dadaRecord_img">
            <img
              src="https://image.osulloc.com/kr/ko/static_cdj/others/image/stdd/osl_stdd_main/osl_main_dd_pc.jpg"
              class="dadaRecord_img1"
            />

            <img
              src="https://image.osulloc.com/kr/ko/static_cdj/others/image/stdd/osl_stdd_main/osl_main_dd_mo.jpg"
              class="dadaRecord_img2"
            />
            <div class="dadaRecord_img_text">
              <p>다다일상 기록</p>
              <p>레시피·취향관</p>
            </div>
          </div>
        </div>
      </section>
      <section id="sec7">
        <div class="dada_title">
          <h2>매장소개</h2>
          <p>오프라인 매장에서 다채로운 오설록을 경험하세요.</p>
        </div>

        <div class="sec7_slide">
          <!-- Swiper -->
          <div class="swiper mySwiper3">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <a href="#"
                  ><img
                    src="https://image.osulloc.com/kr/ko/static_cdj/others/image/stdd/osl_stdd_main/main_th_jeju.webp"
                  />
                </a>
                <div class="swiper_txt">
                  <h2>
                    제주오설록 <br />
                    티뮤지엄
                  </h2>
                  <p>
                    차의 역사와 문화를 체험할 수 있는 <br />
                    국내 최대 차 종합 전시관
                  </p>
                </div>
              </div>
              <div class="swiper-slide">
                <a href="#"
                  ><img
                    src="https://image.osulloc.com/kr/ko/static_cdj/others/image/stdd/osl_stdd_main/main_th_bukchon.webp"
                  />
                </a>
                <div class="swiper_txt">
                  <h2>
                    제주오설록 <br />
                    티하우스 북촌점
                  </h2>
                  <p>
                    차를 통해 새로운 감각과 취향을 <br />
                    보여주는 가치변화의 공간
                  </p>
                </div>
              </div>
              <div class="swiper-slide">
                <a href="#"
                  ><img
                    src="https://image.osulloc.com/kr/ko/static_cdj/others/image/stdd/osl_stdd_main/main_th_hannam.webp"
                  />
                </a>
                <div class="swiper_txt">
                  <h2>
                    오설록 <br />
                    티하우스 한남점
                  </h2>
                  <p>
                    브랜드의 격을 한 단계 끌어올린 <br />
                    오설록의 프리미엄 티
                  </p>
                </div>
              </div>
              <div class="swiper-slide">
                <a href="#"
                  ><img
                    src="https://image.osulloc.com/kr/ko/static_cdj/others/image/stdd/osl_stdd_main/main_th_mmca.webp"
                  />
                </a>
                <div class="swiper_txt">
                  <h2>
                    오설록 <br />
                    티하우스MMCA
                  </h2>
                  <p>문화 예술을 함께하는 파문화의 발견,<br />티하우스MMCA</p>
                </div>
              </div>
              <div class="swiper-slide">
                <a href="#"
                  ><img
                    src="https://image.osulloc.com/kr/ko/static_cdj/others/image/stdd/osl_stdd_main/main_th_yongsan.webp"
                  />
                </a>
                <div class="swiper_txt">
                  <h2>
                    오설록티하우스 <br />
                    용산파크점
                  </h2>
                  <p>캐주얼하면서도 차에대한 <br />전문성을 담은 세련된 공간</p>
                </div>
              </div>
              <div class="swiper-slide">
                <a href="#"
                  ><img
                    src="https://image.osulloc.com/kr/ko/static_cdj/others/image/stdd/osl_stdd_main/main_th_1979.webp"
                  />
                </a>
                <div class="swiper_txt">
                  <h2>
                    오설록 <br />
                    1979
                  </h2>
                  <p>
                    브랜드의 격을 한 단계 끌어올린 <br />
                    오설록의 프리미엄 티
                  </p>
                </div>
              </div>
              <div class="swiper-slide">
                <a href="#"
                  ><img
                    src="https://image.osulloc.com/kr/ko/static_cdj/others/image/stdd/osl_stdd_main/main_th_haeundae.webp"
                  />
                </a>
                <div class="swiper_txt">
                  <h2>
                    오설록 티하우스 <br />
                    해운대점
                  </h2>
                  <p>
                    일상에서 벗어나 차의 본질에 집중하며<br />
                    온전한 휴식을 완성하는 공간
                  </p>
                </div>
              </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </section>
      <section id="sec8">
        <div class="group">
          <div class="groupTxt">
            <h2>단체 및 기업 구매</h2>
            <p>대량구매 전용 서비와 프로모션 만나보세요</p>
          </div>
          <img
            class="img1"
            src="https://image.osulloc.com/kr/ko/static_cdj/images/main/b2b_banner.jpg"
            alt=""
          />
          <img
            class="img2"
            src="https://image.osulloc.com/kr/ko/static_cdj/images/main/b2b_banner_m.jpg"
            alt=""
          />
        </div>
      </section>
      <section id="sec9">
        <div class="footer_tgBox">
          <div>오설록 사업자 정보확인</div>
          <button id="toggleFooter">>Click!<</button>
        </div>
        <div class="mini_footer">
          <div class="hide_footer_txt">
            <p>
              ㈜ 오설록<br />
              대표이사 : 서혁제<br />
              주소 : 서울 특별시 용산구 한강대로 100 (한강로2가)<br />
              사업자 등록번호 : 390-87-01499<br />
              통신판매업신고번호 : 2019-서울용산-1173호<br />
              호스팅제공자 : ㈜오설록<br />
              <br />
              (주)오설록은 오설록 브랜드를 제외한 입점 브랜드에 대해서는 <br />
              통신판매중개자 이며 통신판매의 당사자가 아닙니다.<br />
              따라서 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지
              않습니다.<br />
              <br />
              NHN KCP 구매안전(에스크로)서비스<br />
              고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에
              가입한<br />
              NHN KCP의 구매안전서비스를 이용하실 수 있습니다.
            </p>
          </div>
          <hr />
          <p class="footer_btmtxt1">
            회사소개 | 서비스이용약관 | 개인정보 처리방침 | 영상정보 처리방침 |
            뷰티포인트 | 임직원할인 | 사이트맵 | 전자공고
          </p>
        </div>

        <div class="footer_login">
          <div class="footer_login_box">
            <p>로그인</p>
            <img
              src="https://image.osulloc.com/kr/ko/static_cdj/images/sns/sns_t.png"
              alt=""
            />
            <img
              src="https://image.osulloc.com/kr/ko/static_cdj/images/sns/sns_y.png"
              alt=""
            />
            <img
              src="https://image.osulloc.com/kr/ko/static_renew/images/sns_i.png"
              alt=""
            />
          </div>
        </div>
        <div class="footer_top">
          <div class="footer_top_info">
            <div class="footer_top_info_left">
              <p class="footer_top_info_left_title">
                고객상담센터 · 주문/배송문의
              </p>
              <p class="footer_top_info_left_email">help@osulloc.com</p>
              <p class="footer_top_info_left_tell">080-805-5555</p>
              <p class="footer_top_info_left_time">
                평일 09:30 - 17:00 (점심 11:30 - 13:00)
              </p>
            </div>
            <div class="footer_top_info_right">
              <p class="footer_top_info_right_title">특판, 대량구매 문의</p>
              <p class="footer_top_info_right_email">mall@osulloc.com</p>
              <p class="footer_top_info_right_kakao">
                카카오톡ID : osullocmall
              </p>
              <p class="footer_top_info_right_time">
                평일 09:30 - 17:00 (점심 11:30 - 13:00)
              </p>
            </div>
          </div>
          <div class="footer_top_icon">
            <div>
              <img
                src="https://image.osulloc.com/kr/ko/static_renew/images/f1.png"
                alt=""
              />
              매장안내
            </div>
            <div>
              <img
                src="https://image.osulloc.com/kr/ko/static_renew/images/f2.png"
                alt=""
              />
              멤버십혜택
            </div>
            <div>
              <img
                src="https://image.osulloc.com/kr/ko/static_renew/images/f5.png"
                alt=""
              />
              단체 및<br />기업구매
            </div>
            <div>
              <img
                src="https://image.osulloc.com/kr/ko/static_renew/images/f4.png"
                alt=""
              />
              1:1문의
            </div>
            <div>
              <img
                src="https://image.osulloc.com/kr/ko/static_renew/images/beauti.png"
                alt=""
              />
              뷰티포인트 <br />추후적립
            </div>
          </div>
        </div>
        <div class="footer_btm">
          <a href="#">
            <img
              class="footer_btm_img1"
              src="https://image.osulloc.com/kr/ko/static_renew/images/logo_f.png"
              alt=""
            />
          </a>
          <div>
            <p class="footer_btmtxt1">
              회사소개 | 서비스이용약관 | 개인정보 처리방침 | 영상정보 처리방침
              | 뷰티포인트 | 임직원할인 | 사이트맵 | 전자공고
            </p>
            <p class="footer_btmtxt2">
              ㈜ 오설록<br />
              대표이사:서혁제 주소:서울특별시 용산구 한강대로 100 (한강로2가)
              사업자등록번호: 390-87-01499 <br />
              통신판매업신고번호:2019-서울용산-1173호 호스팅제공자: ㈜오설록
            </p>
            <p class="footer_btmtxt3">
              주)오설록은 오설록 브랜드를 제외한 입점 브랜드에 대해서는
              통신판매중개자 이며 통신판매의 당사자가 아닙니다. <br />따라서
              입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.
            </p>
          </div>
          <img class="footer_btm_img2" src="img/footerLogo.png" alt="" />
        </div>
      </section>
    </div>
    <script>
    // ================메인메뉴 스크립트====================
    $(function () {
      let Mainli = $("#Mainmenu");
      let MainA = $("#Mainmenu a");
      let MainLogo = $("#Mainmenu h1 a img");
      let originalLogoUrl =
        "https://image.osulloc.com/kr/ko/static_cdj/images/main/logo_white.png";
      let hoverLogoUrl =
        "https://image.osulloc.com/kr/ko/static_cdj/images/main/logo_black.png";
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

      Mainli.hover(
        function () {
          showMainMenu();
        },
        function () {
          // 마우스가 hideMenu를 벗어나면 Mainmenu가 숨겨져 있을 때만 hideMainMenu실행
          if (!hideMenu.is(":visible")) {
            hideMainMenu();
          }
        }
      );
      $(".left_box ul li a").hover(
        function () {
          // 마우스가 요소 위에 있을 때
          $(this).css("color", "green");
        },
        function () {
          // 마우스가 요소를 벗어났을 때
          $(this).css("color", "white");
        }
      );

      MainA.hover(
        function () {
          $(this).css("color", "green");
        },
        function () {
          $(this).css("color", "#333333");
        }
      );

      left_menu.eq(0).hover(
        function () {
          hideMenu.slideDown();
          showMainMenu(); // hideMenu가 나타날 때 Mainmenu도 hover 상태로 유지
        },
        function () {
          // 마우스가 메인메뉴와 hideMenu를 벗어나면 숨김
          $(document).on("mouseover", function (e) {
            if (
              !hideMenu.is(e.target) &&
              hideMenu.has(e.target).length === 0 &&
              !Mainli.is(e.target) &&
              Mainli.has(e.target).length === 0
            ) {
              hideMenu.slideUp();
              hideMainMenu();
            }
          });
        }
      );

      // $(window).scroll(function () {
      //   //스크롤이 내려가면 스타일 바뀌
      //   let scroll = $(window).scrollTop();
      //   if (scroll >= 100) {
      //     Mainli.css("background", "white");
      //     MainA.css("color", "#333333");
      //     MainLogo.attr("src", hoverLogoUrl);
      //   }
      //   if (scroll < 100) {
      //     MainA.css("color", "white");
      //     Mainli.css(
      //       "background",
      //       "linear-gradient(to bottom, rgba(0, 0, 0, 0.33), rgba(255, 255, 255, 0))"
      //     );
      //     MainLogo.attr("src", originalLogoUrl);
      //   }
      // });
    });

      // ======================버거메뉴=========================

      $(function () {
        let burger_close_Btn = $("#smallMenu span");
        let burgerMenuBtn = $(".burgerBtn");
        let burgerMenu = $("#smallMenu");
        let body = $("body");

        burgerMenu.hide();

        // smallMenu 내부에서 스크롤이 가능하도록 설정
        burgerMenu.css("overflow-y", "auto");

        burgerMenuBtn.click(function (event) {
          event.stopPropagation();
          burgerMenu.show();
          body.css("overflow", "hidden"); // 배경 스크롤 비활성화
        });

        burger_close_Btn.click(function () {
          burgerMenu.hide();
          body.css("overflow", "auto"); // 배경 스크롤 다시 활성화
        });

        $(document).click(function () {
          burgerMenu.hide();
          body.css("overflow", "auto"); // 배경 스크롤 다시 활성화
        });
      });

      //==============================섹션 1 캐로셀-==========================
      let currentIndex = 0;
      let isPlaying = true;
      const intervalTime = 5000;

      function changeImage(index) {
        currentIndex = index;
        showImage();
      }

      function showImage() {
        const images = document.querySelectorAll(".gallery li");
        const buttons = document.querySelectorAll(".btn_set li");

        images.forEach((image, index) => {
          image.classList.remove("active");
          buttons[index].classList.remove("active");
        });

        images[currentIndex].classList.add("active");
        buttons[currentIndex].classList.add("active");
      }

      function togglePlayPause() {
        isPlaying = !isPlaying;
        const playPauseButton = document.querySelector("button");

        if (isPlaying) {
          playPauseButton.innerHTML =
            '<span class="material-symbols-outlined">pause</span>';
          autoPlay();
        } else {
          playPauseButton.innerHTML =
            '<span class="material-symbols-outlined">play_arrow</span>';
        }
      }

      function autoPlay() {
        if (isPlaying) {
          currentIndex = (currentIndex + 1) % 5; // 이미지가 5장이라고 가정
          showImage();
          setTimeout(autoPlay, intervalTime);
        }
      }

      // 초기 설정
      showImage();
      autoPlay();

      // =================오늘은 어떤차를 마셔볼까 캐로셀-==========================

      var previousWidth = window.innerWidth;

      function initializeSwiper() {
        var slidesPerView = window.innerWidth >= 960 ? 5 : 2;
        var swiper = new Swiper(".mySwiper1", {
          slidesPerView: slidesPerView,
          spaceBetween: 30,
          loop: true,
          autoplay: {
            delay: 2500,
            disableOnInteraction: false,
          },
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
        });
      }

      window.onresize = function () {
        var currentWidth = window.innerWidth;
        if (
          (previousWidth < 960 && currentWidth >= 960) ||
          (previousWidth >= 960 && currentWidth < 960)
        ) {
          document.location.reload();
        }
        previousWidth = currentWidth;
      };

      initializeSwiper();

      var swiper = new Swiper(".mySwiper2", {
        slidesPerView: "auto",
        spaceBetween: 30,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });

      let sec3 = $("#sec3 .onlyToday");

      sec3.click(function () {
        window.location.href = "#";
      });

      // ===============섹션7 캐로셀

      var swiper = new Swiper(".mySwiper3", {
        effect: "coverflow",
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: "auto",
        loop: true,
        spaceBetween: 30,
        coverflowEffect: {
          rotate: 50,
          stretch: 0,
          depth: 0,
          modifier: 0.7,
          slideShadows: true,
        },
        pagination: {
          el: ".swiper-pagination",
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });

      //footer 영역 토글 구현
      document.addEventListener("DOMContentLoaded", function () {
        var toggleButton = document.getElementById("toggleFooter");
        var miniFooter = document.querySelector(".mini_footer");

        toggleButton.addEventListener("click", function () {
          // 화면 너비가 1050px 이하일 때만 토글 기능이 작동합니다.
          if (window.innerWidth <= 1050) {
            miniFooter.style.display =
              miniFooter.style.display === "block" ? "none" : "block";
          }
        });

        // 화면 크기 변경에 따라 mini_footer의 표시 여부를 조정합니다.
        window.addEventListener("resize", function () {
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