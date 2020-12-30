<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" href="css/loginFormStyle.css">
</head>
<body>
	<!-- Cookie가 비어있지 않을 때 checked속성을 준다 -->
	<c:if test="${not empty cookie.id}">
		<c:set value="checked" var="checked"/>
	</c:if>
			
	<div class="loginBox">
		<h1>로그인</h1>
		<form action="login.do" method="post">
			<!-- 쿠키 있을 때 쿠키 아이디값 표시 -->
			<input type="text" placeholder ="아이디" id="id" name="id" value="${cookie.id.value}">
			<input type="password" placeholder="비밀번호" id="pw" name="pw">
			
			<div class="chk">
				<!-- 쿠키 있을 때 아이디저장 체크박스 checked로 설정 -->
				<input type="checkbox" id="idChk" name="idChk" ${checked}> 
				<label for="idChk">아이디 저장</label> 
				<input type="checkbox" id="pwChk" name="pwChk" value="pwChkYes"> 
				<label for="pwChk">비밀번호 저장</label>
			</div>
			<div class="serch">
				<span class="text">아이디 또는 비밀번호를 잊으셨나요?</span> <a href="#">ID/PW찾기</a>
			</div>
			<div class="btnWrap">
				<input type="button" value="회원가입" id="joinBtn" onclick="location.href='./joinForm.jsp'">
				<input type="submit" id="loginBtn" value="로그인">
			</div>
		</form>
	</div>
</body>
</html>
