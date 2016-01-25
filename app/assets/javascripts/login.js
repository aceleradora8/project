var LOGIN = LOGIN || {}

LOGIN.validateFormOnSubmit = function validateForm() {
  $("#form-login").submit(function() {
    validateEmail = VALIDATION.validateEmail();
    validatePassword = VALIDATION.validatePassword();
   	if (VALIDATION.hasError()) {
      return false;
    }
    return true;
  });
};

LOGIN.disableButtonOnSubmitForgotPass = function disableButtonOnSubmitForgotPass(){
  $("#form-password-reset-email").submit(function(){
    $('#email-reset-button').prop("disabled", true);
    $('#back-button').prop("disabled", true);
    $("#email-reset-button").val("Aguarde...");
    $('#close-password').hide();
  });
};
