var INTEREST = INTEREST || {}
	
INTEREST.validateForm = function validateForm(){	
	if (VALIDATION.validateName() && VALIDATION.validateEmail() && VALIDATION.validatePhone()){
		return true;
	} else{
		return false;
	}
}



