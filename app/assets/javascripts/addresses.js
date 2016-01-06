var ADDRESSES = ADDRESSES || {}

ADDRESSES.validateForm = function validateForm() {
  if (VALIDATION.validateZipCode()) {
    return true;
  }
  return false;
}

ADDRESSES.cleanFields = function cleanFields() { 
  $("#inputState").attr("text", "");
  $("#inputState").attr("value", "");
  $("#inputCity").attr("text", "");
  $("#inputCity").attr("value", "");
  $("#inputNeighborhood").attr("text", "");
  $("#inputNeighborhood").attr("value", "");
  $("#inputAddress").attr("text", "");
  $("#inputAddress").attr("value", "");
}

ADDRESSES.requestZipCode = requestZipCode = function() {
  $.ajax({
    url: $(location).attr('pathname'),
    data: {
      zipcode: $("#inputZipcode").val()
    },
    success: function(response) {
      $("#ajax-loader").hide();   
      $("#inputState").attr("value", response.state);
      $("#inputState").attr("text", response.state);
      $("#inputCity").attr("value", response.city);
      $("#inputCity").attr("text", response.city);
      $("#inputNeighborhood").attr("value", response.neighborhood);
      $("#inputNeighborhood").attr("text", response.neighborhood);
      $("#inputAddress").attr("value", response.address);
      $("#inputAddress").attr("text", response.address);
    },error: function(){
      ($("#inputZipcode").val().length == 0) ? $("#ajax-loader").hide() : $("#ajax-loader").show(); 
      ADDRESSES.cleanFields();
    }
  });
};

ADDRESSES.requestTriggerZipcode = function requestTriggerZipcode() {
  $("#inputZipcode").keyup(function() {
      ADDRESSES.requestZipCode();
  });
}
