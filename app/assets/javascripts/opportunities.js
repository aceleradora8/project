var OPPORTUNITIES = OPPORTUNITIES || {}

OPPORTUNITIES.validateFormOnSubmit = function validateForm() {
  $("#form-opportunity").submit(function() {
    validateTitle = VALIDATION.validateName();
    validateDescription = VALIDATION.validateDescription();
    validateAddress = VALIDATION.validateZipCode();
    validateDate = VALIDATION.validateDate();
    validateVacancies = VALIDATION.validateVacancies();
    if (errorArray.length == 0) {
        VALIDATION.disableButtonOnSubmit();
        return true;
      }
    return false;
  });
};


OPPORTUNITIES.checkCategories = function() {
  $('.category-checkbox').on('change', function() {
    if ($('.category-checkbox:checked').length == 5) {
      $(".category-checkbox").not(":checked").attr("disabled", true);
    } else {
      $(".category-checkbox").not(":checked").attr("disabled", false);
    }
  });
};

OPPORTUNITIES.getRecurrentChecked = function() {
$("#recurrent").is(":checked") ? $(".cd_data").prop("disabled", true) : $(".cd_data").prop("disabled", false);
$('#recurrent').on('change', function() {
    $("#recurrent").is(":checked") ? $(".cd_data").prop("disabled", true) : $(".cd_data").prop("disabled", false);
  });
};

OPPORTUNITIES.getNoAddressChecked = function() {
$('[name="noaddress"]').on('change', function(){
  if ($("#noaddress").is(":checked") == true) {
    $(".validate-zipcode").prop("disabled", true);
    $('[name="opportunity[address_attributes][number]"]').prop('disabled', true);
    $('[name="opportunity[address_attributes][complement]"]').prop('disabled', true);
  } else {
      $(".validate-zipcode").prop("disabled", false);
      $('[name="opportunity[address_attributes][number]"]').prop('disabled', false);
      $('[name="opportunity[address_attributes][complement]"]').prop('disabled', false);
    };
  });
};
