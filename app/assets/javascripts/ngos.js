var NGO = NGO || {}

NGO.validateFormOnSubmit = function validateForm() {
  $("#form-ngo").submit(function() {
    validateName = VALIDATION.validateName();
    validateDescription = VALIDATION.validateDescription();
    validateAddress = VALIDATION.validateZipCode();
    validateEmail = VALIDATION.validateEmail($(".validate-email"),$('.email-error-invalid'));
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
    validatePhone = VALIDATION.validatePhone();
    if (errorArray.length == 0) {
      VALIDATION.disableButtonOnSubmit();
      return true;
    }
    return false;
  });
}

NGO.requestNgos = function() {
  $.get('/ngos', {
    cities: citiesList,
    text_search: $('#text_search').val()
  });
};

NGO.getCitiesChecked = function() {
  $('.cb_city_ngos').on('change', function() {
    citiesList = [];
    $('input.cb_city_ngos:checked').each(function() {
      citiesList.push($(this).val());
    });
    NGO.requestNgos();
  });
};

NGO.checkCauses = function() {
  $('.category-checkbox-ngo').on('change', function() {
    if ($('.category-checkbox-ngo:checked').length == 4) {
      $(".category-checkbox-ngo").not(":checked").attr("disabled", true);
    } else {
      $(".category-checkbox-ngo").not(":checked").attr("disabled", false);
    }
  });
};
