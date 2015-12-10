var INTEREST = INTEREST || {}
	

INTEREST.validateFormOnSubmit = function validateForm(){
	$("#form-interest").submit(function(){	
	  validateName =VALIDATION.validateName();
	  validateEmail = VALIDATION.validateEmail();
	  validatePhone = VALIDATION.validatePhone();
		if (validateName && validateEmail && validatePhone){
			return true;
		} else{
			return false;
		}
	});
}
