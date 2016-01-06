var ready = function() {
    $("#ajax-loader").hide();
  ADDRESSES.requestTriggerZipcode();

  INTEREST.disableButtonOnSubmit();

  LOGIN.validateFormOnSubmit();

  MASKS.addMasks();

  NGO.validateFormOnSubmit();

  OPPORTUNITIES.validateFormOnSubmit();
  OPPORTUNITIES.getCausesChecked();
  OPPORTUNITIES.getCitiesChecked();
  OPPORTUNITIES.getRecurrentChecked();

  PASS_RESETS.validateFormResetPassOnSubmit();

  PHONES.addPhones();
  PHONES.loadPhones();
  PHONES.removePhones();

  VOLUNTEER.validateFormOnSubmit();

  VALIDATION.eventsValidate();
}

$(document).ready(ready);
$(document).on('page:load', ready);
