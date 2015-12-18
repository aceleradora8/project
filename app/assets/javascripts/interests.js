var INTEREST = INTEREST || {}
	

INTEREST.validateFormOnSubmit = function validateForm(){
	$("#form-interest").submit(function(){	
	  $("#confirm-interest").prop( "disabled", true );
	  $("#confirm-interest").val("Enviando...")
	});
}
