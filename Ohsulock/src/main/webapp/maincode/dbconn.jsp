<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>175_connection</title>
</head>
<body>
	<%
		Connection conn = null;
	 	PreparedStatement pstmt = null;
	 	ResultSet rs = null;
	 	
		try{
			String url ="jdbc:oracle:thin:@localhost:1521:xe";
			String username = "C##dbexam";
			String password ="m1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 등록 성공");
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("접속 성공");
			System.out.println("접속 성공");
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 등록 실패");
		}
	%>
</body>
</html>