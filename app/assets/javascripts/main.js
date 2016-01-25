var ready = function() {
  $("#ajax-loader").hide();
  ADDRESSES.requestTriggerZipcode();

  INTEREST.disableButtonOnSubmit();

  VALIDATION.eventsValidate();

  LOGIN.validateFormOnSubmit();
  LOGIN.disableButtonOnSubmitForgotPass();

  MASKS.addMasks();

  NGO.validateFormOnSubmit();
  NGO.getCitiesChecked();
  NGO.checkCauses();

  ABOUTUS.validateFormContactUsSubmit();

  OPPORTUNITIES.validateFormOnSubmit();
  OPPORTUNITIES.checkCategories();
  OPPORTUNITIES.getNoAddressChecked();

  DATES.setEventDateType();
  DATES.setFieldsAccordingToDateType();

  FILTER.getCausesChecked();
  FILTER.getCitiesChecked();

  PASS_RESETS.validateFormResetPassOnSubmit();

  VOLUNTEER.validateFormOnSubmit();

  SEARCH.clickButtonSearch();  
}

$(document).ready(ready);
$(document).on('page:load', ready);
