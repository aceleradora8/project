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
  OPPORTUNITIES.getRecurrentChecked();
  OPPORTUNITIES.checkCategories();
  OPPORTUNITIES.validateFormOnSubmit();
  OPPORTUNITIES.getNoAddressChecked();

  FILTER.getCausesChecked();
  FILTER.getCitiesChecked();

  PASS_RESETS.validateFormResetPassOnSubmit();

  VOLUNTEER.validateFormOnSubmit();

  MOUSEFLOW.callMouseFlow();

  ANALYTICS.callGoogleAnalytics();
}

$(document).ready(ready);
$(document).on('page:load', ready);
