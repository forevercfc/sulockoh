<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="mvc.database.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String mail = request.getParameter("mail");
	String phoneCode = request.getParameter("phoneCode");
	String phoneMiddle = request.getParameter("phoneMiddle");
	String phoneLast = request.getParameter("phoneLast");
	String phone = phoneCode + phoneMiddle + phoneLast;
	String postcode = request.getParameter("postcode");
	String address = request.getParameter("address");
	String detailAddress = request.getParameter("detailAddress");
	String extraAddress = request.getParameter("extraAddress");
	
	Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        conn = DBConnection.getConnection();
        String sql = "INSERT INTO ohsulock_Member (id, password, name, gender, birth, mail, phone, postcode, address, detailAddress, extraAddress, logtime) VALUES (?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?, SYSDATE)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, password);
        pstmt.setString(3, name);
        pstmt.setString(4, gender);
        pstmt.setString(5, birth);
        pstmt.setString(6, mail);
        pstmt.setString(7, phone);
        pstmt.setString(8, postcode);
        pstmt.setString(9, address);
        pstmt.setString(10, detailAddress);
        pstmt.setString(11, extraAddress);
       

 int result = pstmt.executeUpdate();
    if (result > 0) {
%>
        <script>
            alert("회원가입 성공! 다시 로그인 해주세요.");
            window.location.href = "loginMember.jsp"; // 리다이렉트할 페이지 경로
        </script>
<%
    } else {
%>
        <script>
            alert("회원가입 실패!");
            window.location.href = "addMember.jsp"; // 리다이렉트할 페이지 경로
        </script>
<%
    }
    } catch(Exception e) {
        e.printStackTrace();
        // Handle exceptions
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
    
    
    
</body>
</html>
