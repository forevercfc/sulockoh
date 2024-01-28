<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="mvc.model.BoardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
</head>
<body>
	<!--request 객체에서 원하는 속성 값을 가져와 형변환 후 변수에 저장-->
	<%
		BoardDTO notice=(BoardDTO)request.getAttribute("board");
		int num=(Integer)request.getAttribute("num");
		int nowPage=(Integer)request.getAttribute("page");
	%>
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">게시판</h1>
		</div>
	</div>

	<div class="container mb-5">
		<div class="row">
			<div class="offset-2 col-md-8 px-0">
				<!-- form -->
				<form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowPage%>" method="post">
					<div class="form-group float-left">
						<img src="./resources/img/<%=notice.getImg()%>" alt="" class="img-fluid" width="300"/>
					</div>
					<div class="form-group d-flex">
						<label for="name" class="col-3">성명</label> 
						<input type="text" class="form-control" name="name" value="<%=notice.getName()%>" readonly>
					</div>
					<div class="form-group d-flex">
						<label for="subject" class="col-3">제목</label> 
						<input type="text" class="form-control" name="subject" value="<%=notice.getSubject()%>">
					</div>
					
					<div class="form-group d-flex">
						<label for="subject" class="col-3"> 가격</label> 
						<input type="text" class="form-control" name="subject" value="<%=notice.getPrice()%>">
					</div>
					
					<div class="form-group d-flex">
						<label for="content" class="col-3">내용</label> 
						<textarea name="content" id="" cols="30" rows="10" class="form-control"><%=notice.getContent()%></textarea>
					</div>
					<!--------------------------------->
					<div class="row">
						<div class="col-8">
							<!-- 본인이 쓴 글에만 수정, 삭제가 보이도록 설정 -->
							<c:set var="userId" value="<%=notice.getId()%>"/>
							<c:if test="${sessionId==userId}">
								<a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowPage%>" class="btn btn-danger">삭제</a>
								<input type="submit" value="수정" class="btn btn-warning"/>
							</c:if>
						</div>
						<div class="col-4">
							<a href="./BoardListAction.do?pageNum=<%=nowPage%>" class="btn btn-info float-right">목록</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>