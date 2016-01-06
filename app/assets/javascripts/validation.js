var VALIDATION = VALIDATION || {}

VALIDATION.validateEmpty = function validateEmpty(input) {
  if (input.val() != "") {
    input.removeClass("input-text-error");
    $('.empty-error-' + input.attr('id')).hide();
  } else {
    input.focus();
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
  $(".validate-password").focusout(function(){
    VALIDATION.validatePassword();
  });
  $(".validate-password-confirmation-user").focusout(function(){
    VALIDATION.validatePasswordConfirmation();
  });
  $(".validate-email").focusout(function(){
    VALIDATION.validateEmail();
  });
  $(".validate-phone").focusout(function(){
    VALIDATION.validatePhone();
  });
  $(".validate-zipcode").focusout(function(){
    VALIDATION.validateZipCode();
  });
}

VALIDATION.validateDescription = function validateDescription() {
    return VALIDATION.validateEmpty($(".validate-description"));
};

VALIDATION.validatePassword = function validatePassword() {
    return VALIDATION.validateEmpty($(".validate-password"));
};

VALIDATION.validatePasswordConfirmation = function validatePasswordConfirmation() {
    password = $(".validate-password");
    passwordConfirmation = $(".validate-password-confirmation-user");
    VALIDATION.validateEmpty($(".validate-password-confirmation-user"));
      if (password.val() == passwordConfirmation.val()) {
        passwordConfirmation.removeClass("input-text-error");
        $(".password-confirmation-invalid").hide();
      } else {
        passwordConfirmation.focus();
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
      email.focus();
      email.addClass("input-text-error");
      $('.email-error-invalid').show();
    }
      VALIDATION.buttonState();
}

VALIDATION.validatePhone = function validatePhone() {
  phone = $(".validate-phone");
  var phoneformat = /^([0-9]{2})?(\([0-9]{2})\)([0-9]{3}|[0-9]{4})-[0-9]{4}$/;
  VALIDATION.validateEmpty($(".validate-phone"))
    if (phone.val().match(phoneformat)) {
      phone.removeClass("input-text-error");
      $('.phone-error-invalid').hide();
    } else {
      phone.focus();
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
  var startDate = new Date($('#opportunity_start_date_1i').val() + "/" + $('#opportunity_start_date_2i').val() + "/" + $('#opportunity_start_date_3i').val());
  var finishDate = new Date($('#opportunity_finish_date_1i').val() + "/" + $('#opportunity_finish_date_2i').val() + "/" + $('#opportunity_finish_date_3i').val());
  if (startDate > finishDate) {
    $('.error-date-opportunities').show();
  } else {
     $('.error-date-opportunities').hide();
  }
  VALIDATION.buttonState();
};

VALIDATION.validateZipCode = function validateZipCode() {
  zipCode = $(".validate-zipcode");
  if (VALIDATION.validateEmpty($(".validate-zipcode"))) {
    if ($("#inputCity").val().length == 0) {
      zipCode.focus();
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