<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, dao.MemberDAO, dto.MemberDTO"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");

    if(id == null || password == null || id.trim().isEmpty() || password.trim().isEmpty()) {
        out.println("<script>alert('아이디와 비밀번호를 입력해주세요.');location.href='loginMember.jsp';</script>");
    } else {
        try {
            MemberDAO dao = new MemberDAO();
            MemberDTO member = dao.validateMember(id, password);

            if (member != null) {
                session.setAttribute("member", member);
                response.sendRedirect("../sulock/mainPage.jsp");
            } else {
                out.println("<script>alert('아이디와 비밀번호를 확인해 주세요.');location.href='loginMember.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('로그인 처리 중 에러가 발생했습니다.');location.href='loginMember.jsp';</script>");
        }
    }
%>
