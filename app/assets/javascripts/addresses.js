var ADDRESSES = ADDRESSES || {}

ADDRESSES.validateForm = function validateForm() {
  if (VALIDATION.validateZipCode()) {
    return true;
  }
  return false;
}

ADDRESSES.cleanFields = function cleanFields() { 
  $("#inputState").val("");
  $("#inputCity").val("");
  $("#inputNeighborhood").val("");
  $("#inputAddress").val("");
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
      $("#ajax-loader").hide();
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

ADDRESSES.showFields = function(visible){
  if(visible){
    $("#inputZipcode").prop("disabled", false);
    $("#inputNumber").prop('disabled', false);
    $("#inputComplement").prop('disabled', false);
    $("#address").show();
  }else{
    $("#inputZipcode").prop("disabled", true);
    $("#inputNumber").prop('disabled', true);
    $("#inputComplement").prop('disabled', true);
    $("#address").hide();
  }
}

ADDRESSES.requestTriggerZipcode = function requestTriggerZipcode() {
  $("#inputZipcode").keyup(function() {
    if($("#inputZipcode").val().length == 9){
        $("#ajax-loader").show()
        ADDRESSES.requestZipCode();
    }else{
      ADDRESSES.cleanFields();
    }
  });
}
