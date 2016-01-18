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
      ADDRESSES.cleanFields();
      readOnlyFieldsAddress(response.neighborhood, $("#inputNeighborhood"));
      readOnlyFieldsAddress(response.address, $("#inputAddress"));
      $("#ajax-loader").hide();   
      $("#inputState").val(response.state);
      $("#inputCity").val(response.city);
      $("#inputNeighborhood").val(response.neighborhood);
      $("#inputAddress").val(response.address);
      VALIDATION.validateZipCode();
    },error: function(){
      ($("#inputZipcode").val().length == 0) ? $("#ajax-loader").hide() : $("#ajax-loader").show(); 
      ADDRESSES.cleanFields();
    }
  });
};

function readOnlyFieldsAddress(valor, input){
  if(valor == ""){
    input.prop('readonly', false)
    input.attr("placeholder", "");
  }else{
     input.prop('readonly', true); 
     input.attr("placeholder", "Digite o CEP acima");
  }
}

ADDRESSES.requestTriggerZipcode = function requestTriggerZipcode() {
  $("#inputZipcode").keyup(function() {
      ADDRESSES.requestZipCode();
  });
}
