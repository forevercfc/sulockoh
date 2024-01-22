<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, dao.MemberDAO, dto.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 처리</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    MemberDTO member = new MemberDTO();

    member.setId(request.getParameter("id"));
    member.setPassword(request.getParameter("password"));
    member.setName(request.getParameter("name"));
    member.setGender(request.getParameter("gender"));
    member.setMail(request.getParameter("mail"));
    String phone = request.getParameter("phoneCode") + "-" + request.getParameter("phoneMiddle") + "-" + request.getParameter("phoneLast");
    member.setPhone(phone);
    member.setBirth(request.getParameter("birth"));
    member.setPostcode(request.getParameter("postcode"));
    member.setAddress(request.getParameter("address"));
    member.setDetailAddress(request.getParameter("detailAddress"));
    member.setExtraAddress(request.getParameter("extraAddress"));

    MemberDAO dao = new MemberDAO();
    boolean success = dao.registerMember(member);

 
    if (success) {
        // 회원가입 성공 메시지 출력 후, 로그인 페이지로 리다이렉트
%>
        <script type="text/javascript">
            alert("회원가입 성공! 다시 로그인 해주세요.");
            window.location.href = "loginMember.jsp"; // 리다이렉트할 페이지 경로
        </script>
<%
    } else {
        // 회원가입 실패 메시지 출력 후, 다시 회원가입 페이지로 리다이렉트
%>
        <script type="text/javascript">
            alert("회원가입 실패!");
            window.location.href = "addMember.jsp"; // 리다이렉트할 페이지 경로
        </script>
<%
    }
%>

%>
</body>
</html>
