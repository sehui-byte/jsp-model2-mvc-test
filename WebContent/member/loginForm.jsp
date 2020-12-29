<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- navbar 추가 -->
<%@ include file="../common/navbar.jsp"%>
<link rel="stylesheet" href="css/loginFormStyle.css">
</head>
<body>
	<div class="loginBox">
		<h1>로그인</h1>
		<form action="login.do" method="post">
			<label for="id" class="labelId">아이디</label> 
			<input type="text" id="id" name="id">
			<label for="pw" class="labelPw">패스워드</label>
			<input type="password" id="pw" name="pw">
			
			<div class="chk">
				<input type="checkbox" id="idChk" name="idChk" value="idChkYes"> 
				<label for="idChk">아이디 저장</label> 
				<input type="checkbox" id="pwChk" name="pwChk" value="pwChkYes"> 
				<label for="pwChk">비밀번호 저장</label>
			</div>
			<div class="serch">
				<span class="text">아이디 또는 비밀번호를 잊으셨나요?</span> <a href="#">ID/PW찾기</a>
			</div>
			<div class="btnWrap">
				<input type="button" value="회원가입" id="joinBtn" onclick="location.href='./joinForm.jsp'">
				<input type="submit" id="loginBtn" value="로그인" onclick="">
			</div>
		</form>
	</div>
</body>
</html>
