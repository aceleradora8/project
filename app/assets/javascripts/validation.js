var VALIDATION = VALIDATION || {}

VALIDATION.hideDivsError = function hideDivsError(){
	$(".custom-alert-danger").hide();
}

VALIDATION.validateName = function validateName()
{
	nameField = $("#inputName");
	if(nameField.val()!=""){
		nameField.removeClass("input-text-error");
		return true;
	}else{
		nameField.focus();  
		nameField.addClass("input-text-error");
		VALIDATION.hideDivsError();
		$('#nameError').show();
		return false;
	}
}

VALIDATION.validatePassword = function validatePassword()
{
	passwordField = $("#inputPassword");
	if(passwordField.val()!=""){
		passwordField.removeClass("input-text-error");
		return true;
	}else{
		passwordField.focus();  
		passwordField.addClass("input-text-error");
		VALIDATION.hideDivsError();
		$('#passwordError').show();
		return false;
	}
}

VALIDATION.validateEmail = function validateEmail()
{
	email = $("#inputEmail");
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
	if(email.val()!="" && email.val().match(mailformat)){		
		email.removeClass("input-text-error");
		return true;
	}else{
		email.focus();  
		email.addClass("input-text-error");
		VALIDATION.hideDivsError();
		if(email.val()==""){
			$('#emailErrorNil').show();
		}else{
			$('#emailErrorInvalid').show();
		}
		return false;
	}
}

VALIDATION.validatePhone = function validatePhone(){
		phone = $("#inputPhone");
		
		if(phone.val()!=""){		
			phone.removeClass("input-text-error");
			return true;
		}else{
			phone.focus();  
			phone.addClass("input-text-error");
			VALIDATION.hideDivsError();
			if(phone.val()==""){
				$('#phoneErrorNil').show();
			}else{
				$('#phoneErrorInvalid').show();
			}
			return false;
		}
	}