var NGO = NGO || {}

NGO.validateFormOnSubmit = function validateForm() {
  $("#form-ngo").submit(function() {
    validateName = VALIDATION.validateName();
    validateDescription = VALIDATION.validateDescription();
    validateAddress = VALIDATION.validateZipCode();
    validateEmail = VALIDATION.validateEmail();
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
    if ($(".input-text-error").length == 0) {  
      VALIDATION.disableButtonOnSubmit();
      return true;
    }
    return false;
  });
}
