var PASS_RESETS = PASS_RESETS || {}

PASS_RESETS.validateFormResetPassOnSubmit = function validateFormResetPass() {
  $("#form-password-reset").submit(function() {
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
    if ($(".input-text-error").length == 0) {  
      return true;
    }
    return false;
  });
};
