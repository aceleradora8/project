var OPPORTUNITIES = OPPORTUNITIES || {}


var causesList, citiesList, getCauseList, getCausesChecked, getCitiesChecked, getCityList, requestOpportunities;

causesList = [];

citiesList = [];

OPPORTUNITIES.validateForm = function validateForm()
{
  validateTitle = VALIDATION.validateName();
  validateDescription =VALIDATION.validateDescription();
  validateAddress = VALIDATION.validateZipCode();
  validateDate = VALIDATION.validateDate();
  if (validateTitle && validateDescription && validateAddress && validateDate) {
    return true;
  } else {
    return false;
  }

}


OPPORTUNITIES.requestOpportunities = function() {
  $.get('/opportunities', {
    causes: causesList,
    cities: citiesList,
    text_search: $('#text_search').val()
  });
};


OPPORTUNITIES.getRecurrentChecked = function() {
  $('#recurrent').on('change', function() {
    if ($(this).is(":checked")) {
        $(".cd_data").prop("disabled", true);
     } else {  
        $(".cd_data").prop("disabled", false);
     }
});
}

OPPORTUNITIES.getCausesChecked = function() {  
  $(".cd_data").prop("disabled", true);
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
