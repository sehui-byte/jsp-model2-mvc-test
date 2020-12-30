<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/joinFormStyle.css">
<!-- �ĺ��� ���� ���� -->
<link rel="shortcut icon" href="#">
<!-- ���� �ּ� api �߰�  -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"  charset="UTF-8"></script>
<script src="./js/DaumPost.js" charset="UTF-8"></script>
<!-- validator �߰�  -->
<script src="./js/jQueryValidator.js" charset="UTF-8"></script>

<title>ȸ������</title>
</head>

<body>
	<div class="container">
		<form class="form-horizontal" role="form" id="joinForm"
			name="joinForm" method="post" action="memberInsert.do" enctype="multipart/form-data">
			<h2>Registration</h2>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label"> Name*</label>
				<div class="col-sm-9">
					<input type="text" id="name" name="name" placeholder="Name"
						class="form-control" autofocus>
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="col-sm-3 control-label"> E-mail*</label>
				<div class="col-sm-9">
					<input type="text" id="email" name="email"
						placeholder="(ex)abcd@efg.com" class="form-control">
				</div>
			</div>

			<!-- ���̵� -->
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label"> Id*</label>
				<div class="col-sm-9">
					<input type="text" id="id" name="id" placeholder="Id"
						class="form-control">
				</div>
				<!-- ���̵� �ߺ�üũ ���� 
				<div class="check_font" id="id_check"></div>
				-->
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">Password*</label>
				<div class="col-sm-9">
					<input type="password" id="password" name="password"
						placeholder="Password" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">Confirm
					Password*</label>
				<div class="col-sm-9">
					<input type="password" id="password_confirm"
						name="password_confirm" placeholder="Password"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="birthDate" class="col-sm-3 control-label">Date
					of Birth</label>
				<div class="col-sm-9">
					<input type="date" id="birthDate" name="birthDate"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="phoneNumber" class="col-sm-3 control-label">Phone
					number* </label>
				<div class="col-sm-9">
					<input type="text" id="phoneNumber" name="phoneNumber"
						placeholder="Phone number" class="form-control">
				</div>

			</div>

			<!-- �����ȣ, ���θ��ּ�, ���θ��ּ� ���ּ�, �����ּ� -->
			<div class="form-group">
				<label for="zipcode" class="col-sm-3 control-label"> Address</label>
				<div class="row">
					<div class="col-sm-5">
						<input type="text" name="zipcode" id="zipcode" placeholder="�����ȣ"
							class="form-control" >
					</div>
					<!-- �ּ�ã�� ��ư -->
					<!-- �̰� <button>�±׷� �ϸ� submit�ϸ鼭 ���ΰ�ħ�ǹǷ� input���� ������ -->
					<input type="button" class="btn btn-primary" onclick="exedaumPost()" value="�˻�"/>

					<label for="address" class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						<input type="text" name="address" id="address" placeholder="���θ��ּ�"
							class="form-control" >
					</div>
					<label for="zibun" class="col-sm-3 control-label">
					</label>
					<div class="col-sm-9">
						<input type="text" name="zibun" id="zibun"
							placeholder="�����ּ�" class="form-control" >
					</div>

					<label for="addressDetail" class="col-sm-3 control-label">
					</label>
					<div class="col-sm-9">
						<input type="text" name="addressDetail" id="addressDetail"
							placeholder="���ּ�" class="form-control" >
					</div>
					
					<label for="extraAddress" class="col-sm-3 control-label">
					</label>
					<div class="col-sm-9">
						<input type="text" name="extraAddress" id="extraAddress"
							placeholder="�����׸�" class="form-control" >
					</div>
					<span id="guide" style="color:#999;display:none"></span>
				</div>
			</div>

			<!-- ���� (�ߺ�����X) -->
			<div class="form-group">
				<label class="control-label col-sm-3">Gender*</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-4">
						<!-- ������ư�� ��� �ߺ������� �ȵǰ� �Ϸ��� name�� ���� �ָ� �ȴ� -->
							<label class="radio-inline"> <input type="radio"
								name="gender" id="female" value="F">Female
							</label>
						</div>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								name="gender" id="male" value="M">Male
							</label>
						</div>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								name="gender" id="unknown" value="U">Unknown
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- ���(hobby) -> ���ɻ�� ǥ��  (�ߺ����� ����)-->
			<div class="form-group">
				<label class="control-label col-sm-3">Interest</label>
				<div>�ߺ� ������ �����մϴ�.</div>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="�˰���" id="hobby" name="hobby">�˰���
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="�����ͺ��̽�" id="hobby" name="hobby">�����ͺ��̽�
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="�����α׷���" id="hobby" name="hobby">�����α׷���
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="������" id="hobby" name="hobby">������
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="��ȹ" id="hobby" name="hobby">��ȹ
							</label>
						</div>
					</div>
				</div>
			</div>
			<!--  �Ұ��� �Է� -->
			<div class="form-group">
				<label class="control-label col-sm-3">�Ұ���</label>
				<div class="col-sm-9">
					<textarea class="form-control" autofocus cols="60" rows="10" id="info" name="info"></textarea>
				</div>
			</div>
			<!-- ������ ���� ���ε� -->
			<div class="form-group">
				<label class="control-label col-sm-3">Profile Photo</label> <input
					type="file" name="photo" id="photo" autofocus>
			</div>

			<!-- /.form-group -->
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*Required fields</span>
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-block">����</button>
		</form>
		<!-- /form -->
	</div>
	<!-- ./container -->
</body>
</html>