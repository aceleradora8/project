function validateForm()
{
	if (validateName() && validateEmail() && validatePhone()){
		return true;
	} else{
		return false;
	}
}

function validateName()
{
	nameField = $("#interest_volunteer_attributes_name");
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
	email = $("#interest_volunteer_attributes_email");
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

function validatePhone()
{
	phone = $("#interest_volunteer_attributes_phone");
	var phoneformat = /^([0-9]{2})?(\([0-9]{2})\)([0-9]{3}|[0-9]{4})-[0-9]{4}$/;
	//Formatos aceitos: 55(21)123-4567 | (11)1234-5678 | 55(71)4562-2234
	
	if(phone.val()!="" && phone.val().match(phoneformat)){		
		phone.removeClass("input-text-error");
		return true;
	}else{
		phone.focus();  
		phone.addClass("input-text-error");
		hideDivsError();
		if(phone.val()==""){
			$('#phoneErrorNil').show();
		}else{
			$('#phoneErrorInvalid').show();
		}
		return false;
	}

}

function hideDivsError(){
	$(".custom-alert-danger").hide();
}

$(document).ready(function() {
	hideDivsError();
});