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
	<!-- Cookie�� ������� ���� �� checked�Ӽ��� �ش� -->
	<c:if test="${not empty cookie.id}">
		<c:set value="checked" var="checked"/>
	</c:if>
			
	<div class="loginBox">
		<h1>�α���</h1>
		<form action="login.do" method="post">
			<!-- ��Ű ���� �� ��Ű ���̵� ǥ�� -->
			<input type="text" placeholder ="���̵�" id="id" name="id" value="${cookie.id.value}">
			<input type="password" placeholder="��й�ȣ" id="pw" name="pw">
			
			<div class="chk">
				<!-- ��Ű ���� �� ���̵����� üũ�ڽ� checked�� ���� -->
				<input type="checkbox" id="idChk" name="idChk" ${checked}> 
				<label for="idChk">���̵� ����</label> 
				<input type="checkbox" id="pwChk" name="pwChk" value="pwChkYes"> 
				<label for="pwChk">��й�ȣ ����</label>
			</div>
			<div class="serch">
				<span class="text">���̵� �Ǵ� ��й�ȣ�� �����̳���?</span> <a href="#">ID/PWã��</a>
			</div>
			<div class="btnWrap">
				<input type="button" value="ȸ������" id="joinBtn" onclick="location.href='./joinForm.jsp'">
				<input type="submit" id="loginBtn" value="�α���">
			</div>
		</form>
	</div>
</body>
</html>
