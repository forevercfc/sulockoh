<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String userId = (String) session.getAttribute("memberId");
    String userName = (String) session.getAttribute("memberName"); // 세션에서 사용자 이름 가져오기
    if (userId == null || userName == null) {
        // 로그인되지 않은 사용자에게 알림을 보내고 로그인 페이지로 리다이렉트
%>
        <script type="text/javascript">
            alert("로그인을 해주세요"); // Alert message
            window.location = "./member/loginMember.jsp"; // Redirect to login page
        </script>
<%
        return;
    }
    out.print(userId);
    out.print(userName);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteForm.jsp</title>
<script>
	function checkForm(){
		if(!document.newWrite.name.value){
			alert("성명을 입력하세요");
			return false;
		}
		if(!document.newWrite.subject.value){
			alert("제목을 입력하세요");
			return false;
		}
		if(!document.newWrite.content.value){
			alert("내용을 입력하세요");
			return false;
		}
		/* document.newWrite.submit();	 */	
	}
</script>
</head>
<body>
	<!--게시판 글 쓰는 페이지 구조 생성-->
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">게시판</h1>
		</div>
	</div>

	<div class="container mb-5">
		<div class="row">
			<div class="col-md-8 px-0">
				<!-- form -->
				<form name="newWrite" action="./BoardWriteAction.do" method="post" onsubmit="return checkForm()">
				<div class="form-group d-flex">
						<label for="name" class="col-3">작성자 ID</label> 
						<input type="text" name="id" value="<%=userId %>"/>
					
						<label for="name" class="col-3">성명</label> 
						<input type="text" class="form-control col-9" name="name" value="<%=userName %>" readonly>
					</div>
	
					<div class="form-group d-flex">
						<label for="subject" class="col-3">제목</label> 
						<input type="text" class="form-control col-9" name="subject" placeholder="제목">
					</div>
					
					<div class="form-group d-flex">
						<label for="subject" class="col-3">가격</label> 
						<input type="text" class="form-control col-9" name="price" placeholder="가격">
					</div>
					
					<div class="form-group d-flex">
						<label for="content" class="col-3">내용</label>
						<textarea name="content" id="" cols="30" rows="10" class="form-control"></textarea>
					</div>
					<div class="form-group d-flex">
						<label for="img" class="col-3">이미지</label>
						<input type="file" name="img" value="등록" class="form-control col-9"/> 
					</div>
					<!-- 버튼 -->
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="reset" class="btn btn-danger" value="취소" onclick="reset()">
					<input type="button" class="btn btn-warning" value="이전" onclick="history.back();">
				</form>
			</div>
		</div>
	</div>
</body>
</html>