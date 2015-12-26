var ready = function() {
  ADDRESSES.requestTriggerZipcode();

  INTEREST.disableButtonOnSubmit();

  LOGIN.validateFormOnSubmit();

  MASKS.addMasks();

  NGO.validateFormOnSubmit();

  OPPORTUNITIES.validateFormOnSubmit();
  OPPORTUNITIES.getCausesChecked();
  OPPORTUNITIES.getCitiesChecked();
  OPPORTUNITIES.getRecurrentChecked();

  PASS_RESETS.validateFormEmailOnSubmit();
  PASS_RESETS.validateFormResetPassOnSubmit();

  PHONES.addPhones();
  PHONES.loadPhones();
  PHONES.removePhones();

  VOLUNTEER.validateFormOnSubmit();
}

$(document).ready(ready);
$(document).on('page:load', ready);
