var OPPORTUNITIES = OPPORTUNITIES || {}

OPPORTUNITIES.validateFormOnSubmit = function validateForm() {
  $("#form-opportunity").submit(function() {
    validateTitle = VALIDATION.validateName();
    validateDescription = VALIDATION.validateDescription();
    validateAddress = VALIDATION.validateZipCode();
    validateVacancies = VALIDATION.validateVacancies();
    if (VALIDATION.hasError()) {
      return false;
      }
      VALIDATION.disableButtonOnSubmit();
      return true;
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


OPPORTUNITIES.getNoAddressChecked = function() {
$('[name="noaddress"]').on('change', function(){
  if ($("#noaddress").is(":checked") == true) {
    $(".validate-zipcode").prop("disabled", true);
    $('[name="opportunity[address_attributes][number]"]').prop('disabled', true);
    $('[name="opportunity[address_attributes][complement]"]').prop('disabled', true);
    $("#address").hide();
  } else {
      $(".validate-zipcode").prop("disabled", false);
      $('[name="opportunity[address_attributes][number]"]').prop('disabled', false);
      $('[name="opportunity[address_attributes][complement]"]').prop('disabled', false);
      $("#address").show();
    };
  });
};
