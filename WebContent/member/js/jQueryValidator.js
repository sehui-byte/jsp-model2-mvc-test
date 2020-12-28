/**
 * 
 */


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
		$("#joinForm").validate({
			rules : {
				//name으로 지정
				name : {
					required : true
				},
				id : {
					required : true,
					//중복체크하기
					remote: {
						url: './memberIdCheck.do',
						type: 'post'
					}
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
				},
				id :{
					required : "아이디를 입력해주세요.",
					remote : "사용 중인 아이디입니다."
				}
			}
		});
	});