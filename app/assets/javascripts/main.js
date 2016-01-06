var ready = function() {
  ADDRESSES.requestTriggerZipcode();

  INTEREST.disableButtonOnSubmit();

  LOGIN.validateFormOnSubmit();

  MASKS.addMasks();

  NGO.validateFormOnSubmit();
  NGO.disableButtonOnSubmit();

  OPPORTUNITIES.validateFormOnSubmit();
  OPPORTUNITIES.getCausesChecked();
  OPPORTUNITIES.getCitiesChecked();
  OPPORTUNITIES.getRecurrentChecked();
  OPPORTUNITIES.disableButtonOnSubmit();

  PASS_RESETS.validateFormEmailOnSubmit();
  PASS_RESETS.validateFormResetPassOnSubmit();

  PHONES.addPhones();
  PHONES.loadPhones();
  PHONES.removePhones();

  VOLUNTEER.validateFormOnSubmit();
  VOLUNTEER.disableButtonOnSubmit();
}

$(document).ready(ready);
$(document).on('page:load', ready);
