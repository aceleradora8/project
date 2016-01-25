var FILTER = FILTER || {}

var causesList = [];
var citiesList = [];

FILTER.getCausesChecked = function() {
  $('.cb_cause').on('change', function() {
    causesList = [];
    $('input.cb_cause:checked').each(function() {
      causesList.push($(this).val());
    });
    FILTER.requestFilter();
  });
};

FILTER.getCitiesChecked = function() {
  $('.cb_city').on('change', function() {
    citiesList = [];
    $('input.cb_city:checked').each(function() {
      citiesList.push($(this).val());
    });
    FILTER.requestFilter();
  });
};

FILTER.requestFilter = function(){
	$.get($(location).attr('pathname'), {
    causes: causesList,
    cities: citiesList,
    text_search: $('#text_search').val()
  });
};
