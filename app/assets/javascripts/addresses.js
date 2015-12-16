var ADDRESSES = ADDRESSES || {}

ADDRESSES.validateForm = function validateForm()
{
  if (VALIDATION.validateZipCode()) {
    return true;
  }
  return false;
}

ADDRESSES.cleanFields = function cleanFields() {
  $("#inputState").attr("text","");
  $("#inputCity").attr("text","");
  $("#inputNeighborhood").attr("text","");
  $("#inputAddress").attr("text","");
}

ADDRESSES.requestZipCode = requestZipCode = function() { 
  $.ajax({
    url: $(location).attr('pathname'),
    data: { zipcode: $("#inputZipcode").val()},
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

ADDRESSES.requestTriggerZipcode = function requestTriggerZipcode() {
  $("#inputZipcode").keyup(function() {
    if ($(this).val().length == 9) {
      ADDRESSES.requestZipCode();
    }
    else {
      ADDRESSES.cleanFields();
    };
  });
}
