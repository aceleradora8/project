var OPPORTUNITIES = OPPORTUNITIES || {}


var causesList, citiesList, getCauseList, getCausesChecked, getCitiesChecked, getCityList, requestOpportunities;

causesList = [];

citiesList = [];

OPPORTUNITIES.validateForm = function validateForm()
{
  if (VALIDATION.validateZipCode() && VALIDATION.validateDate()) {
    return true;
  } else {
    return false;
  }

}

OPPORTUNITIES.requestTriggerZipcode = function requestTriggerZipcode() {
  $("#zipcode-opportunity").keyup(function() {
    if ($(this).val().length == 9) {
      OPPORTUNITIES.requestOpportunitiesNew();
    }
    else {
      OPPORTUNITIES.cleanFields();
    };
  });
}

OPPORTUNITIES.cleanFields = function cleanFields() {
  $("#inputState").attr("text","");
  $("#inputCity").attr("text","");
  $("#inputNeighborhood").attr("text","");
  $("#inputAddress").attr("text","");
}

OPPORTUNITIES.requestOpportunitiesNew = requestOpportunitiesNew = function() {
  $.ajax({
  url: '/opportunities/new',
  data: { zipcode: $("#zipcode-opportunity").val()},
  success: function(response) {
      $("#inputState").attr("value",response.state);
      $("#inputState").attr("text",response.state);
      $("#inputCity").attr("value",response.city);
      $("#inputCity").attr("text",response.city);
      $("#inputNeighborhood").attr("value",response.neighborhood);
      $("#inputNeighborhood").attr("text",response.neighborhood);
      $("#inputAddress").attr("value",response.address);
      $("#inputAddress").attr("text",response.address);
      }
});
};

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
