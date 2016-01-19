var ABOUTUS = ABOUTUS || {}

ABOUTUS.validateFormContactUsSubmit = function validateFormContactUsSubmit() {
  $("#form-contact-us").submit(function() {
    validateType = VALIDATION.validateEmpty($('.type-contact-us'));
    validateName = VALIDATION.validateEmpty($('.name-contact-us'));
    validateEmail = VALIDATION.validateContactEmail();
    validateMessage = VALIDATION.validateEmpty($('.message-contact-us'));
    if (errorArray.length == 0) {
      VALIDATION.disableButtonOnSubmit();
      return true;
    }
    return false;
  });
};
