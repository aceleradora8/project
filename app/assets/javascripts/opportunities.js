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
  var currentURL = $(location).attr('href');
  if (currentURL.indexOf('edit') != -1) {
    if($("#inputZipcode").val() === "") {
      $("#noaddress").prop("checked",true);
      ADDRESSES.showFields(false);
    }
  }

$("#noaddress").on('change', function(){
    if ($("#noaddress").is(":checked") == true) {
      ADDRESSES.showFields(false);
    } else {
      ADDRESSES.showFields(true);
    };
  });
};
