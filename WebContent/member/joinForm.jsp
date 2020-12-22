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
<title>회원가입</title>

<script>
	$(function() {

		$.validator
				.setDefaults({
					//필드가 Invalid 됐을때 어떻게 하이라이트 시킬까를 결정할 수 있다.
					highlight : function(element) {
						if (element.type === "radio") {
							this.findByName(element.name).addClass(errorClass)
									.removeClass(validClass);
						} else {
							//input부분의 오른쪽에 아이콘을 넣기 위해서 has-feedback클래스 선택자를 form-group부분에 추가한다
							$(element).closest('.col-sm-9').removeClass(
									'has-success').addClass(
									'has-error has-feedback');
							//이전 아이콘 지움
							$(element).closest('.col-sm-9').find('i.fa')
									.remove();
							//fa-lg : font awesome아이콘 크기
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

		//유효성검사
		//필수 입력값 : 이름, 아이디, 비번, 비번확인, 이메일, 핸드폰번호, 성별
		//아이디 중복검사 jsp로 보내버리기
		$("#joinForm").validate({

			rules : {
				//name으로 지정
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
					required : "이름을 입력해주세요."
				},
				email : {
					email : "이메일 형식을 확인하세요.",
					required : "이메일을 입력하세요."
				},
				password_confirm : {
					required : "비밀번호를 다시 한번 입력해주세요.",
					equalTo : "비밀번호와 다릅니다."
				},
				password : {
					required : "비밀번호를 입력해주세요."
				},
				phoneNumber : {
					required : "핸드폰번호를 입력해주세요."
				},
				gender : {
					required : "성별을 입력해주세요."
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

			<!-- 우편번호, 도로명주소, 도로명주소 상세주소, 지번주소 -->
			<div class="form-group">
				<label for="zipcode" class="col-sm-3 control-label"> Address</label>
				<div class="row">
					<div class="col-sm-5">
						<input type="text" name="zipcode" id="zipcode" placeholder="우편번호"
							class="form-control" autofocus>
					</div>

					<button type="submit" class="btn btn-primary">검색</button>

					<label for="address" class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						<input type="text" name="address" id="address" placeholder="도로명주소"
							class="form-control" autofocus>
					</div>

					<label for="addressDetail" class="col-sm-3 control-label">
					</label>
					<div class="col-sm-9">
						<input type="text" name="addressDetail" id="addressDetail"
							placeholder="상세주소" class="form-control" autofocus>
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
								value="알고리즘">알고리즘
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="데이터베이스">데이터베이스
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="웹프로그래밍">웹프로그래밍
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="빅데이터">빅데이터
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="기획">기획
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-3">소개글</label>
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
			<button type="submit" class="btn btn-primary btn-block">제출</button>
		</form>
		<!-- /form -->
	</div>
	<!-- ./container -->
</body>
</html>