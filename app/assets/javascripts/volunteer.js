var VOLUNTEER = VOLUNTEER || {}

VOLUNTEER.validateFormOnSubmit = function validateForm(){ 
  $("#form-volunteer").submit(function(){  
    validateName =VALIDATION.validateName();
    validateDescription =VALIDATION.validateDescription();
    validateEmail = VALIDATION.validateEmail();
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
    if (validateName && validateDescription && validateEmail && validatePassword && validatePasswordConfirmation){
      return true;
    } 
      return false;
  });
}
