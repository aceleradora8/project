var PASS_RESETS = PASS_RESETS || {}

PASS_RESETS.validateFormResetPassOnSubmit = function validateFormResetPass()
{ 
	$("#form-password-reset").submit(function(){  
		validatePassword = VALIDATION.validatePassword();
		validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
		if (validatePassword && validatePasswordConfirmation){
			return true;
		} else{
			return false;
		}
	});
}

PASS_RESETS.validateFormEmailOnSubmit = function validateFormEmail(){ 
	$("#form-password-reset-email").submit(function(){  
 		return VALIDATION.validateEmail();
 	});
}