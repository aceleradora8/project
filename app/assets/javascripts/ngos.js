var NGO = NGO || {}

NGO.validateForm = function validateForm()
{	
	if (VALIDATION.validateName() && VALIDATION.validateEmail()){
		return true;
	} else{
		return false;
	}
}

