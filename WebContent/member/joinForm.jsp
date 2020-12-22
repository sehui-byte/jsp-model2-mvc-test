<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/joinFormStyle.css">
<title>ȸ������</title>

<script>
	$(function() {

		$.validator
				.setDefaults({
					//�ʵ尡 Invalid ������ ��� ���̶���Ʈ ��ų� ������ �� �ִ�.
					highlight : function(element) {
						if (element.type === "radio") {
							this.findByName(element.name).addClass(errorClass)
									.removeClass(validClass);
						} else {
							//input�κ��� �����ʿ� �������� �ֱ� ���ؼ� has-feedbackŬ���� �����ڸ� form-group�κп� �߰��Ѵ�
							$(element).closest('.col-sm-9').removeClass(
									'has-success').addClass(
									'has-error has-feedback');
							//���� ������ ����
							$(element).closest('.col-sm-9').find('i.fa')
									.remove();
							//fa-lg : font awesome������ ũ��
							$(element)
									.closest('.col-sm-9')
									.append(
											'<i class="fa fa-exclamation-circle form-control-feedback"></i>');
						var a = document.getElementsByTagName('i');
						var b = a.parentElement;
						var c = a.parentNode;
						console.log("parent >>" + b + "," +  c);
						}
					},
					unhighlight : function(element) {
						if (element.type === "radio") {
							this.findByName(element.name).removeClass(
									errorClass).addClass(validClass);
						} else {
							$(element).closest('.col-sm-9').removeClass(
									'has-error has-feedback').addClass(
									'has-success has-feedback');
							$(element).closest('.col-sm-9').find('i.fa')
									.remove();
							$(element)
									.closest('.col-sm-9')
									.append(
											'<i class="fa fa-check form-control-feedback"></i>');
						}
					}
				});

		//��ȿ���˻�
		//�ʼ� �Է°� : �̸�, ���̵�, ���, ���Ȯ��, �̸���, �ڵ�����ȣ, ����
		//���̵� �ߺ��˻� jsp�� ����������
		$("#joinForm").validate({

			rules : {
				//name���� ����
				name : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				password : {
					required : true
				},
				password_confirm : {
					required : true,
					equalTo : password
				},
				phoneNumber : {
					required : true
				},
				gender : {
					required : true
				}
			},
			messages : {
				name : {
					required : "�̸��� �Է����ּ���."
				},
				email : {
					email : "�̸��� ������ Ȯ���ϼ���.",
					required : "�̸����� �Է��ϼ���."
				},
				password_confirm : {
					required : "��й�ȣ�� �ٽ� �ѹ� �Է����ּ���.",
					equalTo : "��й�ȣ�� �ٸ��ϴ�."
				},
				password : {
					required : "��й�ȣ�� �Է����ּ���."
				},
				phoneNumber : {
					required : "�ڵ�����ȣ�� �Է����ּ���."
				},
				gender : {
					required : "������ �Է����ּ���."
				}
			}
		});
	});
</script>
</head>
<body>

	<div class="container">
		<form class="form-horizontal" role="form" id="joinForm"
			name="joinForm">
			<h2>Registration</h2>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label"> Name*</label>
				<div class="col-sm-9">
					<input type="text" id="name" name="name" placeholder="Name"
						class="form-control" autofocus>
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="col-sm-3 control-label"> E-mail*</label>
				<div class="col-sm-9">
					<input type="text" id="email" name="email"
						placeholder="(ex)abcd@efg.com" class="form-control">
				</div>
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
							class="form-control" autofocus>
					</div>

					<button type="submit" class="btn btn-primary">�˻�</button>

					<label for="address" class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						<input type="text" name="address" id="address" placeholder="���θ��ּ�"
							class="form-control" autofocus>
					</div>

					<label for="addressDetail" class="col-sm-3 control-label">
					</label>
					<div class="col-sm-9">
						<input type="text" name="addressDetail" id="addressDetail"
							placeholder="���ּ�" class="form-control" autofocus>
					</div>
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-3">Gender*</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								id="female" value="F">Female
							</label>
						</div>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								id="male" value="M">Male
							</label>
						</div>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								id="unknown" value="U">Unknown
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-3">Interest</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="�˰���">�˰���
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="�����ͺ��̽�">�����ͺ��̽�
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="�����α׷���">�����α׷���
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="������">������
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="��ȹ">��ȹ
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-3">�Ұ���</label>
				<div class="col-sm-9">
					<textarea class="form-control" autofocus cols="60" rows="10"></textarea>
				</div>
			</div>

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