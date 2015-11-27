
var causesList, citiesList, getCauseList, getCausesChecked, getCitiesChecked, getCityList, requestOpportunities;

causesList = [];

citiesList = [];


requestOpportunities = function() {
  $.get('/opportunities', {
    causes: causesList,
    cities: citiesList,
    text_search: $('#text_search').val()
  });
};

getCausesChecked = function() {
  $('.cb_cause').on('change', function() {
    causesList = [];
    $('input.cb_cause:checked').each(function() {
      causesList.push($(this).val());
    });
    requestOpportunities();
  });
};

getCitiesChecked = function() {
  $('.cb_city').on('change', function() {
    citiesList = [];
    $('input.cb_city:checked').each(function() {
      citiesList.push($(this).val());
    });
    requestOpportunities();
  });
};

var ready = function() {
  getCausesChecked();
  getCitiesChecked();
}

$(document).ready(ready);
$(document).on('page:load', ready);