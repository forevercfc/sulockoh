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
        out.println("회원가입 성공!");
    } else {
        out.println("회원가입 실패!");
    }
%>
</body>
</html>
