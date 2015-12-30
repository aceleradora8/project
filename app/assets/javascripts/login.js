var LOGIN = LOGIN || {}

LOGIN.validateFormOnSubmit = function validateForm(){ 
	$("#form-login").submit(function(){	
		validateEmail = VALIDATION.validateEmail();
		validatePassword = VALIDATION.validatePassword();
		if (validateEmail && validatePassword){
			return true;
		} else{
			return false;
		}
	});
}
