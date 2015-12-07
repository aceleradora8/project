var PASS_RESETS = PASS_RESETS || {}

PASS_RESETS.validateFormResetPass = function validateFormResetPass()
{ 
  validatePassword = VALIDATION.validatePassword();
  validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
  if (validatePassword && validatePasswordConfirmation){
    return true;
  } else{
    return false;
  }
}

PASS_RESETS.validateFormEmail= function validateFormEmail()
{ 
 return VALIDATION.validateEmail();
}