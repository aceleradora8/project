var PASS_RESETS = PASS_RESETS || {}

PASS_RESETS.validateForm = function validateForm()
{ 
  validatePassword = VALIDATION.validatePassword();
  validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
  if (validatePassword && validatePasswordConfirmation){
    return true;
  } else{
    return false;
  }
}