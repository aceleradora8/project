var VOLUNTEER = VOLUNTEER || {}

VOLUNTEER.validateFormOnSubmit = function() {
  errorHash = {};
  $("#form-volunteer").submit(function() {
    validateName = VALIDATION.validateName();
    validateEmail = VALIDATION.validateEmail($(".validate-email"));
    validatePhone = VALIDATION.validatePhone();
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
    validateDayBirthday = VALIDATION.validateEmptyDate($("#volunteer_birth_date_3i"));
    validateMonthBirthday = VALIDATION.validateEmptyDate($("#volunteer_birth_date_2i"));
    validateYearBirthday = VALIDATION.validateEmptyDate($("#volunteer_birth_date_1i"));
    if (VALIDATION.hasError()) {
      return false;
      }
      VALIDATION.disableButtonOnSubmit();
      return true;
  });
};
