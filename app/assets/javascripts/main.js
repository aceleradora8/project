var ready = function() {
	$('.cep').mask('00000-000');
	$('.phone_with_ddd').mask('(00)0000-0000');
	$('.cpf').mask('000.000.000-00', {reverse: true});
	ADDRESSES.requestTriggerZipcode();
	OPPORTUNITIES.getCausesChecked();
	OPPORTUNITIES.getCitiesChecked();
	OPPORTUNITIES.getRecurrentChecked();
	PHONES.addPhones();
  PHONES.removePhones();
  PHONES.loadPhones();
	INTEREST.validateFormOnSubmit();
	NGO.validateFormOnSubmit();
	OPPORTUNITIES.validateFormOnSubmit();
	PASS_RESETS.validateFormEmailOnSubmit();
  VOLUNTEER.validateFormOnSubmit();
	PASS_RESETS.validateFormResetPassOnSubmit();
	LOGIN.validateFormOnSubmit();


}

$(document).ready(ready);
$(document).on('page:load', ready);