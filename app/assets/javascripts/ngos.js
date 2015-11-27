$(document).ready(function() {
	hideDivsError();
});

function validateForm()
{	
	if (validateName() && validateEmail()){
		return true;
	} else{
		return false;
	}
}

function validateName()
{
	nameField = $("#ngo_name");
	if(nameField.val()!=""){
		nameField.removeClass("input-text-error");
		return true;
	}else{
		nameField.focus();  
		nameField.addClass("input-text-error");
		hideDivsError();
		$('#nameError').show();
		return false;
	}
}

function validateEmail()
{
	email = $("#ngo_email");
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
	if(email.val()!="" && email.val().match(mailformat)){		
		email.removeClass("input-text-error");
		return true;
	}else{
		email.focus();  
		email.addClass("input-text-error");
		hideDivsError();
		if(email.val()==""){
			$('#emailErrorNil').show();
		}else{
			$('#emailErrorInvalid').show();
		}
		return false;
	}
}

function hideDivsError(){
	$(".custom-alert-danger").hide();
}