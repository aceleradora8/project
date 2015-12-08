var NGO = NGO || {}

NGO.validateForm = function validateForm()
{	
	validateName =VALIDATION.validateName();
  validateDescription =VALIDATION.validateDescription();
  validateAddress = VALIDATION.validateZipCode();
  validateEmail = VALIDATION.validateEmail();
  validatePassword = VALIDATION.validatePassword();
  validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
  if (validateName && validateDescription && validateAddress && validateEmail && validatePassword && validatePasswordConfirmation){
    return true;
  } 
    return false;
}
