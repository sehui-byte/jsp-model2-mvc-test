<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- navbar �߰� -->
<%@ include file="../common/navbar.jsp"%>
<link rel="stylesheet" href="css/loginFormStyle.css">
</head>
<body>
	<div class="loginBox">
		<h1>�α���</h1>
		<form action="login.do" method="post">
			<label for="id" class="labelId">���̵�</label> 
			<input type="text" id="id" name="id">
			<label for="pw" class="labelPw">�н�����</label>
			<input type="password" id="pw" name="pw">
			
			<div class="chk">
				<input type="checkbox" id="idChk" name="idChk" value="idChkYes"> 
				<label for="idChk">���̵� ����</label> 
				<input type="checkbox" id="pwChk" name="pwChk" value="pwChkYes"> 
				<label for="pwChk">��й�ȣ ����</label>
			</div>
			<div class="serch">
				<span class="text">���̵� �Ǵ� ��й�ȣ�� �����̳���?</span> <a href="#">ID/PWã��</a>
			</div>
			<div class="btnWrap">
				<input type="button" value="ȸ������" id="joinBtn" onclick="location.href='./joinForm.jsp'">
				<input type="submit" id="loginBtn" value="�α���" onclick="">
			</div>
		</form>
	</div>
</body>
</html>
