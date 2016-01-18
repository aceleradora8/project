var VALIDATION = VALIDATION || {}

var errorArray = [];

VALIDATION.validateEmpty = function validateEmpty(input) {
  if (input.val() != "") {
    input.removeClass("input-text-error");
    errorArray.pop();
  } else {
    input.focus();
    input.addClass("input-text-error");
    errorArray.push(true);
  }
    VALIDATION.showErrorMessage();
};

VALIDATION.validateName = function validateName() {
    validate = VALIDATION.validateEmpty($(".validate-name"));
};

VALIDATION.eventsValidate = function eventsValidate(){
   VALIDATION.showErrorMessage();
  $(".validate-name").focusout(function(){
    VALIDATION.validateName();
  });
  $(".validate-description").focusout(function(){
    VALIDATION.validateDescription();
  });
  $(".validate-phone").focusout(function(){
    VALIDATION.validatePhone();
  });
  $(".validate-contact-email").focusout(function(){
    VALIDATION.validateContactEmail();
  })
  $(".validate-password").focusout(function(){
    VALIDATION.validatePassword();
  });
  $(".validate-password-confirmation-user").keyup(function(){
    VALIDATION.validatePasswordConfirmation();
  });
  $(".validate-email").focusout(function(){
    VALIDATION.validateEmail($(".validate-email"),
      $('.email-error-invalid'));
  });
  $(".validate-recover-email").focusout(function(){
    VALIDATION.validateEmail($(".validate-recover-email"),
      $('.email-recover-error-invalid'));
  });
  $(".validate-zipcode").focusout(function(){
    VALIDATION.validateZipCode();
  });
  $(".validate-vacancies").change(function(){
    VALIDATION.validateVacancies();
  });
}

VALIDATION.validateDescription = function validateDescription() {
    return VALIDATION.validateEmpty($(".validate-description"));
};

VALIDATION.validateVacancies = function validateVacancies() {
  vacancies = $(".validate-vacancies");
  VALIDATION.validateEmpty($(".validate-vacancies"))
  if (vacancies.val() > 0 && vacancies.val() < 1000){
    vacancies.removeClass("input-text-error");
    errorArray.pop();
  }
  else {
    vacancies.addClass("input-text-error");
    errorArray.push(true);
  }
  VALIDATION.showErrorMessage();
};

VALIDATION.validatePassword = function validatePassword() {
    return VALIDATION.validateEmpty($(".validate-password"));
};

VALIDATION.validatePasswordConfirmation = function validatePasswordConfirmation() {
    password = $(".validate-password");
    passwordConfirmation = $(".validate-password-confirmation-user");
      if (password.val() == passwordConfirmation.val()) {
        passwordConfirmation.removeClass("input-text-error");
        errorArray.pop();
      } else {
        passwordConfirmation.addClass("input-text-error");
        errorArray.push(true);
      }
        VALIDATION.showErrorMessage();
}

VALIDATION.validateEmail = function validateEmail(email,div_error) {
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (email.val().match(mailformat)) {
      email.removeClass("input-text-error");
      errorArray.pop();
    } else {
      email.addClass("input-text-error");
      errorArray.push(true);
    }
      VALIDATION.showErrorMessage();
}

VALIDATION.validateContactEmail = function validateContactEmail() {
  contactEmail = $(".validate-contact-email")
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(contactEmail.val().match(mailformat)) {
      contactEmail.removeClass("input-text-error");
      errorArray.pop();
    } else {
      contactEmail.addClass("input-text-error");
      errorArray.push(true);
    }
  VALIDATION.showErrorMessage();
}

VALIDATION.validatePhone = function validatePhone() {
  phone = $(".validate-phone");
  var phoneformat = /^([0-9]{2})?(\([0-9]{2})\)([0-9]{3}|[0-9]{4})-[0-9]{4}$/;
    if (phone.val().match(phoneformat)) {
      phone.removeClass("input-text-error");
      errorArray.pop();
    } else {
      phone.addClass("input-text-error");
      errorArray.push(true);
    }
    VALIDATION.showErrorMessage();
}

VALIDATION.disableButtonOnSubmit = function validateForm() {
    $("input[name='commit']").prop("disabled", true);
    $("input[name='commit']").val("Aguarde...")
}

VALIDATION.validateDate = function validateDate() {
  var startDate = new Date($("select[name='opportunity[start_date(1i)]']").val() + "/" + $("select[name='opportunity[start_date(2i)]']").val() + "/" + $("select[name='opportunity[start_date(3i)]']").val());
  var finishDate = new Date($("select[name='opportunity[finish_date(1i)]']").val() + "/" + $("select[name='opportunity[finish_date(2i)]']").val() + "/" + $("select[name='opportunity[finish_date(3i)]']").val());
  if (startDate > finishDate) {
    $('.error-date-opportunities').addClass("input-text-error");
    errorArray.push(true);
  } else {
    $('.error-date-opportunities').removeClass("input-text-error");
    errorArray.pop();
  }
  VALIDATION.showErrorMessage();
};

VALIDATION.validateZipCode = function validateZipCode() {
  zipCode = $(".validate-zipcode");
    if ($("#inputCity").val().length == 0) {
      zipCode.addClass("input-text-error");
      errorArray.push(true);
    } else {
      zipCode.removeClass("input-text-error");
      errorArray.pop();
    }
  }
  VALIDATION.showErrorMessage();
};

VALIDATION.showErrorMessage = function showErrorMessage() {
  if (errorArray.length == 0) {
    $('.errorMessageJS').hide();
  } else {
   $('.errorMessageJS').show();
  }
}
