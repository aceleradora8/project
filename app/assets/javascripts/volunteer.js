var VOLUNTEER = VOLUNTEER || {}

VOLUNTEER.validateFormOnSubmit = function validateForm() {
  $("#form-volunteer").submit(function() {
    validateName = VALIDATION.validateName();
    validateEmail = VALIDATION.validateEmail($(".validate-email"),$('.email-error-invalid'));
    validatePhone = VALIDATION.validatePhone();
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
     if (errorArray.length == 0) {
      VALIDATION.disableButtonOnSubmit();
      return true;
    }
    return false;
  });
};
