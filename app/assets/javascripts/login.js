var LOGIN = LOGIN || {}

LOGIN.validateFormOnSubmit = function validateForm() {
  $("#form-login").submit(function() {
    validateEmail = VALIDATION.validateEmail();
    validatePassword = VALIDATION.validatePassword();
   	if ($(".input-text-error").length == 0) {  
      return true;
    }
    return false;
  });
};
