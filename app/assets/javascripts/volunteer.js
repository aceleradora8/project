var VOLUNTEER = VOLUNTEER || {}

VOLUNTEER.validateFormOnSubmit = function validateForm() {
  $("#form-volunteer").submit(function() {
    validateName = VALIDATION.validateName();
    validateEmail = VALIDATION.validateEmail();
    validatePhone = VALIDATION.validatePhone();
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
     if ($(".input-text-error").length == 0) {  
      VALIDATION.disableButtonOnSubmit();
      return true;
    }
    return false;
  });
};
