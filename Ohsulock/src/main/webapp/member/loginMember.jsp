<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.MemberDAO, dto.MemberDTO"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="login.css?v=1234" />
</head>
  <style>
    body {
      background-image: url("./loginbg.png");
      background-size: 100%;
      font-size: 0.75rem;
    }
    a {
      cursor: pointer;
      width: 100%;
      height: 100%;
      color: #000000;
      text-decoration: none;
    }
    #loginBoxTitle {
      color: #000000;
      font-weight: bold;
      font-size: 25px;
      padding: 5px;
      margin-bottom: 20px;
      text-align: center;
    }

    input[type="button"] {
      font-size: 0.75rem;
      padding: 5px 10px;
    }
    .login-box {
      margin: 150px auto;
      background-color: rgba(255, 255, 255, 1);
      border-radius: 10px;
      padding: 40px 30px;
      width: 520px;
      height: auto;
      filter: drop-shadow(0px 0px 10px rgba(0, 0, 0, 0.5));
    }
    .form-group {
      margin-bottom: 10px;
    }
    .form-group label {
      font-size: 0.75rem;
      margin: 5px 0;
    }
    #login-btn-box {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-top: 10px;
    }

    #otherLogin {
      display: flex;
      justify-content: space-evenly;
      margin-top: 50px;
      text-align: center;
    }
    #otherLogin div img {
      width: 45px;
    }

    .newMember_txt {
      display: flex;
      font-size: 15px;
      justify-content: space-between;
      border: #cecacada 1px solid;
      border-radius: 5px;
      align-self: center;
      padding: 10px;
    }
    .newMember_txt p {
      margin: 0;
      display: flex;
    }

    @media screen and (max-width: 540px) {
      .login-box {
        width: 95%;
      }
      #loginBoxTitle {
        font-size: 18px;
      }
      .newMember_txt {
        font-size: 10px;
      }
    }
  </style>
<body>
    <div id="container">
        <div class="login-box">
            <form action="loginProcess.jsp" method="post">
                <div id="loginBoxTitle">
                    아모레퍼시픽 뷰티포인트 통합회원<br />아이디로 로그인해주세요.
                </div>
                <div class="form-group">
                    <input type="text" name="id" id="id" class="form-control" placeholder="아이디 입력" />
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호 입력(영문, 숫자, 특수문자 조합)" />
                </div>
                <div id="login-btn-box">
                    <div>
                        <span> 아이디 저장</span>
                        <input type="checkbox" id="workSite" name="worksite" style="margin-bottom: 5px" />
                    </div>
                    <div id="login-btn">
                        <input type="submit" id="btnLogin" value="로그인" class="btn btn-primary" />
                    </div>
                </div>
            </form>
            <div id="otherLogin">
          <div>
            <img
              src="https://one-ap.amorepacific.com/auth/images/common/btn_login_mobile.png"
              alt=""
            />
            <p>휴대폰<br />로그인</p>
          </div>
          <div>
            <img
              src="https://one-ap.amorepacific.com/auth/images/common/btn_login_ka.png"
              alt=""
            />
            <p>카카오<br />로그인</p>
          </div>
          <div>
            <img
              src="https://one-ap.amorepacific.com/auth/images/common/btn_login_na.png"
              alt=""
            />
            <p>네이버<br />로그인</p>
          </div>
          <div>
            <img
              src="https://one-ap.amorepacific.com/auth/images/common/btn_login_fb.png"
              alt=""
            />
            <p>페이스북<br />로그인</p>
          </div>
        </div>
        <div id="newMember">
          <a href="addMember.jsp">
            <div class="newMember_txt">
              <p>아직 회원이 아니세요?</p>
              <p>회원가입 ></p>
            </div>
          </a>
        </div>
      </div>
      <!-- login Box //-->
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
  </body>
</html>