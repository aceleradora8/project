var NGO = NGO || {}

NGO.validateFormOnSubmit = function validateForm() {
  $("#form-ngo").submit(function() {
    validateName = VALIDATION.validateName();
    validateDescription = VALIDATION.validateDescription();
    validateAddress = VALIDATION.validateZipCode();
    validateEmail = VALIDATION.validateEmail();
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
    if (validateName && validateDescription && validateAddress && validateEmail && validatePassword && validatePasswordConfirmation) {
      return true;
    }
    return false;
  });
}

NGO.disableButtonOnSubmit = function validateForm() {
  $("#form-ngo").submit(function() {
    $("#confirm-ngo").prop("disabled", true);
    $("#confirm-ngo").val("Aguarde...")
  });
}
