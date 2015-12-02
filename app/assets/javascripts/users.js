var USER = USER || {}

USER.validateForm = function validateForm()
{	
	if (VALIDATION.validateEmail() && VALIDATION.validatePassword()){
		return true;
	} else{
		return false;
	}
}