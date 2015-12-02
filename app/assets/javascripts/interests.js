var INTEREST = INTEREST || {}
	
INTEREST.validateForm = function validateForm(){	
  validateName =VALIDATION.validateName();
  validateEmail = VALIDATION.validateEmail();
  validatePhone = VALIDATION.validatePhone();
	if (validateName && validateEmail && validatePhone){
		return true;
	} else{
		return false;
	}
}



