var VALIDATION = VALIDATION || {}

VALIDATION.validateEmpty = function validateEmpty(input)
{
	if(input.val()!=""){
		input.removeClass("input-text-error");
    $('.empty-error-' + input.attr('id')).hide();
		return true;
	}else{
		input.focus();  
		input.addClass("input-text-error");
		$('.empty-error-' + input.attr('id')).show();
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
	email = $(".validate-email");
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; 
   if(VALIDATION.validateEmpty($(".validate-email"))){
  	if(email.val().match(mailformat)){		
  		email.removeClass("input-text-error");
      $('.email-error-invalid').hide();
  		return true;
  	}else{
  		email.focus();  
  		email.addClass("input-text-error");
  		$('.email-error-invalid').show();
  		return false;
  	}
  }else{
    return false;
  }
}

VALIDATION.validatePhone = function validatePhone(){
	phone = $(".validate-phone");
  var phoneformat = /^([0-9]{2})?(\([0-9]{2})\)([0-9]{3}|[0-9]{4})-[0-9]{4}$/; 
   if(VALIDATION.validateEmpty($(".validate-phone"))){
    if(phone.val().match(phoneformat)){    
      phone.removeClass("input-text-error");
      $('.phone-error-invalid').hide();
      return true;
    }else{
      phone.focus();  
      phone.addClass("input-text-error");
      $('.phone-error-invalid').show();
      return false;
    }
  }else{
    return false;
  }
}

VALIDATION.validateName = function validateName() {
  return VALIDATION.validateEmpty($(".validate-name"));
}


