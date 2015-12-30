var INTEREST = INTEREST || {}
	

INTEREST.disableButtonOnSubmit = function validateForm(){
	$("#form-interest").submit(function(){	
	  $("#confirm-interest").prop( "disabled", true );
	  $("#confirm-interest").val("Enviando...")
	});
}
