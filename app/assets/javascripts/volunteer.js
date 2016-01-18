var VOLUNTEER = VOLUNTEER || {}

VOLUNTEER.validateFormOnSubmit = function validateForm() {
  $("#form-volunteer").submit(function() {
    validateName = VALIDATION.validateName();
    validateEmail = VALIDATION.validateEmail($(".validate-email"),$('.email-error-invalid'));
    validatePhone = VALIDATION.validatePhone();
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
    validateDayBirthday = VALIDATION.validateEmptyDate($("#volunteer_birth_date_3i"));
    validateMonthBirthday = VALIDATION.validateEmptyDate($("#volunteer_birth_date_2i"));
    validateYearBirthday = VALIDATION.validateEmptyDate($("#volunteer_birth_date_1i"));
     if (errorArray.length == 0) {
      VALIDATION.disableButtonOnSubmit();
      return true;
    }
    return false;
  });
};
