var NGO = NGO || {}

NGO.validateForm = function validateForm()
{	
	validateName =VALIDATION.validateName();
  validateDescription =VALIDATION.validateDescription();
  validateEmail = VALIDATION.validateEmail();
  validatePassword = VALIDATION.validatePassword();
  validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
  if (validateName && validateDescription && validateEmail && validatePassword && validatePasswordConfirmation){
    return true;
  } else{
    return false;
  }
}
