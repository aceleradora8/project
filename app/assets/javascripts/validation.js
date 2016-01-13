var VALIDATION = VALIDATION || {}

VALIDATION.validateEmpty = function validateEmpty(input) {
  if (input.val() != "") {
    input.removeClass("input-text-error");
    $('.empty-error-' + input.attr('id')).hide();
  } else {
    input.addClass("input-text-error");
    $('.empty-error-' + input.attr('id')).show();
  }
    VALIDATION.buttonState();
};

VALIDATION.validateName = function validateName() {
    validate =  VALIDATION.validateEmpty($(".validate-name"));
};

VALIDATION.eventsValidate = function eventsValidate(){
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
    VALIDATION.validateEmail();
  });
  $(".birthday-teste").focusout(function(){
    VALIDATION.validateBirthDay();
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
    $('.vacancies-error-invalid').hide();
  }
  else {
    vacancies.addClass("input-text-error");
    $('.vacancies-error-invalid').show();
  }
  VALIDATION.buttonState();
};

VALIDATION.validatePassword = function validatePassword() {
    return VALIDATION.validateEmpty($(".validate-password"));
};

VALIDATION.validatePasswordConfirmation = function validatePasswordConfirmation() {
    password = $(".validate-password");
    passwordConfirmation = $(".validate-password-confirmation-user");
      if (password.val() == passwordConfirmation.val()) {
        passwordConfirmation.removeClass("input-text-error");
        $(".password-confirmation-invalid").hide();
      } else {
        passwordConfirmation.addClass("input-text-error");
        $(".password-confirmation-invalid").show();
      }
        VALIDATION.buttonState();
}

VALIDATION.validateEmail = function validateEmail() {
  email = $(".validate-email");
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (email.val().match(mailformat)) {
      email.removeClass("input-text-error");
      $('.email-error-invalid').hide();
    } else {
      email.addClass("input-text-error");
      $('.email-error-invalid').show();
    }
      VALIDATION.buttonState();
}

VALIDATION.validateContactEmail = function validateContactEmail() {
  contactEmail = $(".validate-contact-email")
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(contactEmail.val().match(mailformat)) {
      contactEmail.removeClass("input-text-error");
      $('.email-error-invalid').hide();
    } else {
      contactEmail.addClass("input-text-error");
      $('.email-error-invalid').show();
    }
  VALIDATION.buttonState();
}

VALIDATION.validatePhone = function validatePhone() {
  phone = $(".validate-phone");
  var phoneformat = /^([0-9]{2})?(\([0-9]{2})\)([0-9]{3}|[0-9]{4})-[0-9]{4}$/;
    if (phone.val().match(phoneformat)) {
      phone.removeClass("input-text-error");
      $('.phone-error-invalid').hide();
    } else {
      phone.addClass("input-text-error");
      $('.phone-error-invalid').show();
    }
    VALIDATION.buttonState();
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
    $('.error-date-opportunities').show();
  } else {
      $('.error-date-opportunities').removeClass("input-text-error");
     $('.error-date-opportunities').hide();
  }
  VALIDATION.buttonState();
};

VALIDATION.validateBirthDay = function validateBirthDay(){
  var currentTime = new Date();
  var birthDate = new Date($("select[name='volunteer[birth_date(1i)]']").val() + "/" + $("select[name='volunteer[birth_date(2i)]']").val() + "/" + $("select[name='volunteer[birth_date(3i)]").val());
    if(birthDate > currentTime){
      $('.birth-date-error').addClass("input-text-error");
      $('.birth-date-error').show();
    } else {
      $.('birth-date-error').removeClass("input-text-error");
      $('.birth-date-error').hide();
    }
    VALIDATION.buttonState();
}

VALIDATION.validateZipCode = function validateZipCode() {
  zipCode = $(".validate-zipcode");
  if (VALIDATION.validateEmpty($(".validate-zipcode"))) {
    if ($("#inputCity").val().length == 0) {
      zipCode.addClass("input-text-error");
      $('.error-zipcode-invalid').show();
    } else {
      zipCode.removeClass("input-text-error");
      $('.error-zipcode-invalid').hide();
    }
  }
  VALIDATION.buttonState();
};

VALIDATION.buttonState = function buttonState() {
  if ($(".input-text-error").length == 0) {
    $("input[name='commit']").prop("disabled", false);
  } else {
   $("input[name='commit']").prop("disabled", true);
  }
}
