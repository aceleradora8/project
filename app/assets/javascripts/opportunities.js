var causesList, citiesList, getCauseList, getCausesChecked, getCitiesChecked, getCityList, requestOpportunities;

causesList = [];

citiesList = [];

function validateForm()
{
  if (validateZipcode() && validateDate()) {
    return true;
  } else {
    return false;
  }

}

function validateZipcode() {
  $("#inputCep").keyup(function() {
    if ($(this).val().length == 9) {
      requestOpportunitiesNew();
      //alert("Chegou ao tamanho certo. " + $(this).val());
    }
    else {
      cleanFields();
    };
  });
}

function validateDate() {

}

function cleanFields() {
  $("#inputState").attr("text","");
  $("#inputCity").attr("text","");
  $("#inputNeighborhood").attr("text","");
  $("#inputAddress").attr("text","");
}

requestOpportunitiesNew = function() {
  $.ajax({
  url: '/opportunities/new',
  data: { zipcode: $("#inputCep").val()},
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
  $('#inputCep').mask('00000-000');
  getCausesChecked();
  getCitiesChecked();
  validateZipcode();
}

$(document).ready(ready);
$(document).on('page:load', ready);