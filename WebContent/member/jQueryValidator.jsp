<script type="text/javascript">

$(function(){
	// validate signup form on keyup and submit
	
		$.validator.setDefaults({
		highlight: function(element){
			$(element)
			.closest('.form-group')
			.addClass('has-error')
		},
		unhighlight: function(element){
			$(element)
			.closest('.form-group')
			.removeClass('has-error')
		}
	});
	
	$("joinForm").validate({
		rules:
		{	
			name: "required",
		    password: "required",
			birthDate: "required",
			phoneNumber: "required",
			password_confirm: {
				required : true,
				equalTo: password
			},
			email: {
				required: true,
				email: true
			}
		},
		//검사를 충족하지 못할 경우 표시될 메세지의 나열
		messages:{
			name: "이름을 입력해주세요.",
			password: "Please enter password",
			password_confirm: {
				required: "비밀번호를 다시 한번 입력해주세요.",
				equalTo: "비밀번호가 일치하지 않습니다."
			},
			birthDate: {
				required: " Please enter birthdate"
				},
			email: {
				required: ' Please enter email',
				email: ' Please enter valid email'
				}
			}	
		});
	});
	
	</script>