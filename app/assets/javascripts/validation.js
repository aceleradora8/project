var VALIDATION = VALIDATION || {}

var errorHash = {};

VALIDATION.validateEmpty = function validateEmpty(input, field) {
  if (input.val() != "") {
    input.removeClass("input-text-error");
    errorHash[field] = false;
  } else {
    input.focus();
    input.addClass("input-text-error");
    errorHash[field] = true;
  }
    VALIDATION.showErrorMessage();
};

VALIDATION.validateEmptyDate = function validateEmptyDate(input) {
  if (input.val() != "") {
    $('.birthday-teste').removeClass("input-text-error");
    errorHash['date'] = false;
  } else {
    $('.birthday-teste').addClass("input-text-error");
      errorHash['date'] = true;
  }
    VALIDATION.showErrorMessage();
};

VALIDATION.validateName = function validateName() {
    validate = VALIDATION.validateEmpty($(".validate-name"),'name');
};

VALIDATION.eventsValidate = function eventsValidate(){
  VALIDATION.showErrorMessage();
  $(".validate-name").focusout(function(){
    VALIDATION.validateName();
  });
  $(".validate-description").focusout(function(){
    VALIDATION.validateDescription();
  });
  $("#noaddress").on('change', function(){
    if (($("#noaddress").is(':checked')) == true) {
      zipCode.removeClass("input-text-error");
      errorHash['zipcode'] = false;
      VALIDATION.showErrorMessage();
    };
  });
  $(".validate-phone").focusout(function(){
    VALIDATION.validatePhone();
  });
  $("#volunteer_birth_date_3i").focusout(function(){
    VALIDATION.validateEmptyDate($("#volunteer_birth_date_3i"));
  });
  $("#volunteer_birth_date_2i").focusout(function(){
    VALIDATION.validateEmptyDate($("#volunteer_birth_date_2i"));
  });
  $("#volunteer_birth_date_1i").focusout(function(){
    VALIDATION.validateEmptyDate($("#volunteer_birth_date_1i"));
  });
  $(".validate-contact-email").focusout(function(){
    VALIDATION.validateContactEmail();
  });
  $(".validate-password").focusout(function(){
    VALIDATION.validatePassword();
  });
  $(".validate-password-confirmation-user").focusout(function(){
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
    return VALIDATION.validateEmpty($(".validate-description"), 'description');
};

VALIDATION.validateVacancies = function validateVacancies() {
  vacancies = $(".validate-vacancies");
  VALIDATION.validateEmpty($(".validate-vacancies"), 'vacancies')
  if (vacancies.val() > 0 && vacancies.val() < 1000){
    vacancies.removeClass("input-text-error");
    errorHash['vacancies'] = false;
  }
  else {
    vacancies.addClass("input-text-error");
    errorHash['vacancies'] = true;
  }
  VALIDATION.showErrorMessage();
};

VALIDATION.validatePassword = function validatePassword() {
    return VALIDATION.validateEmpty($(".validate-password"), 'password');
};

VALIDATION.validatePasswordConfirmation = function validatePasswordConfirmation() {
    password = $(".validate-password");
    passwordConfirmation = $(".validate-password-confirmation-user");
      if (password.val() == passwordConfirmation.val()) {
        passwordConfirmation.removeClass("input-text-error");
        errorHash['passwordConfirmation'] = false;
      } else {
        passwordConfirmation.addClass("input-text-error");
        errorHash['passwordConfirmation'] = true;
      }
        VALIDATION.showErrorMessage();
}

VALIDATION.validateEmail = function validateEmail(email) {
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (email.val().match(mailformat)) {
      email.removeClass("input-text-error");
      errorHash['email'] = false;
    } else {
      email.addClass("input-text-error");
      errorHash['email'] = true;
    }
      VALIDATION.showErrorMessage();
}

VALIDATION.validateContactEmail = function validateContactEmail() {
  contactEmail = $(".validate-contact-email")
  VALIDATION.validateEmpty($(".validate-contact-email"), 'contactEmail')
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(contactEmail.val().match(mailformat)) {
      contactEmail.removeClass("input-text-error");
      errorHash['contactEmail'] = false;
    } else {
      contactEmail.addClass("input-text-error");
      errorHash['contactEmail'] = true;
    }
  VALIDATION.showErrorMessage();
}

VALIDATION.validatePhone = function validatePhone() {
  phone = $(".validate-phone");
  var phoneformat = /^([0-9]{2})?(\([0-9]{2})\)([0-9]{3}|[0-9]{4})-[0-9]{4}$/;
    if (phone.val().match(phoneformat)) {
      phone.removeClass("input-text-error");
      errorHash['phone'] = false;
    } else {
      phone.addClass("input-text-error");
      errorHash['phone'] = true;
    }
    VALIDATION.showErrorMessage();
}

VALIDATION.disableButtonOnSubmit = function validateForm() {
    $("input[name='commit']").prop("disabled", true);
    $("input[name='commit']").val("Aguarde...")
}

VALIDATION.validateZipCode = function validateZipCode() {
  zipCode = $(".validate-zipcode");
  if(($("#noaddress").is(":checked") == false)) {
    if ($("#inputCity").val().length == 0) {
      zipCode.addClass("input-text-error");
      errorHash['zipcode'] = true;
 }  else {
      zipCode.removeClass("input-text-error");
      errorHash['zipcode'] = false;
    };
  };
  VALIDATION.showErrorMessage();
};

VALIDATION.hasError = function (){
  var hasError = false;
  for (var key in errorHash) {
    if(errorHash[key] == true){
      hasError = true;
      break;
    }
  }
  return hasError;
}

VALIDATION.showErrorMessage = function showErrorMessage() {
  hasError = VALIDATION.hasError();
  if (hasError || errorHash == null) {
    $('.errorMessageJS').show();
  } else {
    $('.errorMessageJS').hide();
  }
};
