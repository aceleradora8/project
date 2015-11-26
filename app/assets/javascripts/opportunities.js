
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
    city: cityList
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

$(document).ready(function() {
  getCausesChecked();
  getCitiesChecked();
});