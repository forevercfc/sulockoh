<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="mvc.database.DBConnection" %>
<%
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;
    PreparedStatement pstmt = null;

    // 폼에서 받은 데이터
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String birthYear = request.getParameter("birthYear");
    String birthMonth = request.getParameter("birthMonth");
    String birthDay = request.getParameter("birthDay");
    String email = request.getParameter("mail");
    String phoneCode = request.getParameter("phoneCode");
    String phoneMiddle = request.getParameter("phoneMiddle");
    String phoneLast = request.getParameter("phoneLast");
    String phone = phoneCode + phoneMiddle + phoneLast;
    String postcode = request.getParameter("postcode");
    String address = request.getParameter("address");
    String detailAddress = request.getParameter("detailAddress");
    String extraAddress = request.getParameter("extraAddress");
    String birth = birthYear + "-" + birthMonth + "-" + birthDay; // YYYY-MM-DD 형식

    String updateSql = "UPDATE ohsulock_Member SET password = ?, name = ?, gender = ?, birth = TO_DATE(?, 'YYYY-MM-DD'), mail = ?, phone = ?, postcode = ?, address = ?, detailAddress = ?, extraAddress = ? WHERE id = ?";

    try {
        conn = DBConnection.getConnection();
        pstmt = conn.prepareStatement(updateSql);

        pstmt.setString(1, password);
        pstmt.setString(2, name);
        pstmt.setString(3, gender);
        pstmt.setString(4, birth);
        pstmt.setString(5, email);
        pstmt.setString(6, phone);
        pstmt.setString(7, postcode);
        pstmt.setString(8, address);
        pstmt.setString(9, detailAddress);
        pstmt.setString(10, extraAddress);
        pstmt.setString(11, id);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('회원 정보가 성공적으로 업데이트되었습니다.'); location.href='../sulock/mainPage.jsp';</script>");
        } else {
            out.println("<script>alert('회원 정보 업데이트에 실패하였습니다.'); history.back();</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류가 발생했습니다.'); history.back();</script>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
