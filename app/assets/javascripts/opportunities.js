
var causeList, cityList, getCauseList, getCausesChecked, getCitiesChecked, getCityList, requestOpportunities;

causeList = [];

cityList = [];

getCauseList = function() {
  return console.log(causeList);
};

getCityList = function() {
  return console.log(cityList);
};

requestOpportunities = function() {
  $.get('/opportunities', {
    cause: causeList,
    city: cityList,
    text_search: $('#text_search').val()
  });
};

getCausesChecked = function() {
  $('.cb_cause').on('change', function() {
    causeList = [];
    $('input.cb_cause:checked').each(function() {
      causeList.push($(this).val());
    });
    requestOpportunities();
  });
};

getCitiesChecked = function() {
  $('.cb_city').on('change', function() {
    cityList = [];
    $('input.cb_city:checked').each(function() {
      cityList.push($(this).val());
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