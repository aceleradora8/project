var NGO = NGO || {}

NGO.validateFormOnSubmit = function validateForm() {
  $("#form-ngo").submit(function() {
    errorHash = {};
    validateName = VALIDATION.validateName();
    validateDescription = VALIDATION.validateDescription();
    validateAddress = VALIDATION.validateZipCode();
    validatePassword = VALIDATION.validatePassword();
    validatePasswordConfirmation = VALIDATION.validatePasswordConfirmation();
    validateContactEmail = VALIDATION.validateContactEmail();
    validateEmail = VALIDATION.validateEmail($('.validate-email'));
    validatePhone = VALIDATION.validatePhone();
    validateZipCode = VALIDATION.validateZipCode();
    if (VALIDATION.hasError()) {
      return false;
    }
    VALIDATION.disableButtonOnSubmit();
    return true;
  });
};

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
