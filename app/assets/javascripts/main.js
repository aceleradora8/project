var ready = function() {
	ADDRESSES.requestTriggerZipcode();
	OPPORTUNITIES.getCausesChecked();
	PHONES.addPhones();
	PHONES.loadPhones();
	INTEREST.validateFormOnSubmit();
	NGO.validateFormOnSubmit();
	OPPORTUNITIES.validateFormOnSubmit();
	PASS_RESETS.validateFormEmailOnSubmit();
	VOLUNTEER.validateFormOnSubmit();
	PASS_RESETS.validateFormResetPassOnSubmit();
	LOGIN.validateFormOnSubmit();
	$('.cep').mask('00000-000');
	$('.phone_with_ddd').mask('(00)0000-0000');
	$('.cpf').mask('000.000.000-00', {reverse: true});
	OPPORTUNITIES.getCitiesChecked();
	OPPORTUNITIES.getRecurrentChecked();
	PHONES.removePhones();
}

$(document).ready(ready);
$(document).on('page:load', ready);