<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원가입</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<script>
	function checkForm() {
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirm-password").value;

		if (password !== confirmPassword) {
			alert("비밀번호가 일치하지 않습니다.");
			return false; // 폼 제출을 방지
		}
		return true; // 폼 제출을 계속 진행
	}

	function validatePassword() {
		var password = document.getElementById("password");
		var confirmPassword = document.getElementById("confirm-password");

		if (password.value != confirmPassword.value) {
			confirmPassword.classList.add("is-invalid"); // 유효성 검사 실패 시 클래스 추가
		} else {
			confirmPassword.classList.remove("is-invalid"); // 유효성 검사 성공 시 클래스 제거
		}
	}

	window
			.addEventListener(
					"load",
					function() {
						// 폼의 submit 이벤트에 대한 이벤트 리스너 설정
						document
								.querySelector(".validation-form")
								.addEventListener(
										"submit",
										function(event) {
											validatePassword(); // 비밀번호 유효성 검사 수행
											if (!this.checkValidity()
													|| document
															.getElementById("password").value != document
															.getElementById("confirm-password").value) {
												event.preventDefault(); // 유효성 검사 실패 시 폼 제출 방지
												event.stopPropagation(); // 이벤트 전파 중지
											}
											this.classList.add("was-validated"); // 유효성 검사 후 클래스 추가
										}, false);
					});
</script>

<style>
body {
	min-height: 100vh;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.is-invalid {
	border-color: #dc3545;
}

.is-invalid ~ .invalid-feedback {
	display: block;
}
</style>
</head>
<body>
	<form class="validation-form" action="processAddMember.jsp"
		method="POST" accept-charset="UTF-8" novalidate>
		<div class="container">
			<div class="row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3">회원가입</h4>
					<!-- 아이디 필드 -->
					<div class="mb-3">
						<label for="id">아이디</label> <input type="text"
							class="form-control" id="id" name="id" placeholder="아이디" required />

						<div class="invalid-feedback">아이디를 입력해주세요.</div>
					</div>
					<!-- 비밀번호 필드 -->
					<div class="form-group">
						<label for="password">비밀번호:</label> <input type="password"
							class="form-control" id="password" name="password" required
							oninput="validatePassword()">
					</div>

					<!-- 비밀번호 확인 필드 -->
					<div class="form-group">
						<label for="confirm-password">비밀번호 확인:</label> <input
							type="password" class="form-control" id="confirm-password"
							name="confirmPassword" required oninput="validatePassword()">
					</div>


					<!-- 이름 필드 -->
					<div class="mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" id="name" name="name" placeholder="이름"
							required />
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>
					<!-- 성별 필드 -->
					<div class="mb-3">
						<label>성별</label>
						<div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="genderM" value="M" required /> <label
									class="form-check-label" for="genderM">남자</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="genderF" value="F" required /> <label
									class="form-check-label" for="genderF">여자</label>
							</div>
							<div class="invalid-feedback">성별을 선택해주세요.</div>
						</div>

					</div>
					<!-- 생일 필드 -->
					<div class="mb-3">
						<label for="birth">생일</label>
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" id="birth-year"
									placeholder="YYYY" pattern="\d{4}" required minlength="4" maxlength="4"/>
							</div>
							<div class="col">
								<select class="form-control" id="birth-month" required>
									<option value="">월</option>
									<!-- 월 선택 옵션 추가 -->
									<script>
										for (var i = 1; i <= 12; i++) {
											document
													.write('<option value="' + i + '">'
															+ i + '</option>');
										}
									</script>
								</select>
							</div>
							<div class="col">
								<select class="form-control" id="birth-day" required>
									<option value="">일</option>
									<!-- 일 선택 옵션 추가 -->
									<script>
										for (var i = 1; i <= 31; i++) {
											document
													.write('<option value="' + i + '">'
															+ i + '</option>');
										}
									</script>
								</select>
							</div>
						</div>
						<input type="hidden" id="birth" name="birth" />
						<div class="invalid-feedback">생일을 올바르게 입력해주세요.</div>
					</div>




					<!-- 이메일 필드 -->
					<div class="mb-3">
						<label for="mail">이메일</label> <input type="email"
							class="form-control" id="mail" name="mail"
							placeholder="example@gmail.com" required />
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>


					<!-- 전화번호 필드 -->
					<div class="mb-3">
						<label for="phone">전화번호</label>
						<div class="row">
							<!-- 전화번호 필드 -->
							<div class="col-4">
								<select class="form-control" id="phone-code" name="phoneCode"
									required>
									<option value="">선택...</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="02">02</option>
									<option value="031">031</option>
									<!-- 기타 다른 코드 추가 가능 -->
								</select>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" id="phone-middle"
									name="phoneMiddle" pattern="[0-9]{4}" placeholder="1234"
									required minlength="4" maxlength="4"/>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" id="phone-last"
									name="phoneLast" pattern="[0-9]{4}" placeholder="5678" required minlength="4" maxlength="4"/>
							</div>
						</div>
						<div class="invalid-feedback">전화번호를 올바르게 입력해주세요.</div>
					</div>


					<!-- 주소 필드 -->

					<div class="mb-3">
						<label for="sample6_postcode">우편번호</label> <input type="text"
							id="sample6_postcode" name="postcode" class="form-control mb-2"
							placeholder="우편번호" readonly>
						<button type="button" onclick="sample6_execDaumPostcode()">우편번호
							찾기</button>
					</div>

					<div class="mb-3">
						<label for="sample6_address">주소</label> <input type="text"
							id="sample6_address" name="address" class="form-control"
							placeholder="주소" readonly>
					</div>

					<div class="mb-3">
						<label for="sample6_detailAddress">상세주소</label> <input type="text"
							id="sample6_detailAddress" name="detailAddress"
							class="form-control" placeholder="상세주소">
					</div>

					<div class="mb-3">
						<label for="sample6_extraAddress">참고항목</label> <input type="text"
							id="sample6_extraAddress" name="extraAddress"
							class="form-control" placeholder="참고항목" readonly>
					</div>



					<!-- 동의 체크박스 -->
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="agreement"
							name="agreement" required /> <label class="custom-control-label"
							for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<hr class="mb-4" />
					<!-- 제출 버튼 -->
					<button class="btn btn-primary btn-lg btn-block" type="submit"
						onclick="checkForm()">가입 완료</button>
				</div>
			</div>
		</div>
	</form>
	<!-- 유효성 검사 스크립트 -->
	<script>
		window.addEventListener("load", function() {
			var forms = document.getElementsByClassName("validation-form");
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener("submit", function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add("was-validated");
				}, false);
			});
		}, false);

		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 생일 입력 값을 하나의 문자열로 결합
		function combineBirthDate() {
			var year = document.getElementById("birth-year").value;
			var month = document.getElementById("birth-month").value;
			var day = document.getElementById("birth-day").value;
			var birthDate = year + '-' + month + '-' + day;
			document.getElementById("birth").value = birthDate;
		}

		// 폼 제출 전에 생일 입력 값 결합
		document.querySelector(".validation-form").addEventListener("submit",
				function(event) {
					combineBirthDate();
				});
	</script>
</body>
</html>