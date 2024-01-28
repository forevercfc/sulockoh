<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    if(id == null || password == null || id.trim().isEmpty() || password.trim().isEmpty()) {
        out.println("<script>alert('아이디와 비밀번호를 입력해주세요.'); location.href='loginMember.jsp';</script>");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String userName = null;

    try {
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "C##dbexam";
        String pwd = "m1234";
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, user, pwd);
        String sql = "SELECT name FROM ohsulock_Member WHERE id=? AND password=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            userName = rs.getString("name");
           /*  HttpSession session = request.getSession(); */
            session.setAttribute("memberId", id);
            session.setAttribute("memberName", userName);
            response.sendRedirect("../sulock/mainPage.jsp");
        } else {
            out.println("<script>alert('아이디와 비밀번호를 확인해 주세요.'); location.href='loginMember.jsp';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
        if (conn != null) try { conn.close(); } catch (SQLException ex) {}
    }
%>
