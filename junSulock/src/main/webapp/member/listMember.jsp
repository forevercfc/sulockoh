<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.util.*" %>
<%
    String loggedInUserId = (String)session.getAttribute("memberId");

%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>회원 목록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>회원 목록</h2>
        <sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver"
            url="jdbc:oracle:thin:@localhost:1521:xe" user="C##dbexam" password="m1234" />
        <sql:query var="members" dataSource="${dataSource}">
            SELECT * FROM ohsulock_Member
        </sql:query>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>이메일</th>
                     <th>연락처</th>
                      <th>주소</th>
                      <th>생년월일</th>
                      
                    
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${members.rows}">
                    <tr>
                        <td><c:out value="${member.id}" /></td>
                        <td><c:out value="${member.name}" /></td>
                        <td><c:out value="${member.mail}" /></td>
                        <td><c:out value="${member.phone}" /></td>
                        <td><c:out value="${member.postcode}, ${member.address}, ${member.detailAddress}, ${member.extraAddress}" /></td>
                         <td><c:out value="${member.birth}" /></td>
                       
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
