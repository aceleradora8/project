var OPPORTUNITIES = OPPORTUNITIES || {}

var causesList = [];
var citiesList = [];

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

OPPORTUNITIES.requestOpportunities = function() {
  $.get('/opportunities', {
    causes: causesList,
    cities: citiesList,
    text_search: $('#text_search').val()
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

OPPORTUNITIES.getCausesChecked = function() {
  $('.cb_cause').on('change', function() {
    causesList = [];
    $('input.cb_cause:checked').each(function() {
      causesList.push($(this).val());
    });
    OPPORTUNITIES.requestOpportunities();
  });
};

OPPORTUNITIES.getCitiesChecked = function() {
  $('.cb_city').on('change', function() {
    citiesList = [];
    $('input.cb_city:checked').each(function() {
      citiesList.push($(this).val());
    });
    OPPORTUNITIES.requestOpportunities();
  });
};
