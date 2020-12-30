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
<!-- 파비콘 에러 방지 -->
<link rel="shortcut icon" href="#">
<!-- 다음 주소 api 추가  -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"  charset="UTF-8"></script>
<script src="./js/DaumPost.js" charset="UTF-8"></script>
<!-- validator 추가  -->
<script src="./js/jQueryValidator.js" charset="UTF-8"></script>

<title>회원가입</title>
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

			<!-- 아이디 -->
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label"> Id*</label>
				<div class="col-sm-9">
					<input type="text" id="id" name="id" placeholder="Id"
						class="form-control">
				</div>
				<!-- 아이디 중복체크 문구 
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

			<!-- 우편번호, 도로명주소, 도로명주소 상세주소, 지번주소 -->
			<div class="form-group">
				<label for="zipcode" class="col-sm-3 control-label"> Address</label>
				<div class="row">
					<div class="col-sm-5">
						<input type="text" name="zipcode" id="zipcode" placeholder="우편번호"
							class="form-control" >
					</div>
					<!-- 주소찾기 버튼 -->
					<!-- 이걸 <button>태그로 하면 submit하면서 새로고침되므로 input으로 수정함 -->
					<input type="button" class="btn btn-primary" onclick="exedaumPost()" value="검색"/>

					<label for="address" class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						<input type="text" name="address" id="address" placeholder="도로명주소"
							class="form-control" >
					</div>
					<label for="zibun" class="col-sm-3 control-label">
					</label>
					<div class="col-sm-9">
						<input type="text" name="zibun" id="zibun"
							placeholder="지번주소" class="form-control" >
					</div>

					<label for="addressDetail" class="col-sm-3 control-label">
					</label>
					<div class="col-sm-9">
						<input type="text" name="addressDetail" id="addressDetail"
							placeholder="상세주소" class="form-control" >
					</div>
					
					<label for="extraAddress" class="col-sm-3 control-label">
					</label>
					<div class="col-sm-9">
						<input type="text" name="extraAddress" id="extraAddress"
							placeholder="참고항목" class="form-control" >
					</div>
					<span id="guide" style="color:#999;display:none"></span>
				</div>
			</div>

			<!-- 성별 (중복선택X) -->
			<div class="form-group">
				<label class="control-label col-sm-3">Gender*</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-4">
						<!-- 라디오버튼의 경우 중복선택이 안되게 하려면 name을 같게 주면 된다 -->
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
			<!-- 취미(hobby) -> 관심사로 표현  (중복선택 가능)-->
			<div class="form-group">
				<label class="control-label col-sm-3">Interest</label>
				<div>중복 선택이 가능합니다.</div>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="알고리즘" id="hobby" name="hobby">알고리즘
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="데이터베이스" id="hobby" name="hobby">데이터베이스
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="웹프로그래밍" id="hobby" name="hobby">웹프로그래밍
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="빅데이터" id="hobby" name="hobby">빅데이터
							</label>
						</div>
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="checkbox"
								value="기획" id="hobby" name="hobby">기획
							</label>
						</div>
					</div>
				</div>
			</div>
			<!--  소개글 입력 -->
			<div class="form-group">
				<label class="control-label col-sm-3">소개글</label>
				<div class="col-sm-9">
					<textarea class="form-control" autofocus cols="60" rows="10" id="info" name="info"></textarea>
				</div>
			</div>
			<!-- 프로필 사진 업로드 -->
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