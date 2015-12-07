var LOGIN = LOGIN || {}

LOGIN.validateForm = function validateForm()
{ 
  validateEmail = VALIDATION.validateEmail();
  validatePassword = VALIDATION.validatePassword();
  if (validateEmail && validatePassword){
    return true;
  } else{
    return false;
  }
}
