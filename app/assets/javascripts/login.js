var LOGIN = LOGIN || {}

LOGIN.validateForm = function validateForm()
{	
	if (VALIDATION.validateEmail()){
		return true;
	} else{
		return false;
	}
}

