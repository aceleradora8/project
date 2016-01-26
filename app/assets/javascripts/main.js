var ready = function() {
  $("#ajax-loader").hide();
  NGO.getCitiesChecked();
  NGO.checkCauses();
  NGO.validateFormOnSubmit();
  
  ADDRESSES.requestTriggerZipcode();

  INTEREST.disableButtonOnSubmit();

  VALIDATION.eventsValidate();

  LOGIN.validateFormOnSubmit();
  LOGIN.disableButtonOnSubmitForgotPass();

  MASKS.addMasks();


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
  SEARCH.beginSearchAutocomplete();
}

$(document).ready(ready);
$(document).on('page:load', ready);
